/// <summary>
/// Page Certification Questions PDA (ID 70110).
/// </summary>
page 70110 "Certification Questions PDA"
{
    Caption = 'Certification Questions';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Certification Question PDA";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Question; Rec."Question")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Question field.';
                }
            }
        }
        area(Factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(Answers)
            {
                ApplicationArea = All;
                Caption = 'Answers';
                Image = Answers;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                RunObject = Page "Certification Answers PDA";
                RunPageLink = "Question No." = field("Question No.");
                ToolTip = 'View or add answers for the certification question.';
                Visible = ActionEnabled;
                Enabled = ActionEnabled;
            }
        }
    }

    var
        PermissionMgt: Codeunit "Permission Mgt. PDA";
        ActionEnabled: Boolean;

    trigger OnInit()
    var
        NoPermissionErr: Label 'You don''t have the permissions to open this page.';
    begin
        ActionEnabled := PermissionMgt.CheckSetupPermission();
        if not ActionEnabled then
            Error(NoPermissionErr);
    end;
}