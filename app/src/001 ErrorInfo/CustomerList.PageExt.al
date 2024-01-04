/// <summary>
/// PageExtension Customer List PDA (ID 70100) extends Record Customer List.
/// </summary>
pageextension 70100 "Customer List PDA" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action("API Export PDA")
            {
                ApplicationArea = All;
                Caption = 'API Export';
                Image = Export;
                ToolTip = 'Exports the customer to API (test simple TestField procedure)';

                trigger OnAction()
                var
                    IntegrationSetupTest: Codeunit "Integration Setup Test PDA";
                begin
                    IntegrationSetupTest.TestAPICredentials();
                end;
            }
            action("API Export Ext. PDA")
            {
                ApplicationArea = All;
                Caption = 'API Export Ext.';
                Image = Export1099;
                ToolTip = 'Exports the customer to API (test ErrorInfo data type)';

                trigger OnAction()
                var
                    IntegrationSetupTest: Codeunit "Integration Setup Test PDA";
                begin
                    IntegrationSetupTest.TestAPICredentialsExt();
                end;
            }
        }
    }
}