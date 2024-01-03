/// <summary>
/// Page Certification Answers PDA (ID 70111).
/// </summary>
page 70111 "Certification Answers PDA"
{
    Caption = 'Certification Answers';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Certification Answer PDA";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Answer; Rec."Answer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Answer field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Correct Answer field.';
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