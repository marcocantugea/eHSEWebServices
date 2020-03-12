Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Partial Class Users
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("yyyy-MM-dd"))
            loadDepartamentos()
            loadCompany()
            loadNacionality()
            Nombre.Focus()
            cerrarPopUps()
            posicionarPopUps()
        End If
    End Sub
    Protected Sub loadDepartamentos()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select * from ctgDepartamentos")
        clsDB.Close()
        dlDpt.DataSource = Dept.Tables(0)
        dlDpt.DataTextField = "Desc"
        dlDpt.DataValueField = "ID"
        dlDpt.DataBind()
    End Sub
    Protected Sub loadCompany()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select * from ctgEmpresa order by Empresa_Desc")
        clsDB.Close()
        ddEmpresa.DataSource = Dept.Tables(0)
        ddEmpresa.DataTextField = "Empresa_Desc"
        ddEmpresa.DataValueField = "Empresa_ID"
        ddEmpresa.DataBind()
        ddEmpresa.SelectedValue = 1
    End Sub
    Protected Sub loadNacionality()
        Dim Dept As DataSet
        Dept = clsDB.QueryDataSet("Select * from ctgNacionalidad order by Nac_Desc")
        clsDB.Close()
        ddNacionalidad.DataSource = Dept.Tables(0)
        ddNacionalidad.DataTextField = "Nac_Desc"
        ddNacionalidad.DataValueField = "Nac_ID"
        ddNacionalidad.DataBind()
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If Nombre.Text = "" Then
            Response.Write("You must input a name")
        Else
            If ddCrew.SelectedItem.Text = "" Then
                Response.Write("You must Select the Worker Roll")
            Else
                If Posicion.Text = "" Then
                    Response.Write("You must input Position")
                Else
                    If dlDpt.SelectedItem.Text = "All" Then
                        Response.Write("You must select a Department")
                    Else
                        validarFecha()
                    End If
                End If
            End If
        End If
    End Sub
    Protected Sub manageData()
        Dim strSQL1, strSQL As String
        If btnUpdate.Text = "Save" Then
            'If ddCrew.Enabled = True Then
            strSQL1 = "INSERT INTO ctgEmpleados (Rolls,Empresa_ID,Nombre," & _
            "Dpto_ID,Sexo,Nac_ID,Fecha_Nacimiento,Puesto,emp_Vigente)" & _
            "VALUES('" & ddCrew.SelectedItem.Text & "'," & ddEmpresa.SelectedValue & ",'" & Nombre.Text.Trim & "'" & _
            "," & dlDpt.SelectedValue & ",'" & ddSexo.SelectedItem.Text.Trim & "'," & ddNacionalidad.SelectedValue & ",'" & Nacimiento.Text & "','" & Posicion.Text.Trim & "'," & cbActive.Checked & ")"
            'ElseIf RadioButtonList1.SelectedItem.Text = "PEMEX" Then
            '    strSQL1 = "INSERT INTO ctgEmpleados (Crew,Rolls,Empresa_ID,Nombre," & _
            '    "Dpto_ID,Sexo,Nac_ID,Fecha_Nacimiento,Puesto)" & _
            '    "VALUES('None','PEMEX', " & ddEmpresa.SelectedValue & ",'" & Nombre.Text.Trim & "'" & _
            '    "," & dlDpt.SelectedValue & ",'" & ddSexo.SelectedItem.Text.Trim & "'," & ddNacionalidad.SelectedValue & ",'" & Nacimiento.Text & "','" & Posicion.Text.Trim & "')"
            'ElseIf RadioButtonList1.SelectedItem.Text = "SERVICES" Then
            '    strSQL1 = "INSERT INTO ctgEmpleados (Crew,Rolls,Empresa_ID,Nombre," & _
            '    "Dpto_ID,Sexo,Nac_ID,Fecha_Nacimiento,Puesto)" & _
            '    "VALUES('None','SERVICES', " & ddEmpresa.SelectedValue & ",'" & Nombre.Text.Trim & "'" & _
            '    "," & dlDpt.SelectedValue & ",'" & ddSexo.SelectedItem.Text.Trim & "'," & ddNacionalidad.SelectedValue & ",'" & Nacimiento.Text & "','" & Posicion.Text.Trim & "')"
            'End If


            Try
                If clsDB.QueryExecuteNonQuery(strSQL1) = True Then
                    clsDB.Close()
                    Response.Write("A New Worker had been add it")
                Else
                    clsDB.Close()
                    Response.Write("Error Saving Data. The String: " & strSQL1)
                End If
            Catch ex As Exception
                Response.Write("<br/> " & ex.Message)
            End Try


        ElseIf btnUpdate.Text = "Update" Then
            'If ddCrew.Enabled = True Then
            strSQL = "UPDATE ctgEmpleados SET Rolls='" & ddCrew.SelectedItem.Text & "'" & _
            ", Empresa_ID=" & ddEmpresa.SelectedValue & ", Nombre='" & Nombre.Text.Trim & "'" & _
            ",Dpto_ID=" & dlDpt.SelectedValue & ",Sexo='" & ddSexo.SelectedItem.Text.Trim & "'" & _
            ",Nac_ID=" & ddNacionalidad.SelectedValue & ",emp_Vigente=" & cbActive.Checked & ",Fecha_Nacimiento='" & Nacimiento.Text & "'" & _
            ", Puesto='" & Posicion.Text.Trim & "' WHERE Empleado_ID = " & lblId.Text & ""
            'ElseIf RadioButtonList1.SelectedItem.Text = "PEMEX" Then
            '    'En caso que seleccionen PEMEX se actualizara con los siguientes parametros
            '    strSQL = "UPDATE ctgEmpleados SET Crew ='" & ddCrew.SelectedItem.Text & "', " & _
            '    "Rolls='PEMEX'" & _
            '    ", Empresa_ID=" & ddEmpresa.SelectedValue & ", Nombre='" & Nombre.Text.Trim & "'" & _
            '    ",Dpto_ID=" & dlDpt.SelectedValue & ",Sexo='" & ddSexo.SelectedItem.Text.Trim & "'" & _
            '    ",Nac_ID=" & ddNacionalidad.SelectedValue & ",Fecha_Nacimiento='" & Nacimiento.Text & "'" & _
            '    ", Puesto='" & Posicion.Text.Trim & "' WHERE Empleado_ID = " & lblId.Text & ""

            '    'En caso que seleccionen Servicios se actualizara con los siguientes parametros
            'ElseIf RadioButtonList1.SelectedItem.Text = "SERVICES" Then
            '    strSQL = "UPDATE ctgEmpleados SET Crew ='" & ddCrew.SelectedItem.Text & "', " & _
            '    "Rolls='SERVICES'" & _
            '    ", Empresa_ID=" & ddEmpresa.SelectedValue & ", Nombre='" & Nombre.Text.Trim & "'" & _
            '    ",Dpto_ID=" & dlDpt.SelectedValue & ",Sexo='" & ddSexo.SelectedItem.Text.Trim & "'" & _
            '    ",Nac_ID=" & ddNacionalidad.SelectedValue & ",Fecha_Nacimiento='" & Nacimiento.Text & "'" & _
            '    ", Puesto='" & Posicion.Text.Trim & "' WHERE Empleado_ID = " & lblId.Text & ""
            'End If


            If clsDB.QueryExecuteNonQuery(strSQL) = True Then
                clsDB.Close()
                Modify.Visible = True
                btnUpdate.Text = "Save"
                Response.Write("The Record has been updated Successfully")
                clearBoxes()
            Else
                Response.Write("Error updating data")
            End If




        End If
    End Sub
    Protected Sub clearBoxes()
        lblId.Text = ""
        ddCrew.SelectedItem.Text = "A"
        ddEmpresa.SelectedValue = 1
        Nombre.Text = ""
        dlDpt.SelectedValue = 1
        ddSexo.SelectedItem.Text = ""
        ddNacionalidad.SelectedValue = 1
        Nacimiento.Text = ""
        Posicion.Text = ""
        'RadioButtonList1.ClearSelection()
    End Sub
    Protected Sub validarFecha()
        Dim a, b As Date
        b = "01/01/1998"
        If Len(Nacimiento.Text) > 0 Then
            Try
                a = Nacimiento.Text
                Nacimiento.Text = Format(a.ToString("MM/dd/yyyy"))
                If b > a Then
                    manageData()
                Else
                    Response.Write("The Worker must be older than 18 years")
                End If
            Catch
                Response.Write("The Birth Date is incorrect")
            End Try
        Else
            manageData()
        End If
    End Sub
    Protected Sub btnAddNacion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNacion.Click
        divPais.Visible = True
        lPais_ID.Text = ""
        tPaisNombre.Text = ""
        buscarPaises()
    End Sub
    Protected Sub Busqueda_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Busqueda.TextChanged
        buscarEmpleados()
    End Sub
    Protected Sub buscarEmpleados()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Nombre,Crew,Puesto,Desc," & _
        "Tarjetas,Empleado_Id from qEmpleados where Nombre like '%" & Busqueda.Text.Trim & "%'  order by Nombre")
        clsDB.Close()
        gvEmpleados.DataSource = Empleados
        gvEmpleados.DataBind()
    End Sub
    Protected Sub Modify_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Modify.Click
        btnAddNacion.Enabled = False
        Modify.Enabled = False
        btnCancel.Enabled = False
        btnUpdate.Enabled = False
        Modify.Visible = False
        btnAddNacion0.Enabled = False
        btnUpdate.Text = "Update"
        divBusqueda0.Visible = True
        Busqueda.Focus()
    End Sub

    Protected Sub gvEmpleados_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles gvEmpleados.ItemCommand
        Dim accion As String
        Dim Empleado_ID As Integer
        accion = e.CommandName
        If accion = "Borrar" Then
            Empleado_ID = e.CommandArgument
            lblId.Text = Empleado_ID
            divEmpleadoEliminar.Visible = True
        ElseIf accion = "seleccionar" Then
            Nombre.Text = e.CommandArgument
            loadDepartamentos()
            loadCompany()
            loadNacionality()
            traerEmpleado()
            divBusqueda0.Visible = False
            divPais.Visible = False
            btnAddNacion.Enabled = True
            btnAddNacion0.Enabled = True
            Modify.Enabled = True
            btnUpdate.Enabled = True
            btnCancel.Enabled = True
            Busqueda.Text = ""
        End If
    End Sub

    Protected Sub traerEmpleado()
        Dim Empleados As DataSet
        Dim crew As String
        Dim rol As String
        'RadioButtonList1.ClearSelection()
        Empleados = clsDB.QueryDataSet("Select * from qEmpleados where Nombre = '" & Nombre.Text.Trim & "'  order by Nombre")
        clsDB.Close()
        If Empleados.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In Empleados.Tables(0).Rows
                lblId.Text = row("Empleado_Id")
                If Not IsDBNull(row("Rolls")) Then
                    'rol = row("Rolls")
                    'If Len(rol) > 1 Then
                    '    ddCrew.Enabled = False
                    '    'RadioButtonList1.SelectedValue = row("Rolls")
                    'Else
                    ddCrew.Enabled = True
                    ddCrew.SelectedItem.Text = row("Rolls")
                    'End If
                    'Else
                    '    If Not IsDBNull(row("Crew")) Then
                    '        crew = row("Crew")
                    '        If Len(crew) < 1 Then
                    '            ddCrew.SelectedItem.Text = crew
                    '        End If
                    '    Else
                    '        ddCrew.SelectedItem.Text = "All"
                    '    End If
                End If
                If Not IsDBNull(row("Puesto")) Then
                    Posicion.Text = row("Puesto")
                Else
                    Posicion.Text = ""
                End If
                If Not IsDBNull(row("Dpto_ID")) Then
                    dlDpt.SelectedValue = row("Dpto_ID")
                End If
                If Not IsDBNull(row("Empresa_Id")) Then
                    ddEmpresa.SelectedValue = row("Empresa_Id")
                End If
                If Not IsDBNull(row("Nac_Id")) Then
                    ddNacionalidad.SelectedValue = row("Nac_Id")
                Else
                    ddNacionalidad.SelectedValue = 1
                End If
                If Not IsDBNull(row("Sexo")) Then
                    ddSexo.SelectedItem.Text = row("Sexo")
                Else
                    ddSexo.SelectedItem.Text = ""
                End If
                If Not IsDBNull(row("Fecha_Nacimiento")) Then
                    Nacimiento.Text = row("Fecha_Nacimiento")
                End If
                cbActive.Checked = row("emp_Vigente")
            Next
        End If
    End Sub

    Protected Sub btnClose0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose0.Click
        divBusqueda0.Visible = False
        btnAddNacion.Enabled = True
        btnAddNacion0.Enabled = True
        Modify.Enabled = True
        btnUpdate.Enabled = True
        btnCancel.Enabled = True
    End Sub

    

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Modify.Visible = True
        clearBoxes()
        btnUpdate.Text = "Save"
    End Sub
    Protected Sub buscarCompanies()
        Dim Empleados As DataSet
        Empleados = clsDB.QueryDataSet("Select Empresa_Desc,Empresa_ID from ctgEmpresa order by Empresa_Desc")
        clsDB.Close()
        gvCompanies.DataSource = Empleados
        gvCompanies.DataBind()
    End Sub
    Protected Sub buscarPaises()
        Dim Paises As DataSet
        Paises = clsDB.QueryDataSet("Select Nac_Desc,Nac_ID from ctgNacionalidad order by Nac_Desc")
        clsDB.Close()
        gvPais.DataSource = Paises
        gvPais.DataBind()
    End Sub
    Protected Sub btnAddNacion0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNacion0.Click
        divCompany.Visible = True
        lCompany_Id.Text = ""
        buscarCompanies()
    End Sub

    Protected Sub gvCompanies_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles gvCompanies.ItemCommand
        Dim accion As String
        Dim company_Id As Integer
        accion = e.CommandName
        If accion = "Borrar" Then
            company_Id = e.CommandArgument
            lCompany_Id.Text = company_Id
            divEliminarCompany.Visible = True
        ElseIf accion = "seleccionar" Then
            company_Id = e.CommandArgument
            lCompany_Id.Text = company_Id
            tNombreCompania.Text = nombreCompania()
        End If
    End Sub
    Function nombreCompania() As String
        Dim Companias As DataSet
        Dim nombre As String
        Companias = clsDB.QueryDataSet("Select Empresa_Desc from ctgEmpresa Where Empresa_ID=" & lCompany_Id.Text & " order by Empresa_Desc")
        clsDB.Close()
        If Companias.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In Companias.Tables(0).Rows
                nombre = row("Empresa_Desc")
            Next
        End If
        Return nombre
    End Function
    Function nombrePais() As String
        Dim Companias As DataSet
        Dim nombre As String
        Companias = clsDB.QueryDataSet("Select Nac_Desc from ctgNacionalidad Where Nac_ID=" & lPais_ID.Text & " order by Nac_Desc")
        clsDB.Close()
        If Companias.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In Companias.Tables(0).Rows
                nombre = row("Nac_Desc")
            Next
        End If
        Return nombre
    End Function
    Protected Sub Eliminar()
        Dim strSQL As String
        strSQL = "DELETE from ctgEmpresa WHERE Empresa_ID = " & lCompany_Id.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Company has been deleted Successfully")
            divBusqueda0.Visible = False
            loadCompany()
        Else
            Response.Write("Error deleting Company. Employes could be related with this Company. </br>" & strSQL)
        End If
    End Sub
    Protected Sub EliminarPais()
        Dim strSQL As String
        strSQL = "DELETE from ctgNacionalidad WHERE Nac_ID = " & lPais_ID.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Country has been deleted Successfully")
            divBusqueda0.Visible = False
            loadCompany()
        Else
            Response.Write("Error deleting copany, May be are Employes related to this country: </br>" & strSQL)
        End If
    End Sub
    Protected Sub EliminarEmpleado()
        Dim strSQL As String
        strSQL = "DELETE from ctgEmpleados WHERE Empleado_ID = " & lblId.Text & ""
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Employe has been deleted Successfully")
            divBusqueda0.Visible = False
            loadCompany()
        Else
            Response.Write("Error deleting Employe. You cannot delete Employes with SOC created. </br>" & strSQL)
        End If
    End Sub
    Protected Sub btnClose2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose2.Click
        divEliminarCompany.Visible = False
    End Sub
    Protected Sub btnUpdate3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate3.Click
        Eliminar()
        cerrarPopUps()
    End Sub
    Protected Sub cerrarPopUps()
        divPais.Visible = False
        divPaisEliminar.Visible = False
        divBusqueda0.Visible = False
        divCompany.Visible = False
        divEliminarCompany.Visible = False
        divEmpleadoEliminar.Visible = False
    End Sub
    Protected Sub posicionarPopUps()
        'Posicion de Busqueda de Pais
        divPais.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divPais.Style(HtmlTextWriterStyle.Top) = "10%"
        divPais.Style(HtmlTextWriterStyle.Left) = "10%"
        'Posicion de Busqueda de PaisEliminar
        divPaisEliminar.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divPaisEliminar.Style(HtmlTextWriterStyle.Top) = "20%"
        divPaisEliminar.Style(HtmlTextWriterStyle.Left) = "10%"
        'Posicion de Busqueda de EmpleadoEliminar
        divEmpleadoEliminar.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divEmpleadoEliminar.Style(HtmlTextWriterStyle.Top) = "20%"
        divEmpleadoEliminar.Style(HtmlTextWriterStyle.Left) = "10%"
        'Posicion de Busqueda de Usuario
        divBusqueda0.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divBusqueda0.Style(HtmlTextWriterStyle.Top) = "10%"
        divBusqueda0.Style(HtmlTextWriterStyle.Left) = "10%"
        'Posicion de Busqueda de Compania
        divCompany.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divCompany.Style(HtmlTextWriterStyle.Top) = "10%"
        divCompany.Style(HtmlTextWriterStyle.Left) = "10%"
        ''Posicion de Busqueda de CompaniaEliminar
        divEliminarCompany.Style(HtmlTextWriterStyle.Position) = "Absolute"
        divEliminarCompany.Style(HtmlTextWriterStyle.Top) = "20%"
        divEliminarCompany.Style(HtmlTextWriterStyle.Left) = "10%"
    End Sub

    Protected Sub btnClose1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose1.Click
        cerrarPopUps()
    End Sub
    Protected Sub btnUpdate2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate2.Click
        Dim strSQL As String
        If Len(lCompany_Id.Text) > 0 Then
            strSQL = "UPDATE ctgEmpresa SET Empresa_Desc ='" & tNombreCompania.Text & "'" & _
                " WHERE Empresa_ID = " & lCompany_Id.Text & ""
        Else
            strSQL = "INSERT INTO ctgEmpresa (Empresa_Desc)" & _
                "VALUES('" & UCase(tNombreCompania.Text) & "')"
        End If
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Company Name has been Save Successfully")
            cerrarPopUps()
            loadCompany()
            'clearBoxes()
        Else
            Response.Write("Error updating data: </br>" & strSQL)
            cerrarPopUps()
        End If
    End Sub

    Protected Sub bNewCompany_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bNewCompany.Click
        lCompany_Id.Text = ""
        tNombreCompania.Text = ""
    End Sub

    Protected Sub gvPais_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles gvPais.ItemCommand
        Dim accion As String
        Dim pais_ID As Integer
        accion = e.CommandName
        If accion = "Borrar" Then
            pais_ID = e.CommandArgument
            lPais_ID.Text = pais_ID
            divPaisEliminar.Visible = True
        ElseIf accion = "seleccionar" Then
            pais_ID = e.CommandArgument
            lPais_ID.Text = pais_ID
            tPaisNombre.Text = nombrePais()
        End If
    End Sub

    Protected Sub bYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bYes.Click
        EliminarPais()
        cerrarPopUps()
    End Sub

    Protected Sub btnClose3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose3.Click
        divPaisEliminar.Visible = False
    End Sub

    Protected Sub bPaisNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bPaisNew.Click
        lPais_ID.Text = ""
        tPaisNombre.Text = ""
    End Sub

    Protected Sub bPaisSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bPaisSave.Click
        Dim strSQL As String
        If Len(lPais_ID.Text) > 0 Then
            strSQL = "UPDATE ctgNacionalidad SET Nac_Desc ='" & tPaisNombre.Text & "'" & _
                " WHERE Nac_ID = " & lPais_ID.Text & ""
        Else
            strSQL = "INSERT INTO ctgNacionalidad (Nac_Desc)" & _
                "VALUES('" & UCase(tPaisNombre.Text) & "')"
        End If
        If clsDB.QueryExecuteNonQuery(strSQL) = True Then
            clsDB.Close()
            Response.Write("The Country Name has Save updated Successfully")
            cerrarPopUps()
            loadNacionality()
            'clearBoxes()
        Else
            Response.Write("Error updating data: </br>" & strSQL)
            cerrarPopUps()
        End If
    End Sub

    Protected Sub btnPaisCerrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPaisCerrar.Click
        cerrarPopUps()
    End Sub

    Protected Sub btnClose4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose4.Click
        cerrarPopUps()
    End Sub
    Protected Sub bYes0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bYes0.Click
        EliminarEmpleado()
        cerrarPopUps()
        btnAddNacion.Enabled = True
        btnAddNacion0.Enabled = True
        Modify.Enabled = True
        btnUpdate.Enabled = True
        btnCancel.Enabled = True
        Modify.Visible = True
        clearBoxes()
        btnUpdate.Text = "Save"
    End Sub
End Class
