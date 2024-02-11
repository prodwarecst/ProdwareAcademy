/// <summary>
/// Page Rich Content Test PDA (ID 70102).
/// </summary>
page 70102 "Rich Content Test PDA"
{
    Caption = 'Rich Content Test';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Rich Content Test PDA";

    layout
    {
        area(Content)
        {
            group(RichContentGroup)
            {
                Caption = 'Rich Content Editor';

                // Rich Content is required to be alone in a FastTab group, which is a group that is at the root-level of the page
                field("Rich Content"; RichContent)
                {
                    Caption = 'Rich Content';
                    // Both ExtendedDataType and Multiline are required to render a Rich Content Editor
                    ExtendedDataType = RichContent;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Rich Content field.';

                    // Ensures that the value from the RichContent variable is persisted in the record
                    trigger OnValidate()
                    begin
                        Rec.SaveRichContent(RichContent);
                    end;
                }
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

    trigger OnAfterGetCurrRecord()
    begin
        RichContent := Rec.GetRichContent();
    end;

    var
        RichContent: Text;
}