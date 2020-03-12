Imports System.IO
Imports System.Data
Imports exportToExcel
Imports System.Text



Partial Class exportToExcel
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    '#Region " Web Form Designer Generated Code "

    '    'This call is required by the Web Form Designer.
    '    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    '    End Sub

    '    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    '    'Do not delete or move it.
    '    Private designerPlaceholderDeclaration As System.Object

    '    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
    '        'CODEGEN: This method call is required by the Web Form Designer
    '        'Do not modify it using the code editor.
    '        InitializeComponent()
    '        'fillStopCards()
    '    End Sub

    '#End Region
    '    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    '        Dim ds As New DataSet
    '        Dim dtsItems As New DataSet
    '        Dim dts As DataSet

    '        Dim Sql As String = "SELECT * FROM tblStopCard WHERE Estatus='Open'"
    '        dts = clsDB.QueryDataSet(Sql)
    '        clsDB.Close()


    '        'call our class method
    '        DataSetToExcel.Convert(dts, Response)
    '    End Sub
    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        excelExport()
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("yyyy-MM-dd"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            fillStopCards()
        End If
    End Sub
    Protected Sub fillStopCards()
        rptFiles.Visible = True
        Dim dtsItems As New DataSet
        Dim dts As DataSet

        'Dim Sql As String = "SELECT * FROM tblStopCard where Fecha=#" & dia & "# and U_P Is Null"
        Dim Sql As String = "SELECT * FROM qryStopEmpleados WHERE NomineeWeek=" & cbWeek.Checked & " and NomineeMonth=" & cbMonth.Checked & " and Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            Label7.Text = dts.Tables(0).Rows.Count & " Records"
            Dim Lista As New Data.DataTable("Items")
            Dim col23 As New Data.DataColumn("Nombre")
            Dim col21 As New Data.DataColumn("Department")
            Dim col24 As New Data.DataColumn("Fecha")
            Dim col33 As New Data.DataColumn("Ubicacion")
            Dim col53 As New Data.DataColumn("Observacion")
            Dim col54 As New Data.DataColumn("Accion")
            Dim col63 As New Data.DataColumn("Boton")
            Dim item, codigo, revision, path, boton As String

            Lista.Columns.Add(col23)
            Lista.Columns.Add(col21)
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
                fecha = Format(fechas.ToString("dd-MM-yyyy"))
                rptRow = Lista.NewRow
                rptRow("Nombre") = row("Nombre")
                rptRow("Department") = row("Desc")
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
        Else
            rptFiles.Visible = False
            Label7.Text = "0 Records"
        End If

    End Sub
    Protected Sub excelExport()
        Dim dtsItems As New DataSet
        Dim dts As DataSet

        'Dim Sql As String = "SELECT * FROM tblStopCard where Fecha=#" & dia & "# and U_P Is Null"
        Dim Sql As String = "SELECT * FROM qryStopEmpleados WHERE NomineeWeek=" & cbWeek.Checked & " and NomineeMonth=" & cbMonth.Checked & " and Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha ASC"
        dts = clsDB.QueryDataSet(Sql)

        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("cache-control", "private")
            Response.AddHeader("content-disposition", "attachment;filename=Stop Cards From - " & tDateDel.Text & " to " & tDateA.Text & ".xls")
            Response.ContentType = "application/msexcel"
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1252")
            Response.Charset = "utf-8"
            Response.Charset = ""
            Me.EnableViewState = False

            Dim sw As New StringWriter()
            Dim htw As New HtmlTextWriter(sw)
            Dim ds As New DataGrid
            ds.DataSource = dts.Tables(0)
            ds.DataBind()
            ds.RenderControl(htw)
            Response.Write(sw.ToString())
            'Response.Flush()
            Response.End()
        Else
            Response.Write("0 records were found to export")
        End If
        
    End Sub
    Protected Sub excelExport2()

        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String = "SELECT * FROM tblStopCard WHERE Estatus='Open'"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        Dim filename As String = "Stop Cards From - " & tDateDel.Text & " to " & tDateA.Text & ".xls"

        Dim excelHeader As String = "STOP CARDS - BICENTENARIO"

        Dim tw As New StringWriter
        Dim hw As New HtmlTextWriter(tw)
        Dim dgGrid As New DataGrid

        dgGrid.DataSource = dts
        dgGrid.DataBind()
        hw.WriteLine("<b><u><font size=’30′> " + excelHeader + " </font></u></b>")
        dgGrid.RenderControl(hw)
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "")
        Me.EnableViewState = False
        Response.Write(tw.ToString())
        Response.End()
    End Sub
    'Protected Sub ExportToPdf()
    '    Dim dtsItems As New DataSet
    '    Dim dts As DataSet
    '    Dim Sql As String = "SELECT * FROM tblStopCard WHERE Estatus='Open'"
    '    dts = clsDB.QueryDataSet(Sql)
    '    clsDB.Close()
    '    Dim dt As DataTable = dts.Tables(0)

    '    'Create a dummy GridView
    '    Dim GridView1 As New GridView()
    '    GridView1.AllowPaging = False
    '    GridView1.DataSource = dt
    '    GridView1.DataBind()

    '    Response.ContentType = "application/pdf"
    '    Response.AddHeader("content-disposition", _
    '           "attachment;filename=DataTable.pdf")
    '    Response.Cache.SetCacheability(HttpCacheability.NoCache)
    '    Dim sw As New StringWriter()
    '    Dim hw As New HtmlTextWriter(sw)
    '    GridView1.RenderControl(hw)
    '    Dim sr As New StringReader(sw.ToString())
    '    Dim pdfDoc As New Document(PageSize.A4, 10.0F, 10.0F, 10.0F, 0.0F)
    '    Dim htmlparser As New HTMLWorker(pdfDoc)
    '    PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
    '    pdfDoc.Open()
    '    htmlparser.Parse(sr)
    '    pdfDoc.Close()
    '    Response.Write(pdfDoc)
    '    Response.End()
    'End Sub

    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        If validarFechas() Then
            fillStopCards()
        Else
            Response.Write("La fecha debe corresponder al formato Mes-Dia-Año")
        End If
    End Sub
    Function validarFechas() As Boolean
        Dim de, a As Date
        Try
            de = tDateDel.Text
            a = tDateA.Text
            Return True
        Catch ex As Exception
            Response.Write("Error al validar fecha: " & ex.Message)
            Return False
        End Try
    End Function
End Class
