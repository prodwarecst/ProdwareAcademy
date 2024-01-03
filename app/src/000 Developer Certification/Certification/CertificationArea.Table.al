/// <summary>
/// Table Certification Area PDA (ID 70101).
/// </summary>
table 70101 "Certification Area PDA"
{
    Caption = 'Certification Area';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(10; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            TableRelation = "Certification PDA";
        }
        field(20; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; Code, "Certification Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        CertificationQuestion: Record "Certification Question PDA";
    begin
        CertificationQuestion.Reset();
        CertificationQuestion.SetRange("Certification Code", "Certification Code");
        CertificationQuestion.SetRange("Certification Area Code", Code);
        CertificationQuestion.DeleteAll(true);
    end;
}