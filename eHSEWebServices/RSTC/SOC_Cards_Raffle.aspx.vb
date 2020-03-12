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
Partial Class SOC_Cards_Raffle
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Label3.Text = ""
        Dim dts As DataSet
        Dim selDate, selDate2 As Date
        Dim a As Integer
        Try
            selDate = tFechas.Text 'Codigo para introducir la fecha de la tarjeta.
            selDate2 = tFechas2.Text 'Codigo para introducir la fecha de la tarjeta.
            selDate = Format(selDate.ToString("MM/dd/yyyy"))
            selDate2 = Format(selDate2.ToString("MM/dd/yyyy"))
            'a = DatePart(DateInterval.WeekOfYear, selDate, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)'Codigo para sacar la semana actual
            'a = a - 1'codigo para tomar la semana anterior=semana actual - 1
            'Label3.Text = "This SOC was tacked from the week " & a
            Label3.Text = "This SOC was tacked from the day " & selDate
            Dim sql As String = "SELECT ID,Nombre,Fecha From tblStopCard where Fecha Between #" & selDate & "# AND #" & selDate2 & "# order by Fecha"
            dts = clsDB.QueryDataSet(sql)
            Dim rand As New Random
            Dim records As Integer
            Dim winer As Integer
            Dim j As Integer = 1
            If dts.Tables(0).Rows.Count > 0 Then
                records = dts.Tables(0).Rows.Count
                winer = rand.Next(1, records)
                For Each row As DataRow In dts.Tables(0).Rows
                    If j = winer Then
                        Label1.Text = row("Nombre")
                        Label2.Text = "SOC ID " & row("ID")
                        Ganador.Text = "El Ganador fue tomado de un total de " & records & " tarjetas"
                    End If
                    j = j + 1
                Next
                gvEmpleados.DataSource = dts
                gvEmpleados.DataBind()
            Else
                Label3.Text = "No Registros para esta fecha"
            End If
            

        Catch ex As Exception
            Label3.Text = "Formato de fecha incorrecto, debe ser: Mes/Dia/Año </br>"
            Label3.Text = Label3.Text & ex.Message
        End Try
    End Sub
End Class
