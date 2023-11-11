/// <summary>
/// Enum Exam Result PA PWD (ID 70101).
/// </summary>
enum 70101 "Exam Result PA PWD"
{
    Caption = 'Exam Result';
    Extensible = true;

    value(0; Blank) { Caption = ''; }
    value(1; Passed) { Caption = 'Passed'; }
    value(2; "Not Passed") { Caption = 'Not Passed'; }
}