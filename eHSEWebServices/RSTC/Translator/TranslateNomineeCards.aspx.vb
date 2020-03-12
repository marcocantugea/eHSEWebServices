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

Partial Class Translator_TranslateNomineeCards
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            fillStopCards()
            
        End If
    End Sub
    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        seleccionarFila(e.CommandArgument.ToString)
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        modificarRegistro()
        fillStopCards()
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        clearBoxes()
    End Sub
    Protected Sub clearBoxes()
        lblId.Text = ""
        Nombre.Text = ""
        Fecha.Text = ""
        Ubicacion.Text = ""
        Observacion.Text = ""
        Accion.Text = "".Trim
        tMinimize.Text = ""
        tSituation.Text = ""
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Try
            Dim Sql As String = "SELECT * FROM tblStopCard WHERE Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# and NomineeWeek=TRUE or NomineeMonth=TRUE OR SOC_Relevante=TRUE ORDER BY Fecha ASC"
            dts = clsDB.QueryDataSet(Sql)
            clsDB.Close()
            RptTitle.Text = dts.Tables(0).Rows.Count
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
        Catch ex As Exception
            Response.Write("Error getting SOC; " & ex.Message)
        End Try
        
    End Sub
    Protected Sub seleccionarFila(ByVal id As String)
        Dim a As Button
        Dim b As Integer
        Dim items As ImageButton
        Dim path As String
        Dim sql As String
        Dim dts As DataSet
        Dim c As String
        Dim lnombre, lfecha, lUbicacion, lObservacion, lAccion As Label

        Dim codigos, nombres, revisiones, exts As String
        Dim fechas As Date

        For Each item As RepeaterItem In rptFiles.Items
            a = item.FindControl("btnGuardar0")
            b = a.CommandArgument
            If b = id Then
                lnombre = item.FindControl("Nombre")
                lfecha = item.FindControl("fecha")
                lUbicacion = item.FindControl("Ubicacion")
                lObservacion = item.FindControl("Observacion")
                lAccion = item.FindControl("Accion")

                lblId.Text = id
                Nombre.Text = lnombre.Text
                Fecha.Text = lfecha.Text
                Ubicacion.Text = lUbicacion.Text
                Observacion.Text = lObservacion.Text
                Accion.Text = lAccion.Text
                Try
                    sql = "SELECT * FROM tblStopCard WHERE ID=" & lblId.Text
                    dts = clsDB.QueryDataSet(sql)
                    clsDB.Close()
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("Situation")) Then
                                tSituation.Text = row("Situation")
                            Else
                                tSituation.Text = ""
                            End If
                            If Not IsDBNull(row("MinimizeRisk")) Then
                                tMinimize.Text = row("MinimizeRisk")
                            Else
                                tMinimize.Text = ""
                            End If
                        Next
                    End If

                    Exit For
                Catch ex As Exception
                    clsDB.Close()
                    Response.Write("Error loading card. Details; " & ex.Message)
                End Try
                
            End If
        Next
    End Sub
    Protected Sub modificarRegistro()
        Dim strSQL As String
        Dim a As Date
        Try
            a = Fecha.Text
            If lblId.Text = "" Then
                Response.Write("You must select a record to modify")
            Else
                
                            If Observacion.Text = "" Then
                                Response.Write("Observation cannot be in blank")
                            Else
                                If Accion.Text = "" Then
                                    Response.Write("Action cannot be in blank")
                                Else
                                    If Ubicacion.Text = "" Then
                                        Response.Write("Location cannot be in blank")
                                    Else
                            strSQL = "UPDATE tblStopCard SET Fecha='" & a & "',ubicacion='" & Ubicacion.Text.Trim & "', " & _
"Observacion='" & Observacion.Text.Trim & "', Accion='" & Accion.Text.Trim & "', Situation='" & tSituation.Text.Trim & "'" & _
", MinimizeRisk='" & tMinimize.Text.Trim & "' WHERE ID = " & lblId.Text & ""
                                        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                                            clsDB.Close()
                                            Response.Write("The Record has been updated Successfully")
                                clearBoxes()
                                        Else
                                            Response.Write("Error updating data")
                                        End If
                                    End If
                                End If
                            End If
            End If
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error. The Date Format is incorrect")
        End Try
    End Sub
    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        fillStopCards()
    End Sub
End Class
