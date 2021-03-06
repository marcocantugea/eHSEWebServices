﻿Imports clsDataBase
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
Partial Class StopCard
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    
    Protected Sub btnPhoneSrc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhoneSrc.Click
        Dim caja As Integer
        Dim strSQL1 As String
        Dim fecha As Date
        Dim hora As String
        hora = DateTime.Now.ToString("HH:mm")


        Try
            fecha = txtDate.Text
            If txtName.Text.Length > 0 Then
                If txtUbica.Text.Length > 0 Then
                    If txtObserva.Text.Length > 0 Then
                        If txtAccion.Text.Length > 0 Then
                            strSQL1 = "INSERT INTO tblStopCard (Nombre,Fecha,ubicacion,Observacion," & _
            "Accion,Acto_Inseguro,EPP,Posicion_Gente,Orden_Limpieza,Condicion_Insegura," & _
            "Procedimiento,Herramientas,Observacion_Positiva,Otra,Estatus,Week,SOC_Hora,SOC_Computadora)" & _
            "VALUES('" & txtName.Text & "', '" & fecha & "','" & txtUbica.Text.Trim & "'" & _
            ",'" & txtObserva.Text.Trim & "','" & txtAccion.Text.Trim & "'," & rbList.Items(0).Selected & "" & _
        "," & rbList.Items(1).Selected & "," & rbList.Items(2).Selected & "," & rbList.Items(3).Selected & "" & _
        "," & rbList.Items(4).Selected & "," & rbList.Items(5).Selected & "," & rbList.Items(6).Selected & "" & _
        "," & rbList.Items(7).Selected & "," & rbList.Items(8).Selected & ",'Open'," & Semana.Text & ",'" & hora & "','" & lblIP.Text.Trim & "')"

                            Try
                                If clsDB.QueryExecuteNonQuery(strSQL1) = True Then
                                    clsDB.Close()
                                    Response.Redirect("StopCardSent.aspx")
                                Else
                                    clsDB.Close()
                                    Response.Write("Error Saving Data => " & strSQL1)
                                End If
                            Catch ex As Exception
                                Response.Write("<br/> " & ex.Message)
                            End Try
                        Else
                            Response.Write("<br/>  Error: Input an Action <br/> ")
                        End If
                    Else
                        Response.Write("<br/>  Error: Input a Observation <br/> ")
                    End If
                Else
                    Response.Write("<br/>  Error: Input a Location <br/> ")
                End If
            Else
                Response.Write("<br/>  Error: Input a name <br/> ")
            End If
        Catch ex As Exception
            Response.Write("<br/> Error al Error: Input Date")
        End Try
    End Sub
    Protected Sub buscarEmpleados()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Nombre from ctgEmpleados where Nombre like '%" & Busqueda.Text.Trim & "%'  order by Nombre")
        clsDB.Close()
        gvEmpleados.DataSource = Empleados
        gvEmpleados.DataBind()
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim week As Integer
            Dim selDate As Date
            Dim currentRequest As HttpRequest = HttpContext.Current.Request
            lblIP.Text = currentRequest.ServerVariables("REMOTE_ADDR")

            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            txtDate.Text = selDate
            week = DatePart(DateInterval.WeekOfYear, selDate, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
            Semana.Text = week
            txtName.Focus()
            loadNombres()
            divBusqueda.Visible = False
            fillStopCards()
        End If
    End Sub
    Protected Sub loadNombres()
        Dim busca As String = ""
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Nombre from ctgEmpleados order by Nombre")
        clsDB.Close()
        txtName.DataSource = Empleados.Tables(0)
        txtName.DataTextField = "Nombre"
        txtName.DataValueField = "Nombre"
        txtName.DataBind()
    End Sub
    Protected Sub Busqueda_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Busqueda.TextChanged
        buscarEmpleados()
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet

        'Dim Sql As String = "SELECT * FROM tblStopCard where Fecha=#" & dia & "# and U_P Is Null"
        Dim Sql As String = "SELECT * FROM tblStopCard WHERE Estatus='Open'"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Nombre")
        Dim col24 As New Data.DataColumn("Fecha")
        Dim col33 As New Data.DataColumn("Ubicacion")
        Dim col53 As New Data.DataColumn("Observacion")
        Dim col54 As New Data.DataColumn("Accion")
        Dim col63 As New Data.DataColumn("Boton")
        Dim item, codigo, revision, path, boton As String

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
            fecha = Format(fechas.ToString("dd-MM-yyyy"))
            rptRow = Lista.NewRow
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

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        divBusqueda.Visible = False
    End Sub
    
    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        seleccionarFila(e.CommandArgument.ToString)
    End Sub
    
    Protected Sub seleccionarFila(ByVal id As String)
        Dim a As Button
        Dim b As String
        Dim items As ImageButton
        Dim path As String
        Dim lnombre, lfecha, lUbicacion, lObservacion, lAccion As Label

        Dim codigos, nombres, revisiones, exts As String
        Dim fechas As Date
        Dim dts As New Repeater
        dts.DataSource = rptFiles.Items
        dts.DataBind()
        For Each item As RepeaterItem In rptFiles.Items
            a = item.FindControl("btnGuardar0")
            b = a.CommandArgument
            If b = id Then
                lUbicacion = item.FindControl("Ubicacion")
                lObservacion = item.FindControl("Observacion")
                lAccion = item.FindControl("Accion")

                txtUbica.Text = lUbicacion.Text
                txtObserva.Text = lObservacion.Text
                txtAccion.Text = lAccion.Text

                Exit For
            End If
            Dim chain As String
            'chain = codigo.Text.Trim & "," & revision.Text.Trim & "," & nombre.Text.Trim & "," & _
            '"" & path & "," & dlSystem.SelectedValue  ""
            Dim Docs As DataSet
            Dim sql As String

            'sql = "SELECT * FROM qryDocuments where Path='" & path & "'"

            'Docs = clsDB.QueryDataSet(sql)
            'clsDB.Close()
            'If Docs.Tables(0).Rows.Count > 0 Then
            '    Response.Write("Document Already Exist")
            'Else
            '    sql = "INSERT INTO mVendorManals (Codigo,Revision,Nombre,Path,SistemaID, " & _
            '    "Familia,Vendor_ID,AkerCode,Genero_ID,Librero,Repisa,Vols,Comentarios," & _
            '    "EquipoCritico,Area,Reviewed,DocType,Equipo) VALUES('" &  & "'"
            '    If clsDB.QueryExecuteNonQuery(sql) = True Then

            '    End If
        Next
    End Sub

    Protected Sub txtDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDate.TextChanged
        Dim selDate As Date
        Dim week As Integer
        Try
            selDate = txtDate.Text
            week = DatePart(DateInterval.WeekOfYear, selDate, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
            Semana.Text = week
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnClose0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose0.Click
        divBusqueda.Visible = True
        Busqueda.Focus()
    End Sub

    Protected Sub gvEmpleados_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles gvEmpleados.ItemCommand
        Dim a As String
        a = e.CommandArgument.ToString
        txtName.SelectedValue = a
        divBusqueda.Visible = False
    End Sub
End Class
