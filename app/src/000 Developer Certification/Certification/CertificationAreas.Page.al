/// <summary>
/// Page Certification Areas PDA (ID 70106).
/// </summary>
page 70106 "Certification Areas PDA"
{
    Caption = 'Certification Areas';
    PageType = ListPart;
    DelayedInsert = true;
    LinksAllowed = false;
    UsageCategory = None;
    SourceTable = "Certification Area PDA";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Questions)
            {
                ApplicationArea = All;
                Caption = 'Questions';
                Image = Questionaire;
                RunObject = Page "Certification Questions PDA";
                RunPageLink = "Certification Code" = field("Certification Code"), "Certification Area Code" = field(Code);
                ToolTip = 'View or add questions for the certification.';
                Visible = ActionEnabled;
                Enabled = ActionEnabled;
            }
        }
    }
    var
        PermissionMgt: Codeunit "Permission Mgt. PDA";
        ActionEnabled: Boolean;

    trigger OnInit()
    begin
        ActionEnabled := PermissionMgt.CheckSetupPermission();
    end;
}