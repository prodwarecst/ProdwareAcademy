/// <summary>
/// Permission Set Isolated Storage PDA (ID 70102).
/// </summary>
permissionset 70102 "Isolated Storage PDA"
{
    Assignable = true;
    Permissions = tabledata "Integration Setup PDA" = RIMD,
        table "Integration Setup PDA" = X,
        page "Integration Setup PDA" = X,
        codeunit "Integration Setup Test PDA" = X;
}