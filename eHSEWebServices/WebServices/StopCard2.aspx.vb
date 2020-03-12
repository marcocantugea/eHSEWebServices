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
    
    Protected Sub btnPhoneSrc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhoneSrc.Click
        Dim strSQL1 As String
        Dim fecha As Date
        fecha = txtDate.Text

        If txtName.Text.Length > 0 Then
            If txtUbica.Text.Length > 0 Then
                If txtObserva.Text.Length > 0 Then
                    If txtAccion.Text.Length > 0 Then
                        strSQL1 = "INSERT INTO tblStopCard (Nombre,Fecha,ubicacion,Observacion," & _
        "Accion,Acto_Inseguro,EPP,Posicion_Gente,Orden_Limpieza,Condicion_Insegura," & _
        "Procedimiento,Herramientas,Observacion_Positiva,Otra,Estatus,Week)" & _
        "VALUES('" & txtName.Text & "', '" & fecha & "','" & txtUbica.Text.Trim & "'" & _
        ",'" & txtObserva.Text.Trim & "','" & txtAccion.Text.Trim & "'," & CheckBox1.Checked & "" & _
        "," & CheckBox2.Checked & "," & CheckBox3.Checked & "," & CheckBox4.Checked & "" & _
        "," & CheckBox5.Checked & "," & CheckBox6.Checked & "," & CheckBox7.Checked & "" & _
        "," & CheckBox8.Checked & "," & CheckBox9.Checked & ",'Open'," & Semana.Text & ")"

                        Try
                            If clsDB.QueryExecuteNonQuery(strSQL1) = True Then
                                clsDB.Close()
                                Response.Redirect("StopCardSent.aspx")
                            Else
                                clsDB.Close()
                                Response.Write("Error Saving Data")
                            End If
                        Catch ex As Exception
                            Response.Write("Error al buscar Equipos <br/> " & ex.Message)
                        End Try
                    Else
                        Response.Write("<br/>  Input an Action <br/> ")
                    End If
                Else
                    Response.Write("<br/>  Input a Observation <br/> ")
                End If
            Else
                Response.Write("<br/>  Input a Location <br/> ")
            End If
        Else
            Response.Write("<br/>  Input a name <br/> ")
        End If
        
    End Sub
    Protected Sub dlCrews_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlCrews.SelectedIndexChanged
        loadNombres()
    End Sub
    Protected Sub buscarEmpleados()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Crew,Nombre from ctgEmpleados where Nombre like '%" & Busqueda.Text.Trim & "%'  order by Nombre")
        clsDB.Close()
        gvEmpleados.DataSource = Empleados
        gvEmpleados.DataBind()
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim week As Integer
            week = DatePart(DateInterval.WeekOfYear, Now, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
            Semana.Text = week
            txtDate.Text = Format(Now.Date.ToString("yyyy-MM-dd"))
            txtName.Focus()
            loadNombres()
            divBusqueda.Visible = False
        End If
    End Sub
    Protected Sub loadNombres()
        Dim filtro As String
        If dlCrews.Text = "Other" Then
            filtro = " Is Null"
        Else
            filtro = "='" & dlCrews.SelectedItem.Text & "'"
        End If
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select * from ctgEmpleados where Crew " & filtro & " order by Nombre")
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
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        divBusqueda.Visible = True
    End Sub
End Class
