Imports System.Net
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports clsDataUsers
Partial Class LoggedIn
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataUsers

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim Context As HttpContext
        Context = HttpContext.Current
        If Context.Items.Contains("Llave") Then
            Me.Label1.Text = CType(Context.Items("Llave").ToString, String)
            If Label1.Text.Length > 0 Then
                cargarMenus()
                Response.Write("Información cargada")
            Else
                Response.Write("Sin Datos")
            End If
        Else
            Response.Write("Sin Datos </br>")
        End If
    End Sub
    Protected Sub cargarMenus()
        Dim Usuarios As DataSet
        Dim query As String
        query = "Select * From tblUsuarios Where UsuId=" & Label1.Text.Trim & ""
        Usuarios = clsDB.QueryDataSet(query)
        clsDB.Close()
        If Usuarios.Tables(0).Rows.Count > 0 Then
            For Each rows As DataRow In Usuarios.Tables(0).Rows
                Label1.Text = "Welcome back. </br> Your User Account " & rows("UsuUser") & " allow you to do:"
                'Response.Write("Bienvenido " & rows("JobDescription"))
                Redireccionar(rows("UsuDep"))
            Next
        Else
            Response.Write("Sin Datos en la Base")
        End If
    End Sub
    Protected Sub Redireccionar(ByVal dept As String)
        Response.BufferOutput = True
        If dept = "Safety" Then
            Response.Redirect("/RSTC/StopCards.aspx")
        ElseIf dept = "Medic" Then

        ElseIf dept = "Maintenance" Then

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
