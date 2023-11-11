/// <summary>
/// Page Certification Questions PA PWD (ID 70110).
/// </summary>
page 70110 "Certification Questions PA PWD"
{
    Caption = 'Certification Questions';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Certification Question PA PWD";
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
                RunObject = Page "Certification Answers PA PWD";
                RunPageLink = "Question No." = field("Question No.");
                ToolTip = 'View or add answers for the certification question.';
                Visible = ActionEnabled;
                Enabled = ActionEnabled;
            }
        }
    }

    var
        PermissionMgt: Codeunit "Permission Mgt. PA PWD";
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