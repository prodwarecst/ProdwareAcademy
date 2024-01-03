/// <summary>
/// Table Certification Answer PDA (ID 70105).
/// </summary>
table 70105 "Certification Answer PDA"
{
    Caption = 'Certification Answer';
    DataClassification = CustomerContent;
    LookupPageId = "Certification Answers PDA";
    DrillDownPageId = "Certification Answers PDA";

    fields
    {
        field(1; "Answer No."; Integer)
        {
            Caption = 'Answer No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(10; "Question No."; Integer)
        {
            Caption = 'Question No.';
            TableRelation = "Certification Question PDA";
            Editable = false;
        }
        field(20; Answer; Text[2048])
        {
            Caption = 'Answer';
        }
        field(30; Active; Boolean)
        {
            Caption = 'Correct Answer';
        }
    }

    keys
    {
        key(PK; "Answer No.", "Question No.")
        {
            Clustered = true;
        }
    }
}