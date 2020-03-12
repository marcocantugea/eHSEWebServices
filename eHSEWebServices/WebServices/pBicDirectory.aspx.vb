Imports clsDBPhone
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Imports System.Diagnostics.Process
Imports System.Diagnostics
Imports System
Imports System.ComponentModel
Imports System.Security
Partial Class pBicDirectory
    Inherits System.Web.UI.Page
    Public clsDB As New clsDBPhone
    Protected Sub btnPhoneSrc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhoneSrc.Click
        cargarDatos()
    End Sub
    'Function Busqueda()
    '    Dim sql
    '    Dim a, b As Date
    '    sql = "SELECT Date,Craft,[Craft Initial],Equipment,Location,[Work Notes] FROM [Electrical Work Log] where date Between #" & a & "# And #" & b & "# order by Date asc"
    '    Select Case rbBusqueda.SelectedIndex
    '        Case 0
    '            sql = "SELECT Date,Craft,[Craft Initial],Equipment,Location,[Work Notes] FROM [Electrical Work Log] where date Between #" & a & "# And #" & b & "# and Craft like '%" & txtSearch.Text & "%' order by Date asc"
    '        Case 1
    '            sql = "SELECT Date,Craft,[Craft Initial],Equipment,Location,[Work Notes] FROM [Electrical Work Log] where date Between #" & a & "# And #" & b & "# AND [Equipment] like '%" & txtSearch.Text & "%' order by Date asc"
    '        Case 2
    '            sql = "SELECT Date,Craft,[Craft Initial],Equipment,Location,[Work Notes] FROM [Electrical Work Log] where date Between #" & a & "# And #" & b & "# AND [Work Notes] like '%" & txtSearch.Text & "%' order by Date asc"
    '    End Select
    '    Return sql
    'End Function
    'Function Areas()
    '    Dim ds As DataSet
    '    Dim Sql As String = "SELECT Area FROM tblPhoneAreas order by ID asc"
    '    Try
    '        ds = clsDB.QueryDataSet(Sql)
    '        DPPhoneAreas.DataSource = ds
    '        clsDB.Close()
    '        DPPhoneAreas.DataTextField = "Area"
    '        DPPhoneAreas.DataValueField = "Area"
    '        DPPhoneAreas.DataBind()
    '        Dim blankitem As New ListItem
    '        blankitem.Text = ""
    '        blankitem.Selected = True
    '        DPPhoneAreas.Items.Add(blankitem)
    '        Return Areas
    '    Catch ex As Exception
    '        Response.Write("Error al llenar Craft <br/> " & ex.Message)
    '    End Try
    'End Function
    Protected Sub cargarDatos()
        Dim strSQL As String
        Dim ds As DataSet
        Dim src As String
        If txtPhoneSrc.Text = "Input Your Search" Then
            src = ""
        Else
            src = txtPhoneSrc.Text
        End If

        strSQL = "SELECT Desc,Ext FROM tblPhoneDirectory where Desc like '%" & src & "%'"
        Try
            ds = clsDB.QueryDataSet(strSQL)
            '*** Bind Rows ***'  
            If ds.Tables(0).Rows.Count > 0 Then
                rptPhoneDirectory.DataSource = ds
                rptPhoneDirectory.DataBind()
            End If
            clsDB.Close()
        Catch ex As Exception
            Response.Write("Error al pasar datos <br/> " & ex.Message)
        End Try
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        cargarDatos()
    End Sub
End Class
