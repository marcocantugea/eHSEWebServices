Imports Microsoft.VisualBasic
Imports System.IO
Public Class ObtenerNombre
    Public Sub GetAker(ByVal RootFolder As String, ByVal filesC As FileObjectCollection)
        Try
            Dim Folders() As String = Directory.GetDirectories(RootFolder)
            If Folders.Length > 0 Then
                For Each v In Folders
                    Dim folder As String
                    If Not IsNothing(v) Then
                        folder = v
                        If Directory.Exists(folder) Then
                            Dim subfolders() As String
                            subfolders = Directory.GetDirectories(folder)
                            If subfolders.Length > 0 Then
                                For Each d As String In subfolders
                                    GetAker(d, filesC)
                                Next

                                Dim files() As String
                                files = Directory.GetFiles(folder)
                                For Each f As String In files
                                    Dim fileobj As New FileObject
                                    fileobj.FileName = Path.GetFileName(f)
                                    'fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
                                    fileobj.filePather = Path.GetDirectoryName(f).Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
                                    Dim validation As String
                                    validation = fileobj.FileName.Substring(0, 4)
                                    filesC.Add(fileobj)
                                Next
                            Else
                                Dim files() As String
                                files = Directory.GetFiles(folder)
                                For Each f As String In files
                                    Dim fileobj As New FileObject
                                    fileobj.FileName = Path.GetFileName(f)
                                    'fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
                                    fileobj.filePather = Path.GetDirectoryName(f).Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
                                    Dim validation As String
                                    validation = fileobj.FileName.Substring(0, 4)
                                    filesC.Add(fileobj)
                                Next
                            End If
                        End If
                    End If
                Next
            Else
                Dim files() As String
                files = Directory.GetFiles(RootFolder)
                For Each f As String In files
                    Dim fileobj As New FileObject
                    fileobj.FileName = Path.GetFileName(f)
                    'fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
                    fileobj.filePather = Path.GetDirectoryName(f).Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                    If fileobj.filePather.Contains("BB012") Then
                        fileobj.filePather = fileobj.filePather
                    End If
                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                    fileobj.DateFile = Directory.GetCreationTime(f)
                    fileobj.FilePath = f
                    Dim validation As String
                    validation = fileobj.FileName.Substring(0, 4)
                    filesC.Add(fileobj)
                    If validation > 0 Then
                        validation = validation
                    End If
                Next
            End If

        Catch ex As Exception
            Console.WriteLine("Exception on Search: " & ex.Message.ToString)
            Console.WriteLine("")
            Console.Write("Loading Files........>")
        End Try
    End Sub
End Class
