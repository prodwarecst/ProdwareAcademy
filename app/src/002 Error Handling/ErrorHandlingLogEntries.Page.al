/// <summary>
/// Page Error Handling Log Entries PDA (ID 70100).
/// </summary>
page 70100 "Error Handling Log Entries PDA"
{
    Caption = 'Error Handling Log Entries';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Error Handling Log PDA";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the entry.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the entry was created.';
                }
                field("Time"; Rec."Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the time when the entry was created.';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the error message of the entry.';
                }
            }
        }
        area(Factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowErrorMessage)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show Error Message';
                Image = Error;
                ToolTip = 'Show the error message that has stopped the entry.';

                trigger OnAction()
                begin
                    Rec.ShowErrorMessage();
                end;
            }
            action(ShowErrorCallStack)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show Error Call Stack';
                Image = StepInto;
                ToolTip = 'Show the call stack for the error that has stopped the entry.';

                trigger OnAction()
                begin
                    Rec.ShowErrorCallStack();
                end;
            }
        }
        area(Promoted)
        {
            actionref(ShowErrorMessage_Promoted; ShowErrorMessage)
            {
            }
            actionref(ShowErrorCallStack_Promoted; ShowErrorCallStack)
            {
            }
        }
    }
}