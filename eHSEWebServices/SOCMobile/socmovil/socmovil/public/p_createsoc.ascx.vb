Public Class p_createsoc
    Inherits System.Web.UI.UserControl
    Implements IntPageControllerClass

    Private pagecontrollerclass As New PageControllerClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public ReadOnly Property GlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.GlobalConfigReader
        Get
            Return pagecontrollerclass.GlobalConfigReader.Configuration
        End Get
    End Property

    Public ReadOnly Property lang_configreader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.lang_configreader
        Get
            Return pagecontrollerclass.lang_configreader.Configuration
        End Get
    End Property

    Public Sub LoadConfiguration() Implements IntPageControllerClass.LoadConfiguration
        pagecontrollerclass.LoadConfiguration(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    End Sub

    Public Sub LoadLanguage() Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadLanguage(session As HttpSessionState) Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub GetLbl(value As String) Implements IntPageControllerClass.GetLbl
        Response.Write(pagecontrollerclass.lang_configreader.Getlbl(value))
    End Sub
End Class