Imports socmobile_core.com
Imports etra.com.objects
Imports etra.com.ado.ole
Imports System.Runtime.Remoting
Public Class _DebugPage
    Inherits System.Web.UI.Page

    Dim UnitOfWork As New eservices_datamanager.UnitOfWork

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SOCTestObj As New objects.SOCCardObj
        SOCTestObj.Nombre = "Marco CAntu Gea"

        Dim ADOSOCCard As New ado.ole.ADOSOCCard


        'ADOSOCCard.SaveSOCCard(SOCTestObj)
      
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim list_usuarios As New Dictionary(Of String, socmobile_core.com.objects.UsuariosObj)
        UnitOfWork.SOCCardUsuarios.GetUserNames(list_usuarios)



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


        UnitOfWork.TRA.SaveTRA(new_Tra)

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


        UnitOfWork.TRA.GetTRAsByDeparment(tra_fields, deparment, listoftra)

        Response.Write(listoftra.Count)

        For Each item As TRAObj In listoftra
            Response.Write(item.tra_ID & "-" & item.tra_Activity_Job & "-" & item.tra_Dept & "-" & item.tra_Location & "<br/>")
        Next

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim list_Task As New List(Of etra.com.objects.TRATaskObj)

        UnitOfWork.TRA.GetTRAActivities(1, list_Task)
        Dim encript As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key"))
        For Each item As etra.com.objects.TRATaskObj In list_Task
            Dim value As String = encript.EncryptData(item.traR_TaskSteps)
            Response.Write("Encryp=" & value & "<br/>")
            Response.Write("Dencryp=" & encript.DecryptData(value) & "<br/>")
        Next
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        'Dim ADOUser As New eservices_core.com.ado.ADOUser
        'ADOUser.RegisterUser(New eservices_core.com.objects.UserObj)


        Dim newlist As New Dictionary(Of String, String)

        UnitOfWork.UserUtilities.GetEmployeeNumberList(newlist)

        For Each item As KeyValuePair(Of String, String) In newlist
            Response.Write(item.Key & " - " & item.Value & "<br/>")
        Next

    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim encript As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key"))

        Dim userobj As New eservices_core.com.objects.UserObj
        userobj.user_login = "10009825"
        userobj.user_pwd = encript.EncryptData("123sdfsdfsf")

        UnitOfWork.User.LoginUser(userobj)

    End Sub

    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click


        Dim list_companies As New List(Of eservices_core.com.objects.CompanyObj)
        UnitOfWork.Company.GetAllCompanies(list_companies)

        Response.Write(list_companies.ToString())
        For Each company As eservices_core.com.objects.CompanyObj In list_companies
            Response.Write(company.CompanyName & "<br/>")
        Next
    End Sub

    Protected Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click

        Dim tmpfile As New System.IO.FileInfo(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\" & "log-icon-png.png")
        Dim folderout As String = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("dsignaturesfolder") & "\"
        Dim encrypter As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key"))

        encrypter.EncryptFile(tmpfile, folderout)

    End Sub

    Protected Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click

        Dim imgenct As New System.IO.FileInfo(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("dsignaturesfolder") & "\" & "log-icon-png.png.dat")
        Dim folderout As String = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\"
        Dim encrypter As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key"))

        encrypter.DecryptFile(imgenct, folderout)


    End Sub

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click

        Dim tra_fields As New etra.com.objects.TRAObj
        tra_fields.tra_ID = -7
        tra_fields.tra_Activity_Job = "-7"
        tra_fields.tra_Dept = "-7"
        tra_fields.tra_Location = "-7"

        Dim listoftra As New List(Of etra.com.objects.TRAObj)
        Dim listofdocuments As New List(Of eservices_core.com.objects.DocumentObj)
        UnitOfWork.TRA.GetTRABy(tra_fields, listoftra, "tra_ID>0")

        For Each item As etra.com.objects.TRAObj In listoftra
            'Response.Write(item.ToString + "<br/>")
            listofdocuments.Add(item)
        Next

        For Each document As eservices_core.com.objects.DocumentObj In listofdocuments
            Response.Write(document.getTypeOfObj & ":" & document.getIDObjField & "<br/>")
        Next
    End Sub

    Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        Dim profile As New eservices_core.com.objects.ProfileObj
        profile.idprofile = 1


        UnitOfWork.ModulesMenus.GetModulesMenusByProfile(profile)

        For Each item As KeyValuePair(Of Integer, eservices_core.com.objects.ModuleObj) In profile.Modules
            Response.Write(item.Value.title & "---><br />")
            If Not IsNothing(item.Value.MenuList) Then
                If item.Value.MenuList.Count > 0 Then
                    For Each Menu As eservices_core.com.objects.MenuObj In item.Value.MenuList
                        Response.Write("&emsp;" & Menu.title & "<br />")
                    Next
                End If
            End If
            Response.Write("<hr />")
        Next

    End Sub

    Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click
        Dim user As New eservices_core.com.objects.InfoUserObj
        user.Nombre = "Marco Antonio"
        user.apellido_pat = "Cantu"
        user.apellido_mat = "Gea"

        Dim ADOSOc As New socmobile_core.com.ado.ole.ADOSOCCard
        Dim listofsocs As List(Of eservices_core.com.objects.DocumentObj) = ADOSOc.GetSocCardByUserName(user)

        If Not IsNothing(listofsocs) Then
            For Each document As eservices_core.com.objects.DocumentObj In listofsocs
                Response.Write("<hr />")
                Response.Write("Object Type: " & document.getTypeOfObj)
                If document.getTypeOfObj.Equals("SOCCardObj") Then
                    Dim soc As socmobile_core.com.objects.SOCCardObj = CType(document, socmobile_core.com.objects.SOCCardObj)
                    Response.Write("<br/>" & soc.Observacion & "<br/>")
                End If
            Next
        End If

    End Sub

    Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click

        Dim ADODocuments As New eservices_core.com.ado.ADODocument
        Dim Document As New socmobile_core.com.objects.SOCCardObj
        Document.id = 38
        Document.setCreatedByUserObj(New eservices_core.com.objects.UserObj())
        Document.getCreatedByUserObj.userid = 3
        Document.setDocumentDate(Date.Now)
        'Document.setidDocument(39)

        Dim where As New Dictionary(Of String, String)
        where.Add("TypeOfObj", "='SOCCardObj'")
        where.Add("IDObjField", "='id'")
        where.Add("IdOfDocument", "=67")

        'Response.Write(ADODocuments.GetQueryStr(Document, eservices_core.com.ado.TypeQuery.Insert, where))

    End Sub

    Protected Sub Button14_Click(sender As Object, e As EventArgs) Handles Button14.Click

        Dim ADODocuments As New eservices_core.com.ado.ADODocument
        Dim Userobj As New eservices_core.com.objects.UserObj
        Userobj.userid = 3

        Dim list As SortedList(Of Integer, eservices_core.com.objects.DocumentObj) = ADODocuments.GetDocuemntsByUser(Userobj, "TRA")
        Response.Write(list.Count)

        For Each item As KeyValuePair(Of Integer, eservices_core.com.objects.DocumentObj) In list
            item.Value.LoadInfoByID()
            If item.Value.getTypeOfObj().Contains("SOCCard") Then
                Response.Write("<br/>" & item.Value.ToString)
                'Response.Write("<br/>" & item.Value.GetType.GetProperty("Ubicacion").GetValue(item.Value, Nothing))
            End If
            If item.Value.getTypeOfObj().Contains("TRA") Then
                Response.Write("<br/>" & item.Value.ToString)
                'Response.Write("<br/>" & item.Value.GetType.GetProperty("pin_save").GetValue(item.Value, Nothing))
            End If

        Next

        'Dim handler As ObjectHandle = CreateObject("socmobile_core", "SOCCardObj")
        'Dim o As Object = handler.Unwrap
        'Dim currentdomain As AppDomain = AppDomain.CurrentDomain
        'Dim asevidence As System.Security.Policy.Evidence = currentdomain.Evidence
        'currentdomain.Load("eservices_core", asevidence)
        'Dim assm() As System.Reflection.Assembly = currentdomain.GetAssemblies

        'Dim asm As System.Reflection.Assembly = System.Reflection.Assembly.Load("socmobile_core")
        'If Not IsNothing(asm) Then
        '    Dim o As Object = asm.CreateInstance("socmobile_core.com.objects.SOCCardObj")
        '    'System.Activator.CreateInstance(asm.GetTypes(9))
        '    Response.Write(o.GetType.Name)
        'End If
        'Object o = new Object();
        '    dim asm As Assemb = Assembly.Load("QReporting");
        '    if (asm != null)
        '    {
        '        Type hai = asm.GetType();
        '        o = System.Activator.CreateInstance(hai); 
        '    }
    End Sub

    Function CreateObject(ensambly As String, classtypename As String) As Object
        'Dim oType As Type = Type.GetType(ClassName)
        Return Activator.CreateInstance(ensambly, classtypename)
    End Function

End Class