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

Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections
Partial Class TRA_TRA_Revision_1
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataRSTC
    Public moment As New System.DateTime()
    Protected Sub traerUnidades()
        Dim Unidades As DataSet
        Unidades = clsDB.QueryDataSet("Select Unit_Id,Unit_Name from ctgUnits order by Unit_Name")
        clsDB.Close()
        dbUnit.DataSource = Unidades.Tables(0)
        dbUnit.DataTextField = "Unit_Name"
        dbUnit.DataValueField = "Unit_Id"
        dbUnit.DataBind()
        dbUnit.SelectedValue = 1
    End Sub
    Protected Sub traerDepartamentos()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select cDep_Id,cDep_Name from ctgDepartTRA order by cDep_Name")
        clsDB.Close()
        dbDepartamento.DataSource = Dept.Tables(0)
        dbDepartamento.DataTextField = "cDep_Name"
        dbDepartamento.DataValueField = "cDep_Id"
        dbDepartamento.DataBind()
        dbDepartamento.SelectedValue = 1
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            lblUser.Text = "Welcome " + Context.User.Identity.Name & "." 'Se toma el valo del user con identity
            Dim s As String = Request.QueryString("Param").ToString 'Se toma el parametro que se envio de la pagina anterior
            Dim estado As String
            ltraId.Text = s
            traerDepartamentos()
            traerUnidades()
            txtFecha.Text = Format(Now.Date.ToString("dd/MM/yyyy"))
            'tbl_PasosTRA.Visible = False
            tbl_TRAMain2.Visible = True
            tbl_TRAMain3.Visible = True
            divProcedimientos.Visible = False
            divtablaProc.Visible = False
            divConfirmación.Visible = False
            ' BindRepeater()
            estado = traerStatus(s)
            If estado = "Draft" Or estado = "Authority" Then
                cargarTRADetalles()
                traerTRA()
            ElseIf estado = "Safety" Then
                MessageBox("You cannot edit this TRA. Is under revision by Safety Department")
            ElseIf estado = "Oficial" Then
                MessageBox("You cannot edit this TRA. Is already Official")
            End If
        End If
    End Sub

    Protected Sub BindRepeater() '& dbDepartamento.SelectedItem.Text &
        Dim sql As String
        sql = "Select proc_Id,proc_Codigo, proc_Descripcion from traProcedimientos where proc_Departamento='" & dbProcDepartamento.SelectedItem.Value & "' and proc_TipoDoc='" & dbDocTipo.SelectedItem.Value & "' and proc_Descripcion like '%" & tSearchDoc.Text & "%' and proc_Lenguage='en'"
        Dim dt As New DataTable()
        Dim dts As New DataSet
        dts = clsDB.QueryDataSet(sql)

        dt = dts.Tables(0)

        'Dim adp As New SqlDataAdapter(cmd)
        'adp.Fill(dt)
        Dim pgitems As New PagedDataSource()
        Dim dv As New DataView(dt)
        pgitems.DataSource = dv
        pgitems.AllowPaging = True
        pgitems.PageSize = 17
        pgitems.CurrentPageIndex = PageNumber
        If pgitems.PageCount > 1 Then
            rptPaging.Visible = True
            Dim pages As New ArrayList()
            For i As Integer = 0 To pgitems.PageCount - 1
                pages.Add((i + 1).ToString())
            Next
            rptPaging.DataSource = pages
            rptPaging.DataBind()
        Else
            rptPaging.Visible = False
        End If
        rptProcedimientos.DataSource = pgitems
        rptProcedimientos.DataBind()
    End Sub
    Public Property PageNumber() As Integer
        Get
            If ViewState("PageNumber") IsNot Nothing Then
                Return Convert.ToInt32(ViewState("PageNumber"))
            Else
                Return 0
            End If
        End Get
        Set(ByVal value As Integer)
            ViewState("PageNumber") = value
        End Set
    End Property
    Protected Sub rptPaging_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptPaging.ItemCommand
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1
        BindRepeater()
    End Sub

    Protected Sub GuardarTRAMain()
        '********GUARDAR CAMBIOS DEL TRA *****************
        Dim strSQL As String

        txtFecha.Text = Format(Now.Date.ToString("dd/MM/yyyy")) ' ,tra_Location='" & txtLocacion.Text & "'
        strSQL = "UPDATE traRecords SET tra_Unit='" & dbUnit.SelectedItem.Text & "',tra_Dept='" & dbDepartamento.SelectedItem.Text & "'" & _
        ",tra_Activity_Job='" & txtActividad.Text.Replace("'", "''") & "',tra_Date='" & txtFecha.Text & "',tra_Hazard_Subs_NA=" & RadioButtonList1.Items(0).Selected & "," & _
        "tra_Hazard_Subs_Eval=" & RadioButtonList1.Items(1).Selected & ",tra_Hazard_Noise_NA=" & RadioButtonList2.Items(0).Selected & ",tra_Hazard_Noise_Eval=" & RadioButtonList2.Items(1).Selected & "" & _
        ",tra_Hazard_Hand_NA=" & RadioButtonList3.Items(0).Selected & ",tra_Hazard_Hand_Eval=" & RadioButtonList3.Items(1).Selected & "" & _
        ",tra_Hazard_Access_NA=" & RadioButtonList4.Items(0).Selected & ",tra_Hazard_Access_Eval=" & RadioButtonList4.Items(1).Selected & "" & _
        ",tra_Hazard_Equip_NA=" & RadioButtonList5.Items(0).Selected & ",tra_Hazard_Equip_Eval=" & RadioButtonList5.Items(1).Selected & "" & _
        ",tra_Hazard_Overhead_NA=" & RadioButtonList6.Items(0).Selected & ",tra_Hazard_Overhead_Eval=" & RadioButtonList6.Items(1).Selected & "" & _
        ",tra_Hazard_Factors_NA=" & RadioButtonList7.Items(0).Selected & ",tra_Hazard_Factors_Eval=" & RadioButtonList7.Items(1).Selected & "" & _
        ",tra_Hazard_Comms_NA=" & RadioButtonList8.Items(0).Selected & ",tra_Hazard_Comms_Eval=" & RadioButtonList8.Items(1).Selected & "" & _
        ",tra_Hazard_Environ_NA=" & RadioButtonList9.Items(0).Selected & ",tra_Hazard_Environ_Eval=" & RadioButtonList9.Items(1).Selected & "" & _
        ",tra_Hazard_Process_NA=" & RadioButtonList10.Items(0).Selected & ",tra_Hazard_Process_Eval=" & RadioButtonList10.Items(1).Selected & "" & _
        ",tra_Hazard_Vibration_NA=" & RadioButtonList11.Items(0).Selected & ",tra_Hazard_Vibration_Eval=" & RadioButtonList11.Items(1).Selected & "" & _
        ",tra_FinalAssessment='" & txtAssessment.Text & "',tra_OveralRisk='" & dbOverall.SelectedItem.Value & "',tra_ApplicableProcedure='" & txtProcedure.Text.Replace("'", "''") & "'" & _
        ",tra_Status='Authority' WHERE TRA_ID = " & ltraId.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            MessageBox("Your changes are been save successfully")
        Else
            MessageBox("Error Closing SOC. Qry=" & strSQL)
        End If
    End Sub
    Function traerStatus(traID As Integer) As String
        Dim dts As DataSet
        Dim sql As String
        sql = "select tra_Status frmo traRecords where tra_ID=" & traID & ""
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                traerStatus = row("tra_Status")
                Return traerStatus
            Next
        Else
            Return ""
        End If
    End Function
    Protected Sub traerTRA()
        Dim dts As New DataSet
        Dim sql As String
        sql = "Select * from traRecords where tra_ID=" & ltraId.Text
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()

        For Each row As DataRow In dts.Tables(0).Rows
            dbUnit.SelectedItem.Text = row("tra_Unit")
            If Not IsDBNull(row("tra_Activity_Job")) Then
                txtActividad.Text = row("tra_Activity_Job")
            End If
            dbDepartamento.SelectedItem.Text = row("tra_Dept")
            If Not IsDBNull(row("tra_Activity_Job")) Then
                txtFecha.Text = row("tra_Date")
            End If
            If Not IsDBNull(row("tra_Hazard_Subs_NA")) Then
                RadioButtonList1.Items(0).Selected = row("tra_Hazard_Subs_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Subs_Eval")) Then
                RadioButtonList1.Items(1).Selected = row("tra_Hazard_Subs_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Noise_NA")) Then
                RadioButtonList2.Items(0).Selected = row("tra_Hazard_Noise_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Noise_Eval")) Then
                RadioButtonList2.Items(1).Selected = row("tra_Hazard_Noise_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Hand_NA")) Then
                RadioButtonList3.Items(0).Selected = row("tra_Hazard_Hand_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Hand_Eval")) Then
                RadioButtonList3.Items(1).Selected = row("tra_Hazard_Hand_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Access_NA")) Then
                RadioButtonList4.Items(0).Selected = row("tra_Hazard_Access_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Access_Eval")) Then
                RadioButtonList4.Items(1).Selected = row("tra_Hazard_Access_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Overhead_NA")) Then
                RadioButtonList5.Items(0).Selected = row("tra_Hazard_Overhead_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Overhead_Eval")) Then
                RadioButtonList5.Items(1).Selected = row("tra_Hazard_Overhead_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Factors_NA")) Then
                RadioButtonList6.Items(0).Selected = row("tra_Hazard_Factors_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Factors_Eval")) Then
                RadioButtonList6.Items(1).Selected = row("tra_Hazard_Factors_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Comms_NA")) Then
                RadioButtonList7.Items(0).Selected = row("tra_Hazard_Comms_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Comms_Eval")) Then
                RadioButtonList7.Items(1).Selected = row("tra_Hazard_Comms_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Environ_NA")) Then
                RadioButtonList8.Items(0).Selected = row("tra_Hazard_Environ_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Environ_Eval")) Then
                RadioButtonList8.Items(1).Selected = row("tra_Hazard_Environ_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Process_NA")) Then
                RadioButtonList9.Items(0).Selected = row("tra_Hazard_Process_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Process_Eval")) Then
                RadioButtonList9.Items(1).Selected = row("tra_Hazard_Process_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Vibration_NA")) Then
                RadioButtonList10.Items(0).Selected = row("tra_Hazard_Vibration_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Process_Eval")) Then
                RadioButtonList10.Items(1).Selected = row("tra_Hazard_Process_Eval")
            End If
            If Not IsDBNull(row("tra_Hazard_Vibration_NA")) Then
                RadioButtonList11.Items(0).Selected = row("tra_Hazard_Vibration_NA")
            End If
            If Not IsDBNull(row("tra_Hazard_Vibration_Eval")) Then
                RadioButtonList11.Items(1).Selected = row("tra_Hazard_Vibration_Eval")
            End If
            If Not IsDBNull(row("tra_FinalAssessment")) Then
                txtAssessment.SelectedItem.Value = row("tra_FinalAssessment")
            End If
            If Not IsDBNull(row("tra_OveralRisk")) Then
                dbOverall.SelectedItem.Value = row("tra_OveralRisk")
            End If
            If Not IsDBNull(row("tra_ApplicableProcedure")) Then
                txtProcedure.Text = row("tra_ApplicableProcedure")
            End If
        Next
    End Sub
    Protected Sub cargarTRADetalles()
        Dim dtsItems As New DataSet
        Dim Sql As String
        Dim dts As DataSet
        Sql = "SELECT * FROM traTasks WHERE tra_ID=" & ltraId.Text & " order by traR_Consecutivo asc"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        'RptTitle.Text = dts.Tables(0).Rows.Count 'Despliega la cantidad de renglones
        Dim Lista As New Data.DataTable("Items")
        Dim col01 As New Data.DataColumn("No")
        Dim col1 As New Data.DataColumn("traR_TaskSteps")
        Dim col2 As New Data.DataColumn("traR_Hazard")
        Dim col3 As New Data.DataColumn("traR_Risk")
        Dim col4 As New Data.DataColumn("traR_Ini_Severity")
        Dim col5 As New Data.DataColumn("traR_Ini_Likeli")
        Dim col6 As New Data.DataColumn("traR_Ini_Risk")
        Dim col7 As New Data.DataColumn("traR_MinimizeRiskBy")
        Dim col8 As New Data.DataColumn("traR_Res_Severity")
        Dim col9 As New Data.DataColumn("traR_Res_Likeli")
        Dim col10 As New Data.DataColumn("traR_Res_Risk")
        Dim col11 As New Data.DataColumn("tra_ID")
        Lista.Columns.Add(col01)
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

        Dim rptRow As DataRow
        Dim i As Integer = 1
        Dim cero As String = 0
        Dim count As Integer = 1
        For Each row As DataRow In dts.Tables(0).Rows
            rptRow = Lista.NewRow
            rptRow("No") = row("traR_Consecutivo")
            rptRow("traR_TaskSteps") = row("traR_TaskSteps")
            rptRow("traR_Hazard") = row("traR_Hazard")
            rptRow("traR_Risk") = row("traR_Risk")
            rptRow("traR_Ini_Severity") = row("traR_Ini_Severity")
            rptRow("traR_Ini_Likeli") = row("traR_Ini_Likeli")
            rptRow("traR_Ini_Risk") = row("traR_Ini_Risk")
            rptRow("traR_MinimizeRiskBy") = row("traR_MinimizeRiskBy")
            rptRow("traR_Res_Severity") = row("traR_Res_Severity")
            rptRow("traR_Res_Likeli") = row("traR_Res_Likeli")
            rptRow("traR_Res_Risk") = row("traR_Res_Risk")
            rptRow("tra_ID") = row("traR_Id")
            i = i + 1
            Lista.Rows.Add(rptRow)
        Next
        dtsItems.Tables.Add(Lista)
        rptTRADetail.DataSource = dtsItems
        rptTRADetail.DataBind()
    End Sub
    Protected Sub rptTRADetail_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptTRADetail.ItemCommand
        'divBusqueda0.Visible = True
        Dim a As String
        a = e.CommandName
        If a = "bModify" Then
            cargarTareaEnDiv(e.CommandArgument.ToString)
            bSaveTask.Visible = True
        ElseIf a = "bDelete" Then
            divProcedimientos.Visible = True
            divConfirmación.Visible = True
            TraR_ID.Text = e.CommandArgument.ToString
        ElseIf a = "bUp" Then
            moverArriba(e.CommandArgument)
        ElseIf a = "bDown" Then
            moverAbajo(e.CommandArgument)
        End If
    End Sub
    Protected Sub cargarTareaEnDiv(task_Id As Integer)
        Dim dts As New DataSet
        Dim sql As String
        sql = "select * from traTasks where traR_ID=" & task_Id & ""
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                lConsecutivoTras.Text = row("traR_Consecutivo")
                tTarea.Text = row("traR_TaskSteps")
                tPeligro.Text = row("traR_Hazard")
                tRiesgos.Text = row("traR_Risk")
                dbInSev.SelectedValue = row("traR_Ini_Severity")
                dbInLike.SelectedValue = row("traR_Ini_Likeli")
                dbInRisk.SelectedValue = row("traR_Ini_Risk")
                tMinimise.Text = row("traR_MinimizeRiskBy")
                dbResSev.SelectedValue = row("traR_Res_Severity")
                dbResLike.SelectedValue = row("traR_Res_Likeli")
                dbResRisk.SelectedValue = row("traR_Res_Risk")
                TraR_ID.Text = row("traR_Id")
            Next
        End If
    End Sub
    Protected Sub btnPhoneSrc_Click(sender As Object, e As EventArgs) Handles btnPhoneSrc.Click
        GuardarTRAMain()
    End Sub
    Protected Sub bDeleteTareaConfirm_Click(sender As Object, e As EventArgs) Handles bDeleteTareaConfirm.Click
        Dim strSQL As String
        strSQL = "DELETE from traTasks WHERE traR_ID = " & TraR_ID.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            cargarTRADetalles()
            divConfirmación.Visible = False
            divProcedimientos.Visible = False
        Else
            MessageBox("Error deleting Task: </br>" & strSQL)
        End If
        TraR_ID.Text = ""
    End Sub
    Protected Sub bCancelarTask_Click(sender As Object, e As EventArgs) Handles bCancelarTask.Click
        limpiarDivTasks()

    End Sub
    Public Sub MessageBox(ByVal Message As String)

        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=""JavaScript"">" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("alert(""" & Message & """)" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("</script>")

    End Sub
    Protected Sub bSaveTask_Click(sender As Object, e As EventArgs) Handles bSaveTask.Click
        traSteps_Clear_BackColor()
        If Len(tTarea.Text) > 0 Then
            If Len(tPeligro.Text) > 0 Then
                If Len(tRiesgos.Text) > 0 Then
                    If dbInSev.SelectedItem.Text <> "Select" Then
                        If dbInLike.SelectedItem.Text <> "Select" Then
                            If dbInRisk.SelectedItem.Text <> "Select" Then
                                If Len(tMinimise.Text) > 0 Then
                                    If dbResSev.SelectedItem.Text <> "Select" Then
                                        If dbResLike.SelectedItem.Text <> "Select" Then
                                            If dbResRisk.SelectedItem.Text <> "Select" Then
                                                If Len(TraR_ID.Text) > 0 Then
                                                    modificarTareas()
                                                    tbl_TRAMain2.Visible = True
                                                    tbl_TRAMain3.Visible = True
                                                Else
                                                    agregarTareas()
                                                    tbl_TRAMain2.Visible = True
                                                    tbl_TRAMain3.Visible = True
                                                End If
                                            Else
                                                Response.Write("You cannot leave Fields in blank")
                                                dbResRisk.BackColor = Drawing.Color.Yellow
                                            End If
                                        Else
                                            Response.Write("You cannot leave Fields in blank")
                                            dbResLike.BackColor = Drawing.Color.Yellow
                                        End If
                                    Else
                                        Response.Write("You cannot leave Fields in blank")
                                        dbResSev.BackColor = Drawing.Color.Yellow
                                    End If
                                Else
                                    Response.Write("You cannot leave Fields in blank")
                                    tMinimise.BackColor = Drawing.Color.Yellow
                                End If
                            Else
                                Response.Write("You cannot leave Fields in blank")
                                dbInRisk.BackColor = Drawing.Color.Yellow
                            End If
                        Else
                            Response.Write("You cannot leave Fields in blank")
                            dbInLike.BackColor = Drawing.Color.Yellow
                        End If
                    Else
                        Response.Write("You cannot leave Fields in blank")
                        dbInSev.BackColor = Drawing.Color.Yellow
                    End If
                Else
                    Response.Write("You cannot leave Risks in blank")
                    tRiesgos.BackColor = Drawing.Color.Yellow
                End If
            Else
                Response.Write("You cannot leave Hazard in blank")
                tPeligro.BackColor = Drawing.Color.Yellow
            End If
        Else
            Response.Write("You cannot leave Tasks in blank")
            tTarea.BackColor = Drawing.Color.Yellow
        End If
    End Sub
    Protected Sub agregarTareas()
        '******AGREGA LAS TAREAS AL TRA ******
        Dim i As Integer
        i = rptTRADetail.Items.Count + 1
        Dim strSQL As String
        strSQL = "INSERT INTO traTasks (traR_Consecutivo,tra_ID,traR_TaskSteps,traR_Hazard,traR_Risk,traR_Ini_Severity,traR_Ini_Likeli," & _
            "traR_Ini_Risk,traR_MinimizeRiskBy,traR_Res_Severity,traR_Res_Likeli,traR_Res_Risk)VALUES(" & i & "," & ltraId.Text & "," & _
            "'" & tTarea.Text.Replace("'", "''") & "','" & tPeligro.Text.Replace("'", "''") & "','" & tRiesgos.Text.Replace("'", "''") & "','" & dbInSev.SelectedItem.Value & "'," & _
            "'" & dbInLike.SelectedItem.Value & "','" & dbInRisk.SelectedItem.Value & "','" & tMinimise.Text.Replace("'", "''") & "'," & _
            "'" & dbResSev.SelectedItem.Value & "','" & dbResLike.SelectedItem.Value & "','" & dbResRisk.SelectedItem.Value & "')" ' 
        Try
            If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                clsDB.Close()
                MessageBox("A New Tasks had been add it to the TRA Format")
                cargarTRADetalles()
                limpiarDivTasks()
                'divBusqueda0.Visible = False
            Else
                clsDB.Close()
                MessageBox("Error Saving Data. The Qry: " & strSQL)
            End If
        Catch ex As Exception
            Response.Write("<br/> " & ex.Message)
        End Try
    End Sub
    Protected Sub modificarTareas()
        '******MODIFICAR/GUARDAR LAS TAREAS AL TRA ******
        Dim strSQL As String

        strSQL = "UPDATE traTasks SET traR_Consecutivo = " & lConsecutivoTras.Text & ", traR_TaskSteps='" & tTarea.Text.Replace("'", "''") & "',traR_Hazard='" & tPeligro.Text.Replace("'", "''") & "',traR_Risk='" & tRiesgos.Text.Replace("'", "''") & "'" & _
        ",traR_Ini_Severity='" & dbInSev.SelectedItem.Value & "',traR_Ini_Likeli='" & dbInLike.SelectedItem.Value & "',traR_Ini_Risk='" & dbInRisk.SelectedItem.Value & "'," & _
        "traR_MinimizeRiskBy='" & tMinimise.Text.Replace("'", "''") & "',traR_Res_Severity='" & dbResSev.SelectedItem.Value & "',traR_Res_Likeli='" & dbResLike.SelectedItem.Value & "'," & _
        "traR_Res_Risk='" & dbResRisk.SelectedItem.Value & "' WHERE traR_Id = " & TraR_ID.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            MessageBox("Your changes are been save successfully")
            cargarTRADetalles()
            limpiarDivTasks()
        Else
            MessageBox("Error Closing TRA DataBase. Qry=" & strSQL)
        End If
    End Sub
    Protected Sub moverArriba(ByRef TareaId As Integer)
        '******MODIFICAR/GUARDAR LAS TAREAS AL TRA ******
        Dim strSQL As String
        Dim i As Integer
        i = traerConsecutivo(TareaId)
        'MessageBox(i)
        If i = 1 Then
            MessageBox("Es el primer renglon. NO SUBE")
        Else
            i = i - 1
            Try 'Este es el renglon que deseo mover hacia abajo
                strSQL = "UPDATE traTasks SET traR_Consecutivo = " & lConsecutivoTras.Text & " WHERE traR_Consecutivo = " & i & " and tra_ID = " & ltraId.Text & ""
                If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                    clsDB.Close()
                Else
                    clsDB.Close()
                    MessageBox("Error moving row Down. Qry= " & strSQL)
                End If
            Catch ex As Exception
                MessageBox("Error moving row Down: " & ex.Message)
            End Try
            Try 'Este es el renglon que deseo mover hacia arriba
                strSQL = "UPDATE traTasks SET traR_Consecutivo = " & i & " WHERE traR_Id = " & TareaId & ""
                If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                    clsDB.Close()
                    cargarTRADetalles()
                Else
                    clsDB.Close()
                    MessageBox("Error moving row Up. Qry= " & strSQL)
                End If
            Catch ex As Exception
                MessageBox("Error moving row Up: " & ex.Message)
            End Try
        End If
        lConsecutivoTras.Text = ""
    End Sub
    Protected Sub moverAbajo(ByRef TareaId As Integer)
        '******MUEVE LAS TAREAS UN RENGLON ABAJO ******
        Dim strSQL As String
        Dim i As Integer
        i = traerConsecutivo(TareaId)
        'MessageBox(i)
        If i = rptTRADetail.Items.Count Then
            MessageBox("Es el ultimo renglon. NO BAJA, NO MAMES")
        Else
            i = i + 1
            Try 'Este es el renglon que deseo mover hacia abajo
                strSQL = "UPDATE traTasks SET traR_Consecutivo = " & lConsecutivoTras.Text & " WHERE traR_Consecutivo = " & i & " and tra_ID = " & ltraId.Text & ""
                If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                    clsDB.Close()
                Else
                    clsDB.Close()
                    MessageBox("Error moving row Down. Qry= " & strSQL)
                End If
            Catch ex As Exception
                MessageBox("Error moving row Down: " & ex.Message)
            End Try
            Try 'Este es el renglon que deseo mover hacia arriba
                strSQL = "UPDATE traTasks SET traR_Consecutivo = " & i & " WHERE traR_Id = " & TareaId & ""
                If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                    clsDB.Close()
                    cargarTRADetalles()
                Else
                    clsDB.Close()
                    MessageBox("Error moving row Up. Qry= " & strSQL)
                End If
            Catch ex As Exception
                MessageBox("Error moving row Up: " & ex.Message)
            End Try
        End If
        lConsecutivoTras.Text = ""
    End Sub
    Function traerConsecutivo(ByRef TareaId As Integer) As Integer
        Dim strSql As String
        Dim dts As DataSet
        strSql = "select traR_Consecutivo from traTasks where traR_Id=" & TareaId
        dts = clsDB.QueryDataSet(strSql)
        For Each row As DataRow In dts.Tables(0).Rows
            lConsecutivoTras.Text = row("traR_Consecutivo")
            traerConsecutivo = row("traR_Consecutivo")
        Next
        Return traerConsecutivo
    End Function

    Protected Sub limpiarDivTasks()
        tTarea.Text = ""
        tTarea.Text = ""
        tPeligro.Text = ""
        tRiesgos.Text = ""
        'dbInSev.SelectedItem.Selected = "Select"
        'dbInLike.SelectedItem.Selected = "Select"
        'dbInRisk.SelectedItem.Selected = "Select"
        tMinimise.Text = ""
        'dbResSev.SelectedItem.Selected = "Select"
        'dbResLike.SelectedItem.Selected = "Select"
        'dbResRisk.SelectedItem.Selected = "Select"
        TraR_ID.Text = ""
    End Sub
    Protected Sub traSteps_Clear_BackColor()
        tTarea.BackColor = Drawing.Color.White
        tPeligro.BackColor = Drawing.Color.White
        tRiesgos.BackColor = Drawing.Color.White
        dbInSev.BackColor = Drawing.Color.White
        dbInLike.BackColor = Drawing.Color.White
        dbInRisk.BackColor = Drawing.Color.White
        dbResSev.BackColor = Drawing.Color.White
        dbResLike.BackColor = Drawing.Color.White
        dbResRisk.BackColor = Drawing.Color.White
        tMinimise.BackColor = Drawing.Color.White
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Dim queryString As String = "../Reports/TRA_Format_Viewer.aspx?Param=" + ltraId.Text + ""
        Dim newWin As String = "setTimeout(""window.open('" & queryString & "','','toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=800px,height=800px').focus();"",1);"
        ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
    End Sub

    Protected Sub btnPhoneSrc0_Click(sender As Object, e As EventArgs) Handles btnPhoneSrc0.Click
        'Dar Status Safety 
        Dim strSQL As String
        Dim hoy As Date = Format(Now.Date.ToString("dd/MM/yyyy"))
        strSQL = "UPDATE traRecords SET tra_Status='Safety' and tra_AuthorityApproveDate='" & hoy & "'" & _
        " WHERE TRA_ID = " & ltraId.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Redirect("TRA_Enviar_A_Seguridad.aspx?TraId=" + ltraId.Text + "&Departamento=" + dbDepartamento.SelectedItem.Text + "")
        Else
            MessageBox("Error Closing SOC. Qry=" & strSQL)
        End If

        'Dim queryString As String = "TRA_Enviar_Revision.aspx?TraId=" + ltraId.Text + "&Departamento=" + dbDepartamento.SelectedItem.Text + ""
        'Dim newWin As String = "setTimeout(""window.open('" & queryString & "','','toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=800px,height=800px').focus();"",1);"
        'ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
    End Sub



    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dbDocTipo.SelectedIndexChanged
        If dbProcDepartamento.SelectedItem.Text <> "Select One" Then
            BindRepeater()
        Else
            MessageBox("Select one Department")
        End If

    End Sub

    Protected Sub rptProcedimientos_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rptProcedimientos.ItemCommand
        Dim valor As String = e.CommandArgument
        If Len(txtProcedure.Text) > 0 Then
            txtProcedure.Text = txtProcedure.Text & ", " & valor
        Else
            txtProcedure.Text = valor
        End If

    End Sub

    Protected Sub bProcedureDone_Click(sender As Object, e As EventArgs) Handles bProcedureDone.Click
        divProcedimientos.Visible = False
        divtablaProc.Visible = False
    End Sub

    Protected Sub dbProcDepartamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dbProcDepartamento.SelectedIndexChanged
        dbDocTipo.SelectedValue = "Select One"
    End Sub


    Protected Sub btnEliminarNo_Click(sender As Object, e As EventArgs) Handles btnEliminarNo.Click
        divConfirmación.Visible = False
        divProcedimientos.Visible = False
    End Sub

    Protected Sub ImageButton10_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton10.Click
        divProcedimientos.Visible = True
        divtablaProc.Visible = True
    End Sub

    Protected Sub btnSearchDoc_Click(sender As Object, e As EventArgs) Handles btnSearchDoc.Click
        BindRepeater()
    End Sub
End Class
