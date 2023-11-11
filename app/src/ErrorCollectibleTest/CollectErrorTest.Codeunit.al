/// <summary>
/// Codeunit Collect. Error Test PA PWD (ID 70104).
/// </summary>
codeunit 70104 "Collect. Error Test PA PWD"
{
    trigger OnRun()
    begin
        TestCollectibleError();
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    internal procedure TestCollectibleError()
    var
        Customer: Record Customer;
        BlueLocErrInfo: ErrorInfo;
        BlueLocErr: Label 'Location BLUE will be deleted but the following customers still use that location.';
        BlueLocDetErr: Label 'Customer %1 cannot have Location %2', Comment = '%1=Customer No., %2=Location Code';
    begin
        Customer.Reset();
        Customer.SetRange("Location Code", 'BLUE');
        if Customer.FindSet() then
            repeat
                BlueLocErrInfo := ErrorInfo.Create(BlueLocErr);
                BlueLocErrInfo.ErrorType := ErrorType::Client;
                BlueLocErrInfo.Verbosity := Verbosity::Error;
                BlueLocErrInfo.Message := StrSubstNo(BlueLocDetErr, Customer."No.", Customer."Location Code");
                BlueLocErrInfo.Collectible(true);
                Error(BlueLocErrInfo);
            until Customer.Next() = 0;
    end;

    internal procedure TestError()
    var
        Customer: Record Customer;
        BlueLocDetErr: Label 'Customer %1 cannot have Location %2', Comment = '%1=Customer No., %2=Location Code';
    begin
        Customer.Reset();
        Customer.SetRange("Location Code", 'BLUE');
        if Customer.FindSet() then
            repeat
                Error(BlueLocDetErr, Customer."No.", Customer."Location Code");
            until Customer.Next() = 0;
    end;
}