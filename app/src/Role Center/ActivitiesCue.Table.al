/// <summary>
/// Table Activities Cue PA PWD (ID 70102).
/// </summary>
table 70102 "Activities Cue PA PWD"
{
    Caption = 'Activities Cue';
    ReplicateData = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(10; "Role Filter"; Enum "Role PA PWD")
        {
            Caption = 'Role Filter';
            FieldClass = FlowFilter;
        }
        field(15; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(20; Certifications; Integer)
        {
            CalcFormula = Count("Certification PA PWD" where(Role = field("Role Filter")));
            Caption = 'Certifications';
            FieldClass = FlowField;
        }
        field(30; "Certification Exams"; Integer)
        {
            CalcFormula = Count("Certification Exam PA PWD" where(Role = field("Role Filter"), "User ID" = field("User ID Filter")));
            Caption = 'Certifications Exams';
            FieldClass = FlowField;
        }
        field(40; "Last Date/Time Modified"; DateTime)
        {
            Caption = 'Last Date/Time Modified';
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