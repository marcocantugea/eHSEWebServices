Imports Microsoft.VisualBasic

Public Class FileObject
    Private _FileName As String
    Private _AkerCode As String
    Private _FilePath As String
    Private _DateFile As Date
    Private _Extention As String
    Private _filePather As String

    Public Property FileName() As String
        Get
            Return _FileName
        End Get
        Set(ByVal value As String)
            Dim v() As String
            v = value.Split(".")
            _FileName = value
            'If v.Length > 0 Then
            '    _Extention = v(1)
            'End If
        End Set
    End Property
    Public Property filePather() As String
        Get
            Return _filePather
        End Get
        Set(ByVal value As String)
            _filePather = value
        End Set
    End Property
    Public Property AkerCode() As String
        Get
            Return _AkerCode
        End Get
        Set(ByVal value As String)
            _AkerCode = value
        End Set
    End Property

    Public Property Extention() As String
        Get
            Return _Extention
        End Get
        Set(ByVal value As String)
            _Extention = value
        End Set
    End Property

    Public Property FilePath() As String
        Get
            Return _FilePath
        End Get
        Set(ByVal value As String)
            _FilePath = value
        End Set
    End Property

    Public Property DateFile() As Date
        Get
            Return _DateFile
        End Get
        Set(ByVal value As Date)
            _DateFile = value
        End Set
    End Property

    Public Sub New(ByVal FullPathFile As String)
        If Not FullPathFile.Equals("") Then
            _FilePath = FullPathFile
            Dim location() As String
            location = FullPathFile.Split("\")
            FileName = location(location.Length - 1)

        End If


    End Sub

    Public Sub New()

    End Sub
End Class
