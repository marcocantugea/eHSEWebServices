Public Class PageControllerClass

    Private _lang_configreader As LanguageClass
    Private _GlobalConfigReader As ConfigurationClass

    Public Property GlobalConfigReader As ConfigurationClass
        Get
            Return _GlobalConfigReader
        End Get
        Set(value As ConfigurationClass)
            _GlobalConfigReader = value
        End Set
    End Property

    Public Property lang_configreader As LanguageClass
        Get
            Return _lang_configreader
        End Get
        Set(value As LanguageClass)
            _lang_configreader = value
        End Set
    End Property

    Sub New()

    End Sub
    Public Sub LoadLangConfig(lang_configreader As socmobile_core.com.configuration.GlobalConfReader)
        _lang_configreader = New LanguageClass(lang_configreader)
    End Sub

    Public Sub LoadConfiguration(filepath As String)
        _GlobalConfigReader = New ConfigurationClass(filepath)
    End Sub

End Class
