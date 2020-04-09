Public NotInheritable Class LanguageClass
    Inherits System.Web.UI.UserControl
    Implements IntConfig

    Private _Configuration As socmobile_core.com.configuration.GlobalConfReader

    Public Property Configuration As socmobile_core.com.configuration.GlobalConfReader Implements IntConfig.Configuration
        Get
            Return _Configuration
        End Get
        Set(value As socmobile_core.com.configuration.GlobalConfReader)
            _Configuration = value
        End Set
    End Property

    Sub New(lang_configreader As socmobile_core.com.configuration.GlobalConfReader)
        _Configuration = lang_configreader
    End Sub

    Public Function GetValue(value As String) As String Implements IntConfig.GetValue
        If Not IsNothing(_Configuration) Then
            Return _Configuration.GetValue(value)
        End If
        Return Nothing
    End Function

    Public Sub LoadConfig() Implements IntConfig.LoadConfig


    End Sub

    Public Function Getlbl(value As String) As String
        Return GetValue(value)
    End Function

End Class
