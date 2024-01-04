/// <summary>
/// Codeunit Integration Setup Test PDA (ID 70104).
/// </summary>
codeunit 70104 "Integration Setup Test PDA"
{
    Access = Internal;

    /// <summary>
    /// Tests API endpoint url from integration setup via simple TestField procedure.
    /// </summary>
    procedure TestAPIEndpointUrl()
    var
        IntegrationSetup: Record "Integration Setup PDA";
    begin
        IntegrationSetup.Get();
        IntegrationSetup.TestField("API Endpoint Url");
    end;

    /// <summary>
    /// Tests API endpoint url from integration setup via using ErrorInfo data type.
    /// </summary>
    procedure TestAPIEndpointUrlExt()
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

    [NonDebuggable]
    /// <summary>
    /// Sets credentials for API communication.
    /// </summary>
    /// <param name="APIUserName"></param>
    /// <param name="APIPassword"></param>
    procedure SetAPICredentials(APIUserName: Text; APIPassword: Text)
    var
        IntegrationSetup: Record "Integration Setup PDA";
        APIUserNameLbl: Label 'apiusername', Locked = true;
        APIPasswordLbl: Label 'apipassword', Locked = true;
    begin
        if IsolatedStorage.Contains(APIUserNameLbl, DataScope::Module) then
            IsolatedStorage.Delete(APIUserNameLbl);
        IsolatedStorage.Set(APIUserNameLbl, APIUserName, DataScope::Module);

        if IsolatedStorage.Contains(APIPasswordLbl, DataScope::Module) then
            IsolatedStorage.Delete(APIPasswordLbl);
        IsolatedStorage.Set(APIPasswordLbl, APIPassword, DataScope::Module);

        IntegrationSetup.Get();
        IntegrationSetup."API Credentials Set" := true;
        IntegrationSetup.Modify();
    end;

    [NonDebuggable]
    /// <summary>
    /// Gets credentials for API communication.
    /// </summary>
    /// <param name="APIUserName">VAR SecretText.</param>
    /// <param name="APIPassword">VAR SecretText.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure GetAPICredentials(var APIUserName: SecretText; var APIPassword: SecretText): Boolean
    var
        APIUserNameNotSecret, APIPasswordNotSecret : Text;
        APIUserNameLbl: Label 'apiusername', Locked = true;
        APIPasswordLbl: Label 'apipassword', Locked = true;
    begin
        if not IsolatedStorage.Get(APIUserNameLbl, DataScope::Module, APIUserNameNotSecret) then
            exit(false);
        if not IsolatedStorage.Get(APIPasswordLbl, DataScope::Module, APIPasswordNotSecret) then
            exit(false);

        APIUserName := APIUserNameNotSecret;
        APIPassword := APIPasswordNotSecret;
        exit(true);
    end;
}