/// <summary>
/// Codeunit Permission Mgt. PA PWD (ID 70102).
/// </summary>
codeunit 70102 "Permission Mgt. PA PWD"
{
    /// <summary>
    /// Check Setup Permission enabled for the current user.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    internal procedure CheckSetupPermission(): Boolean
    var
        AccessControl: Record "Access Control";
    begin
        AccessControl.Reset();
        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'ACADEMY SETUP PA PWD');
        exit(not AccessControl.IsEmpty());
    end;
}