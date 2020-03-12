
Imports System.Net
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports clsDataUsers
Imports clsDataBase

Partial Class index
    Inherits System.Web.UI.Page
    Public Url As String
    Dim clsDB As New clsDataUsers
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            divMenu.Visible = False
            Dim Context As HttpContext
            Context = HttpContext.Current
            If Context.Items.Contains("Llave") Then
                Me.Label1.Text = CType(Context.Items("Llave").ToString, String)
                If Label1.Text.Length > 0 Then
                    cargarMenus()

                Else
                    Response.Write("Sin Datos")
                End If
            Else
                Label1.Text = "Favor de registrarse"
            End If
        End If
    End Sub
    
    Protected Sub cargarMenus()
        Dim Usuarios As DataSet
        Dim query As String
        query = "Select * From tblUsuarios Where UsuId=" & Label1.Text.Trim & ""
        Usuarios = clsDB.QueryDataSet(query)
        clsDB.Close()
        If Usuarios.Tables(0).Rows.Count > 0 Then
            divMenu.Visible = True
            For Each rows As DataRow In Usuarios.Tables(0).Rows
                Label1.Text = "Welcome back " & rows("JobDescription") & ""
            Next
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim a As String = Page.ResolveUrl("StopCard.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone.Click
        Dim a As String = Page.ResolveUrl("NewStopCards.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone0.Click
        Dim a As String = Page.ResolveUrl("exportToExcel.aspx")
        Url = a
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("http://192.168.4.6")
    End Sub

    Protected Sub btnPhone1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone1.Click
        Dim a As String = Page.ResolveUrl("SOC_Resume.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone2.Click
        Dim a As String = Page.ResolveUrl("Users.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone3.Click
        Dim a As String = Page.ResolveUrl("FollowUpList.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone4.Click
        Dim a As String = Page.ResolveUrl("SOC - Summary.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone5.Click
        Dim a As String = Page.ResolveUrl("SOC_Cards_Raffle.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone6.Click
        Dim a As String = Page.ResolveUrl("rTotales.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone7.Click
        Dim a As String = Page.ResolveUrl("Tracking.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone8.Click
        Dim a As String = Page.ResolveUrl("rReporteo.aspx")
        Url = a
    End Sub

    Protected Sub btnPhone9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhone9.Click
        Dim a As String = Page.ResolveUrl("Duplicados.aspx")
        Url = a
    End Sub
End Class
