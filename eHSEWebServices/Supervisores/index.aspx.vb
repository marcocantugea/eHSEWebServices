Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Imports System.ComponentModel
Imports System.Security
Partial Class index
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataUsers

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim Usuarios As DataSet
        Dim query As String
        query = "Select * From tblUsuarios Where UsuUser= '" & Login1.UserName & "' And UsuPass = '" & Login1.Password & "'"
        Usuarios = clsDB.QueryDataSet(query)
        clsDB.Close()
        If Usuarios.Tables(0).Rows.Count > 0 Then
            For Each rows As DataRow In Usuarios.Tables(0).Rows

                Dim Context As HttpContext
                Context = HttpContext.Current
                Context.Items.Add("Llave", rows("UsuId"))
                Server.Transfer("main.aspx")
            Next
        Else
            Response.Write("Invalid credentials")
        End If
    End Sub
End Class
