/// <summary>
/// PageExtension Customer List PA PWD (ID 70100) extends Record Customer List.
/// </summary>
pageextension 70100 "Customer List PA PWD" extends "Customer List" //22
{
    actions
    {
        addlast(processing)
        {
            action("CheckBlueLoc1PAPWD PA PWD")
            {
                ApplicationArea = All;
                Caption = 'Check BLUE Location';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Check BLUE Location action.';
                trigger OnAction()
                var
                    CollectErrorTest: Codeunit "Collect. Error Test PA PWD";
                begin
                    Clear(CollectErrorTest);
                    CollectErrorTest.TestError();
                end;
            }
            action("CheckBlueLoc2PAPWD PA PWD")
            {
                ApplicationArea = All;
                Caption = 'Check BLUE Location Collectible';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Check BLUE Location Collectible action.';
                trigger OnAction()
                var
                    CollectErrorTest: Codeunit "Collect. Error Test PA PWD";
                begin
                    Clear(CollectErrorTest);
                    CollectErrorTest.TestCollectibleError();
                end;
            }
        }
    }
}