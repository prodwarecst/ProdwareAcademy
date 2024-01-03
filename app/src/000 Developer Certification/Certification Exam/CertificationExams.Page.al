/// <summary>
/// Page Certification Exams PDA (ID 70109).
/// </summary>
page 70109 "Certification Exams PDA"
{
    Caption = 'Certification Exams';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Certification Exam PDA";
    RefreshOnActivate = true;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Certification Code"; Rec."Certification Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Certification Code field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Date/Time Started"; Rec."Date/Time Started")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date/Time Started field.';
                }
                field("Date/Time Ended"; Rec."Date/Time Ended")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date/Time Ended field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Score field.';
                }
                field("Passing Score"; Rec."Passing Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Passing Score field.';
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = All;
                    StyleExpr = ResultStyle;
                    ToolTip = 'Specifies the value of the Result field.';
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
        area(Processing)
        {
            action(PrintCertificationExamResult)
            {
                ApplicationArea = All;
                Caption = 'Print Certification Exam Result';
                Image = PrintDocument;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Print the result of the certification exam.';

                trigger OnAction()
                begin
                    Rec.PrintCertificationExamResult(Rec."Entry No.");
                end;
            }
            action(PrintCertificate)
            {
                ApplicationArea = All;
                Caption = 'Print Certificate';
                Image = PrintVoucher;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Print the certificate for the successfully passed certification exam.';
                Enabled = Rec.Result = Rec.Result::Passed;
                Visible = Rec.Result = Rec.Result::Passed;

                trigger OnAction()
                begin
                    Rec.PrintCertificate(Rec."Entry No.");
                end;
            }
        }
    }

    var
        ResultStyle: Text;

    trigger OnAfterGetRecord()
    begin
        case Rec.Result of
            Rec.Result::Passed:
                ResultStyle := 'Favorable';
            Rec.Result::"Not Passed":
                ResultStyle := 'Unfavorable';
            else
                ResultStyle := 'None';
        end;
    end;
}