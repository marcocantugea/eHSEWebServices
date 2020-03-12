Imports clsDBPhone
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Imports System.ComponentModel
Imports System.Security
Partial Class Login
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataUsers
    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim Usuarios As DataSet
        Dim query As String
        query = "Select * From tblUsuarios Where UsuUser= '" & Login1.UserName & "' And UsuPass = '" & Login1.Password & "'"
        Usuarios = clsDB.QueryDataSet(query)
        If Usuarios.Tables(0).Rows.Count > 0 Then
            For Each rows As DataRow In Usuarios.Tables(0).Rows

                Dim Context As HttpContext
                Context = HttpContext.Current
                Context.Items.Add("Llave", rows("UsuId"))
                Server.Transfer("LoggedIn.aspx")
            Next
        Else
            Response.Write("Invalid credentials")
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Usuarios As DataSet
        Dim query As String
        query = "Select UsuPass From tblUsuarios"
        Usuarios = clsDB.QueryDataSet(query)
        If Usuarios.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In Usuarios.Tables(0).Rows
                Label1.Text = row("UsuPass")
                Label1.Visible = True
            Next
        End If
    End Sub
End Class
