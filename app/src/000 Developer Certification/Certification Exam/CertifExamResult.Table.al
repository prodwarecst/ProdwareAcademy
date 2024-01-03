/// <summary>
/// Table Certif. Exam Result PDA (ID 70106).
/// </summary>
table 70106 "Certif. Exam Result PDA"
{
    Caption = 'Certification Exam Result';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Certif. Exam Entry No."; Integer)
        {
            Caption = 'Certification Exam Entry No.';
            DataClassification = SystemMetadata;
            TableRelation = "Certification Exam PDA";
        }
        field(20; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            TableRelation = "Certification PDA";
        }
        field(30; "Certification Area Code"; Code[20])
        {
            Caption = 'Certification Area Code';
            TableRelation = "Certification Area PDA" where("Certification Code" = field("Certification Code"));
        }
        field(40; "Question No."; Integer)
        {
            Caption = 'Question No.';
        }
        field(50; "Answer No."; Integer)
        {
            Caption = 'Answer No.';
        }
        field(60; Correct; Boolean)
        {
            Caption = 'Correct';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}