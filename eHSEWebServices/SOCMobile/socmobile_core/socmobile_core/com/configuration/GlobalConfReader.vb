Imports System.Configuration.ConfigurationSettings

Namespace com.configuration

    Public Class GlobalConfReader

        Private _GlobalConfigFile As String
        Private _GlobalValues As New Dictionary(Of String, String)

        Public Sub New()
            LoadFileSetting(AppSettings("GlobalConfigFile"))
        End Sub

        Public Sub GetValuesFromFile(textline As String)
            If textline.Contains("=") Then
                Dim v() As String = textline.Split("=")
                If v.Length >= 3 Then
                    Dim parameter As String = textline.Substring(0, textline.IndexOf("="))
                    Dim value As String = textline.Substring(textline.IndexOf("=") + 1)
                    _GlobalValues.Add(parameter, value)
                Else
                    _GlobalValues.Add(v(0), v(1))
                End If

            End If
        End Sub

        Public Function GetValue(variable As String) As String
            Try
                Return _GlobalValues.Item(variable)
            Catch ex As Exception
                Return Nothing
            End Try

        End Function

        Public Sub LoadFileSetting(filepath As String)
            'Carga el archivo de configuracion global, si no lo encuentra carga valores por default
            If System.IO.File.Exists(filepath) Then
                Dim fileReader As System.IO.StreamReader
                fileReader =
                My.Computer.FileSystem.OpenTextFileReader(filepath)

                While Not fileReader.EndOfStream
                    GetValuesFromFile(fileReader.ReadLine)
                End While

                fileReader.Close()


            Else

            End If
        End Sub


    End Class

End Namespace