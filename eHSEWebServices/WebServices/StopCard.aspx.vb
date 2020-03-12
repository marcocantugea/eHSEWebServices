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
        If txtName.Text.Length > 0 Then
            If txtName.Text <> "Select Name - Seleccionar" Then
                If txtUbica.Text.Length > 0 Then
                    If txtObserva.Text.Length > 0 Then
                        If txtAccion.Text.Length > 0 Then
                            If Len(tConcern.Text) > 0 And Len(tMinimize.Text) > 0 Then
                                If rbAct.Items(0).Selected = True Or rbAct.Items(1).Selected = True Then
                                    If rbWorkStop.Items(0).Selected = True Or rbWorkStop.Items(1).Selected = True Then
                                        If rbList.Items(0).Selected = True Or rbList.Items(1).Selected = True Or rbList.Items(2).Selected = True Or rbList.Items(3).Selected = True Or rbList.Items(4).Selected = True Or rbList.Items(5).Selected = True Or rbList.Items(6).Selected = True Or rbList.Items(7).Selected = True Or rbList2.Items(0).Selected = True Or rbList2.Items(1).Selected = True Or rbList2.Items(2).Selected = True Or rbList2.Items(3).Selected = True Or rbList2.Items(4).Selected = True Or rbList2.Items(5).Selected = True Or rbList2.Items(6).Selected = True Or rbList2.Items(7).Selected = True Then
                                            If verificar() = False Then
                                                insertarSOC()
                                            Else
                                                Response.Write("Tarjeta Repetida <br/> ")
                                            End If
                                        Else
                                            Response.Write("<br/>  Risk Observed? / ¿Riesgos Observados? <br/> ")
                                            btnPhoneSrc.Enabled = True
                                        End If
                                    Else
                                        Response.Write("<br/>  Did you STOP the Job? / ¿Detuvo el trabajo? <br/> ")
                                        btnPhoneSrc.Enabled = True
                                    End If
                                Else
                                    Response.Write("<br/>  Was an unsafe act? / ¿Fue un acto inseguro? <br/> ")
                                    btnPhoneSrc.Enabled = True
                                End If
                            Else
                                Response.Write("<br/>  The fields cannot be empty / Los campos no pueden quedar en blanco <br/> ")
                                btnPhoneSrc.Enabled = True
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
                Response.Write("<br/>  Pick a name - Seleccionar Nombre <br/> ")
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
    Private Sub insertarSOC()
        Dim strSQL1 As String
        Dim fecha As Date
        fecha = txtDate.Text
        Dim hora As String
        hora = DateTime.Now.ToString("HH:mm:ss")


        strSQL1 = "INSERT INTO tblStopCard (Nombre,Fecha,ubicacion,Observacion," & _
        "Accion,Acto_Inseguro,Estatus,Week,SOC_Hora,SOC_Computadora,Situation,StopJob,MinimizeRisk,InformSupervisor" & _
        ",EPP,ch_Atrapamiento,Posicion_Gente,ch_Planeacion,ch_SnBarreras,ch_AmbienteTox,ch_TrabajoGrua,Otra,ch_Resbalon,ch_NoPermiso,ch_Comms," & _
        "ch_CondMeteorologica,ch_AltaPresion,ch_Quimicos,ch_Soldadura,Observacion_Positiva)" & _
        "VALUES('" & txtName.Text & "', '" & fecha & "','" & txtUbica.Text.Replace("'", "''").Trim & "'" & _
        ",'" & txtObserva.Text.Replace("'", "''").Trim & "','" & txtAccion.Text.Replace("'", "''").Trim & "'," & rbAct.SelectedValue & "," & _
        "'Open'," & Semana.Text & ",'" & hora & "','" & lblIP.Text.Trim & "','" & tConcern.Text.Replace("'", "''").Trim & "'," & rbWorkStop.SelectedValue & "," & _
        "'" & tMinimize.Text.Replace("'", "''").Trim & "'," & rbSuper.SelectedValue & "," & _
        "" & rbList.Items(0).Selected & "," & rbList.Items(1).Selected & "," & rbList.Items(2).Selected & "" & _
        "," & rbList.Items(3).Selected & "," & rbList.Items(4).Selected & "," & rbList.Items(5).Selected & "" & _
        "," & rbList.Items(6).Selected & "," & rbList.Items(7).Selected & "," & rbList2.Items(0).Selected & "" & _
        "," & rbList2.Items(1).Selected & "," & rbList2.Items(2).Selected & "," & rbList2.Items(3).Selected & "" & _
        "," & rbList2.Items(4).Selected & "," & rbList2.Items(5).Selected & "," & rbList2.Items(6).Selected & "," & rbList2.Items(7).Selected & ")"
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
    End Sub
    Protected Sub buscarEmpleados()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Crew,Nombre from ctgEmpleados where Nombre like '%" & Busqueda.Text.Trim & "%' and emp_Vigente=Yes order by Nombre")
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
            'loadSOCs()
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
        Dim dtsItems As New DataSet
        Empleados = clsDB.QueryDataSet("Select * from ctgEmpleados where emp_Vigente=Yes order by Nombre")
        clsDB.Close()
        'txtName.DataSource = Empleados.Tables(0)
        'txtName.DataTextField = "Nombre"
        'txtName.DataValueField = "Nombre"
        'txtName.DataBind()

        '****************************** Seleccionar Nombre ********************************
        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Nombre")
        Dim item, codigo, revision, path, boton As String


        Lista.Columns.Add(col23)

        Dim rptRow As DataRow
        Dim i As Integer = 1
        Dim cero As String = 0
        Dim count As Integer = 1
        Dim fechas As Date
        Dim fecha As String

        rptRow = Lista.NewRow
        rptRow("Nombre") = "Select Name - Seleccionar"
        Lista.Rows.Add(rptRow)

        For Each row As DataRow In Empleados.Tables(0).Rows
            rptRow = Lista.NewRow

            rptRow("Nombre") = row("Nombre")

            i = i + 1
            Lista.Rows.Add(rptRow)
        Next
        dtsItems.Tables.Add(Lista)
        txtName.DataSource = dtsItems.Tables(0)
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

    Protected Sub rbList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbList.SelectedIndexChanged
        'Al seleccionar cualquier radio del listado de rbList2 pone a todos los botones del listado  rbList en falso
        rbList2.Items(0).Selected = False
        rbList2.Items(1).Selected = False
        rbList2.Items(2).Selected = False
        rbList2.Items(3).Selected = False
        rbList2.Items(4).Selected = False
        rbList2.Items(5).Selected = False
        rbList2.Items(6).Selected = False
        rbList2.Items(7).Selected = False
        MaintainScrollPositionOnPostBack = True
    End Sub

    Protected Sub rbList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbList2.SelectedIndexChanged
        'Al seleccionar cualquier radio del listado de rbList2 pone a todos los botones del listado  rbList en falso
        rbList.Items(0).Selected = False
        rbList.Items(1).Selected = False
        rbList.Items(2).Selected = False
        rbList.Items(3).Selected = False
        rbList.Items(4).Selected = False
        rbList.Items(5).Selected = False
        rbList.Items(6).Selected = False
        rbList.Items(7).Selected = False
        MaintainScrollPositionOnPostBack = True
    End Sub
End Class
