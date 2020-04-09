Public Class t_confirmtrans
    Inherits System.Web.UI.Page
    Implements IntConfig

    Private _Config As New socmobile_core.com.configuration.GlobalConfReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Property Configuration As socmobile_core.com.configuration.GlobalConfReader Implements IntConfig.Configuration
        Get
            Return _Config
        End Get
        Set(value As socmobile_core.com.configuration.GlobalConfReader)
            _Config = value
        End Set
    End Property

    Public Function GetValue(value As String) As String Implements IntConfig.GetValue
        Return _Config.GetValue(value)
    End Function

    Public Sub LoadConfig() Implements IntConfig.LoadConfig
        _Config = New socmobile_core.com.configuration.GlobalConfReader
        _Config.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    End Sub

    Public ReadOnly Property GlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader
        Get
            Return _Config
        End Get
    End Property


End Class