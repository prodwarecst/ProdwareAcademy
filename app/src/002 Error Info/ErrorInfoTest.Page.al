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
            action("Standard Error")
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
            action("Collectible Errors")
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
            action("Error Info Navigation Action")
            {
                ApplicationArea = All;
                Caption = 'Error Info Navigation Action';
                Image = TestFile;
                ToolTip = 'Tests error info with navigation action.';

                trigger OnAction()
                var
                    ErrorInfoMgt: Codeunit "Error Info Mgt. PDA";
                begin
                    ErrorInfoMgt.TestErrorInfoNavigationAction();
                end;
            }
        }
    }
}