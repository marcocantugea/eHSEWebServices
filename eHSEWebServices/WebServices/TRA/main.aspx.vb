Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Partial Class TRA_main
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataRSTC
    Public moment As New System.DateTime()
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            'tDateDel.Text = "05/01/2013"
            'tDateA.Text = selDate
            traerDepartamentos()
            fillTRAsByDeptDrafts()
            lblStatus.Text = "DRAFTS"
            'divBusqueda.Visible = False
        End If
    End Sub
    Protected Sub fillTRAsByDept()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords where tra_Status='Oficial' and tra_Activity_Job like '%" & tSrcDescription.Text & "%' ORDER BY tra_Activity_Job ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        lblStatus.Text = "OFFICIAL"
        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()
    End Sub
    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        'seleccionarFila(e.CommandArgument.ToString)
        'Dim Context As HttpContext
        'Context = HttpContext.Current
        'Context.Items.Add("Tarjeta", e.CommandArgument.ToString)
        'Server.Transfer("FollowUp.aspx")
        Dim name As String
        name = e.CommandName
        Select Case name
            Case "brptPrint" 'Si eligen botón Imprimir 
                Dim queryString As String = "../Reports/TRA_Format_Viewer.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "setTimeout(""window.open('" & queryString & "','','toolbar=yes,location=no,statusbar=no,menubar=no,resizable=yes,scrollbars=yes,width=1100px,height=800px').focus();"",1);"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptClone" 'Si eligen botón Clonar
                'MsgBox("Clonar Por favor ID = " & e.CommandArgument)
                Response.Redirect("TRA_Input_Data.aspx?Param=" + e.CommandArgument.ToString + "")
        End Select
    End Sub
    Protected Sub traerDepartamentos()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select cDep_Id,cDep_Name from ctgDepartTRA order by cDep_Name")
        clsDB.Close()
        dbDepartamento.DataSource = Dept.Tables(0)
        dbDepartamento.DataTextField = "cDep_Name"
        dbDepartamento.DataValueField = "cDep_Id"
        dbDepartamento.DataBind()
        dbDepartamento.SelectedValue = 1
    End Sub
    Protected Sub dbDepartamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dbDepartamento.SelectedIndexChanged
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Dim criterio As String
        rptFiles.DataSource = Nothing
        rptFiles.DataBind()
        If dbDepartamento.SelectedItem.Text = "Select One" Then
            criterio = ""
        Else
            criterio = dbDepartamento.SelectedItem.Text
        End If
        If btnBorradores.Text = "Drafts" Then
            Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords Where tra_Dept like '%" & criterio & "%' and tra_Activity_Job like '%" & tSrcDescription.Text & "%' and tra_Status='Oficial' ORDER BY tra_Activity_Job ASC"
            lblStatus.Text = "OFFICIAL"
        ElseIf btnBorradores.Text = "Official" Then
            Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords Where tra_Dept like '%" & criterio & "%'  and tra_Activity_Job like '%" & tSrcDescription.Text & "%' and tra_Status<>'Oficial' ORDER BY tra_Activity_Job ASC"
            lblStatus.Text = "DRAFTS"
        End If

        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()
    End Sub
    Public Sub MessageBox(ByVal Message As String)

        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=""JavaScript"">" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("alert(""" & Message & """)" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("</script>")

    End Sub
    Protected Sub btnBorradores_Click(sender As Object, e As EventArgs) Handles btnBorradores.Click

        rptFiles.DataSource = Nothing
        rptFiles.DataBind()
        If btnBorradores.Text = "Drafts" Then
            fillTRAsByDeptDrafts()
            btnBorradores.Text = "Official"
        ElseIf btnBorradores.Text = "Official" Then
            fillTRAsByDept()
            btnBorradores.Text = "Drafts"
        End If
    End Sub
    Protected Sub fillTRAsByDeptDrafts()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords where tra_Status <> 'Oficial'  and tra_Activity_Job like '%" & tSrcDescription.Text & "%' ORDER BY tra_Activity_Job ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        lblStatus.Text = "DRAFTS"
        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()


        'dts = clsDB.QueryDataSet(Sql)
        'clsDB.Close()
        'RptTitle.Text = dts.Tables(0).Rows.Count
        'Dim Lista As New Data.DataTable("Items")
        'Dim col13 As New Data.DataColumn("Idi")
        'Dim col23 As New Data.DataColumn("Nombre")
        'Dim col24 As New Data.DataColumn("Fecha")
        'Dim col33 As New Data.DataColumn("Ubicacion")
        'Dim col53 As New Data.DataColumn("Observacion")
        'Dim col54 As New Data.DataColumn("Accion")
        'Dim col63 As New Data.DataColumn("Boton")
        'Dim item, codigo, revision, path, boton As String

        'Lista.Columns.Add(col13)
        'Lista.Columns.Add(col23)
        'Lista.Columns.Add(col24)
        'Lista.Columns.Add(col33)
        ''Lista.Columns.Add(col43)
        'Lista.Columns.Add(col53)
        'Lista.Columns.Add(col54)
        'Lista.Columns.Add(col63)


        'Dim up, tp As Decimal
        'Dim UOM As String
        'Dim rptRow As DataRow
        'Dim i As Integer = 1
        'Dim cero As String = 0
        'Dim count As Integer = 1
        'Dim fechas As Date
        'Dim fecha As String
        'For Each row As DataRow In dts.Tables(0).Rows
        '    fechas = row("Fecha").ToString
        '    fecha = Format(fechas.ToString("MM/dd/yyyy"))
        '    rptRow = Lista.NewRow
        '    rptRow("Idi") = row("ID")
        '    rptRow("Nombre") = row("Nombre")
        '    rptRow("Fecha") = fecha
        '    rptRow("Ubicacion") = row("Ubicacion")
        '    rptRow("Observacion") = row("Observacion")
        '    rptRow("Accion") = row("Accion")
        '    rptRow("Boton") = row("ID")
        '    i = i + 1
        '    Lista.Rows.Add(rptRow)
        'Next
        'dtsItems.Tables.Add(Lista)
        'rptFiles.DataSource = dtsItems
        'rptFiles.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Dim criterio As String
        If dbDepartamento.SelectedItem.Text = "Select One" Then
            criterio = ""
        Else
            criterio = dbDepartamento.SelectedItem.Text
        End If
        If btnBorradores.Text = "Drafts" Then
            Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords Where tra_Dept like '%" & criterio & "%' and tra_Activity_Job like '%" & tSrcDescription.Text & "%' and tra_Status='Oficial' ORDER BY tra_Activity_Job ASC"
        ElseIf btnBorradores.Text = "Official" Then
            Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords Where tra_Dept like '%" & criterio & "%'  and tra_Activity_Job like '%" & tSrcDescription.Text & "%' and tra_Status<>'Oficial' ORDER BY tra_Activity_Job ASC"
        End If

        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()
    End Sub
End Class
