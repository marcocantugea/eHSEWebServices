Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Imports System.Web.UI.WebControls
Partial Class TRA_main
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Public moment As New System.DateTime()
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            'lblUser.Text = "Welcome " + Context.User.Identity.Name & "."
            Dim tipo As String = tipoUsuario(Context.User.Identity.Name)
            divConfirmación.Visible = False
            divMensaje.Visible = False
            lblUser.Text = lblUser.Text & " " & tipo

            If tipo = "Supervisor" Then
                Dim selDate As Date
                selDate = Format(Now.Date.ToString("MM/dd/yyyy"))

                'Set View State Value for Initial Sort Order
                'ViewState("Column") = "tra_Activity_Job"
                'ViewState("Sortorder") = "ASC"


                fillTRAsByDeptDrafts()
                lblStatus.Text = "DRAFTS"
                lDepartamento.Text = UsuarioDepartamento()
                'divBusqueda.Visible = False
            Else
                Response.Redirect("TRA_Not_Authorized.aspx")
            End If
        End If
    End Sub
    Function tipoUsuario(ByRef usuario As String) As String
        Dim dts As New DataSet
        Dim sql As String
        sql = "SELECT MembersOf,JobDescription From tblUsuarios Where UsuUser='" & usuario & "'"
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                tipoUsuario = row("MembersOf")
                lblUser.Text = "Welcome " + row("JobDescription") & "."
                Exit For
            Next
        End If
        Return tipoUsuario
    End Function
    Protected Sub fillTRAsByDept()
        Dim dtsItems As New DataSet
        Dim dts, dts2 As DataSet
        Dim Sql As String
        Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords where tra_Status='Oficial' and tra_Dept='" & UsuarioDepartamento() & "'  ORDER BY tra_Activity_Job ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        lblStatus.Text = "OFFICIAL"
        rptRevision.DataSource = dts
        rptRevision.DataBind()

        'dtsItems.Tables.Add(Lista)
    End Sub
    Protected Sub rptFiles_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptFiles.ItemCommand
        Dim name As String
        name = e.CommandName
        Select Case name
            Case "brptPrint" 'Si eligen botón Imprimir 
                Dim queryString As String = "../Reports/TRA_Format_Viewer.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "setTimeout(""window.open('" & queryString & "','','toolbar=no,resizable=yes,scrollbars=yes,location=no,statusbar=no,menubar=no,width=800px,height=800px').focus();"",1);"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptClone" 'Si eligen botón Clonar
                Dim queryString As String = "TRA_Input_Data.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "window.open('" & queryString & "');"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptDelete" 'Si eligen el botón Eliminar
                divConfirmación.Visible = True
                divMensaje.Visible = True
                lblTRA_Id.Text = e.CommandArgument.ToString
        End Select
    End Sub
    Protected Sub rptRevision_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rptRevision.ItemCommand
        Dim name As String
        name = e.CommandName
        Select Case name
            Case "brptPrint" 'Si eligen botón Imprimir 
                Dim queryString As String = "../Reports/TRA_Format_Viewer.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "setTimeout(""window.open('" & queryString & "','','toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=800px,height=800px').focus();"",1);"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptClone" 'Si eligen botón Clonar
                Dim queryString As String = "TRA_Input_Data.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "window.open('" & queryString & "');"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptEdit" 'Si eligen el botón Revisar

                Dim queryString As String = "TRA_Revision_1.aspx?Param=" + e.CommandArgument.ToString + ""
                Dim newWin As String = "window.open('" & queryString & "');"
                ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
            Case "brptDelete" 'Si eligen el botón Eliminar
                divConfirmación.Visible = True
                divMensaje.Visible = True
                lblTRA_Id.Text = e.CommandArgument.ToString
        End Select
    End Sub
    Function UsuarioDepartamento() As String
        Dim dts As New DataSet
        Dim sql As String
        sql = "select usuDep from tblUsuarios where UsuUser='" & Context.User.Identity.Name & "'"
        dts = clsDB.QueryDataSet(sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                UsuarioDepartamento = row("usuDep")
                Exit For
            Next
            Return UsuarioDepartamento
        End If

    End Function

    Public Sub MessageBox(ByVal Message As String)

        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=""JavaScript"">" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("alert(""" & Message & """)" & vbCrLf)

        System.Web.HttpContext.Current.Response.Write("</script>")

    End Sub
    Protected Sub fillTRAsByDeptDrafts()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords where tra_Status='Draft' and tra_Dept='" & UsuarioDepartamento() & "'  and tra_Activity_Job like '%" & tSrcDescription.Text & "%' ORDER BY tra_Activity_Job ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        lblStatus.Text = "DRAFTS"
        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()
    End Sub
    Protected Sub fillTRAsByDeptOnRevision()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Try
            Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job,tra_SentBack_Reason FROM traRecords where tra_Status='Authority' and tra_Dept='" & UsuarioDepartamento() & "' and tra_Activity_Job like '%" & tSrcDescription.Text & "%' ORDER BY tra_Activity_Job ASC"
            dts = clsDB.QueryDataSet(Sql)
            clsDB.Close()

            lblStatus.Text = "ON REVISION"
            'RptTitle.Text = dts.Tables(0).Rows.Count 'Despliega la cantidad de renglones
            Dim Lista As New Data.DataTable("Items")
            Dim col01 As New Data.DataColumn("tra_ID")
            Dim col1 As New Data.DataColumn("tra_Dept")
            Dim col2 As New Data.DataColumn("tra_Activity_Job")
            Dim col3 As New Data.DataColumn("tra_SentBack_Reason")
            Lista.Columns.Add(col01)
            Lista.Columns.Add(col1)
            Lista.Columns.Add(col2)
            Lista.Columns.Add(col3)

            Dim rptRow As DataRow
            Dim i As Integer = 1
            Dim cero As String = 0
            Dim count As Integer = 1
            Dim razon As String
            For Each row As DataRow In dts.Tables(0).Rows
                rptRow = Lista.NewRow
                rptRow("tra_ID") = row("tra_ID")
                rptRow("tra_Dept") = row("tra_Dept")
                rptRow("tra_Activity_Job") = row("tra_Activity_Job")
                If Not IsDBNull(row("tra_SentBack_Reason")) Then
                    rptRow("tra_SentBack_Reason") = "Reject"
                Else
                    rptRow("tra_SentBack_Reason") = "Normal"
                End If
                i = i + 1
                Lista.Rows.Add(rptRow)
            Next
            dtsItems.Tables.Add(Lista)

            rptRevision.DataSource = dtsItems
            rptRevision.DataBind()
        Catch ex As Exception
            MessageBox("Error trying to get documents for revision. Error Message: " & ex.Message)
        End Try
    End Sub
    Protected Sub fillTRAsByDeptOficials()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String
        Sql = "SELECT tra_ID,tra_Dept,tra_Activity_Job FROM traRecords where tra_Status='Oficial' and tra_Dept='" & UsuarioDepartamento() & "' and tra_Activity_Job like '%" & tSrcDescription.Text & "%' ORDER BY tra_Activity_Job ASC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        lblStatus.Text = "OFFICIAL"
        'dtsItems.Tables.Add(Lista)
        rptFiles.DataSource = dts
        rptFiles.DataBind()
    End Sub
    Protected Sub btnBorradores_Click(sender As Object, e As EventArgs) Handles btnBorradores.Click
        rptFiles.Visible = True
        rptRevision.Visible = False
        fillTRAsByDeptDrafts()
    End Sub
    Protected Sub btnOnRevision_Click(sender As Object, e As EventArgs) Handles btnOnRevision.Click
        rptFiles.Visible = False
        rptRevision.Visible = True
        fillTRAsByDeptOnRevision()
    End Sub
    Protected Sub btnOficiales_Click(sender As Object, e As EventArgs) Handles btnOficiales.Click
        rptFiles.Visible = True
        rptRevision.Visible = False
        fillTRAsByDeptOficials()
    End Sub
    Protected Sub btnCrearTRA_Click(sender As Object, e As EventArgs) Handles btnCrearTRA.Click
        Dim queryString As String = "TRA_Input_Data.aspx"
        Dim newWin As String = "window.open('" & queryString & "');"
        ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
    End Sub

    Protected Sub bDeleteTareaConfirm_Click(sender As Object, e As EventArgs) Handles bDeleteTareaConfirm.Click
        divConfirmación.Visible = True
        divMensaje.Visible = True
        Dim strSQL As String
        If getTRAStatus() = "Official" Then
            strSQL = "Update traRecords SET tra_Status='Pending_Delete' Where tra_ID=" & lblTRA_Id.Text
            If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                clsDB.Close()
                fillTRAsByDeptOficials()
                MessageBox("The TRA is been send to Safety Department for approvation to Delete")
            Else
                clsDB.Close()
                MessageBox("Error Deleting SOC. Qry=" & strSQL)
            End If
        Else
            strSQL = "DELETE from traTasks WHERE tra_ID = " & lblTRA_Id.Text & ""
            If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                clsDB.Close()
                strSQL = "DELETE from traRecords WHERE tra_ID = " & lblTRA_Id.Text & ""
                If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                    clsDB.Close()
                    fillTRAsByDeptDrafts()
                Else
                    clsDB.Close()
                End If
            Else
                clsDB.Close()
                MessageBox("Error deleting TRA.: </br>" & strSQL)
            End If

        End If
        
        divConfirmación.Visible = False
        divMensaje.Visible = False
    End Sub
    Function getTRAStatus() As String
        Dim dts As DataSet
        Dim sql As String
        sql = "Select tra_Status from traRecords Where Tra_Id=" & lblTRA_Id.Text
        dts = clsDB.QueryDataSet(sql)
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                getTRAStatus = row("tra_Status")
            Next
            Return getTRAStatus
        Else
            Return ""
        End If
    End Function

    Protected Sub btnEliminarNo_Click(sender As Object, e As EventArgs) Handles btnEliminarNo.Click
        divConfirmación.Visible = False
        divMensaje.Visible = False
    End Sub

    Protected Sub rptRevision_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rptRevision.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            Dim tr As HtmlTableRow = DirectCast(e.Item.FindControl("trID"), HtmlTableRow)
            Dim drv As DataRowView = TryCast(e.Item.DataItem, DataRowView)
            Dim gen As String = Convert.ToString(drv("tra_SentBack_Reason"))

            If gen = "Reject" Then
                tr.Attributes.Add("style", "background-color:#cc0000;color:#FFFFFF;")
                'Else
                '    tr.Attributes.Add("style", "background-color:#000000;color:#FFFFFF;")
            End If
        End If
    End Sub
End Class
