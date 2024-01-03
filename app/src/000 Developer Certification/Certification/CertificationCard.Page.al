/// <summary>
/// Page Certification Card PDA (ID 70105).
/// </summary>
page 70105 "Certification Card PDA"
{
    Caption = 'Certification Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Certification PDA";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Passing Score"; Rec."Passing Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Passing Score field.';
                }
            }
            part(CertificationAreas; "Certification Areas PDA")
            {
                ApplicationArea = All;
                SubPageLink = "Certification Code" = field(Code);
                UpdatePropagation = Both;
            }
        }
        area(Factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(TakeCertificationExam)
            {
                ApplicationArea = All;
                Caption = 'Take Certification Exam';
                Image = Certificate;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Take the new certification exam.';

                trigger OnAction()
                var
                    CertifExamWizard: Page "Certif. Exam Wizard PDA";
                begin
                    Clear(CertifExamWizard);
                    CertifExamWizard.SetCertification(Rec.Code);
                    CertifExamWizard.RunModal();
                end;
            }
        }
    }
}