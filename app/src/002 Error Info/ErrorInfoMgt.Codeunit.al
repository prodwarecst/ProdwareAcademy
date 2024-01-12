/// <summary>
/// Codeunit Error Info Mgt. PDA (ID 70105).
/// </summary>
codeunit 70105 "Error Info Mgt. PDA"
{
    Access = Internal;

    /// <summary>
    /// Tests standard error for TestField procedure.
    /// </summary>
    procedure TestStandardError()
    var
        Customer: Record Customer;
    begin
        Customer.Reset();
        if Customer.FindSet() then
            repeat
                Customer.TestField(Blocked, "Customer Blocked"::" ");
            until Customer.Next() = 0;
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    /// <summary>
    /// Tests collectible errors behavior for TestField procedure.
    /// </summary>
    procedure TestCollectibleErrors()
    var
        Customer: Record Customer;
    begin
        Customer.Reset();
        if Customer.FindSet() then
            repeat
                Customer.TestField(Blocked, "Customer Blocked"::" ", ErrorInfo.Create());
            until Customer.Next() = 0;
    end;

    /// <summary>
    /// Tests actionable errors with navigation action.
    /// </summary>
    procedure TestActionableErrorsNavigationAction()
    var
        IntegrationSetup: Record "Integration Setup PDA";
        ErrorInfoObject: ErrorInfo;
        APIEndpointUrlErr: Label 'Invalid API Endpoint Url.';
        OpenSetupLbl: Label 'Open Integration Setup';
    begin
        Clear(ErrorInfoObject);
        IntegrationSetup.Get();
        if IntegrationSetup."API Endpoint Url" = '' then begin
            ErrorInfoObject.Message := APIEndpointUrlErr;
            ErrorInfoObject.PageNo := Page::"Integration Setup PDA";
            ErrorInfoObject.AddNavigationAction(OpenSetupLbl);
            Error(ErrorInfoObject);
        end;
    end;

    /// <summary>
    /// Tests actionable errors with fix-it action.
    /// </summary>
    procedure TestActionableErrorsFixAction()
    var
        IntegrationSetup: Record "Integration Setup PDA";
        ErrorInfoObject: ErrorInfo;
        APIEndpointUrlErr: Label 'Invalid API Endpoint Url.';
        APIEndpointUrlMustBeLbl: Label 'API Endpoint Url must be: %1', Comment = '%1=Correct Url';
        APIEndpointUrlSetValueLbl: Label 'Set value to: %1', Comment = '%1=Correct Url';
        APIEndpointUrlCorrectLbl: Label 'https://catfact.ninja/fact', Locked = true;
    begin
        Clear(ErrorInfoObject);
        IntegrationSetup.Get();
        if IntegrationSetup."API Endpoint Url" = '' then begin
            ErrorInfoObject.Title := APIEndpointUrlErr;
            ErrorInfoObject.Message := StrSubstNo(APIEndpointUrlMustBeLbl, APIEndpointUrlCorrectLbl);
            ErrorInfoObject.AddAction(StrSubstNo(APIEndpointUrlSetValueLbl, APIEndpointUrlCorrectLbl), Codeunit::"Error Info Mgt. PDA", 'SetAPIEndpointUrl');
            Error(ErrorInfoObject);
        end;
    end;

    /// <summary>
    /// Sets value for API Endpoint Url based on actionable error provided in TestActionableErrorsFixAction procedure.
    /// </summary>
    /// <param name="ErrorInfoObject">ErrorInfo.</param>
    procedure SetAPIEndpointUrl(ErrorInfoObject: ErrorInfo)
    var
        IntegrationSetup: Record "Integration Setup PDA";
        APIEndpointUrlCorrectLbl: Label 'https://catfact.ninja/fact', Locked = true;
    begin
        IntegrationSetup.Get();
        IntegrationSetup."API Endpoint Url" := APIEndpointUrlCorrectLbl;
        IntegrationSetup.Modify();
    end;
}