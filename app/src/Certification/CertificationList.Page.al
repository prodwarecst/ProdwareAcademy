/// <summary>
/// Page Certification List PA PWD (ID 70104).
/// </summary>
page 70104 "Certification List PA PWD"
{
    Caption = 'Certification List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Certification PA PWD";
    CardPageId = "Certification Card PA PWD";
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                    CertifExamWizard: Page "Certif. Exam Wizard PA PWD";
                begin
                    Clear(CertifExamWizard);
                    CertifExamWizard.SetCertification(Rec.Code);
                    CertifExamWizard.RunModal();
                end;
            }
        }
    }
}