Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Partial Class Duplicados
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateDel.Text = "05/01/2013"
            tDateA.Text = selDate
            fillStopCards()
            divBusqueda.Visible = False
        End If
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Sql = "SELECT * FROM qryRepetidas WHERE Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha Desc"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        RptTitle.Text = dts.Tables(0).Rows.Count
        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Nombre")
        Dim col24 As New Data.DataColumn("Fecha")
        Dim col33 As New Data.DataColumn("Ubicacion")
        Dim col53 As New Data.DataColumn("Observacion")
        Dim col54 As New Data.DataColumn("Totales")
        Dim col63 As New Data.DataColumn("Boton_")
        Dim col64 As New Data.DataColumn("Boton")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col53)
        Lista.Columns.Add(col54)
        Lista.Columns.Add(col63)
        Lista.Columns.Add(col64)


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
            rptRow("Nombre") = row("Nombre")
            rptRow("Fecha") = fecha
            rptRow("Totales") = row("Totales")
            rptRow("Ubicacion") = row("Ubicacion")
            rptRow("Observacion") = row("Observacion")
            rptRow("Boton_") = row("Observacion")
            rptRow("Boton") = row("Observacion")
            i = i + 1
            Lista.Rows.Add(rptRow)
        Next
        dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dtsItems
        rptFiles.DataBind()
    End Sub

    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        Mensajes.Visible = False
        If e.CommandName = "Detalle" Then
            divBusqueda.Visible = True
            seleccionarFila(e.CommandArgument.ToString)
            btnClose.Focus()
        ElseIf e.CommandName = "Borrar" Then
            normalizarTarjeta(e.CommandArgument.ToString)
        End If

    End Sub
    Protected Sub seleccionarFila(ByVal id As String)
        Dim a As Button
        Dim observa As String
        Dim items As ImageButton
        Dim dts As DataSet
        Dim dtsitems As New DataSet
        Dim lnombre, lfecha, lUbicacion, lObservacion, lAccion As Label
        observa = id
        Dim sql As String
        'sql = "Select Nombre,Puesto,Desc,Crew,Empresa_Desc from qryStopEmpleados WHERE Empleado_ID=" & id & " AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# "
        'dts = clsDB.QueryDataSet(sql)
        'clsDB.Close()
        'If dts.Tables(0).Rows.Count > 0 Then
        '    For Each row As DataRow In dts.Tables(0).Rows
        '        Nombre.Text = row("Nombre")
        '        Position.Text = row("Puesto")
        '        Department.Text = row("Desc")
        '        Crew.Text = row("Crew")
        '        Company.Text = row("Empresa_Desc")
        '    Next
        'End If
        sql = "Select ID,Fecha,Ubicacion,Observacion,Accion,SOC_Hora,SOC_Computadora from qryStopEmpleados WHERE  Observacion LIKE '%" & observa & "%'"
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()

        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("SOCID")
        Dim col24 As New Data.DataColumn("Ubicacion")
        Dim col33 As New Data.DataColumn("Observacion")
        Dim col63 As New Data.DataColumn("Accion")
        Dim col73 As New Data.DataColumn("Hora")
        Dim col83 As New Data.DataColumn("PC")
        Dim item, codigo, revision, path, boton As String

        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Lista.Columns.Add(col33)
        Lista.Columns.Add(col63)
        Lista.Columns.Add(col73)
        Lista.Columns.Add(col83)


        Dim up, tp As Decimal
        Dim UOM As String
        Dim rptRow As DataRow
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim horaF As DateTime
        Dim hora As String
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                horaF = row("SOC_Hora").ToString
                hora = Format(horaF.ToString("HH:mm:ss"))
                rptRow = Lista.NewRow
                rptRow("SOCID") = row("ID")
                rptRow("Ubicacion") = row("Ubicacion")
                rptRow("Observacion") = row("Observacion")
                rptRow("Accion") = row("Accion")
                rptRow("Hora") = hora
                rptRow("PC") = row("SOC_Computadora")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
        End If

        dtsItems.Tables.Add(Lista)
        gvTarjetas.DataSource = dtsItems
        gvTarjetas.DataBind()
    End Sub
    Protected Sub normalizarTarjeta(ByVal observa As String)
        Mensajes.Visible = False
        Dim dts As DataSet
        Dim tarjeta As New clsDataBase
        Dim sql As String
        Dim Qty As Integer = 1
        Dim socID As Integer
        Dim socDelete As String
        Dim fallo As Boolean
        sql = "SELECT * FROM tblStopCard WHERE Observacion LIKE '%" & observa & "%'"
        dts = tarjeta.QueryDataSet(sql)
        tarjeta.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                socID = row("ID")
                If Qty = 1 Then
                Else
                    sql = "DELETE from tblStopCard WHERE ID = " & socID & ""
                    If tarjeta.QueryExecuteNonQuery(sql) = True Then
                        tarjeta.Close()
                        socDelete = socID & " " & socDelete
                    Else
                        Mensajes.Visible = True
                        Mensajes.Text = "Error Borrando Tarjetas SOC"
                        fallo = True
                        Exit For
                    End If
                End If
                Qty = Qty + 1
            Next
            Dim borradas As Integer = Qty - 2
            If fallo = False Then
                Mensajes.Visible = True
                Mensajes.Text = borradas & " SOC han sido borradas con ID: " & socDelete & " satisfactoriamente"
                fillStopCards()
            End If
        End If
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        divBusqueda.Visible = False
    End Sub
End Class
