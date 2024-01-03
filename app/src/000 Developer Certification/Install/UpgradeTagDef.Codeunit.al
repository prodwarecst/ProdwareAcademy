/// <summary>
/// Codeunit Upgrade Tag Def PDA (ID 70101).
/// </summary>
codeunit 70101 "Upgrade Tag Def PDA"
{
    // Register the new upgrade tag for new companies when they are created
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(GetGuidedExperienceItemsUpgradeTag());
    end;

    /// <summary>
    /// Get Guided Experience Items Upgrade Tag.
    /// </summary>
    /// <returns>Return value of type Text[250].</returns>
    internal procedure GetGuidedExperienceItemsUpgradeTag(): Text[250]
    begin
        exit('PDA-0001-GuidedExperienceItems-19.0.2111');
    end;
}