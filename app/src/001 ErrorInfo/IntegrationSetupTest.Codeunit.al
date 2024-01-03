codeunit 70104 "Integration Setup Test PDA"
{
    Access = Internal;

    /// <summary>
    /// Tests API credentials from integration setup via simple TestField procedure.
    /// </summary>
    procedure TestAPICredentials()
    var
        IntegrationSetup: Record "Integration Setup PDA";
    begin
        IntegrationSetup.Get();
        IntegrationSetup.TestField("API Username");
        IntegrationSetup.TestField("API Password");
    end;

    /// <summary>
    /// Tests API credentials from integration setup via using ErrorInfo data type.
    /// </summary>
    procedure TestAPICredentialsExt()
    var
        IntegrationSetup: Record "Integration Setup PDA";
        ErrorInfoObject: ErrorInfo;
        APICredentialsErr: Label 'Invalid API credentials.';
        OpenSetupLbl: Label 'Open Integration Setup';
    begin
        IntegrationSetup.Get();
        if (IntegrationSetup."API Username" = '') or (IntegrationSetup."API Password" = '') then begin
            ErrorInfoObject.Message := APICredentialsErr;
            ErrorInfoObject.PageNo := Page::"Integration Setup PDA";
            ErrorInfoObject.AddNavigationAction(OpenSetupLbl);
            Error(ErrorInfoObject);
        end;
    end;
}