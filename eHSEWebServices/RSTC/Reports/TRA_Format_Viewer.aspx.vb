Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data.OleDb


Partial Class Reports_TRA_Format_Viewer
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            Dim s As String = Request.QueryString("Param").ToString

            Dim dts As DataSet
            dts = loadTRAs()
            Dim bindDs_name As String = "qryTRATest" 'Dim bindDs_name As String = "qryTRATest"
            Dim reportName As String = "Reports/Report.rdlc" 'Dim reportName As String = "Reports/Report.rdlc" 'Report.rdlc
            ReportViewer1.LocalReport.DisplayName = "Demo Report"
            ReportViewer1.LocalReport.ReportPath = reportName
            Dim datasource As ReportDataSource = New ReportDataSource("qryTRATest", dts.Tables("qryTRATest"))  'Dim datasource As ReportDataSource = New ReportDataSource("qryTRATest", dts.Tables("qryTRATest"))
            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()
            'dts.Dispose()
        End If
    End Sub

    Function loadTRAs()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim s As String = Request.QueryString("Param").ToString
        'Dim s As String = 47
        Dim sql As String = "Select * From qryTRATest where tra_ID=" & s

        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        Dim dsc As String
        Dim qty As Integer


        Dim Lista As New Data.DataTable("qryTRATest")
        Dim col1 As New Data.DataColumn("tra_Unit")
        Dim col2 As New Data.DataColumn("tra_Dept")
        Dim col3 As New Data.DataColumn("traR_TaskSteps")
        Dim col4 As New Data.DataColumn("traR_Hazard")
        Dim col5 As New Data.DataColumn("tra_ID")
        Dim col6 As New Data.DataColumn("tra_Location")
        Dim col7 As New Data.DataColumn("tra_Activity_Job")
        Dim col8 As New Data.DataColumn("tra_Date")
        Dim col9 As New Data.DataColumn("traR_Risk")
        Dim col10 As New Data.DataColumn("traR_Ini_Severity")
        Dim col11 As New Data.DataColumn("traR_Ini_Likeli")
        Dim col12 As New Data.DataColumn("traR_Ini_Risk")
        Dim col13 As New Data.DataColumn("traR_MinimizeRiskBy")
        Dim col14 As New Data.DataColumn("traR_Res_Severity")
        Dim col15 As New Data.DataColumn("traR_Res_Likeli")
        Dim col16 As New Data.DataColumn("traR_Res_Risk")
        Dim col17 As New Data.DataColumn("tra_Hazard_Subs_NA")
        Dim col18 As New Data.DataColumn("tra_Hazard_Noise_NA")
        Dim col19 As New Data.DataColumn("tra_Hazard_Hand_NA")
        Dim col20 As New Data.DataColumn("tra_Hazard_Access_NA")
        Dim col21 As New Data.DataColumn("tra_Hazard_Equip_NA")
        Dim col22 As New Data.DataColumn("tra_Hazard_Overhead_NA")
        Dim col23 As New Data.DataColumn("tra_Hazard_Factors_NA")
        Dim col24 As New Data.DataColumn("tra_Hazard_Comms_NA")
        Dim col25 As New Data.DataColumn("tra_Hazard_Environ_NA")
        Dim col26 As New Data.DataColumn("tra_Hazard_Process_NA")
        Dim col27 As New Data.DataColumn("tra_Hazard_Vibration_NA")
        Dim col28 As New Data.DataColumn("tra_Hazard_Subs_Eval")
        Dim col29 As New Data.DataColumn("tra_Hazard_Noise_Eval")
        Dim col30 As New Data.DataColumn("tra_Hazard_Hand_Eval")
        Dim col31 As New Data.DataColumn("tra_Hazard_Access_Eval")
        Dim col32 As New Data.DataColumn("tra_Hazard_Equip_Eval")
        Dim col33 As New Data.DataColumn("tra_Hazard_Overhead_Eval")
        Dim col34 As New Data.DataColumn("tra_Hazard_Factors_Eval")
        Dim col35 As New Data.DataColumn("tra_Hazard_Comms_Eval")
        Dim col36 As New Data.DataColumn("tra_Hazard_Environ_Eval")
        Dim col37 As New Data.DataColumn("tra_Hazard_Process_Eval")
        Dim col38 As New Data.DataColumn("tra_Hazard_Vibration_Eval")
        Dim col39 As New Data.DataColumn("tra_FinalAssessment")
        Dim col40 As New Data.DataColumn("tra_OveralRisk")
        Dim col41 As New Data.DataColumn("tra_ApplicableProcedure")


        Lista.Columns.Add(col1)
        Lista.Columns.Add(col2)
        Lista.Columns.Add(col3)
        Lista.Columns.Add(col4)
        Lista.Columns.Add(col5)
        Lista.Columns.Add(col6)
        Lista.Columns.Add(col7)
        Lista.Columns.Add(col8)
        Lista.Columns.Add(col9)
        Lista.Columns.Add(col10)
        Lista.Columns.Add(col11)
        Lista.Columns.Add(col12)
        Lista.Columns.Add(col13)
        Lista.Columns.Add(col14)
        Lista.Columns.Add(col15)
        Lista.Columns.Add(col16)
        Lista.Columns.Add(col17)
        Lista.Columns.Add(col18)
        Lista.Columns.Add(col19)
        Lista.Columns.Add(col20)
        Lista.Columns.Add(col21)
        Lista.Columns.Add(col22)
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col25)
        Lista.Columns.Add(col26)
        Lista.Columns.Add(col27)
        Lista.Columns.Add(col28)
        Lista.Columns.Add(col29)
        Lista.Columns.Add(col30)
        Lista.Columns.Add(col31)
        Lista.Columns.Add(col32)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col34)
        Lista.Columns.Add(col35)
        Lista.Columns.Add(col36)
        Lista.Columns.Add(col37)
        Lista.Columns.Add(col38)
        Lista.Columns.Add(col39)
        Lista.Columns.Add(col40)
        Lista.Columns.Add(col41)
                          
        Dim rptRow As DataRow
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                rptRow = Lista.NewRow
                rptRow("tra_Unit") = row("tra_Unit")
                rptRow("tra_Dept") = row("tra_Dept")
                rptRow("traR_TaskSteps") = row("traR_TaskSteps")
                rptRow("traR_Hazard") = row("traR_Hazard")
                rptRow("tra_ID") = row("tra_ID")
                rptRow("tra_Location") = row("tra_Location")
                rptRow("tra_Activity_Job") = row("tra_Activity_Job")
                rptRow("tra_Date") = row("tra_Date")
                rptRow("traR_Risk") = row("traR_Risk")
                rptRow("traR_Ini_Severity") = row("traR_Ini_Severity")
                rptRow("traR_Ini_Likeli") = row("traR_Ini_Likeli")
                rptRow("traR_Ini_Risk") = row("traR_Ini_Risk")
                rptRow("traR_MinimizeRiskBy") = row("traR_MinimizeRiskBy")
                rptRow("traR_Res_Severity") = row("traR_Res_Severity")
                rptRow("traR_Res_Likeli") = row("traR_Res_Likeli")
                rptRow("traR_Res_Risk") = row("traR_Res_Risk")
                rptRow("tra_Hazard_Subs_NA") = row("tra_Hazard_Subs_NA")
                rptRow("tra_Hazard_Noise_NA") = row("tra_Hazard_Noise_NA")
                rptRow("tra_Hazard_Hand_NA") = row("tra_Hazard_Hand_NA")
                rptRow("tra_Hazard_Access_NA") = row("tra_Hazard_Access_NA")
                rptRow("tra_Hazard_Equip_NA") = row("tra_Hazard_Equip_NA")
                rptRow("tra_Hazard_Overhead_NA") = row("tra_Hazard_Overhead_NA")
                rptRow("tra_Hazard_Factors_NA") = row("tra_Hazard_Factors_NA")
                rptRow("tra_Hazard_Comms_NA") = row("tra_Hazard_Comms_NA")
                rptRow("tra_Hazard_Environ_NA") = row("tra_Hazard_Environ_NA")
                rptRow("tra_Hazard_Process_NA") = row("tra_Hazard_Process_NA")
                rptRow("tra_Hazard_Vibration_NA") = row("tra_Hazard_Vibration_NA")
                rptRow("tra_Hazard_Subs_Eval") = row("tra_Hazard_Subs_Eval")
                rptRow("tra_Hazard_Noise_Eval") = row("tra_Hazard_Noise_Eval")
                rptRow("tra_Hazard_Hand_Eval") = row("tra_Hazard_Hand_Eval")
                rptRow("tra_Hazard_Access_Eval") = row("tra_Hazard_Access_Eval")
                rptRow("tra_Hazard_Equip_Eval") = row("tra_Hazard_Equip_Eval")
                rptRow("tra_Hazard_Overhead_Eval") = row("tra_Hazard_Overhead_Eval")
                rptRow("tra_Hazard_Factors_Eval") = row("tra_Hazard_Factors_Eval")
                rptRow("tra_Hazard_Comms_Eval") = row("tra_Hazard_Comms_Eval")
                rptRow("tra_Hazard_Environ_Eval") = row("tra_Hazard_Environ_Eval")
                rptRow("tra_Hazard_Process_Eval") = row("tra_Hazard_Process_Eval")
                rptRow("tra_Hazard_Vibration_Eval") = row("tra_Hazard_Vibration_Eval")
                rptRow("tra_FinalAssessment") = row("tra_FinalAssessment")
                rptRow("tra_OveralRisk") = row("tra_OveralRisk")
                rptRow("tra_ApplicableProcedure") = row("tra_ApplicableProcedure")

                Lista.Rows.Add(rptRow)


            Next
            dtsItems.Tables.Add(Lista)
            Return dtsItems
        End If
    End Function
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
End Class
