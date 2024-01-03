/// <summary>
/// Enum Role PDA (ID 70100).
/// </summary>
enum 70100 "Role PDA"
{
    Caption = 'Role';
    Extensible = true;

    value(0; Blank) { Caption = ''; }
    value(1; Developer) { Caption = 'Developer'; }
    value(2; Consultant) { Caption = 'Consultant'; }
}