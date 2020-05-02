Public Interface IntPageControllerClass

    ReadOnly Property Pagelang_configreader As socmobile_core.com.configuration.GlobalConfReader
    ReadOnly Property PageGlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader
    Sub LoadLanguage()
    Sub LoadConfiguration()
    Sub LoadLanguage(session As HttpSessionState)
    Sub GetLbl(value As String)


End Interface
