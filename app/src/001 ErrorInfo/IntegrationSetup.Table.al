/// <summary>
/// Table Integration Setup PDA (ID 70107).
/// </summary>
table 70107 "Integration Setup PDA"
{
    Access = Internal;
    DataClassification = CustomerContent;
    Caption = 'Integration Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Code';
        }
        field(10; "API Endpoint Url"; Text[100])
        {
            Caption = 'API Endpoint Url';
            ExtendedDatatype = URL;
        }
        field(20; "API Username"; Text[50])
        {
            Caption = 'API Username';
        }
        field(30; "API Password"; Text[50])
        {
            Caption = 'API Password';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}