/// <summary>
/// Codeunit Install Codeunit PDA (ID 70100).
/// </summary>
codeunit 70100 "Install Codeunit PDA"
{
    Subtype = Install;

    var
        DataUpgrade: Codeunit "Data Upgrade PDA";

    trigger OnInstallAppPerCompany()
    begin
        DataUpgrade.RunUpgradeGuidedExperienceItems();
    end;
}