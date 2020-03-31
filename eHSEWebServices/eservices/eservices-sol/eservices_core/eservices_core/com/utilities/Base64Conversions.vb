Imports System.Text

Namespace com.utilities
    Public Class Base64Conversions

        Public Function EncodeBase64(text As String) As String
            Dim return_str As String
            Try
                Dim byt As Byte() = Encoding.ASCII.GetBytes(text)
                return_str = Convert.ToBase64String(byt)
            Catch ex As Exception

            End Try

            Return return_str
        End Function

        Public Function DecodeBase64(text As String) As String
            Dim return_str As String
            Try
                Dim byt As Byte() = System.Convert.FromBase64String(text)
                return_str = Encoding.ASCII.GetString(byt)
            Catch ex As Exception

            End Try
            Return return_str
        End Function

    End Class
End Namespace
