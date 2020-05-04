Public Class PageControllerClass
    Inherits System.Web.UI.UserControl
    Implements IntPageControllerClass

    Private _lang_configreader As LanguageClass
    Private _GlobalConfigReader As ConfigurationClass
    Private _UnitofWork As eservices_datamanager.UnitOfWork
    Private _Base64 As eservices_core.com.utilities.Base64Conversions

    Public ReadOnly Property UnitOfWork As eservices_datamanager.UnitOfWork
        Get
            Try
                If Not IsNothing(Me.Session("_UnitofWork")) Then
                    _UnitofWork = Me.Session("_UnitofWork")
                Else
                    _UnitofWork = New eservices_datamanager.UnitOfWork
                    Me.Session("_UnitofWork") = _UnitofWork
                End If
            Catch ex As Exception

            End Try

            Return _UnitofWork
        End Get
    End Property

    Private Property GlobalConfigReader As ConfigurationClass
        Get
            Return _GlobalConfigReader
        End Get
        Set(value As ConfigurationClass)
            _GlobalConfigReader = value
        End Set
    End Property

    Private Property lang_configreader As LanguageClass
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
        If Not IsNothing(Me.Session("_lang_configreader")) Then
            _lang_configreader = Me.Session("_lang_configreader")
        Else
            _lang_configreader = New LanguageClass(lang_configreader)
            Me.Session("_lang_configreader") = _lang_configreader
        End If

    End Sub

    Public Overridable Sub LoadConfiguration(filepath As String)
        If Not IsNothing(Me.Session("_GlobalConfigReader")) Then
            _GlobalConfigReader = Me.Session("_GlobalConfigReader")
        Else
            _GlobalConfigReader = New ConfigurationClass(filepath)
            Me.Session("_GlobalConfigReader") = _GlobalConfigReader
        End If
    End Sub

    Public Sub LoadConfiguration() Implements IntPageControllerClass.LoadConfiguration
        LoadConfiguration(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    End Sub

    Public Sub GetLbl(value As String) Implements IntPageControllerClass.GetLbl
        Response.Write(lang_configreader.Getlbl(value))
    End Sub

    Public Sub LoadLanguage() Implements IntPageControllerClass.LoadLanguage
        LoadLangConfig(CType(Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadLanguage(session As HttpSessionState) Implements IntPageControllerClass.LoadLanguage
        LoadLangConfig(CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public ReadOnly Property PageGlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.PageGlobalConfigReader
        Get
            Return GlobalConfigReader.Configuration
        End Get
    End Property

    Public ReadOnly Property Pagelang_configreader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.Pagelang_configreader
        Get
            Return lang_configreader.Configuration
        End Get
    End Property

    Public ReadOnly Property Base64Encoder As eservices_core.com.utilities.Base64Conversions Implements IntPageControllerClass.Base64Encoder
        Get
            If IsNothing(_Base64) Then
                _Base64 = New eservices_core.com.utilities.Base64Conversions
            End If

            Return _Base64
        End Get
    End Property
End Class
