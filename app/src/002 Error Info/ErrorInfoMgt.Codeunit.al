/// <summary>
/// Codeunit Error Info Mgt. PDA (ID 70105).
/// </summary>
codeunit 70105 "Error Info Mgt. PDA"
{
    Access = Internal;

    /// <summary>
    /// Tests API endpoint url from integration setup via simple TestField procedure.
    /// </summary>
    procedure TestStandardError()
    var
        IntegrationSetup: Record "Integration Setup PDA";
    begin
        IntegrationSetup.Get();
        IntegrationSetup.TestField("API Endpoint Url");
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    /// <summary>
    /// Tests collectible errors behavior.
    /// </summary>
    procedure TestCollectibleErrors()
    var
        ErrorInfoObject: ErrorInfo;
        i: Integer;
        ErrorLbl: Label 'Error %1', Locked = true;
        DetailedErrorLbl: Label 'Detailed error message %1', Locked = true;
    begin
        for i := 1 to 3 do begin
            Clear(ErrorInfoObject);
            ErrorInfoObject := ErrorInfo.Create(StrSubstNo(ErrorLbl, i));
            ErrorInfoObject.DetailedMessage(StrSubstNo(DetailedErrorLbl, i));
            ErrorInfoObject.Collectible(true);
            Error(ErrorInfoObject);
        end;
    end;

    /// <summary>
    /// Tests API endpoint url from integration setup via using ErrorInfo data type.
    /// </summary>
    procedure TestErrorInfoNavigationAction()
    var
        IntegrationSetup: Record "Integration Setup PDA";
        ErrorInfoObject: ErrorInfo;
        APIEndpointUrlErr: Label 'Invalid API Endpoint Url.';
        OpenSetupLbl: Label 'Open Integration Setup';
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."API Endpoint Url" = '' then begin
            ErrorInfoObject.Message := APIEndpointUrlErr;
            ErrorInfoObject.PageNo := Page::"Integration Setup PDA";
            ErrorInfoObject.AddNavigationAction(OpenSetupLbl);
            Error(ErrorInfoObject);
        end;
    end;
}