/// <summary>
/// Table Certification PDA (ID 70100).
/// </summary>
table 70100 "Certification PDA"
{
    Caption = 'Certification';
    DataClassification = CustomerContent;
    LookupPageId = "Certification List PDA";
    DrillDownPageId = "Certification List PDA";
    DataCaptionFields = Code, Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(10; Role; Enum "Role PDA")
        {
            Caption = 'Role';
            NotBlank = true;
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(25; "Passing Score"; Decimal)
        {
            Caption = 'Passing Score';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        CertificationArea: Record "Certification Area PDA";
        CertificationExam: Record "Certification Exam PDA";
    begin
        CertificationArea.Reset();
        CertificationArea.SetRange("Certification Code", Code);
        CertificationArea.DeleteAll(true);

        CertificationExam.Reset();
        CertificationExam.SetRange("Certification Code", Code);
        CertificationExam.DeleteAll(true);
    end;
}