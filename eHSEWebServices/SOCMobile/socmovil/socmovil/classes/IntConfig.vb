Public Interface IntConfig

    Property Configuration As socmobile_core.com.configuration.GlobalConfReader

    Sub LoadConfig()
    Function GetValue(value As String) As String


End Interface
