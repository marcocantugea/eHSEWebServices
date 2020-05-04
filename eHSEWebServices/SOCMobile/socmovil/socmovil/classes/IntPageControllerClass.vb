Public Interface IntPageControllerClass

    ReadOnly Property Pagelang_configreader As socmobile_core.com.configuration.GlobalConfReader
    ReadOnly Property PageGlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader
    ReadOnly Property Base64Encoder As eservices_core.com.utilities.Base64Conversions

    Sub LoadLanguage()
    Sub LoadConfiguration()
    Sub LoadLanguage(session As HttpSessionState)
    Sub GetLbl(value As String)


End Interface
