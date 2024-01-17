/// <summary>
/// Page Error Handling Test PDA (ID 70115).
/// </summary>
page 70115 "Error Handling Test PDA"
{
    Caption = 'Error Handling Test';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Integration Setup PDA";

    actions
    {
        area(Processing)
        {
            action(StandardError)
            {
                ApplicationArea = All;
                Caption = 'Standard Error';
                Image = TestFile;
                ToolTip = 'Tests standard error.';

                trigger OnAction()
                var
                    ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
                begin
                    ErrorHandlingMgt.TestStandardError();
                end;
            }
            action(CollectibleErrors)
            {
                ApplicationArea = All;
                Caption = 'Collectible Errors';
                Image = TestFile;
                ToolTip = 'Tests collectible errors.';

                trigger OnAction()
                var
                    ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
                begin
                    ErrorHandlingMgt.TestCollectibleErrors();
                end;
            }
            action(ActionableErrorsNavigationAction)
            {
                ApplicationArea = All;
                Caption = 'Actionable Errors (Navigation Action)';
                Image = TestFile;
                ToolTip = 'Tests actionable errors with navigation action.';

                trigger OnAction()
                var
                    ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
                begin
                    ErrorHandlingMgt.TestActionableErrorsNavigationAction();
                end;
            }
            action(ActionableErrorsFixAction)
            {
                ApplicationArea = All;
                Caption = 'Actionable Errors (Fix Action)';
                Image = TestFile;
                ToolTip = 'Tests actionable errors with fix action.';

                trigger OnAction()
                var
                    ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
                begin
                    ErrorHandlingMgt.TestActionableErrorsFixAction();
                end;
            }
            action(ErrorCallStack)
            {
                ApplicationArea = All;
                Caption = 'Error Call Stack';
                Image = StepInto;
                ToolTip = 'Tests error call stack feature.';

                trigger OnAction()
                var
                    ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
                begin
                    ErrorHandlingMgt.TestErrorCallStack();
                end;
            }
        }
        area(Navigation)
        {
            action(ErrorHandlingLog)
            {
                ApplicationArea = All;
                Caption = 'Error Handling Log';
                Image = Log;
                ToolTip = 'Shows error handling log entries.';
                RunObject = page "Error Handling Log Entries PDA";
            }
        }
        area(Promoted)
        {
            actionref(StandardError_Promoted; StandardError)
            {
            }
            actionref(CollectibleErrors_Promoted; CollectibleErrors)
            {
            }
            actionref(ActionableErrorsNavigationAction_Promoted; ActionableErrorsNavigationAction)
            {
            }
            actionref(ActionableErrorsFixAction_Promoted; ActionableErrorsFixAction)
            {
            }
            actionref(ErrorCallStack_Promoted; ErrorCallStack)
            {
            }
            actionref(ErrorHandlingLog_Promoted; ErrorHandlingLog)
            {
            }
        }
    }
}