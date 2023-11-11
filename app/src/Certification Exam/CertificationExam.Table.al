/// <summary>
/// Table Certification Exam PA PWD (ID 70103).
/// </summary>
table 70103 "Certification Exam PA PWD"
{
    Caption = 'Certification Exam';
    DataClassification = CustomerContent;
    LookupPageId = "Certification Exams PA PWD";
    DrillDownPageId = "Certification Exams PA PWD";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            TableRelation = "Certification PA PWD";
            NotBlank = true;

            trigger OnValidate()
            var
                Certification: Record "Certification PA PWD";
            begin
                Certification.Get("Certification Code");
                Role := Certification.Role;
            end;
        }
        field(20; Role; Enum "Role PA PWD")
        {
            Caption = 'Role';
            Editable = false;
        }
        field(30; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            Editable = false;
        }
        field(40; "Date/Time Started"; DateTime)
        {
            Caption = 'Date/Time Started';
            Editable = false;
        }
        field(50; "Date/Time Ended"; DateTime)
        {
            Caption = 'Date/Time Ended';
            Editable = false;
        }
        field(60; Score; Decimal)
        {
            Caption = 'Score';
            Editable = false;
        }
        field(70; "Passing Score"; Decimal)
        {
            Caption = 'Passing Score';
            FieldClass = FlowField;
            CalcFormula = lookup("Certification PA PWD"."Passing Score" where(Code = field("Certification Code")));
        }
        field(80; Result; Enum "Exam Result PA PWD")
        {
            Caption = 'Result';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "User ID" := CopyStr(UserId(), 1, MaxStrLen("User ID"));
    end;

    trigger OnDelete()
    var
        CertificationExamResult: Record "Certif. Exam Result PA PWD";
    begin
        CertificationExamResult.Reset();
        CertificationExamResult.SetRange("Certif. Exam Entry No.", "Entry No.");
        CertificationExamResult.DeleteAll(true);
    end;

    /// <summary>
    /// Initialize.
    /// </summary>
    /// <param name="CertificationCode">Code[20].</param>
    /// <returns>Return variable EntryNo of type Integer.</returns>
    internal procedure Initialize(CertificationCode: Code[20]) EntryNo: Integer
    var
        CertificationExam: Record "Certification Exam PA PWD";
    begin
        CertificationExam.Init();
        CertificationExam.Validate("Certification Code", CertificationCode);
        CertificationExam.Validate("User ID", UserId());
        CertificationExam."Date/Time Started" := CurrentDateTime();
        CertificationExam.Insert(true);
        EntryNo := CertificationExam."Entry No.";
    end;

    /// <summary>
    /// Prepare Certification Questions.
    /// </summary>
    /// <param name="EntryNo">Integer.</param>
    /// <param name="Questions">VAR List of [Text].</param>
    /// <param name="NoOfQuestions">Integer.</param>
    internal procedure PrepareCertificationQuestions(EntryNo: Integer; var Questions: Dictionary of [Integer, Text]; NoOfQuestions: Integer)
    var
        CertificationExam: Record "Certification Exam PA PWD";
        CertificationArea: Record "Certification Area PA PWD";
        CertificationQuestion: Record "Certification Question PA PWD";
        AllQuestions: Dictionary of [Integer, Text];
    begin
        CertificationExam.Get(EntryNo);

        CertificationArea.Reset();
        CertificationArea.SetRange("Certification Code", CertificationExam."Certification Code");
        CertificationArea.SetLoadFields("Certification Code", Code);
        if CertificationArea.FindSet() then
            repeat
                CertificationQuestion.Reset();
                CertificationQuestion.SetRange("Certification Code", CertificationArea."Certification Code");
                CertificationQuestion.SetRange("Certification Area Code", CertificationArea.Code);
                CertificationQuestion.SetLoadFields("Question No.", Question);
                if CertificationQuestion.FindSet() then
                    repeat
                        AllQuestions.Add(CertificationQuestion."Question No.", CertificationQuestion.Question);
                    until CertificationQuestion.Next() = 0;
            until CertificationArea.Next() = 0;

        ShuffleQuestions(Questions, AllQuestions, NoOfQuestions);
    end;

    /// <summary>
    /// Lookup Answer for Certification Question.
    /// </summary>
    /// <param name="QuestionNo">Integer.</param>
    /// <param name="Answer">VAR Text.</param>
    /// <param name="Answers">VAR Dictionary of [Integer, Text].</param>
    internal procedure LookupAnswer(QuestionNo: Integer; var Answer: Text; var Answers: Dictionary of [Integer, Text])
    var
        CertificationAnswer: Record "Certification Answer PA PWD";
        CertificationAnswers: Page "Certif. Answers Select. PA PWD";
    begin
        CertificationAnswer.Reset();
        CertificationAnswer.SetRange("Question No.", QuestionNo);
        Clear(CertificationAnswers);
        CertificationAnswers.SetTableView(CertificationAnswer);
        CertificationAnswers.SetRecord(CertificationAnswer);
        CertificationAnswers.LookupMode(true);
        if CertificationAnswers.RunModal() = Action::LookupOK then begin
            CertificationAnswers.GetRecord(CertificationAnswer);
            Answer := CertificationAnswer.Answer;
            Answers.Add(CertificationAnswer."Answer No.", CertificationAnswer.Answer);
        end;
    end;

    /// <summary>
    /// Evaluate Certification Exam Results.
    /// </summary>
    /// <param name="EntryNo">Integer.</param>
    /// <param name="Questions">Dictionary of [Integer, Text].</param>
    /// <param name="Answers">Dictionary of [Integer, Text].</param>
    internal procedure EvaluateResults(EntryNo: Integer; Questions: Dictionary of [Integer, Text]; Answers: Dictionary of [Integer, Text])
    var
        CertificationExam: Record "Certification Exam PA PWD";
        CertificationAnswer: Record "Certification Answer PA PWD";
        AnswerNos: List of [Integer];
        AnswerNo: Integer;
        AnswersCount: Integer;
        CorrectAnswersCount: Integer;
        QuestionsCount: Integer;
        ExamScore: Decimal;
    begin
        ExamScore := 0;
        CorrectAnswersCount := 0;
        AnswersCount := Answers.Count();
        QuestionsCount := Questions.Count();

        if AnswersCount > 0 then begin
            AnswerNos := Answers.Keys();
            foreach AnswerNo in AnswerNos do begin
                CertificationAnswer.Reset();
                CertificationAnswer.SetRange("Answer No.", AnswerNo);
                if CertificationAnswer.FindFirst() then
                    if CertificationAnswer.Active then begin
                        InsertCertifExamResult(EntryNo, CertificationAnswer."Question No.", AnswerNo, true);
                        CorrectAnswersCount += 1;
                    end else
                        InsertCertifExamResult(EntryNo, CertificationAnswer."Question No.", AnswerNo, false);
            end;
            ExamScore := CorrectAnswersCount / QuestionsCount * 1000;
        end;

        if CertificationExam.Get(EntryNo) then begin
            CertificationExam.CalcFields("Passing Score");
            CertificationExam."Date/Time Ended" := CurrentDateTime();
            CertificationExam.Score := ExamScore;
            if ExamScore >= CertificationExam."Passing Score" then
                CertificationExam.Result := CertificationExam.Result::Passed
            else
                CertificationExam.Result := CertificationExam.Result::"Not Passed";
            CertificationExam.Modify();
        end;
    end;

    /// <summary>
    /// Print Certification Exam Result.
    /// </summary>
    /// <param name="EntryNo">Integer.</param>
    internal procedure PrintCertificationExamResult(EntryNo: Integer)
    var
        CertificationExam: Record "Certification Exam PA PWD";
    begin
        CertificationExam.Get(EntryNo);
        CertificationExam.SetRecFilter();
        Report.RunModal(Report::"Certif. Exam Result PA PWD", false, true, CertificationExam);
    end;

    /// <summary>
    /// Print Certificate.
    /// </summary>
    /// <param name="EntryNo">Integer.</param>
    internal procedure PrintCertificate(EntryNo: Integer)
    var
        CertificationExam: Record "Certification Exam PA PWD";
    begin
        CertificationExam.Get(EntryNo);
        CertificationExam.SetRecFilter();
        Report.RunModal(Report::"Certificate PA PWD", false, true, CertificationExam);
    end;

    /// <summary>
    /// Shuffle Certification Questions.
    /// </summary>
    /// <param name="Questions">VAR Dictionary of [Integer, Text].</param>
    /// <param name="AllQuestions">Dictionary of [Integer, Text].</param>
    /// <param name="NoOfQuestions">Integer.</param>
    local procedure ShuffleQuestions(var Questions: Dictionary of [Integer, Text]; AllQuestions: Dictionary of [Integer, Text]; NoOfQuestions: Integer)
    var
        QuestionNo: Integer;
        Question: Text;
        TotalNoOfQuestions: Integer;
        i: Integer;
    begin
        TotalNoOfQuestions := AllQuestions.Count();
        while NoOfQuestions > 0 do begin
            i := Random(TotalNoOfQuestions);
            QuestionNo := AllQuestions.Keys.Get(i);
            Question := AllQuestions.Values.Get(i);
            if not Questions.ContainsKey(QuestionNo) then begin
                Questions.Add(QuestionNo, Question);
                NoOfQuestions -= 1;
            end;
        end;
    end;

    /// <summary>
    /// Insert Certification Exam Result.
    /// </summary>
    /// <param name="EntryNo">Integer.</param>
    /// <param name="QuestionNo">Integer.</param>
    /// <param name="AnswerNo">Integer.</param>
    /// <param name="Correct">Boolean.</param>
    local procedure InsertCertifExamResult(EntryNo: Integer; QuestionNo: Integer; AnswerNo: Integer; Correct: Boolean)
    var
        CertifExamResult: Record "Certif. Exam Result PA PWD";
        CertificationQuestion: Record "Certification Question PA PWD";
    begin
        CertificationQuestion.Reset();
        CertificationQuestion.SetRange("Question No.", QuestionNo);
        CertificationQuestion.FindLast();

        CertifExamResult.Init();
        CertifExamResult."Certif. Exam Entry No." := EntryNo;
        CertifExamResult."Certification Code" := CertificationQuestion."Certification Code";
        CertifExamResult."Certification Area Code" := CertificationQuestion."Certification Area Code";
        CertifExamResult."Question No." := QuestionNo;
        CertifExamResult."Answer No." := AnswerNo;
        CertifExamResult.Correct := Correct;
        CertifExamResult.Insert();
    end;
}