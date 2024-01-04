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
        field(20; "API Credentials Set"; Boolean)
        {
            Caption = 'API Credentials Set';
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