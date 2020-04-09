Public Interface IntLanguage

    ReadOnly Property lang_configreader As socmobile_core.com.configuration.GlobalConfReader
    Sub LoadLanguage(session As HttpSessionState)
    Sub LoadLanguage()
    Sub Getlabel(value As String)


End Interface
