Imports System.Data
Imports System
Imports clsDataBase
Imports Microsoft.Reporting.WebForms

Partial Class rSummary
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Public clsDB2 As New clsDataHome

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM-dd-yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            loadDepartamentos()
            getDepto()
            fillStopCards()
            'If Len(Request.QueryString("UserID")) > 0 Then
            '    'UserID.Text = Request.QueryString("UserID")
            '    ()
            'Else
            '    Response.Write("User ID had not been receive")
            'End If
        End If
    End Sub
    Protected Sub loadDepartamentos()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select * from ctgDepartamentos")
        clsDB.Close()
        dDpt.DataSource = Dept.Tables(0)
        dDpt.DataTextField = "Desc"
        dDpt.DataValueField = "Desc"
        dDpt.DataBind()
    End Sub
    Function validarFechas() As Boolean
        Dim de, a As Date
        Try
            de = tDateDel.Text
            a = tDateA.Text
            Return True
        Catch ex As Exception
            Response.Write("Error validating Date: " & ex.Message)
            Return False
        End Try
    End Function
    Function fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim empleados As DataSet
        Dim esta As Boolean = False
        Dim departamento As String = getDepto()
        If dDpt.SelectedItem.Text = "All" Then
            departamento = ""
        Else
            departamento = dDpt.SelectedItem.Text
        End If
        Dim Sql As String
        Sql = "SELECT * FROM qryConteoSOC WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Nombre ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Nombre From ctgEmpleados WHERE Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento
        Dim Lista As New Data.DataTable("Summary")
        Dim col13 As New Data.DataColumn("Item")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Cantidad")
        Dim col63 As New Data.DataColumn("Puesto")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col13)
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col63)


        Dim up, tp As Decimal
        Dim UOM As String
        Dim rptRow As DataRow
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim fechas As Date
        Dim fecha As String
        Dim total As Integer
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                total = row("Qty")
                fechas = row("Fecha").ToString
                fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Item") = i
                rptRow("Nombre") = row("Nombre")
                rptRow("Fecha") = fecha
                rptRow("Cantidad") = total
                rptRow("Puesto") = row("Puesto")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If
        Dim Empleado, Nombre As String

        dtsItems.Tables.Add(Lista)
        Return dtsItems
    End Function
    Function fillTOTALSOC()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim empleados As DataSet
        Dim esta As Boolean = False
        Dim departamento As String = getDepto()
        If dDpt.SelectedItem.Text = "All" Then
            departamento = ""
        Else
            departamento = dDpt.SelectedItem.Text
        End If
        Dim Sql As String
        'Sql = "SELECT * FROM qryConteoSOC WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Nombre ASC"
        Sql = "SELECT ctgEmpleados.Empleado_ID, ctgEmpleados.Puesto,ctgEmpleados.Nombre, Count(tblStopCard.Nombre) AS Qty, ctgDepartamentos.Desc" & _
        " FROM ctgDepartamentos INNER JOIN (ctgEmpleados LEFT JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
        " WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
        " GROUP BY ctgEmpleados.Empleado_ID,ctgEmpleados.Puesto,ctgEmpleados.Nombre, ctgDepartamentos.Desc" & _
        " ORDER BY Count(tblStopCard.Nombre) DESC"

        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Nombre From ctgEmpleados WHERE Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento
        Dim Lista As New Data.DataTable("Summary")
        Dim col13 As New Data.DataColumn("Item")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Cantidad")
        Dim col63 As New Data.DataColumn("Puesto")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col13)
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col63)


        Dim up, tp As Decimal
        Dim UOM As String
        Dim rptRow As DataRow
        Dim i As Integer = 1
        Dim j As Integer = 0
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim fechas As Date
        Dim fecha As String
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                'fechas = row("Fecha").ToString
                'fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Item") = i
                rptRow("Nombre") = row("Nombre")
                rptRow("Fecha") = ""
                rptRow("Cantidad") = row("Qty")
                rptRow("Puesto") = row("Puesto")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If
        Dim Empleado, Nombre As String

        dtsItems.Tables.Add(Lista)
        Return dtsItems
    End Function
    Function fillNoSOC()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim empleados As DataSet
        Dim esta As Boolean = False
        Dim departamento As String = getDepto()
        'If dDpt.SelectedItem.Text = "All" Then
        '    departamento = ""
        'Else
        '    departamento = dDpt.SelectedItem.Text
        'End If
        Dim Sql As String
        'Sql = "SELECT * FROM qryConteoSOC WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Nombre ASC"
        Sql = "SELECT ctgEmpleados.Empleado_ID,ctgEmpleados.Puesto, ctgEmpleados.Nombre, Count(tblStopCard.Nombre) AS Qty, ctgDepartamentos.Desc" & _
        " FROM ctgDepartamentos INNER JOIN (ctgEmpleados LEFT JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
        " WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
        " GROUP BY ctgEmpleados.Empleado_ID,ctgEmpleados.Puesto,ctgEmpleados.Nombre, ctgDepartamentos.Desc" & _
        " ORDER BY Count(tblStopCard.Nombre) DESC"

        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Puesto,Nombre From ctgEmpleados WHERE Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento

        Dim Lista As New Data.DataTable("Summary")
        Dim col13 As New Data.DataColumn("Item")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Cantidad")
        Dim col63 As New Data.DataColumn("Puesto")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col13)
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col63)


        Dim up, tp As Decimal
        Dim UOM As String
        Dim rptRow As DataRow
        Dim i As Integer = 0
        Dim j As Integer = 1
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim fechas As Date
        Dim fecha As String
        Dim Empleado As String
        Dim Nombre As String
        If empleados.Tables(0).Rows.Count > 0 Then
            For Each registro As DataRow In empleados.Tables(0).Rows
                Empleado = registro("Nombre")
                For Each tarjeta As DataRow In dts.Tables(0).Rows
                    Nombre = tarjeta("Nombre")
                    If Empleado = Nombre Then
                        esta = True
                    End If
                Next
                Dim qty As Label
                If esta = False Then
                    rptRow = Lista.NewRow
                    rptRow("Item") = j
                    rptRow("Fecha") = ""
                    rptRow("Nombre") = registro("Nombre")
                    rptRow("Cantidad") = "0"
                    rptRow("Puesto") = registro("Puesto")
                    j = j + 1
                    Lista.Rows.Add(rptRow)
                End If
                esta = False
            Next
        End If
        dtsItems.Tables.Add(Lista)
        Return dtsItems
    End Function
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
        dDpt.SelectedValue = dpto
        Return dpto
    End Function
    Function getDeptoID(ByVal dsc As String)
        Dim ds As DataSet
        Dim dpto As Integer
        Dim sql As String = "Select ID From ctgDepartamentos where Desc='" & dsc & "'"
        ds = clsDB.QueryDataSet(sql)
        clsDB.Close()
        dpto = 0
        If ds.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In ds.Tables(0).Rows
                dpto = row("ID")
            Next
        End If
        Return dpto
    End Function

    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        If validarFechas() Then
            Dim dts As DataSet
            'dts = loadxRisks() 
            'dts = loadxDpto()
            dts = fillStopCards()
            Dim bindDs_name As String = "Reportes_Summary"
            Dim reportName As String = "rSummary.rdlc"
            ReportViewer1.LocalReport.DisplayName = "SOC - Summary"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("Reportes_Summary", dts.Tables("Summary"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()

        Else
            Response.Write("Dates must be in format Month/Day/Year")
        End If
    End Sub

    Protected Sub btnTotal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTotal.Click
        If validarFechas() Then
            Dim dts As DataSet
            dts = fillTOTALSOC()
            Dim bindDs_name As String = "Reportes_Summary"
            Dim reportName As String = "rSummary.rdlc"
            ReportViewer1.LocalReport.DisplayName = "SOC - Summary"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("Reportes_Summary", dts.Tables("Summary"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()

        Else
            Response.Write("Dates must be in format Month/Day/Year")
        End If
    End Sub

    Protected Sub btnTotal0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTotal0.Click
        If validarFechas() Then
            Dim dts As DataSet
            dts = fillNoSOC()
            Dim bindDs_name As String = "Reportes_Summary"
            Dim reportName As String = "rSummary.rdlc"
            ReportViewer1.LocalReport.DisplayName = "SOC - Summary"
            ReportViewer1.LocalReport.ReportPath = reportName

            Dim datasource As ReportDataSource = New ReportDataSource("Reportes_Summary", dts.Tables("Summary"))

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()
            ReportViewer1.DataBind()


        Else
            Response.Write("Dates must be in format Month/Day/Year")
        End If

    End Sub
End Class
