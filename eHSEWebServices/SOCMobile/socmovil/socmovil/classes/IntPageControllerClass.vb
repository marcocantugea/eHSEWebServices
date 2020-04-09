Public Interface IntPageControllerClass

    ReadOnly Property lang_configreader As socmobile_core.com.configuration.GlobalConfReader
    ReadOnly Property GlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader
    Sub LoadLanguage()
    Sub LoadConfiguration()
    Sub LoadLanguage(session As HttpSessionState)
    Sub GetLbl(value As String)


End Interface
