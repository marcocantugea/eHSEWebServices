Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Partial Class SOC_Resume
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Public clsDB2 As New clsDataHome
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            loadDptos()
            fillStopCards()
            'If Len(Request.QueryString("UserID")) > 0 Then
            '    UserID.Text = Request.QueryString("UserID")

            'Else
            '    Response.Write("User ID had not been receive")
            'End If
        End If
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim dpto As String = getDepto()
        Dim Sql As String
        If tId.Text.Length > 0 Then
            Sql = "SELECT * FROM tblStopCard WHERE ID=" & tId.Text & " AND Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# AND Dpto='" & dpto & "' ORDER BY Fecha ASC"
        Else
            Sql = "SELECT * FROM tblStopCard WHERE Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# AND Dpto='" & dpto & "' ORDER BY Fecha ASC"
        End If
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        dDptos.SelectedValue = dpto
        Label7.Text = dts.Tables(0).Rows.Count
        Dim Lista As New Data.DataTable("Items")
        Dim col13 As New Data.DataColumn("Idi")
        Dim col23 As New Data.DataColumn("Nombre")
        Dim col24 As New Data.DataColumn("Fecha")
        Dim col33 As New Data.DataColumn("Ubicacion")
        Dim col53 As New Data.DataColumn("Observacion")
        Dim col54 As New Data.DataColumn("Accion")
        Dim col63 As New Data.DataColumn("Boton")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col13)
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        'Lista.Columns.Add(col43)
        Lista.Columns.Add(col53)
        Lista.Columns.Add(col54)
        Lista.Columns.Add(col63)


        Dim up, tp As Decimal
        Dim UOM As String
        Dim rptRow As DataRow
        Dim i As Integer = 1
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim fechas As Date
        Dim fecha As String
        For Each row As DataRow In dts.Tables(0).Rows
            fechas = row("Fecha").ToString
            fecha = Format(fechas.ToString("MM/dd/yyyy"))
            rptRow = Lista.NewRow
            rptRow("Idi") = row("ID")
            rptRow("Nombre") = row("Nombre")
            rptRow("Fecha") = fecha
            rptRow("Ubicacion") = row("Ubicacion")
            rptRow("Observacion") = row("Observacion")
            rptRow("Accion") = row("Accion")
            rptRow("Boton") = row("ID")
            i = i + 1
            Lista.Rows.Add(rptRow)

        Next
        dtsItems.Tables.Add(Lista)

        rptFiles.DataSource = dtsItems
        rptFiles.DataBind()
    End Sub
    Function getDepto()
        Dim ds As DataSet
        Dim dpto As String
        Dim sql As String = "Select UsuDep From qMenudeUsuarios where UsuUser='" & Context.User.Identity.Name & "'"
        ds = clsDB.QueryDataSet(sql) 'clsDB2
        clsDB.Close()
        dpto = ""
        If ds.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In ds.Tables(0).Rows
                dpto = row("UsuDep")
            Next
        End If

        Return dpto
    End Function
    Protected Sub loadDptos()
        Dim busca As String = ""
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select * from ctgDepartamentos order by ID Asc")
        clsDB.Close()
        dDptos.DataSource = Empleados.Tables(0)
        dDptos.DataTextField = "Desc"
        dDptos.DataValueField = "Desc"
        dDptos.DataBind()
    End Sub
    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        fillStopCards()
    End Sub
End Class
