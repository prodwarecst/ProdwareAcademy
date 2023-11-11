/// <summary>
/// Codeunit Install Codeunit PA PWD (ID 70100).
/// </summary>
codeunit 70100 "Install Codeunit PA PWD"
{
    Subtype = Install;

    var
        DataUpgrade: Codeunit "Data Upgrade PA PWD";

    trigger OnInstallAppPerCompany()
    begin
        DataUpgrade.RunUpgradeGuidedExperienceItems();
    end;
}