<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_loadtra.aspx.vb" Inherits="socmovil.t_loadtra" %>
<% 
    Dim load_success As Boolean = False
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    
    If Not IsNothing(Request.QueryString("trapin")) Then
        Try
            Dim tra_pin As Integer = Integer.Parse(Request.QueryString("trapin"))
            
            
            Dim TRAobj As New etra.com.objects.TRAObj
            TRAobj.pin_save = tra_pin
            
            UnitOfWork.TRA.GetTRAbyPIN(TRAobj)
            
            If TRAobj.tra_ID > 0 Then
                TRAobj.LoadDocumentHeadInfo()
                If TRAobj.getLock Then
                    Throw New Exception("REDIRECT:TRAFormat.aspx?tra_id=" & Base64Con.EncodeBase64(TRAobj.tra_ID))
                End If
                TRAobj.traTasks = New List(Of etra.com.objects.TRATaskObj)
                UnitOfWork.TRA.GetTRAActivities(TRAobj.tra_ID, TRAobj.traTasks)
                Me.Session("new_tra_insession") = TRAobj
                load_success = True
                'Response.Write("TRA_Loaded")
            Else
                Response.Redirect("../index.aspx?p=tra/p_tras")
            End If
        Catch ex As Exception
            If ex.Message.Contains("REDIRECT") Then
                Dim redirectvalues As String() = ex.Message.Split(":")
                Response.Redirect(redirectvalues(1))
            Else
                Response.Redirect("../index.aspx?p=tra/p_tras")
            End If
            'Throw
        End Try
    End If
    
    If Not IsNothing(Request.QueryString("tra_id")) Then
        Try
            Dim requested_tra_id As String = Request.QueryString("tra_id")
            Dim str_tra_id As String = Base64Con.DecodeBase64(requested_tra_id)
            Dim int_tra_id As Integer = Integer.Parse(str_tra_id)
            Dim tra_tofind As New etra.com.objects.TRAObj
            
            
            tra_tofind.tra_ID = int_tra_id
            UnitOfWork.TRA.GetTRAbyID(tra_tofind)
            If tra_tofind.tra_ID > 0 Then
                tra_tofind.traTasks = New List(Of etra.com.objects.TRATaskObj)
                UnitOfWork.TRA.GetTRAActivities(tra_tofind.tra_ID, tra_tofind.traTasks)
                
                For Each activiti As etra.com.objects.TRATaskObj In tra_tofind.traTasks
                    activiti.traR_Id = -1
                    activiti.tra_ID = -1
                Next
                
                tra_tofind.tra_Status = "temp"
                tra_tofind.tra_ID = -1
                
                Dim PINGenerator As New eservices_core.com.utilities.PINGenerator
                Dim pin_save As Integer = PINGenerator.GeneratePIN4digit
                Dim gen_pin As Boolean = True
                While gen_pin
                    If UnitOfWork.TRA.DuplicatePIN(pin_save) Then
                        pin_save = Integer.Parse(PINGenerator.GeneratePIN4digit)
                    Else
                        gen_pin = False
                    End If
                End While
                tra_tofind.pin_save = pin_save
                
                Me.Session("new_tra_insession") = tra_tofind
                load_success = True
            End If
            
        Catch ex As Exception
            'Throw 
            Response.Redirect("../index.aspx?p=tra/p_tras")
        End Try
    End If
%>
<%
    If load_success Then
        
   
 %>
<script>
    window.location.href = "../index.aspx?p=tra/p_createTRA";
</script>
<%
End If
 %>