Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Partial Class FollowUp
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM/dd/yyyy"))
            Fecha.Text = selDate
            Fecha.Focus()
            loadNombres()
            Dim Context As HttpContext
            Context = HttpContext.Current
            If Context.Items.Contains("Tarjeta") Then
                Me.lblId.Text = CType(Context.Items("Tarjeta").ToString, String)
                loadStopCard()
                fillSeguimiento()
            Else
                lblId.Text = "Are Not Record. Please go back"
            End If
        End If
    End Sub
    Protected Sub loadStopCard()
        Dim dts, dts2 As DataSet
        Dim k As Integer = 0
        Dim sql As String = "SELECT * FROM tblStopCard WHERE ID=" & lblId.Text.Trim
        Try
            dts = clsDB.QueryDataSet(sql)
            clsDB.Close()
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error loading SOC card. Details; " & ex.Message)
        End Try
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                Nombre.Text = row("Nombre")
                Locacion.Text = row("Ubicacion")
                Observacion.Text = row("Observacion")
                If Not IsDBNull(row("Dpto")) Then
                    Area.Text = row("Dpto")
                End If
                If row("Estatus") = "Closed" Then
                    lblId1.Text = "This SOC had been CLOSE"
                    Fecha.Enabled = False
                    txtName.Enabled = False
                    Comentario.Enabled = False
                    AccionTomada.Enabled = False
                End If
            Next
            Try
                sql = "SELECT * FROM tDistributionList WHERE Departamento='" & Area.Text & "'"
                dts2 = clsDB.QueryDataSet(sql)
                clsDB.Close()
            Catch ex As Exception
                clsDB.Close()
                Response.Write("Error loading Distribution List for Card by Dept. Details; " & ex.Message)
            End Try
            If dts2.Tables(0).Rows.Count > 0 Then
                For Each row2 As DataRow In dts2.Tables(0).Rows
                    If k = 0 Then
                        Distribucion.Text = row2("Correo")
                    Else
                        Distribucion.Text = Distribucion.Text & ", " & row2("Correo")
                    End If

                    k = k + 1
                Next
            End If
        End If
    End Sub
    Protected Sub loadNombres()
        Dim busca As String = ""
        Dim Empleados As DataSet
        Try
            Empleados = clsDB.QueryDataSet("Select * from ctgEmpleados order by Nombre")
            clsDB.Close()
            txtName.DataSource = Empleados.Tables(0)
            txtName.DataTextField = "Nombre"
            txtName.DataValueField = "Nombre"
            txtName.DataBind()
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error loading Workers. Details; " & ex.Message)
        End Try
    End Sub
    Protected Sub fillSeguimiento()
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim Sql As String = "SELECT * FROM tblSeguimiento WHERE Stop_ID=" & lblId.Text
        Try
            dts = clsDB.QueryDataSet(Sql)
            clsDB.Close()
            RptTitle.Text = dts.Tables(0).Rows.Count
            Dim Lista As New Data.DataTable("Items")
            Dim col13 As New Data.DataColumn("Idi")
            Dim col24 As New Data.DataColumn("Fecha")
            Dim col23 As New Data.DataColumn("Nombre")
            Dim col53 As New Data.DataColumn("Observacion")
            Dim col54 As New Data.DataColumn("Accion")
            Dim col63 As New Data.DataColumn("Boton")
            Dim item, codigo, revision, path, boton As String

            Lista.Columns.Add(col13)
            Lista.Columns.Add(col24)
            Lista.Columns.Add(col23)
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
                fechas = row("Seg_Fecha").ToString
                fecha = Format(fechas.ToString("MM/dd/yyyy"))
                rptRow = Lista.NewRow
                rptRow("Idi") = row("Seg_ID")
                rptRow("Nombre") = row("Seg_Responsable")
                rptRow("Fecha") = fecha
                rptRow("Observacion") = row("Seg_Coment")
                rptRow("Accion") = row("Seg_Accion")
                rptRow("Boton") = row("Seg_ID")
                i = i + 1
                Lista.Rows.Add(rptRow)

            Next
            dtsItems.Tables.Add(Lista)
            RptTitle.Text = dts.Tables(0).Rows.Count
            rptFiles.DataSource = dtsItems
            rptFiles.DataBind()
        Catch ex As Exception
            clsDB.Close()
            Response.Write("Error loading Follow Data. Details; " & ex.Message)
        End Try
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        'Response.Redirect("FollowUpList.aspx")
        Server.Transfer("FollowUpList.aspx")
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim strSQL As String
        Dim a As Date
        Try
            a = Fecha.Text
            If Nombre.Text = "" Then
                Response.Write("You Must Select a Name")
                txtName.Focus()
            Else
                If Comentario.Text = "" Then
                    Response.Write("You must input a follow up COMMENT")
                    Comentario.Focus()
                Else
                    strSQL = "INSERT INTO tblSeguimiento (Stop_ID,Seg_Fecha,Seg_Coment,Seg_Accion,Seg_Responsable)" & _
            "VALUES(" & lblId.Text & ",'" & a & "', '" & Comentario.Text.Trim & "','" & AccionTomada.Text.Trim & "'" & _
            ",'" & txtName.Text.Trim & "')"
                    Try
                        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                            clsDB.Close()
                            Response.Write("Follow Up Comment add on successfully")
                            fillSeguimiento()
                        Else
                            clsDB.Close()
                            Response.Write("Error Saving Data")
                        End If
                    Catch ex As Exception
                        Response.Write("<br/> " & ex.Message)
                    End Try
                End If
            End If
        Catch
            Response.Write("Error. The Date Format is incorrect")
        End Try
    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        Dim strSQL As String
        Dim a As Date
        Dim Context As HttpContext
        Dim OKa As Boolean
        Try
            a = Fecha.Text
            If Nombre.Text = "" Then
                Response.Write("You Must Select a Name")
                txtName.Focus()
            Else
                If Comentario.Text = "" Then
                    Response.Write("You must input a follow up COMMENT")
                    Comentario.Focus()
                Else
                    strSQL = "INSERT INTO tblSeguimiento (Stop_ID,Seg_Fecha,Seg_Coment,Seg_Accion,Seg_Responsable)" & _
            "VALUES(" & lblId.Text & ",'" & a & "', '" & Comentario.Text.Trim & "','" & AccionTomada.Text.Trim & "'" & _
            ",'" & txtName.Text.Trim & "')"
                    Try
                        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                            clsDB.Close()


                            strSQL = "UPDATE tblStopCard SET Estatus='Closed' WHERE ID = " & lblId.Text & ""
                            If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                                clsDB.Close()
                                OKa = True
                            Else
                                Response.Write("Error Closing SOC. Qry=" & strSQL)
                            End If
                        Else
                            clsDB.Close()
                            Response.Write("Error Input Comments. Qry=" & strSQL)
                        End If
                    Catch ex As Exception
                        Response.Write("<br/> " & ex.Message)
                    End Try
                End If
            End If
        Catch
            Response.Write("Error. The Date Format is incorrect")
        End Try
        If OKa = True Then
            Context = HttpContext.Current
            Context.Items.Add("SOC", lblId.Text)
            Server.Transfer("SOC_Been_Close.aspx")
        End If
    End Sub
End Class
