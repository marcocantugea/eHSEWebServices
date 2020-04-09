Public NotInheritable Class ConfigurationClass
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
    Sub New(filepath As String)
        _Configuration = New socmobile_core.com.configuration.GlobalConfReader
        _Configuration.LoadFileSetting(filepath)
    End Sub
    Public Function GetValue(value As String) As String Implements IntConfig.GetValue
        If Not IsNothing(_Configuration) Then
            Return _Configuration.GetValue(value)
        End If
    End Function

    Public Sub LoadConfig() Implements IntConfig.LoadConfig

    End Sub
End Class
