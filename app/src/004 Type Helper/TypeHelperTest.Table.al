/// <summary>
/// Table Type Helper Test PDA (ID 70101).
/// </summary>
table 70101 "Type Helper Test PDA"
{
    Access = Internal;
    DataClassification = CustomerContent;
    Caption = 'Type Helper Test';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Code';
        }
        field(10; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "Language Id"; Integer)
        {
            Caption = 'Language Id';
            TableRelation = Language."Windows Language ID";
            ValidateTableRelation = false;
        }
        field(20; "Date"; Date)
        {
            Caption = 'Date';
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