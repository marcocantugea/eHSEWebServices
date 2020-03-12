Imports System
Imports System.Diagnostics
Imports System.ComponentModel
Imports System.Security

Namespace OpenDocs
    Public Class AbriendoDocs
        Public Shared Sub Main(ByVal nfile As String)
            Dim myProcess As New Process()

            Try                ' Get the path that stores user documents.
                Dim ProcessProperties As New ProcessStartInfo

                ProcessProperties.FileName = nfile
                ProcessProperties.Arguments = ""
                ProcessProperties.UseShellExecute = False
                ProcessProperties.RedirectStandardOutput = True
                ProcessProperties.WindowStyle = ProcessWindowStyle.Maximized
                Dim proceso As Process = Process.Start(ProcessProperties)

            Catch e As Exception
                Throw
            End Try


        End Sub 'Main
    End Class
End Namespace

