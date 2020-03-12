Imports Microsoft.VisualBasic
Imports System.IO
Public Class MotorBusqueda
    'Public Sub generalMaster()
    '    Dim logger As New LogFile
    '    Dim bodyLog As String
    '    Dim archivosAkerEncontrados As New FileObjectCollection
    '    Dim archivosSistema As New FileObjectCollection
    '    bodyLog = "Archivos copiados de AKMH" & vbNewLine & _
    '               "Carpeta Padre = Archivo = AkerCode = SystemNo = Origen = Destino = Estado" & vbNewLine

    '    busquedaDocAker(archivosAkerEncontrados)
    '    Dim systemIntegration As New SystemIntregationCollection
    '    GetIntegration("\\GRUPOR\00 - System Integration\", systemIntegration)

    '    For Each datos As KeyValuePair(Of String, FileObject) In archivosAkerEncontrados.FilesObjesCollection
    '        Dim destino As String = "\\grupor\00 - System Integration"
    '        destino = destino & "\Engineering\Technical Data"

    '        Dim SystemPath As String

    '        Dim FileName, AkerCode, filePather, DateFile, FilePath, akerSystemName As String
    '        FileName = datos.Value.FileName
    '        AkerCode = datos.Value.AkerCode
    '        DateFile = datos.Value.DateFile
    '        FilePath = datos.Value.FilePath
    '        filePather = datos.Value.filePather
    '        akerSystemName = busquedaDB(AkerCode)

    '        If Not IsNothing(akerSystemName) Then
    '            SystemPath = systemIntegration.FilesObjesCollection(akerSystemName).FolderPath
    '            SystemPath = SystemPath & "\Engineering\Technical Data\" & FileName
    '            'My.Computer.FileSystem.CopyFile(FilePath, SystemPath, True)
    '            bodyLog = bodyLog & filePather & "=" & FileName & "=" & AkerCode & "=" & akerSystemName & "=" & FilePath & "=" & SystemPath & "= Integrado" & vbNewLine
    '        Else
    '            SystemPath = "F:\Juan.Rios\00 - System Integration\00 - Log No Copiados\" & FileName
    '            'My.Computer.FileSystem.CopyFile(FilePath, SystemPath, True)
    '            bodyLog = bodyLog & filePather & "=" & FileName & "=" & AkerCode & "=" & akerSystemName & "=" & FilePath & "=" & SystemPath & "= No Integrado" & vbNewLine
    '        End If

    '    Next
    '    logger.GenerateSystemLog(bodyLog)
    'End Sub




    Public Sub GetCertificatesFolders(ByVal RootFolder As String, ByVal filesC As FileObjectCollection)
        Dim folders() As String
        folders = Directory.GetDirectories(RootFolder)
        For Each f As String In folders
            Dim fileobj As New FileObject
            fileobj.filePather = f.Replace("\\grupor\08 - Document Control\02 Procurement\2.5 Equipment Certificate\", "")
            fileobj.FilePath = f
            filesC.Add(fileobj)
        Next
    End Sub
    Public Sub GetFolders(ByVal RootFolder As String, ByVal filesC As FileObjectCollection)
        Dim folders() As String
        folders = Directory.GetDirectories(RootFolder)
        For Each f As String In folders
            Dim fileobj As New FileObject
            fileobj.filePather = f.Replace("F:\Juan.Rios\00 - System Integration\", "")
            '\\GRUPOR\05 - Project Pics & Videos\
            fileobj.FilePath = f
            filesC.Add(fileobj)
        Next
    End Sub
    Public Sub GetArchivos(ByVal RootFolder As String, ByVal filesC As FileObjectCollection)
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
                                    fileobj.filePather = Path.GetDirectoryName(f)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
                                    filesC.Add(fileobj)
                                Next
                            Else
                                Dim files() As String
                                files = Directory.GetFiles(folder)
                                For Each f As String In files
                                    Dim fileobj As New FileObject
                                    fileobj.FileName = Path.GetFileName(f)
                                    fileobj.filePather = Path.GetDirectoryName(f)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
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
                    fileobj.filePather = Path.GetDirectoryName(f)
                    fileobj.DateFile = Directory.GetCreationTime(f)
                    fileobj.FilePath = f
                    filesC.Add(fileobj)
                Next
            End If

        Catch ex As Exception
            Console.WriteLine("Exception on Search: " & ex.Message.ToString)
            Console.WriteLine("")
            Console.Write("Loading Files........>")
        End Try
    End Sub
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
                                    fileobj.filePather = Path.GetDirectoryName(f) '.Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
                                    Dim validation As String
                                    validation = fileobj.FileName.Substring(0, 4)
                                    fileobj.Extention = Path.GetExtension(f)
                                    filesC.Add(fileobj)
                                Next
                            Else
                                Dim files() As String
                                files = Directory.GetFiles(folder)
                                For Each f As String In files
                                    Dim fileobj As New FileObject
                                    fileobj.FileName = Path.GetFileName(f)
                                    'fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
                                    fileobj.filePather = Path.GetDirectoryName(f) '.Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                                    fileobj.DateFile = Directory.GetCreationTime(f)
                                    fileobj.FilePath = f
                                    Dim validation As String
                                    validation = fileobj.FileName.Substring(0, 4)
                                    fileobj.Extention = Path.GetExtension(f)
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
                    fileobj.filePather = Path.GetDirectoryName(f) '.Replace("\\GRUPOR\00 - System Integration\DIMS Manuals\V_D_for_Drilling_(AKMH)\", "")
                    If fileobj.filePather.Contains("BB012") Then
                        fileobj.filePather = fileobj.filePather
                    End If
                    fileobj.AkerCode = Mid(fileobj.filePather, 2, 5)
                    fileobj.DateFile = Directory.GetCreationTime(f)
                    fileobj.FilePath = f
                    Dim validation As String
                    validation = fileobj.FileName.Substring(0, 4)
                    fileobj.Extention = Path.GetExtension(f)
                    filesC.Add(fileobj)
                Next
            End If

        Catch ex As Exception
            Console.WriteLine("Exception on Search: " & ex.Message.ToString)
            Console.WriteLine("")
            Console.Write("Loading Files........>")
        End Try
    End Sub 'Colección para obtener documentos dentro de carpetas y colocarlas en contenedor
    'Public Sub GetFat(ByVal RootFolder As String, ByVal filesC As FileObjectCollection)
    '    Try
    '        Dim Folders() As String = Directory.GetDirectories(RootFolder)
    '        Dim Documents() As String = Directory.GetFiles(RootFolder)
    '        For Each v In Folders
    '            Dim folder As String
    '            If Not IsNothing(v) Then
    '                folder = v
    '                If Directory.Exists(folder) Then
    '                    Dim subfolders() As String
    '                    subfolders = Directory.GetDirectories(folder)
    '                    If subfolders.Length > 0 Then
    '                        For Each d As String In subfolders
    '                            GetAker(d, filesC)
    '                        Next

    '                        Dim files() As String
    '                        files = Directory.GetFiles(folder)
    '                        For Each f As String In files
    '                            Dim fileobj As New FileObject
    '                            fileobj.FileName = Path.GetFileName(f)
    '                            fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
    '                            fileobj.DateFile = Directory.GetCreationTime(f)
    '                            fileobj.FilePath = f
    '                            Dim validation As String
    '                            validation = fileobj.FileName.Substring(0, 4)
    '                            filesC.Add(fileobj.FileName, fileobj)
    '                        Next
    '                    Else
    '                        Dim files() As String
    '                        files = Directory.GetFiles(folder)
    '                        For Each f As String In files
    '                            Dim fileobj As New FileObject
    '                            fileobj.FileName = Path.GetFileName(f)
    '                            fileobj.AkerCode = Mid(Path.GetFileName(f), 10, 5)
    '                            fileobj.DateFile = Directory.GetCreationTime(f)
    '                            fileobj.FilePath = f
    '                            Dim validation As String
    '                            validation = fileobj.FileName.Substring(0, 4)
    '                            filesC.Add(fileobj.FileName, fileobj)
    '                        Next
    '                    End If
    '                End If
    '            End If
    '        Next
    '        For Each a In Documents
    '            Dim fileobj As New FileObject
    '            fileobj.FileName = Path.GetFileName(a)
    '            fileobj.AkerCode = Mid(Path.GetFileName(a), 10, 5)
    '            fileobj.DateFile = Directory.GetCreationTime(a)
    '            fileobj.FilePath = a
    '            Dim validation As String
    '            validation = fileobj.FileName.Substring(0, 4)
    '            filesC.Add(fileobj.FileName, fileobj)
    '        Next
    '    Catch ex As Exception
    '        Console.WriteLine("Exception on Search: " & ex.Message.ToString)
    '        Console.WriteLine("")
    '        Console.Write("Loading Files........>")
    '    End Try
    'End Sub



End Class
