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
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            fillStopCards()
            fillTotales()
        End If
    End Sub
    Protected Sub fillTotales()
        Repetidas.Visible = False
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Dim total, dia As Integer
        Dim repetido As New clsDataBase
        Dim fechaA, fechaDel As Date
        fechaA = Format(Now.Date.ToString("MM/dd/yyyy"))
        fechaDel = "05/01/2013"
        Sql = "SELECT * FROM qryRepetidas WHERE Fecha Between #" & fechaDel & "# AND #" & fechaA & "# ORDER BY Fecha Desc"
        dts = repetido.QueryDataSet(Sql)
        repetido.Close()
        total = dts.Tables(0).Rows.Count
        If total > 0 Then
            Repetidas.Text = "Tarjetas repetidas al dia de hoy: " & total
            Repetidas.Visible = True
        End If
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet

        Dim Sql As String
        If tId.Text.Length > 0 Then
            Sql = "SELECT * FROM tblStopCard WHERE ID=" & tId.Text & " AND Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha ASC"
        Else
            Sql = "SELECT * FROM tblStopCard WHERE Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha ASC"
        End If
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
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

    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        fillStopCards()
    End Sub
End Class
