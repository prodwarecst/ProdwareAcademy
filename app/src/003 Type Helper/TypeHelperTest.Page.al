/// <summary>
/// Page Type Helper Test PDA (ID 70101).
/// </summary>
page 70101 "Type Helper Test PDA"
{
    Caption = 'Type Helper Test';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Type Helper Test PDA";

    layout
    {
        area(Content)
        {
            field("Phone No."; Rec."Phone No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Phone No. field.';
            }
            field("Language ID"; Rec."Language Id")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Language Id field.';
            }
            field("Date"; Rec."Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date field.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(IsPhoneNumber)
            {
                ApplicationArea = All;
                Caption = 'IsPhoneNumber';
                Image = Calls;
                ToolTip = 'Tests IsPhoneNumber procedure from Type Helper.';

                trigger OnAction()
                var
                    TypeHelperTest: Codeunit "Type Helper Test PDA";
                begin
                    TypeHelperTest.TestIsPhoneNumber(Rec);
                end;
            }
            action(LanguageIDToCultureName)
            {
                ApplicationArea = All;
                Caption = 'LanguageIDToCultureName';
                Image = Language;
                ToolTip = 'Tests LanguageIDToCultureName procedure from Type Helper Test.';

                trigger OnAction()
                var
                    TypeHelperTest: Codeunit "Type Helper Test PDA";
                begin
                    TypeHelperTest.TestLanguageIDToCultureName(Rec);
                end;
            }
            action(FormatDate)
            {
                ApplicationArea = All;
                Caption = 'FormatDate';
                Image = DueDate;
                ToolTip = 'Tests FormatDate procedure from Type Helper.';

                trigger OnAction()
                var
                    TypeHelperTest: Codeunit "Type Helper Test PDA";
                begin
                    TypeHelperTest.TestFormatDate(Rec);
                end;
            }
            action(EvaluateDate)
            {
                ApplicationArea = All;
                Caption = 'EvaluateDate';
                Image = Evaluate;
                ToolTip = 'Tests EvaluateDate procedure from Type Helper.';

                trigger OnAction()
                var
                    TypeHelperTest: Codeunit "Type Helper Test PDA";
                begin
                    TypeHelperTest.TestEvaluateDate();
                end;
            }
        }
        area(Promoted)
        {
            actionref(IsPhoneNumber_Promoted; IsPhoneNumber)
            {
            }
            actionref(LanguageIDToCultureName_Promoted; LanguageIDToCultureName)
            {
            }
            actionref(FormatDate_Promoted; FormatDate)
            {
            }
            actionref(EvaluateDate_Promoted; EvaluateDate)
            {
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}