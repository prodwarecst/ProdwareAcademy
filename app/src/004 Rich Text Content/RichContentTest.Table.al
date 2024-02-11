/// <summary>
/// Table Rich Content Test PDA (ID 70102).
/// </summary>
table 70102 "Rich Content Test PDA"
{
    Access = Internal;
    DataClassification = CustomerContent;
    Caption = 'Rich Content Test';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Code';
        }
        field(10; "Rich Content"; Blob)
        {
            Caption = 'Rich Content';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// Reads the "Rich Text" value into a stream and outputs the value as a text representation.
    /// </summary>
    /// <returns>A text value, which can be used with a Rich Text Editor.</returns>
    procedure GetRichContent(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        Rec.CalcFields(Rec."Rich Content");
        Rec."Rich Content".CreateInStream(InStream);
        InStream.ReadText(TextValue);
        exit(TextValue);
    end;

    /// <summary>
    /// Saves the text parameter in the "Rich Text" field.
    /// </summary>
    /// <param name="MyRichText">The value to save in blob field.</param>
    procedure SaveRichContent(RichText: Text)
    var
        OutStream: OutStream;
    begin
        Rec."Rich Content".CreateOutStream(OutStream);
        OutStream.WriteText(RichText);
        Rec.Modify();
    end;
}