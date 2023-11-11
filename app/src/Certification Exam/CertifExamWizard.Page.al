page 70112 "Certif. Exam Wizard PA PWD"
{
    Caption = 'Certification Exam Wizard';
    PageType = NavigatePage;
    SourceTable = "Certification Exam PA PWD";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and not FinishActionEnabled;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            // Welcome Step
            group(WelcomeStep)
            {
                Visible = WelcomeStepVisible;
                group("Welcome to Certification Exam")
                {
                    Caption = 'Welcome to Certification Exam!';
                    Visible = WelcomeStepVisible;
                    group(Group1)
                    {
                        Caption = '';
                        InstructionalText = 'Hello! We appreciate you would like to take the certification exam. We wish you all the best of luck!';
                    }
                }
                group("Let's go!")
                {
                    Caption = 'Let''s go!';
                    group(Group2)
                    {
                        Caption = '';
                        InstructionalText = 'Choose Next so you can start with the certification exam.';
                    }
                }
            }

            #region Questions
            // Question 1
            group(Step1)
            {
                Visible = Step1Visible;
                group("Question 1")
                {
                    field(Q1; Questions.Values().Get(1))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }
                    field(A1; A1)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(1), A1, Answers);
                        end;
                    }
                }
            }

            // Question 2
            group(Step2)
            {
                Visible = Step2Visible;
                group("Question 2")
                {
                    field(Q2; Questions.Values.Get(2))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A2; A2)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(2), A2, Answers);
                        end;
                    }
                }
            }

            // Question 3
            group(Step3)
            {
                Visible = Step3Visible;
                group("Question 3")
                {
                    field(Q3; Questions.Values.Get(3))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A3; A3)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(3), A3, Answers);
                        end;
                    }
                }
            }

            // Question 4
            group(Step4)
            {
                Visible = Step4Visible;
                group("Question 4")
                {
                    field(Q4; Questions.Values.Get(4))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A4; A4)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(4), A4, Answers);
                        end;
                    }
                }
            }

            // Question 5
            group(Step5)
            {
                Visible = Step5Visible;
                group("Question 5")
                {
                    field(Q5; Questions.Values.Get(5))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A5; A5)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(5), A5, Answers);
                        end;
                    }
                }
            }

            // Question 6
            group(Step6)
            {
                Visible = Step6Visible;
                group("Question 6")
                {
                    field(Q6; Questions.Values.Get(6))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A6; A6)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(6), A6, Answers);
                        end;
                    }
                }
            }

            // Question 7
            group(Step7)
            {
                Visible = Step7Visible;
                group("Question 7")
                {
                    field(Q7; Questions.Values.Get(7))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A7; A7)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(7), A7, Answers);
                        end;
                    }
                }
            }

            // Question 8
            group(Step8)
            {
                Visible = Step8Visible;
                group("Question 8")
                {
                    field(Q8; Questions.Values.Get(8))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A8; A8)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(8), A8, Answers);
                        end;
                    }
                }
            }

            // Question 9
            group(Step9)
            {
                Visible = Step9Visible;
                group("Question 9")
                {
                    field(Q9; Questions.Values.Get(9))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A9; A9)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(9), A9, Answers);
                        end;
                    }
                }
            }

            // Question 10
            group(Step10)
            {
                Visible = Step10Visible;
                group("Question 10")
                {
                    field(Q10; Questions.Values.Get(10))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A10; A10)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(10), A10, Answers);
                        end;
                    }
                }
            }

            // Question 11
            group(Step11)
            {
                Visible = Step11Visible;
                group("Question 11")
                {
                    field(Q11; Questions.Values.Get(11))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A11; A11)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(11), A11, Answers);
                        end;
                    }
                }
            }

            // Question 12
            group(Step12)
            {
                Visible = Step12Visible;
                group("Question 12")
                {
                    field(Q12; Questions.Values.Get(12))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A12; A12)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(12), A12, Answers);
                        end;
                    }
                }
            }

            // Question 13
            group(Step13)
            {
                Visible = Step13Visible;
                group("Question 13")
                {
                    field(Q13; Questions.Values.Get(13))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A13; A13)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(13), A13, Answers);
                        end;
                    }
                }
            }

            // Question 14
            group(Step14)
            {
                Visible = Step14Visible;
                group("Question 14")
                {
                    field(Q14; Questions.Values.Get(14))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A14; A14)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(14), A14, Answers);
                        end;
                    }
                }
            }

            // Question 15
            group(Step15)
            {
                Visible = Step15Visible;
                group("Question 15")
                {
                    field(Q15; Questions.Values.Get(15))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A15; A15)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(15), A15, Answers);
                        end;
                    }
                }
            }

            // Question 16
            group(Step16)
            {
                Visible = Step16Visible;
                group("Question 16")
                {
                    field(Q16; Questions.Values.Get(16))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A16; A16)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(16), A16, Answers);
                        end;
                    }
                }
            }

            // Question 17
            group(Step17)
            {
                Visible = Step17Visible;
                group("Question 17")
                {
                    field(Q17; Questions.Values.Get(17))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A17; A17)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(17), A17, Answers);
                        end;
                    }
                }
            }

            // Question 18
            group(Step18)
            {
                Visible = Step18Visible;
                group("Question 18")
                {
                    field(Q18; Questions.Values.Get(18))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A18; A18)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(18), A18, Answers);
                        end;
                    }
                }
            }

            // Question 19
            group(Step19)
            {
                Visible = Step19Visible;
                group("Question 19")
                {
                    field(Q19; Questions.Values.Get(19))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A19; A19)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(19), A19, Answers);
                        end;
                    }
                }
            }

            // Question 20
            group(Step20)
            {
                Visible = Step20Visible;
                group("Question 20")
                {
                    field(Q20; Questions.Values.Get(20))
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Enabled = false;
                        MultiLine = true;
                    }

                    field(A20; A20)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        ShowMandatory = true;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            Rec.LookupAnswer(Questions.Keys().Get(20), A20, Answers);
                        end;
                    }
                }
            }
            #endregion

            // Final Step
            group(FinishStep)
            {
                Visible = FinishStepVisible;
                group("That's it!")
                {
                    Caption = 'That''s it!';
                    group(Group3)
                    {
                        Caption = '';
                        InstructionalText = 'To complete the certification exam, choose Finish.';
                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction();
                begin
                    FinishAction();
                end;
            }
        }
    }
    trigger OnInit()
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        EntryNo := Rec.Initialize(CertificationCode);
        Rec.PrepareCertificationQuestions(EntryNo, Questions, 20);

        Step := Step::Welcome;
        EnableControls();
    end;

    var
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        MediaResourcesStandard: Record "Media Resources";
        CertificationCode: Code[20];
        Questions: Dictionary of [Integer, Text];
        Answers: Dictionary of [Integer, Text];
        A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20 : Text;
        Step: Option Welcome,Step1,Step2,Step3,Step4,Step5,Step6,Step7,Step8,Step9,Step10,Step11,Step12,Step13,Step14,Step15,Step16,Step17,Step18,Step19,Step20,Finish;
        EntryNo: Integer;
        BackActionEnabled, FinishActionEnabled, NextActionEnabled, TopBannerVisible : Boolean;
        WelcomeStepVisible, Step1Visible, Step2Visible, Step3Visible, Step4Visible, Step5Visible, Step6Visible, Step7Visible, Step8Visible, Step9Visible, Step10Visible, Step11Visible, Step12Visible, Step13Visible, Step14Visible, Step15Visible, Step16Visible, Step17Visible, Step18Visible, Step19Visible, Step20Visible, FinishStepVisible : Boolean;

    internal procedure SetCertification(NewCertificationCode: Code[20])
    begin
        CertificationCode := NewCertificationCode;
    end;

    local procedure EnableControls()
    begin
        ResetControls();

        case Step of
            Step::Welcome:
                ShowWelcomeStep();
            Step::Step1:
                ShowStep1();
            Step::Step2:
                ShowStep2();
            Step::Step3:
                ShowStep3();
            Step::Step4:
                ShowStep4();
            Step::Step5:
                ShowStep5();
            Step::Step6:
                ShowStep6();
            Step::Step7:
                ShowStep7();
            Step::Step8:
                ShowStep8();
            Step::Step9:
                ShowStep9();
            Step::Step10:
                ShowStep10();
            Step::Step11:
                ShowStep11();
            Step::Step12:
                ShowStep12();
            Step::Step13:
                ShowStep13();
            Step::Step14:
                ShowStep14();
            Step::Step15:
                ShowStep15();
            Step::Step16:
                ShowStep16();
            Step::Step17:
                ShowStep17();
            Step::Step18:
                ShowStep18();
            Step::Step19:
                ShowStep19();
            Step::Step20:
                ShowStep20();
            Step::Finish:
                ShowFinishStep();
        end;
    end;

    local procedure FinishAction()
    begin
        Rec.EvaluateResults(EntryNo, Questions, Answers);
        Rec.PrintCertificationExamResult(EntryNo);
        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;

        EnableControls();
    end;

    local procedure ShowWelcomeStep()
    begin
        WelcomeStepVisible := true;

        FinishActionEnabled := false;
        BackActionEnabled := false;
    end;

    local procedure ShowStep1()
    begin
        Step1Visible := true;
    end;

    local procedure ShowStep2()
    begin
        Step2Visible := true;
    end;

    local procedure ShowStep3()
    begin
        Step3Visible := true;
    end;

    local procedure ShowStep4()
    begin
        Step4Visible := true;
    end;

    local procedure ShowStep5()
    begin
        Step5Visible := true;
    end;

    local procedure ShowStep6()
    begin
        Step6Visible := true;
    end;

    local procedure ShowStep7()
    begin
        Step7Visible := true;
    end;

    local procedure ShowStep8()
    begin
        Step8Visible := true;
    end;

    local procedure ShowStep9()
    begin
        Step9Visible := true;
    end;

    local procedure ShowStep10()
    begin
        Step10Visible := true;
    end;

    local procedure ShowStep11()
    begin
        Step11Visible := true;
    end;

    local procedure ShowStep12()
    begin
        Step12Visible := true;
    end;

    local procedure ShowStep13()
    begin
        Step13Visible := true;
    end;

    local procedure ShowStep14()
    begin
        Step14Visible := true;
    end;

    local procedure ShowStep15()
    begin
        Step15Visible := true;
    end;

    local procedure ShowStep16()
    begin
        Step16Visible := true;
    end;

    local procedure ShowStep17()
    begin
        Step17Visible := true;
    end;

    local procedure ShowStep18()
    begin
        Step18Visible := true;
    end;

    local procedure ShowStep19()
    begin
        Step19Visible := true;
    end;

    local procedure ShowStep20()
    begin
        Step20Visible := true;
    end;

    local procedure ShowFinishStep()
    begin
        FinishStepVisible := true;

        NextActionEnabled := false;
        FinishActionEnabled := true;
    end;

    local procedure ResetControls()
    begin
        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;

        WelcomeStepVisible := false;
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
        Step4Visible := false;
        Step5Visible := false;
        Step6Visible := false;
        Step7Visible := false;
        Step8Visible := false;
        Step9Visible := false;
        Step10Visible := false;
        Step11Visible := false;
        Step12Visible := false;
        Step13Visible := false;
        Step14Visible := false;
        Step15Visible := false;
        Step16Visible := false;
        Step17Visible := false;
        Step18Visible := false;
        Step19Visible := false;
        Step20Visible := false;
        FinishStepVisible := false;
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.Get('AssistedSetupInfo-NoText.png', Format(CurrentClientType())) and
           MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
               MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
            then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
    end;
}