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
                field("API Username"; Rec."API Username")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the API Username field.';
                }
                field("API Password"; Rec."API Password")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the API Password field.';
                    ExtendedDatatype = Masked;
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
    end;
}