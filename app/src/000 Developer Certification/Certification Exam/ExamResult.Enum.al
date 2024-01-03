/// <summary>
/// Enum Exam Result PDA (ID 70101).
/// </summary>
enum 70101 "Exam Result PDA"
{
    Caption = 'Exam Result';
    Extensible = true;

    value(0; Blank) { Caption = ''; }
    value(1; Passed) { Caption = 'Passed'; }
    value(2; "Not Passed") { Caption = 'Not Passed'; }
}