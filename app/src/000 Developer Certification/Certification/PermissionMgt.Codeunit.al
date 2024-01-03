/// <summary>
/// Codeunit Permission Mgt. PDA (ID 70102).
/// </summary>
codeunit 70102 "Permission Mgt. PDA"
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
        AccessControl.SetRange("Role ID", 'ACADEMY SETUP PDA');
        exit(not AccessControl.IsEmpty());
    end;
}