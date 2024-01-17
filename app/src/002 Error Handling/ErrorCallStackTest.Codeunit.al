/// <summary>
/// Codeunit Error Call Stack Test PDA (ID 70100).
/// </summary>
codeunit 70100 "Error Call Stack Test PDA"
{
    trigger OnRun()
    var
        ErrorHandlingMgt: Codeunit "Error Handling Mgt. PDA";
    begin
        Clear(ErrorHandlingMgt);
        ErrorHandlingMgt.TestStandardError();
    end;
}