Imports socmobile_core.com
Imports etra.com.objects
Imports etra.com.ado.ole
Public Class _DebugPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SOCTestObj As New objects.SOCCardObj
        SOCTestObj.Nombre = "Marco CAntu Gea"

        Dim ADOSOCCard As New ado.ole.ADOSOCCard


        'ADOSOCCard.SaveSOCCard(SOCTestObj)
      
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ADOUsuarios As New ado.ole.ADOUsuarios
        Dim list_usuarios As New Dictionary(Of String, socmobile_core.com.objects.UsuariosObj)
        ADOUsuarios.GetUserNames(list_usuarios)

        For Each item As KeyValuePair(Of String, socmobile_core.com.objects.UsuariosObj) In list_usuarios
            Response.Write(item.Key.ToString)
        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim new_Tra As New TRAObj

        new_Tra.tra_Activity_Job = "this is a test"
        new_Tra.tra_Location = "This is a test"

        Dim list_task As New List(Of TRATaskObj)

        Dim newtask As New TRATaskObj

        newtask.traR_TaskSteps = "this is a test"
        newtask.traR_Hazard = "this is a test"

        list_task.Add(newtask)
        new_Tra.traTasks = list_task


        Dim ADOTRA As New ADOTRA
        ADOTRA.SaveTRA(new_Tra)

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim tra_fields As New TRAObj
        tra_fields.tra_ID = -7
        tra_fields.tra_Activity_Job = "-7"
        tra_fields.tra_Dept = "-7"
        tra_fields.tra_Location = "-7"

        Dim deparment As New TRADeparment
        deparment.cDep_Name = "Electrical"

        Dim listoftra As New List(Of TRAObj)
        Dim ADOTRA As New ADOTRA

        ADOTRA.GetTRAsByDeparment(tra_fields, deparment, listoftra)

        Response.Write(listoftra.Count)

        For Each item As TRAObj In listoftra
            Response.Write(item.tra_ID & "-" & item.tra_Activity_Job & "-" & item.tra_Dept & "-" & item.tra_Location & "<br/>")
        Next

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim list_Task As New List(Of etra.com.objects.TRATaskObj)
        Dim ADOTRA As New ADOTRA
        ADOTRA.GetTRAActivities(1, list_Task)
        For Each item As etra.com.objects.TRATaskObj In list_Task
            Response.Write(item.traR_TaskSteps & "<br/>")
        Next
    End Sub
End Class