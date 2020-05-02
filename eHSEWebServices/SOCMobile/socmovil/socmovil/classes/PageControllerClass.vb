Public Class PageControllerClass
    Inherits System.Web.UI.UserControl

    Private _lang_configreader As LanguageClass
    Private _GlobalConfigReader As ConfigurationClass
    Private _UnitofWork As eservices_datamanager.UnitOfWork

    Public ReadOnly Property UnitOfWork As eservices_datamanager.UnitOfWork
        Get
            Return _UnitofWork
        End Get
    End Property

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
        _UnitofWork = New eservices_datamanager.UnitOfWork
    End Sub
    Public Sub LoadLangConfig(lang_configreader As socmobile_core.com.configuration.GlobalConfReader)
        _lang_configreader = New LanguageClass(lang_configreader)
    End Sub

    Public Overridable Sub LoadConfiguration(filepath As String)
        _GlobalConfigReader = New ConfigurationClass(filepath)
    End Sub

End Class
