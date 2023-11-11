/// <summary>
/// Table Certification Question PA PWD (ID 70104).
/// </summary>
table 70104 "Certification Question PA PWD"
{
    Caption = 'Certification Question';
    DataClassification = CustomerContent;
    LookupPageId = "Certification Questions PA PWD";
    DrillDownPageId = "Certification Questions PA PWD";

    fields
    {
        field(1; "Question No."; Integer)
        {
            Caption = 'Question No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(10; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            TableRelation = "Certification PA PWD";
            Editable = false;
        }
        field(20; "Certification Area Code"; Code[20])
        {
            Caption = 'Certification Area Code';
            TableRelation = "Certification Area PA PWD" where("Certification Code" = field("Certification Code"));
            Editable = false;
        }
        field(30; Question; Text[2048])
        {
            Caption = 'Question';
        }
    }

    keys
    {
        key(PK; "Question No.", "Certification Code", "Certification Area Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        CertificationAnswer: Record "Certification Answer PA PWD";
    begin
        CertificationAnswer.Reset();
        CertificationAnswer.SetRange("Question No.", "Question No.");
        CertificationAnswer.DeleteAll(true);
    end;
}