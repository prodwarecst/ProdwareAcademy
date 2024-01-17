/// <summary>
/// Table Error Handling Log PDA (ID 70100).
/// </summary>
table 70100 "Error Handling Log PDA"
{
    Access = Internal;
    DataClassification = CustomerContent;
    Caption = 'Error Handling Log';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(10; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(15; "Time"; Time)
        {
            Caption = 'Time';
        }
        field(20; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
        }
        field(25; "Error Call Stack"; Blob)
        {
            Caption = 'Error Call Stack';
            DataClassification = SystemMetadata;
        }
        field(30; "Error Message Register Id"; Guid)
        {
            Caption = 'Error Message Register Id';
            DataClassification = SystemMetadata;
            TableRelation = "Error Message Register".ID;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// Adds log entry.
    /// </summary>
    procedure AddLogEntry()
    var
        ErrorHandlingLog: Record "Error Handling Log PDA";
        ErrorText: Text;
    begin
        ErrorText := GetLastErrorText();
        if ErrorText <> '' then begin
            Clear(ErrorHandlingLog);
            ErrorHandlingLog.Init();
            ErrorHandlingLog."Entry No." := 0;
            ErrorHandlingLog.Date := WorkDate();
            ErrorHandlingLog.Time := Time();
            ErrorHandlingLog.SetErrorCallStack(GetLastErrorCallStack());
            ErrorHandlingLog."Error Message" := CopyStr(ErrorText, 1, MaxStrLen(ErrorHandlingLog."Error Message"));
            ErrorHandlingLog.Insert();
        end;
    end;

    /// <summary>
    /// Sets error call stack.
    /// </summary>
    /// <param name="NewCallStack">Text.</param>
    procedure SetErrorCallStack(NewCallStack: Text)
    var
        OutStream: OutStream;
    begin
        "Error Call Stack".CreateOutStream(OutStream, TextEncoding::Windows);
        OutStream.Write(NewCallStack);
    end;

    /// <summary>
    /// Gets error call stack.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure GetErrorCallStack(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
    begin
        TempBlob.FromRecord(Rec, FieldNo("Error Call Stack"));
        TempBlob.CreateInStream(InStream, TextEncoding::Windows);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;

    /// <summary>
    /// Shows error call stack.
    /// </summary>
    procedure ShowErrorCallStack()
    begin
        if GuiAllowed() then
            Message(GetErrorCallStack());
    end;

    /// <summary>
    /// Shows error message.
    /// </summary>
    procedure ShowErrorMessage()
    var
        ErrorMessage: Record "Error Message";
        ErrorMessages: Page "Error Messages";
        NoErrMsg: Label 'There is no error message.';
    begin
        ErrorMessage.SetRange("Register ID", "Error Message Register Id");
        if not IsNullGuid("Error Message Register Id") and ErrorMessage.FindSet() then begin
            ErrorMessages.SetRecords(ErrorMessage);
            ErrorMessages.Run();
        end else
            if "Error Message" = '' then
                Message(NoErrMsg)
            else
                Message("Error Message");
    end;
}