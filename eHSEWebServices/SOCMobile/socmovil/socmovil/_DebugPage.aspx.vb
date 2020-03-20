Imports socmobile_core.com
Public Class _DebugPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SOCTestObj As New objects.SOCCardObj
        SOCTestObj.Nombre = "Marco CAntu Gea"

        Dim ADOSOCCard As New ado.ole.ADOSOCCard


        'ADOSOCCard.SaveSOCCard(SOCTestObj)
      
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ADOUsuarios As New ado.ole.ADOUsuarios
        Dim list_usuarios As New Dictionary(Of String, socmobile_core.com.objects.UsuariosObj)
        ADOUsuarios.GetUserNames(list_usuarios)

        For Each item As KeyValuePair(Of String, socmobile_core.com.objects.UsuariosObj) In list_usuarios
            Response.Write(item.Key.ToString)
        Next
    End Sub
End Class