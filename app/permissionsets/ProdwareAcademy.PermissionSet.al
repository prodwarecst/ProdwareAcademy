/// <summary>
/// Permission Set Prodware Academy PDA (ID 70102).
/// </summary>
permissionset 70102 "Prodware Academy PDA"
{
    Assignable = true;
    Permissions = tabledata "Error Handling Log PDA" = RIMD,
        tabledata "Integration Setup PDA" = RIMD,
        tabledata "Type Helper Test PDA" = RIMD,
        table "Error Handling Log PDA" = X,
        table "Integration Setup PDA" = X,
        table "Type Helper Test PDA" = X,
        codeunit "Error Call Stack Test PDA" = X,
        codeunit "Error Handling Mgt. PDA" = X,
        codeunit "Integration Setup Mgt. PDA" = X,
        codeunit "Type Helper Test PDA" = X,
        page "Error Handling Log Entries PDA" = X,
        page "Error Handling Test PDA" = X,
        page "Integration Setup PDA" = X,
        page "Type Helper Test PDA" = X;
}