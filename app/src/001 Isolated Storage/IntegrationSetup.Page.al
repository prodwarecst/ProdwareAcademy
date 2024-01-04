/// <summary>
/// Page Integration Setup PDA (ID 70114).
/// </summary>
page 70114 "Integration Setup PDA"
{
    AccessByPermission = tabledata "Integration Setup PDA" = R;
    Caption = 'Integration Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Integration Setup PDA";

    layout
    {
        area(Content)
        {
            group(API)
            {
                Caption = 'API';
                field("API Endpoint Url"; Rec."API Endpoint Url")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the API Endpoint Url field.';
                }
                field("API Username"; APIUsername)
                {
                    ApplicationArea = All;
                    Caption = 'API Username';
                    ToolTip = 'Specifies the value of the API Username field.';
                    ExtendedDatatype = Masked;

                    trigger OnValidate()
                    begin
                        IntegrationSetupTest.SetAPICredentials(APIUsername, APIPassword);
                    end;
                }
                field("API Password"; APIPassword)
                {
                    ApplicationArea = All;
                    Caption = 'API Password';
                    ToolTip = 'Specifies the value of the API Password field.';
                    ExtendedDatatype = Masked;

                    trigger OnValidate()
                    begin
                        IntegrationSetupTest.SetAPICredentials(APIUsername, APIPassword);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        IsCredentialsSet();
    end;

    var
        IntegrationSetupTest: Codeunit "Integration Setup Test PDA";
        [NonDebuggable]
        APIUsername, APIPassword : Text;

    [NonDebuggable]
    local procedure IsCredentialsSet()
    begin
        if Rec."API Credentials Set" then begin
            APIUsername := 'X';
            APIPassword := 'X';
        end;
    end;
}