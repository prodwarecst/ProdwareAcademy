/// <summary>
/// Page Headline RC Developer PDA (ID 70101).
/// </summary>
page 70101 "Headline RC Developer PDA"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(UserGreeting)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingText; RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = All;
                    Caption = 'Greeting headline';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Developer PDA");
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
        UserGreetingVisible: Boolean;
}