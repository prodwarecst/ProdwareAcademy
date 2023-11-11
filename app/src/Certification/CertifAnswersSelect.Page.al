/// <summary>
/// Page Certif. Answers Select. PA PWD (ID 70113).
/// </summary>
page 70113 "Certif. Answers Select. PA PWD"
{
    Caption = 'Certification Answers';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Certification Answer PA PWD";
    RefreshOnActivate = true;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

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
            }
        }
    }
}