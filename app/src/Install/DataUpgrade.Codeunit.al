/// <summary>
/// Codeunit Data Upgrade PA PWD (ID 70103).
/// </summary>
codeunit 70103 "Data Upgrade PA PWD"
{
    #region PDWPA-0001-GuidedExperienceItems-19.0.2111 

    /// <summary>
    /// Run Upgrade Guided Experience Items.
    /// </summary>
    internal procedure RunUpgradeGuidedExperienceItems()
    var
        UpgradeTagDefinitions: Codeunit "Upgrade Tag Def PA PWD";
        UpgradeTagMgt: Codeunit "Upgrade Tag";
    begin
        if UpgradeTagMgt.HasUpgradeTag(UpgradeTagDefinitions.GetGuidedExperienceItemsUpgradeTag()) then
            exit;

        UpgradeGuidedExperienceItems();

        UpgradeTagMgt.SetUpgradeTag(UpgradeTagDefinitions.GetGuidedExperienceItemsUpgradeTag());
    end;

    /// <summary>
    /// Upgrade Guided Experience Items.
    /// </summary>
    local procedure UpgradeGuidedExperienceItems()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        // Developer Guided Experience Items
        GuidedExperience.InsertVideo(
            'Getting Started with BC development (Part 1)',
            'Development Training (Part 1)',
            'Explore the video how to develop in Visual Studio Code for Dynamics 365 Business Central (Part 1).',
            105,
            'https://www.youtube.com/embed/04T2pAnXjGQ',
            "Video Category"::Uncategorized
        );
        GuidedExperience.InsertVideo(
            'Getting Started with BC development (Part 2)',
            'Development Training (Part 2)',
            'Explore the video how to develop in Visual Studio Code for Dynamics 365 Business Central (Part 2).',
            122,
            'https://www.youtube.com/embed/Sd7G8jyipKE',
            "Video Category"::Uncategorized
        );
        GuidedExperience.InsertLearnLink(
            'Find training on Microsoft Learn',
            'Microsoft Learn',
            'Explore the free e-learning material for Business Central on the Microsoft Learn site in a new browser tab.',
            1440,
            'https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/'
        );
        GuidedExperience.InsertManualSetup(
            'Take Certification Exam',
            'Certification Exam',
            'Prepare yourself, select the certification you want to achieve and take the certification exam.',
            60,
            ObjectType::Page,
            Page::"Certification List PA PWD",
            "Manual Setup Category"::Uncategorized,
            'Certification, Certification Exam'
        );
        // TODO: Consultants Guided Experience Items
    end;
    #endregion
}