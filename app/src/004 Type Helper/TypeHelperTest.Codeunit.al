/// <summary>
/// Codeunit Type Helper Test PDA (ID 70101).
/// </summary>
codeunit 70101 "Type Helper Test PDA"
{
    Access = Internal;

    var
        TypeHelper: Codeunit "Type Helper";

    /// <summary>
    /// Tests IsPhoneNumber procedure from Type Helper codeunit.
    /// </summary>
    /// <param name="TypeHelperTest">Record "Type Helper Test PDA".</param>
    procedure TestIsPhoneNumber(TypeHelperTest: Record "Type Helper Test PDA")
    var
        ResultLbl: Label '%1', Locked = true;
    begin
        Message(ResultLbl, TypeHelper.IsPhoneNumber(TypeHelperTest."Phone No."));
    end;

    /// <summary>
    /// Tests LanguageIDToCultureName from Type Helper codeunit.
    /// </summary>
    /// <param name="TypeHelperTest">Record "Type Helper Test PDA".</param>
    procedure TestLanguageIDToCultureName(TypeHelperTest: Record "Type Helper Test PDA")
    var
        ResultLbl: Label '%1', Locked = true;
    begin
        Message(ResultLbl, TypeHelper.LanguageIDToCultureName(TypeHelperTest."Language Id"));
    end;

    /// <summary>
    /// Tests FormatDate from Type Helper codeunit.
    /// </summary>
    /// <param name="TypeHelperTest">Record "Type Helper Test PDA".</param>
    procedure TestFormatDate(TypeHelperTest: Record "Type Helper Test PDA")
    var
        ResultLbl: Label '%1', Locked = true;
    begin
        Message(ResultLbl, TypeHelper.FormatDate(TypeHelperTest."Date", TypeHelperTest."Language Id"));
    end;

    /// <summary>
    /// Tests EvaluateDate from Type Helper codeunit.
    /// </summary>
    procedure TestEvaluateDate()
    var
        EvaluateDate: Date;
        VariantDate: Variant;
        ResultLbl: Label '%1', Locked = true;
    begin
        EvaluateDate := 0D;
        VariantDate := EvaluateDate;

        TypeHelper.Evaluate(VariantDate, '20240125', 'yyyyMMdd', '');

        EvaluateDate := VariantDate;
        Message(ResultLbl, EvaluateDate);
    end;
}