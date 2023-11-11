/// <summary>
/// Report Certif. Exam Result PA PWD (ID 70100).
/// </summary>
report 70100 "Certif. Exam Result PA PWD"
{
    Caption = 'Certification Exam Result';
    UsageCategory = None;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Certification Exam/Rep - Certif. Exam Result.rdlc';

    dataset
    {
        dataitem("Certification Exam"; "Certification Exam PA PWD")
        {
            column(CertificationExam_UserID; "User ID")
            {
            }
            column(CertificationExam_Result; Result)
            {
            }
            column(CertificationExam_PassingScore; "Passing Score")
            {
            }
            column(CertificationExam_YourScore; Score)
            {
            }
            column(CertificationExam_DateTimeStarted; "Date/Time Started")
            {
            }

            dataitem(Certification; "Certification PA PWD")
            {
                DataItemLink = Code = field("Certification Code");

                column(Certification_Code; Certification.Code)
                {
                }
                column(Certification_Description; Certification.Description)
                {
                }

                dataitem("Certification Area"; "Certification Area PA PWD")
                {
                    DataItemLink = "Certification Code" = field(Code);

                    column(CertificationArea_Code; Code)
                    {
                    }
                    column(CertificationArea_Name; Name)
                    {
                    }
                    column(CertificationArea_Performance; Performance)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        CertifExamResult: Record "Certif. Exam Result PA PWD";
                        NoOfTotalQuestions: Integer;
                        NoOfTotalCorrectQuestions: Integer;
                    begin
                        CertifExamResult.Reset();
                        CertifExamResult.SetRange("Certif. Exam Entry No.", "Certification Exam"."Entry No.");
                        CertifExamResult.SetRange("Certification Code", Certification.Code);
                        CertifExamResult.SetRange("Certification Area Code", "Certification Area".Code);
                        NoOfTotalQuestions := CertifExamResult.Count();

                        CertifExamResult.Reset();
                        CertifExamResult.SetRange("Certif. Exam Entry No.", "Certification Exam"."Entry No.");
                        CertifExamResult.SetRange("Certification Code", Certification.Code);
                        CertifExamResult.SetRange("Certification Area Code", "Certification Area".Code);
                        CertifExamResult.SetRange(Correct, true);
                        NoOfTotalCorrectQuestions := CertifExamResult.Count();

                        Performance := 0;
                        if NoOfTotalQuestions <> 0 then
                            Performance := NoOfTotalCorrectQuestions / NoOfTotalQuestions * 100;
                    end;
                }
            }
        }
    }

    labels
    {
        LblCandidate = 'Candidate:';
        LblResult = 'Result:';
        LblPassingScore = 'Passing Score:';
        LblYourScore = 'Your Score:';
        LblDateTime = 'Date and Time:';
        LblPerformanceByArea = 'Performance by exam area';
        LblPerformanceByAreaText = 'Each area appears to the left of the chart. The length of the bars represents your are-level performance. Shorter bars reflect weaker performance, and longer bars reflect stronger performance.';
        LblNote = 'Note: Because the number of questions in each area varies, the length of the bars cannot be used to calculate the number of questions answered correctly, and bars cannot be combined to determine percentage of questions answered correctly on the overall exam. If a bar is not displayed for a skill area, no questions were answered correctly or provided in that section of the exam.';
    }

    var
        Performance: Decimal;
}