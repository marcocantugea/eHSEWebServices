Imports System.IO
Imports System.Data
Imports System.Text
Imports Microsoft.Reporting.WebForms
Imports System.Web.UI.ScriptManager
Partial Class rReporteo
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            Dim dts As DataSet
            'dts = loadxRisks()
            'dts = loadxDpto()
            'dts = loadxClass()
            Label7.Text = " 0 Records Found. "
            tDateDel.Text = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateA.Text = Format(Now.Date.ToString("MM/dd/yyyy"))
            'If (dts IsNot Nothing) Then
            '    Dim bindDs_name As String = "dsReportes_qSOCDpto" 'dsReportes_qSOCDpto
            '    Dim reportName As String = "Reporte.rdlc"
            '    ReportViewer1.LocalReport.DisplayName = "Demo Report"
            '    ReportViewer1.LocalReport.ReportPath = reportName

            '    Dim datasource As ReportDataSource = New ReportDataSource("dsReportes_qSOCDpto", dts.Tables("qSOCDpto"))

            '    ReportViewer1.LocalReport.DataSources.Clear()
            '    ReportViewer1.LocalReport.DataSources.Add(datasource)
            '    ReportViewer1.LocalReport.Refresh()
            '    ReportViewer1.DataBind()
            'Else

            'End If
        End If
    End Sub
    Function loadxRisks()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT Sum(IIf([tblStopCard].[EPP]=True,1,0)) AS EPP, " & _
        "Sum(IIf([tblStopCard].[ch_Atrapamiento]=True,1,0)) AS Atrapamiento, " & _
        "Sum(IIf([tblStopCard].[Posicion_Gente]=True,1,0)) AS Posicion, " & _
        "Sum(IIf([tblStopCard].[ch_Planeacion]=True,1,0)) AS Planeación, " & _
        "Sum(IIf([tblStopCard].[ch_SnBarreras]=True,1,0)) AS Sin_Barreras, " & _
        "Sum(IIf([tblStopCard].[ch_AmbienteTox]=True,1,0)) AS Ambiente_Toxico, " & _
        "Sum(IIf([tblStopCard].[ch_TrabajoGrua]=True,1,0)) AS Trabajo_con_Grua, " & _
        "Sum(IIf([tblStopCard].[Otra]=True,1,0)) AS Otra," & _
        "Sum(IIf([tblStopCard].[ch_Resbalon]=True,1,0)) AS Resbalón_Caidas," & _
        "Sum(IIf([tblStopCard].[ch_NoPermiso]=True,1,0)) AS No_Permiso," & _
        "Sum(IIf([tblStopCard].[ch_Comms]=True,1,0)) AS Comunicación," & _
        "Sum(IIf([tblStopCard].[ch_CondMeteorologica]=True,1,0)) AS Condición_Meteorologica," & _
        "Sum(IIf([tblStopCard].[ch_AltaPresion]=True,1,0)) AS Alta_Presión," & _
        "Sum(IIf([tblStopCard].[ch_Quimicos]=True,1,0)) AS Químicos," & _
        "Sum(IIf([tblStopCard].[ch_Soldadura]=True,1,0)) AS Soldadura," & _
        " Sum(IIf([tblStopCard].[Observacion_Positiva]=True,1,0)) AS Observacion" & _
        " FROM tblStopCard" & _
        " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        '#" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        Try
            dts = clsDB.QueryDataSet(sql)
            Dim safe, atrapamiento, others, epp, posicion, planeacion, sinbarrera, toxico, grua, caidas, permiso, comms, meteorologica, presion, quimicos, soldadura As Integer
            safe = 0
            epp = 0
            atrapamiento = 0
            others = 0
            posicion = 0
            planeacion = 0
            sinbarrera = 0
            toxico = 0
            grua = 0
            caidas = 0
            permiso = 0
            comms = 0
            meteorologica = 0
            presion = 0
            quimicos = 0
            soldadura = 0


            Dim Lista As New Data.DataTable("qSOCDpto")
            Dim col23 As New Data.DataColumn("Desc")
            Dim col24 As New Data.DataColumn("Qty")

            Lista.Columns.Add(col23)
            Lista.Columns.Add(col24)
            Dim rptRow As DataRow
            If dts.Tables(0).Rows.Count > 0 Then
                Label7.Text = TotalSOCs()
                For Each row As DataRow In dts.Tables(0).Rows
                    If Not IsDBNull(row("Observacion")) Then
                        safe = row("Observacion")
                    End If
                    If Not IsDBNull(row("Otra")) Then
                        others = row("Otra")
                    End If
                    If Not IsDBNull(row("EPP")) Then
                        epp = row("EPP")
                        atrapamiento = row("Atrapamiento")
                        posicion = row("Posicion")
                        planeacion = row("Planeación")
                        sinbarrera = row("Sin_Barreras")
                        toxico = row("Ambiente_Toxico")
                        grua = row("Trabajo_con_Grua")
                        caidas = row("Resbalón_Caidas")
                        permiso = row("No_Permiso")
                        comms = row("Comunicación")
                        meteorologica = row("Condición_Meteorologica")
                        presion = row("Alta_Presión")
                        quimicos = row("Químicos")
                        soldadura = row("Soldadura")
                    End If
                    rptRow = Lista.NewRow
                    rptRow("Desc") = "PPE / EPP"
                    rptRow("Qty") = epp
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Pinch Points / Atrapamiento"
                    rptRow("Qty") = atrapamiento
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Body Placement / Posición del Cuerpo"
                    rptRow("Qty") = posicion
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Poor Planning / Pobre Planeacion"
                    rptRow("Qty") = planeacion
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "No Barriers / Sin Barreras"
                    rptRow("Qty") = sinbarrera
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Toxic Environment / Ambiente Toxico"
                    rptRow("Qty") = toxico
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Crane Work / Trabajo con Grua"
                    rptRow("Qty") = grua
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Slips/Falls / Resbalon/Caidas"
                    rptRow("Qty") = caidas
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "PTW not in place / Sin PTD en Sitio"
                    rptRow("Qty") = permiso
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Communication / Comunicación"
                    rptRow("Qty") = comms
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Weather / Cond. Meteorologica"
                    rptRow("Qty") = meteorologica
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "High Pressure / Alta Presion"
                    rptRow("Qty") = presion
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Chemicals / Quimicos"
                    rptRow("Qty") = quimicos
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Welding / Soldadura"
                    rptRow("Qty") = soldadura
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Others"
                    rptRow("Qty") = others
                    Lista.Rows.Add(rptRow)

                    rptRow = Lista.NewRow
                    rptRow("Desc") = "Safe / Positive Observation / Observación Positiva"
                    rptRow("Qty") = safe
                    Lista.Rows.Add(rptRow)
                Next
                dtsItems.Tables.Add(Lista)
                Return dtsItems
            End If
        Catch ex As Exception
            Response.Write("<br/> Error getting Class Stadistics. " & ex.Message)
        End Try
    End Function
    Function loadxRolls()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT Rolls, Count(tblStopCard.ID) AS Total_SOC" & _
               " FROM ctgEmpleados INNER JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre " & _
                " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
                "GROUP BY ctgEmpleados.Rolls" & _
                " ORDER BY Count(tblStopCard.ID) DESC"
        Try
            dts = clsDB.QueryDataSet(sql)
            Dim dsc As String
            Dim qty As Integer


            Dim Lista As New Data.DataTable("qSOCDpto")
            Dim col23 As New Data.DataColumn("Desc")
            Dim col24 As New Data.DataColumn("Qty")

            Lista.Columns.Add(col23)
            Lista.Columns.Add(col24)
            Dim rptRow As DataRow
            If dts.Tables(0).Rows.Count > 0 Then
                Label7.Text = TotalSOCs()
                For Each row As DataRow In dts.Tables(0).Rows
                    dsc = row("Total_SOC") & " - " & row("Rolls")
                    qty = row("Total_SOC")

                    rptRow = Lista.NewRow
                    rptRow("Desc") = dsc
                    rptRow("Qty") = qty
                    Lista.Rows.Add(rptRow)


                Next
                dtsItems.Tables.Add(Lista)
                Return dtsItems
            End If
        Catch ex As Exception
            Response.Write("<br/> Error getting Rolls Stadistics. " & ex.Message)
        End Try
    End Function
    Function loadxDpto()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT ctgDepartamentos.Desc, Count(tblStopCard.ID) AS Qty" & _
               " FROM ctgDepartamentos INNER JOIN (tblStopCard INNER JOIN ctgEmpleados ON " & _
               " tblStopCard.Nombre = ctgEmpleados.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
                " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
                " GROUP BY ctgDepartamentos.Desc"

        Try
            dts = clsDB.QueryDataSet(sql)
            Dim dsc As String
            Dim qty As Integer


            Dim Lista As New Data.DataTable("qSOCDpto")
            Dim col23 As New Data.DataColumn("Desc")
            Dim col24 As New Data.DataColumn("Qty")

            Lista.Columns.Add(col23)
            Lista.Columns.Add(col24)
            Dim rptRow As DataRow
            If dts.Tables(0).Rows.Count > 0 Then
                Label7.Text = TotalSOCs()
                For Each row As DataRow In dts.Tables(0).Rows
                    dsc = row("Qty") & "   " & row("Desc")
                    qty = row("Qty")

                    rptRow = Lista.NewRow
                    rptRow("Desc") = dsc
                    rptRow("Qty") = qty
                    Lista.Rows.Add(rptRow)


                Next
                dtsItems.Tables.Add(Lista)
                Return dtsItems
            End If
        Catch ex As Exception
            Response.Write("<br/> Error getting Department Stadistics. " & ex.Message)
        End Try
    End Function
    Function loadxClass()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT * FROM tblStopCard" & _
                " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"

        Try
            dts = clsDB.QueryDataSet(sql)
            Dim dsc As String
            Dim qty As Integer
            Dim observacion, atrapamiento, otra, epp, posicion, planeacion, sinbarrera, toxico, grua, caidas, permiso, comms, meteorologica, presion, quimicos, soldadura As Boolean

            Dim Safe, Corrective, Others As Integer
            Safe = 0
            Corrective = 0
            Others = 0

            Dim Lista As New Data.DataTable("qSOCDpto")
            Dim col23 As New Data.DataColumn("Desc")
            Dim col24 As New Data.DataColumn("Qty")

            Lista.Columns.Add(col23)
            Lista.Columns.Add(col24)
            Dim rptRow As DataRow
            If dts.Tables(0).Rows.Count > 0 Then
                Label7.Text = dts.Tables(0).Rows.Count
                For Each row As DataRow In dts.Tables(0).Rows
                    
                    observacion = row("Observacion_Positiva")
                    otra = row("Otra")
                    epp = row("EPP")
                    atrapamiento = row("ch_Atrapamiento")
                    posicion = row("Posicion_Gente")
                    planeacion = row("ch_Planeacion")
                    sinbarrera = row("ch_SnBarreras")
                    toxico = row("ch_AmbienteTox")
                    grua = row("ch_TrabajoGrua")
                    caidas = row("ch_Resbalon")
                    permiso = row("ch_NoPermiso")
                    comms = row("ch_Comms")
                    meteorologica = row("ch_CondMeteorologica")
                    presion = row("ch_AltaPresion")
                    quimicos = row("ch_Quimicos")
                    soldadura = row("ch_Soldadura")

                    If epp Then Corrective = Corrective + 1
                    If atrapamiento Then Corrective = Corrective + 1
                    If posicion Then Corrective = Corrective + 1
                    If planeacion Then Corrective = Corrective + 1
                    If sinbarrera Then Corrective = Corrective + 1
                    If toxico Then Corrective = Corrective + 1
                    If grua Then Corrective = Corrective + 1
                    If caidas Then Corrective = Corrective + 1
                    If permiso Then Corrective = Corrective + 1
                    If comms Then Others = Others + 1
                    If meteorologica Then Others = Others + 1
                    If presion Then Corrective = Corrective + 1
                    If quimicos Then Corrective = Corrective + 1
                    If soldadura Then Corrective = Corrective + 1
                    If observacion Then Safe = Safe + 1
                    If otra Then Others = Others + 1
                Next

                rptRow = Lista.NewRow
                rptRow("Desc") = Safe & " - " & "Positive Observations"
                rptRow("Qty") = Safe
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Desc") = Corrective & " - " & "Corrections"
                rptRow("Qty") = Corrective
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Desc") = Others & " - " & "Others"
                rptRow("Qty") = Others
                Lista.Rows.Add(rptRow)

                dtsItems.Tables.Add(Lista)
                Return dtsItems
            End If
        Catch ex As Exception
            Response.Write("<br/> Error getting Class Stadistics. " & ex.Message)
        End Try
    End Function
    Protected Sub ReportViewer1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.DataBinding
        'Dim dts As DataSet
        'dts = loadxRisks()
        'Dim bindDs_name As String = "dsReports_myReport"
        'Dim reportName As String = "Reporte.rdlc"
        'ReportViewer1.LocalReport.DisplayName = "Demo Report"
        'ReportViewer1.LocalReport.ReportPath = reportName
        'ReportViewer1.LocalReport.DataSources.Clear()
        'ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource(bindDs_name.Trim, dts))
        'dts.Dispose()

    End Sub


    Protected Sub ReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.Init
        ReportViewer1.ProcessingMode = ProcessingMode.Local
        ReportViewer1.LocalReport.EnableExternalImages = False
        ReportViewer1.LocalReport.EnableHyperlinks = False
        ReportViewer1.Visible = True
        ReportViewer1.ShowBackButton = True
        ReportViewer1.ShowDocumentMapButton = True
        ReportViewer1.ShowExportControls = True
        ReportViewer1.ShowFindControls = True
        ReportViewer1.ShowParameterPrompts = False
        ReportViewer1.ShowReportBody = True
        ReportViewer1.SizeToReportContent = True
        ReportViewer1.ShowToolBar = True
        ReportViewer1.ShowZoomControl = True
        ReportViewer1.DocumentMapCollapsed = True
    End Sub
    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        Dim dts As DataSet
        'dts = loadxRisks()
        dts = loadxDpto()
        'dts = loadxClass()
        If (dts IsNot Nothing) Then
            Dim bindDs_name As String = "dsReportes_qSOCDpto"
            Dim reportName As String = "Reporte.rdlc"
            ReportViewer1.LocalReport.DisplayName = "Demo Report"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("dsReportes_qSOCDpto", dts.Tables("qSOCDpto"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()
        Else
            Label7.Text = " 0 Records Found. "
        End If

    End Sub
    Protected Sub btnExport1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport1.Click
        Dim dts As DataSet
        dts = loadxRisks()
        'dts = loadxDpto()
        'dts = loadxClass()
        If (dts IsNot Nothing) Then
            Dim bindDs_name As String = "dsReportes_qSOCDpto"
            Dim reportName As String = "Reporte.rdlc"
            ReportViewer1.LocalReport.DisplayName = "Demo Report"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("dsReportes_qSOCDpto", dts.Tables("qSOCDpto"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()
        Else
            Label7.Text = " 0 Records Found. "
        End If
    End Sub
    Protected Sub btnExport2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport2.Click
        Dim dts As DataSet
        dts = loadxClass()
        If (dts IsNot Nothing) Then
            Dim bindDs_name As String = "dsReportes_qSOCDpto"
            Dim reportName As String = "Reporte.rdlc"
            ReportViewer1.LocalReport.DisplayName = "Demo Report"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("dsReportes_qSOCDpto", dts.Tables("qSOCDpto"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()
        Else
            Label7.Text = " 0 Records Found. "
        End If
    End Sub
    Protected Sub btnExport3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport3.Click
        Dim dts As DataSet
        dts = loadxRolls()
        If (dts IsNot Nothing) Then
            Dim bindDs_name As String = "dsReportes_qSOCDpto"
            Dim reportName As String = "Reporte.rdlc"
            ReportViewer1.LocalReport.DisplayName = "Demo Report"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("dsReportes_qSOCDpto", dts.Tables("qSOCDpto"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()
        Else
            Label7.Text = " 0 Records Found. "
        End If
    End Sub
    Function TotalSOCs() As Integer
        Dim dts As DataSet
        Dim sql As String = "SELECT *" & _
                       " FROM tblStopCard" & _
                       " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"

        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        TotalSOCs = dts.Tables(0).Rows.Count
        Return TotalSOCs
    End Function
End Class
