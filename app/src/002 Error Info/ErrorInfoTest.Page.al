/// <summary>
/// Page Error Info Test PDA (ID 70115).
/// </summary>
page 70115 "Error Info Test PDA"
{
    Caption = 'Error Info Test';
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
                    ErrorInfoMgt: Codeunit "Error Info Mgt. PDA";
                begin
                    ErrorInfoMgt.TestStandardError();
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
                    ErrorInfoMgt: Codeunit "Error Info Mgt. PDA";
                begin
                    ErrorInfoMgt.TestCollectibleErrors();
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
                    ErrorInfoMgt: Codeunit "Error Info Mgt. PDA";
                begin
                    ErrorInfoMgt.TestActionableErrorsNavigationAction();
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
                    ErrorInfoMgt: Codeunit "Error Info Mgt. PDA";
                begin
                    ErrorInfoMgt.TestActionableErrorsFixAction();
                end;
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
        }
    }
}