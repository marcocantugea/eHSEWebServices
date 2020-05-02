Imports eservices_core.com.objects
Public Class p_docforsig
    Inherits PageControllerClass
    Implements IntUserSession

    Private _SessionUser As UserStateClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadUserSession()
    End Sub

    Public Sub PrintValueList(list As List(Of Object), Field As String)
        Response.Write(GetValueList(list, Field))
    End Sub

    Public Function GetValueList(list As List(Of Object), Field As String) As Object
        Dim returnval As Object = Nothing
        For Each rowval As Object In list
            Dim l_field = rowval.GetType().GetProperty("Name").GetValue(rowval, Nothing)
            If l_field.Equals(Field) Then
                returnval = rowval.GetType().GetProperty("Value").GetValue(rowval, Nothing)
            End If
        Next
        Return returnval
    End Function

    Public Sub LoadUserSession() Implements IntUserSession.LoadUserSession
        _SessionUser = New socmovil.UserStateClass(Me.Session, Me.Response)
    End Sub

    Public Sub RefreshUserSessionData() Implements IntUserSession.RefreshUserSessionData
        If Not IsNothing(_SessionUser) Then
            _SessionUser.UserObjSession.Loadinfo()
        End If
    End Sub

    Public Property SessionUser As UserStateClass Implements IntUserSession.SessionUser
        Get
            Return _SessionUser
        End Get
        Set(value As UserStateClass)
            _SessionUser = value
        End Set
    End Property

End Class