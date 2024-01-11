/// <summary>
/// Codeunit Integration Setup Mgt. PDA (ID 70104).
/// </summary>
codeunit 70104 "Integration Setup Mgt. PDA"
{
    Access = Internal;

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