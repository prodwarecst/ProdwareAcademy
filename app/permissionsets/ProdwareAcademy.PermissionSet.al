/// <summary>
/// Permission Set Prodware Academy PDA (ID 70102).
/// </summary>
permissionset 70102 "Prodware Academy PDA"
{
    Assignable = true;
    Permissions = tabledata "Integration Setup PDA" = RIMD,
        table "Integration Setup PDA" = X,
        codeunit "Error Info Mgt. PDA" = X,
        codeunit "Integration Setup Mgt. PDA" = X,
        page "Error Info Test PDA" = X,
        page "Integration Setup PDA" = X;
}