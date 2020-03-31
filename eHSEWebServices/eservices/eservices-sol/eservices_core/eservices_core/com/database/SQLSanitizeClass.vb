Namespace com.database
    Public Class SQLSanitizeClass

        Public Function SanitizeSTR(str As String) As String
            Dim var_sanitize As String = str

            var_sanitize = var_sanitize.Replace(";", "")
            var_sanitize = var_sanitize.Replace("'", "")
            var_sanitize = var_sanitize.Replace("--", "")
            var_sanitize = var_sanitize.Replace("/*", "")
            var_sanitize = var_sanitize.Replace("*/", "")

            Return var_sanitize
        End Function

    End Class
End Namespace