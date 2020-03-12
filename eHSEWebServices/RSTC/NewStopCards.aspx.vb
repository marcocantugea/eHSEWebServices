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

Partial Class NewStopCards
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
            fillStopCards()
            loadDepartamentos()
            divBusqueda.Visible = False
            divBusqueda0.Visible = False
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
        btnUpdate0.Enabled = False
        dlAC.SelectedValue = ""
        dlUP.SelectedValue = ""
        dlStatus.SelectedValue = "Open"
    End Sub
    Protected Sub fillStopCards()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Try
            Dim Sql As String = "SELECT * FROM tblStopCard WHERE Estatus like '%" & dStatus.SelectedValue & "%' AND Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "# ORDER BY Fecha ASC"
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
            clsDB.Close()
            Response.Write("Error loading card. Details; " & ex.Message)
        End Try
    End Sub
    Protected Sub loadDepartamentos()
        Dim Dept As DataSet
        Try
            Dept = clsDB.QueryDataSet("Select * from ctgDepartamentos")
            clsDB.Close()
            dlDpt.DataSource = Dept.Tables(0)
            dlDpt.DataTextField = "Desc"
            dlDpt.DataValueField = "Desc"
            dlDpt.DataBind()
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error loading Departments. Details; " & ex.Message)
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
                sql = "SELECT * FROM tblStopCard WHERE ID=" & lblId.Text
                Try
                    dts = clsDB.QueryDataSet(sql)
                    clsDB.Close()
                    If dts.Tables(0).Rows.Count > 0 Then
                        btnCancel0.Enabled = True
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("A_C")) Then
                                dlAC.Text = row("A_C")
                            Else
                                dlAC.Text = ""
                                btnUpdate0.Enabled = False
                            End If
                            If Not IsDBNull(row("U_P")) Then
                                dlUP.Text = row("U_P")
                            Else
                                dlUP.Text = ""
                                btnUpdate0.Enabled = False
                            End If
                            If Not IsDBNull(row("Dpto")) Then
                                dlDpt.SelectedValue = row("Dpto")
                            Else
                                dlDpt.SelectedValue = "All"
                                btnUpdate0.Enabled = False
                            End If
                            cbMonth.Checked = row("NomineeMonth")
                            cbWeek.Checked = row("NomineeWeek")
                            c = row("Estatus")
                            If c = "Closed" Then
                                dlStatus.SelectedValue = "Closed"
                                dlStatus.Enabled = False
                                dlUP.Enabled = False
                                dlAC.Enabled = False
                                dlDpt.Enabled = False
                                btnUpdate0.Enabled = False
                            ElseIf c = "Open" Then
                                dlStatus.SelectedValue = "Open"
                                dlStatus.Enabled = True
                                dlUP.Enabled = True
                                dlAC.Enabled = True
                                dlDpt.Enabled = True
                                'btnUpdate0.Enabled = True
                            End If
                        Next
                    End If
                Catch ex As Exception
                    clsDB.Close()
                    Response.Write("Error Getting Card Information. Details; " & ex.Message)
                End Try
                Exit For
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
                If dlAC.SelectedItem.Text = "" Then
                    Response.Write("Select A/C")
                Else
                    If dlUP.SelectedItem.Text = "" Then
                        Response.Write("Select U/P")
                    Else
                        If dlStatus.SelectedItem.Text = "" Then
                            Response.Write("Select Status")
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
                                        strSQL = "UPDATE tblStopCard SET A_C = '" & dlAC.SelectedItem.Text & "', U_P='" & dlUP.SelectedItem.Text & "'" & _
                                                                        ", Estatus='" & dlStatus.SelectedItem.Text.Trim & "', Dpto='" & dlDpt.SelectedValue & "'" & _
                                                                        ",Fecha='" & a & "',ubicacion='" & Ubicacion.Text.Trim & "', " & _
                                                                        "Observacion='" & Observacion.Text.Trim & "',NomineeMonth=" & cbMonth.Checked & ",NomineeWeek=" & cbWeek.Checked & ",Accion='" & Accion.Text.Trim & "' WHERE ID = " & lblId.Text & ""
                                        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                                            clsDB.Close()
                                            If dlStatus.SelectedValue = "Open" Then
                                                btnUpdate0.Enabled = True
                                            Else
                                                btnUpdate0.Enabled = False
                                            End If
                                            Response.Write("The Record has been updated Successfully")
                                            'clearBoxes()
                                        Else
                                            clsDB.Close()
                                            Response.Write("Error updating data")
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        Catch ex As Exception
            Response.Write("Error. The Date Format is incorrect")
        End Try
    End Sub
    Protected Sub cnRelevancia()
        Dim strSQL As String
        Dim a As Date
        
        strSQL = "UPDATE tblStopCard SET Estatus='Follow Up',SOC_Relevante=Yes WHERE ID=" & lblId.Text.Trim
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Record had been Set as ""Follow Up"" Status")
            'clearBoxes()
        Else
            clsDB.Close()
            Response.Write("Error Seting as Follow Up")
        End If
                                       
    End Sub
    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        divBusqueda.Visible = True
        Dim dts As DataSet
        Dim i As Integer = 0
        Dim contentId As String = "Image1"
        Dim contentId2 As String = "Image2"
        Dim path As String = Server.MapPath("~") & "\"
        Dim filename As String = path & "images\Logotipo Muralla.png"
        Dim filename2 As String = path & "images\LogoRSTC.PNG"
        Dim Email As New MailMessage
        Try
            dts = clsDB.QueryDataSet("Select Correo FROM tDistributionList WHERE Departamento='" & dlDpt.SelectedValue & "'")
            clsDB.Close()

            Email.From = New MailAddress("rstc@grm4.com", "SOC - La Muralla IV")
            Email.Priority = MailPriority.High
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error loading Distribution List. Details; " & ex.Message)
        End Try

        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                If i = 0 Then
                    Email.To.Add(New MailAddress(row("Correo")))
                    'Email.To.Add(New MailAddress("it.BIC@grupor.com.mx"))
                Else
                    'Email.To.Add(New MailAddress("it.BIC@grupor.com.mx"))
                    If row("correo") = "it@grm4.com" Then
                        Email.Bcc.Add(New MailAddress(row("Correo")))
                    Else
                        Email.CC.Add(New MailAddress(row("Correo")))
                    End If

                End If
                i = i + 1
                'Email.To.Add("it.BIC@grupor.com.mx")
            Next
        End If

        Email.Subject = "Relevant SOC No.: " & lblId.Text ' - " & Observacion.Text
        '    Email.Body = "<b>" & Nombre.Text & "</b>" & "</br> <b><p>Ubication: </b>" & Ubicacion.Text & "</br> <b>Observation: </b>" & Observacion.Text & _
        '"</p></br> <b> Action: </b>" & Accion.Text & "</p></br><b>Department: </b>" & Department.Text & " </p>"
        Dim av1 As AlternateView
        av1 = AlternateView.CreateAlternateViewFromString(cuerpoMensaje, Nothing, _
            MediaTypeNames.Text.Html)
        Dim linkedResource As LinkedResource = New LinkedResource(filename)
        Dim linkedResource2 As LinkedResource = New LinkedResource(filename2)
        linkedResource.ContentId = contentId
        linkedResource2.ContentId = contentId2
        linkedResource.ContentType.Name = filename
        linkedResource2.ContentType.Name = filename2

        av1.LinkedResources.Add(linkedResource)
        av1.LinkedResources.Add(linkedResource2)
        Email.AlternateViews.Add(av1)
        Email.IsBodyHtml = True

        'Email.Body = cuerpoMensaje()
        'linkImage1.ContentId = "LogotipoIPC"
        'linkImage2.ContentId = "LogoRSTC"
        'Email.IsBodyHtml = True

        Try

            Dim mailClient As New System.Net.Mail.SmtpClient()
            'This object stores the authentication values
            Dim basicAuthenticationInfo As _
            New System.Net.NetworkCredential("mainserver@grm4.com", "111222rrr")
            'Put your own, or your ISPs, mail server name onthis next line
            mailClient.Host = "192.168.45.4"
            mailClient.UseDefaultCredentials = True
            mailClient.Credentials = basicAuthenticationInfo

            mailClient.Send(Email)
            Label10.Text = "EMail Sent Successufully"
            cnRelevancia()
            gvDestinatarios.DataSource = dts
            gvDestinatarios.DataBind()
            btnUpdate0.Enabled = False
        Catch ex As Exception
            Label10.Text = "Error sending email: " & ex.Message
        End Try
    End Sub
    Function cuerpoMensaje() As String
        Dim cuerpo As String
        cuerpo = "<table style=""height: 246px; width: 721px"" > " & _
"<tr>" & _
 "<td><img src=""'cid:Image1'"" style=""height: 46px; width: 174px"" /></td>" & _
 "<td></td>" & _
 "<td align=""right""><img src=""'cid:Image2'"" style=""height: 39px; width: 156px"" /></td>" & _
"</tr><tr>" & _
        "<td bgcolor=""#009FC2"" class=""style15"" colspan=""2"" Style = ""border-style: none none groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal; color: #FFFFFF""align=""center"">" & dlDpt.SelectedValue & "</td>" & _
"</tr><tr>" & _
 "<td colspan=""3""><table border=""0"" cellpadding=""3"" cellspacing=""0"" style=""border: medium groove #333333; width: 100%; height: 157px;""><tr><td bgcolor=""#009FC2"" class=""style16"" colspan=""2"" style=""border-style: none none groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #FFFFFF""> SAFETY OBSERVATION CARD No.: " & lblId.Text & "</td>" & _
"</tr><tr>" & _
            "<td bgcolor=""#333333"" class=""style16"" colspan=""2"" " & _
        "style=""border-style: none none groove none; border-width: medium; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #FFFFFF"">" & _
                "Location: <span class=""style7"">" & Ubicacion.Text & "</span></td>" & _
        "</tr>" & _
        "<tr>" & _
            "<td class=""style17"" " & _
        "Style = ""font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #333333; border-bottom-style: groove; border-bottom-width: thin; border-bottom-color: #333333; border-right-style: groove; border-right-width: thin; border-right-color: #333333;""" & _
                "valign=""middle"">" & _
                "Date:</td>" & _
            "<td class=""style18"" " & _
        "Style = ""border-style: none none groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal; color: #333333""" & _
                "valign=""middle"">" & _
        "" & Fecha.Text & "</td>" & _
        "</tr>" & _
        "<tr>" & _
            "<td class=""style19"" " & _
        "Style = ""border-style: none groove groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #333333""" & _
                "valign=""top"">" & _
                "Observation:</td>" & _
            "<td class=""style20"" " & _
        "Style = ""border-style: none none groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal; color: #333333""" & _
                "valign=""top"">" & _
        "" & Observacion.Text & "</td>" & _
        "</tr>" & _
        "<tr>" & _
            "<td class=""style20"" " & _
        "Style = ""border-style: none groove groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #333333""" & _
                "valign=""top"">" & _
                "Action Required:</td>" & _
            "<td class=""style20"" " & _
        "Style = ""border-style: none none groove none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal; color: #333333""" & _
                "valign="" top"">" & _
        "" & Accion.Text & "</td>" & _
        "</tr>" & _
        "<tr>" & _
            "<td class=""style14"" " & _
        "Style = ""border-style: none groove none none; border-width: thin; border-color: #333333; font-family: Verdana; font-size: x-small; font-weight: bold; font-style: normal; color: #333333""" & _
                "valign=""top"">" & _
                "Contact Details:</td>" & _
            "<td class=""style21""" & _
        "Style = ""font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal; color: #333333""" & _
                "valign=""top"">" & _
                "<b>Safety Office<br/>" & _
                "</b>Ext.:5028<br/>" & _
                "</b>EMail: SafetyOff.Mur@grupor.com.mx<br/>" & _
                "Internal EMail: rstc@grm4.com</td>" & _
                "</tr>" & _
    "</table>" & _
    "</td>" & _
    "</tr>" & _
    "<tr>" & _
        "<td Style = ""font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal; color: #333333"">Powered By Juan Luis Rios ©</td>" & _
    "</tr>" & _
"</table>"
        Return cuerpo
    End Function
    Protected Sub msgeConfirmacion()

    End Sub
    Protected Sub btnExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport0.Click
        fillStopCards()
    End Sub
    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        divBusqueda.Visible = False
        clearBoxes()
    End Sub

    Protected Sub btnCancel0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel0.Click
        divBusqueda0.Visible = True
    End Sub

    Protected Sub btnDeleteCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteCancel.Click
        divBusqueda0.Visible = False
        btnCancel0.Enabled = False
    End Sub

    Protected Sub btnDeleteOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteOK.Click
        Dim strSQL As String
        btnCancel0.Enabled = False
        strSQL = "DELETE from tblStopCard WHERE ID = " & lblId.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Record has been deleted Successfully")
            clearBoxes()
            fillStopCards()
            divBusqueda0.Visible = False
        Else
            clsDB.Close()
            Response.Write("Error deleting record")
        End If
    End Sub
End Class
