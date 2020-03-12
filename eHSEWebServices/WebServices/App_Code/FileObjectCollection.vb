Imports Microsoft.VisualBasic

Public Class FileObjectCollection
    Implements IEnumerable, IEnumerator, ICollection

    Private position As Integer = -1
    Private _Files As New List(Of FileObject)

    Public ReadOnly Property FilesObjesCollection() As List(Of FileObject)
        Get
            Return _Files
        End Get
    End Property

    Public Sub Add(ByVal File As FileObject)

        _Files.Add(File)

    End Sub
    'Public Sub Add(ByVal folderName As String, ByVal File As FileObject)
    '    If Not folderName.Equals("") And Not IsNothing(File) Then
    '        If Not _Files.ContainsKey(folderName) Then
    '            _Files.Add(folderName, File)
    '        End If
    '        If folderName = "" Then

    '        End If
    '    End If
    'End Sub

    Public Sub CopyTo(ByVal array As Array, ByVal index As Integer) Implements ICollection.CopyTo

    End Sub

    Public ReadOnly Property Count() As Integer Implements ICollection.Count
        Get
            Return _Files.Count
        End Get
    End Property

    Public ReadOnly Property IsSynchronized() As Boolean Implements ICollection.IsSynchronized
        Get
            Return False
        End Get
    End Property

    Public ReadOnly Property SyncRoot() As Object Implements ICollection.SyncRoot
        Get
            Return Me
        End Get
    End Property

    Public Function GetEnumerator() As IEnumerator Implements IEnumerable.GetEnumerator
        Return CType(Me, IEnumerator)
    End Function

    Public ReadOnly Property Current() As Object Implements IEnumerator.Current
        Get
            Return _Files.GetEnumerator.Current
        End Get
    End Property

    Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext
        position += 1
        Return (position <= _Files.Count)
    End Function

    Public Sub Reset() Implements IEnumerator.Reset
        position = -1
    End Sub

    'Public Function RemoveItem(ByVal FileName As String) As Integer
    '    Try
    '        _Files.Remove(FileName)
    '    Catch ex As Exception

    '    End Try
    'End Function
End Class
