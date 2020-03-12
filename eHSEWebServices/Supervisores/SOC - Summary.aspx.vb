Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Imports System.Web.UI.WebControls
Imports System.ComponentModel
Imports System.Security
Imports System.Net.Mail
Imports System.Net.Mime
Partial Class SOC___Summary
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
            fillStopCards()
            'If Len(Request.QueryString("UserID")) > 0 Then
            '    UserID.Text = Request.QueryString("UserID")

            'Else
            '    Response.Write("User ID had not been receive")
            'End If

            divBusqueda.Visible = False
        End If
    End Sub
    Protected Sub loadDepartamentos()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select * from ctgDepartamentos")
        clsDB.Close()
        dDpt.DataSource = Dept.Tables(0)
        dDpt.DataTextField = "Desc"
        dDpt.DataValueField = "ID"
        dDpt.DataBind()
    End Sub

    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        If validarFechas() Then
            fillStopCards()

        Else
            Response.Write("Dates must be in format Month/Day/Year")
        End If
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
    Protected Sub fillStopCards()
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
        Sql = "SELECT * FROM qryConteoSOC WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Nombre ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Nombre From ctgEmpleados WHERE emp_Vigente=True AND Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento
        Label7.Text = dts.Tables(0).Rows.Count & " Records"
        Dim Lista As New Data.DataTable("Items")
        Dim col13 As New Data.DataColumn("Idi")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Qty")
        Dim col63 As New Data.DataColumn("Boton")
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
        Dim socTotal As Integer = 0
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                socTotal = socTotal + row("Qty")
                fechas = row("Fecha").ToString
                fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Idi") = row("Empleado_ID")
                rptRow("Nombre") = row("Nombre")
                rptRow("Fecha") = fecha
                rptRow("Qty") = row("Qty")
                rptRow("Boton") = row("Empleado_ID")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If
        Dim Empleado, Nombre As String
        dtsItems.Tables.Add(Lista)

        rptFiles.DataSource = dtsItems
        rptFiles.DataBind()

        Label7.Text = socTotal
        lCrewLabel.Text = "Total SOC Cards                "
        RptNull.Text = i
        CrewTotal.Text = ""
    End Sub
    Protected Sub fillTOTALSOC()
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
        Sql = "SELECT ctgEmpleados.Empleado_ID, ctgEmpleados.Nombre, Count(tblStopCard.Nombre) AS Qty, ctgDepartamentos.Desc" & _
        " FROM ctgDepartamentos INNER JOIN (ctgEmpleados LEFT JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
        " WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
        " GROUP BY ctgEmpleados.Empleado_ID, ctgEmpleados.Nombre, ctgDepartamentos.Desc" & _
        " ORDER BY Count(tblStopCard.Nombre) DESC"

        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Nombre From ctgEmpleados WHERE emp_Vigente=True AND Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento
        Label7.Text = dts.Tables(0).Rows.Count & " Records"
        Dim Lista As New Data.DataTable("Items")
        Dim col13 As New Data.DataColumn("Idi")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Qty")
        Dim col63 As New Data.DataColumn("Boton")
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
        Dim socTotal As Integer = 0
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                'fechas = row("Fecha").ToString
                socTotal = socTotal + row("Qty")
                fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Idi") = row("Empleado_ID")
                rptRow("Nombre") = row("Nombre")
                rptRow("Fecha") = ""
                rptRow("Qty") = row("Qty")
                rptRow("Boton") = row("Empleado_ID")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If
        dtsItems.Tables.Add(Lista)

        rptFiles.DataSource = dtsItems
        rptFiles.DataBind()

        Label7.Text = socTotal
        lCrewLabel.Text = "Crew with Participation    "
        RptNull.Text = i & " of "
        CrewTotal.Text = empleados.Tables(0).Rows.Count
    End Sub
    Protected Sub fillNoSOC()
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
        Sql = "SELECT ctgEmpleados.Empleado_ID, ctgEmpleados.Nombre, Count(tblStopCard.Nombre) AS Qty, ctgDepartamentos.Desc" & _
        " FROM ctgDepartamentos INNER JOIN (ctgEmpleados LEFT JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
        " WHERE Desc like '%" & departamento & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
        " GROUP BY ctgEmpleados.Empleado_ID, ctgEmpleados.Nombre, ctgDepartamentos.Desc" & _
        " ORDER BY Count(tblStopCard.Nombre) DESC"
        'Desc like '%" & departamento & "%'
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim dptID As Integer = getDeptoID(departamento)
        Dim Sql2 As String = "Select Empleado_ID,Nombre From ctgEmpleados WHERE emp_Vigente=True and Dpto_ID=" & dptID & " ORDER BY Nombre ASC"
        empleados = clsDB.QueryDataSet(Sql2)
        clsDB.Close()

        dDpt.SelectedItem.Text = departamento
        Label7.Text = dts.Tables(0).Rows.Count & " Records"
        Dim Lista As New Data.DataTable("Items")
        Dim col13 As New Data.DataColumn("Idi")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Nombre")
        Dim col33 As New Data.DataColumn("Qty")
        Dim col63 As New Data.DataColumn("Boton")
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

        Dim Empleado, Nombre As String

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
                rptRow("Idi") = registro("Empleado_ID")
                rptRow("Nombre") = registro("Nombre")
                rptRow("Fecha") = ""
                rptRow("Qty") = "0"
                rptRow("Boton") = registro("Empleado_ID")
                j = j + 1
                Lista.Rows.Add(rptRow)
            End If
            esta = False
        Next






        dtsItems.Tables.Add(Lista)

        rptFiles.DataSource = dtsItems
        rptFiles.DataBind()

        Label7.Text = i
        lCrewLabel.Text = "Crew without Participation "
        RptNull.Text = j & " of "
        CrewTotal.Text = empleados.Tables(0).Rows.Count
    End Sub
    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        divBusqueda.Visible = True
        seleccionarFila(e.CommandArgument.ToString)
    End Sub
    Protected Sub seleccionarFila(ByVal id As String)
        Dim a As Button
        Dim b As Integer
        Dim items As ImageButton
        Dim dts As DataSet
        Dim dtsitems As New DataSet
        Dim lnombre, lfecha, lUbicacion, lObservacion, lAccion As Label
        b = id
        Dim sql As String = "Select Nombre,Puesto,Desc,Crew,Empresa_Desc from qryStopEmpleados WHERE Empleado_ID=" & id & " AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# "
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                Nombre.Text = row("Nombre")
                Position.Text = row("Puesto")
                Department.Text = row("Desc")
                Crew.Text = row("Crew")
                Company.Text = row("Empresa_Desc")
            Next
        End If
        sql = "Select Fecha,Ubicacion,Observacion,Accion from qryStopEmpleados WHERE Empleado_ID=" & id & " AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# "
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()

        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Fecha")
        Dim col24 As New Data.DataColumn("Ubicacion")
        Dim col33 As New Data.DataColumn("Observacion")
        Dim col63 As New Data.DataColumn("Accion")
        Dim item, codigo, revision, path, boton As String

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
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                fechas = row("Fecha").ToString
                fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Fecha") = fecha
                rptRow("Ubicacion") = row("Ubicacion")
                rptRow("Observacion") = row("Observacion")
                rptRow("Accion") = row("Accion")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If

        dtsItems.Tables.Add(Lista)
        gvTarjetas.DataSource = dtsItems
        gvTarjetas.DataBind()
    End Sub
    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        divBusqueda.Visible = False
    End Sub
    Protected Sub btnTotal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTotal.Click
        If validarFechas() Then
            fillTOTALSOC()

        Else
            Response.Write("Dates must be in format Month/Day/Year")
        End If
    End Sub
    Protected Sub btnTotal0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTotal0.Click
        fillNoSOC()
    End Sub
    Protected Sub btnTotal1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTotal1.Click
        Response.Write("<script>")
        Response.Write("window.open('rSummary.aspx?UserID=" & UserID.Text & "','_blank')")
        Response.Write("</script>")
    End Sub
End Class
