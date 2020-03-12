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
Imports OpenDocs
Partial Class StopCard
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataRSTC
    Public moment As New System.DateTime()
    Protected Sub btnPhoneSrc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhoneSrc.Click
        Dim strSQL1 As String
        Dim fecha As Date
        fecha = txtDate.Text
        Dim hora As String
        hora = DateTime.Now.ToString("HH:mm:ss")
        If txtName.Text.Length > 0 Then
            If txtUbica.Text.Length > 0 Then
                If txtObserva.Text.Length > 0 Then
                    If txtAccion.Text.Length > 0 Then
                        If verificar() = False Then
                            strSQL1 = "INSERT INTO tblStopCard (Nombre,Fecha,ubicacion,Observacion," & _
                                    "Accion,Acto_Inseguro,EPP,Posicion_Gente,Orden_Limpieza,Condicion_Insegura," & _
                                    "Procedimiento,Herramientas,Observacion_Positiva,Otra,Estatus,Week,SOC_Hora,SOC_Computadora)" & _
                                    "VALUES('" & txtName.Text & "', '" & fecha & "','" & txtUbica.Text.Replace("'", "''").Trim & "'" & _
                                    ",'" & txtObserva.Text.Replace("'", "''").Trim & "','" & txtAccion.Text.Replace("'", "''").Trim & "'," & rbList.Items(0).Selected & "" & _
                                    "," & rbList.Items(1).Selected & "," & rbList.Items(2).Selected & "," & rbList.Items(3).Selected & "" & _
                                    "," & rbList.Items(4).Selected & "," & rbList.Items(5).Selected & "," & rbList.Items(6).Selected & "" & _
                                    "," & rbList.Items(7).Selected & "," & rbList.Items(8).Selected & ",'Open'," & Semana.Text & ",'" & hora & "','" & lblIP.Text.Trim & "')"
                            Try
                                If clsDB.QueryExecuteNonQuery(strSQL1) = True Then
                                    clsDB.Close()
                                    Response.Redirect("StopCardSent.aspx")
                                    'Response.Write("Saved")
                                Else
                                    clsDB.Close()
                                    Response.Write("Stop Card couldn't be saved")
                                End If
                            Catch ex As Exception
                                Response.Write("Error Saving Stop Card. <br/> " & ex.Message)
                            End Try
                        Else
                            Response.Write("Tarjeta Repetida <br/> ")
                        End If

                    Else
                        Response.Write("<br/>  Input an Action <br/> ")
                        btnPhoneSrc.Enabled = True
                    End If
                Else
                    Response.Write("<br/>  Input a Observation <br/> ")
                    btnPhoneSrc.Enabled = True
                End If
            Else
                Response.Write("<br/>  Input a Location <br/> ")
                btnPhoneSrc.Enabled = True
            End If
        Else
            btnPhoneSrc.Enabled = True
            Response.Write("<br/>  Input a name <br/> ")
        End If
        
    End Sub
    Function verificar() As Boolean
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Dim total As Integer
        Dim repetido As New clsDataBase
        Dim fecha As Date
        fecha = txtDate.Text
        Sql = "SELECT * FROM tblStopCard WHERE Fecha Between #" & fecha & "# AND #" & fecha & "#" & _
        " and Ubicacion='" & txtUbica.Text.Replace("'", "''").Trim & "' and Observacion='" & txtObserva.Text.Replace("'", "''").Trim & "' ORDER BY Fecha Desc"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        total = dts.Tables(0).Rows.Count
        If total > 0 Then
            Return True
        End If
    End Function
    Protected Sub buscarEmpleados()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Crew,Nombre from ctgEmpleados where Nombre like '%" & Busqueda.Text.Trim & "%'  order by Nombre")
        clsDB.Close()
        gvEmpleados.DataSource = Empleados
        gvEmpleados.DataBind()
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim currentRequest As HttpRequest = HttpContext.Current.Request
            lblIP.Text = currentRequest.ServerVariables("REMOTE_ADDR")

            Dim week As Integer
            week = DatePart(DateInterval.WeekOfYear, Now, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
            Semana.Text = week
            txtDate.Text = Format(Now.Date.ToString("MM/dd/yyyy"))
            txtName.Focus()
            loadNombres()
            loadSOCs()
            divBusqueda.Visible = False
        End If
    End Sub
    Protected Sub loadSOCs()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Ubicacion, Observacion from tblStopCard WHERE Week=" & Semana.Text & " order by SOC_Relevante")
        clsDB.Close()
        rptSOCss.DataSource = Empleados
        rptSOCss.DataBind()
    End Sub
    Protected Sub loadNombres()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select * from ctgEmpleados order by Nombre")
        clsDB.Close()
        txtName.DataSource = Empleados.Tables(0)
        txtName.DataTextField = "Nombre"
        txtName.DataValueField = "Nombre"
        txtName.DataBind()
    End Sub
    Protected Sub Busqueda_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Busqueda.TextChanged
        buscarEmpleados()
    End Sub

    Protected Sub gvEmpleados_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvEmpleados.SelectedIndexChanged
        txtObserva.Text = gvEmpleados.SelectedRow.Cells(1).Text
    End Sub
    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        divBusqueda.Visible = False
    End Sub
End Class
