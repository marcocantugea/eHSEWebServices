<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_loadtra.aspx.vb" Inherits="socmovil.t_loadtra" %>
<% 
    Dim load_success As Boolean = False
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    
    If Not IsNothing(Request.QueryString("trapin")) Then
        Try
            Dim tra_pin As Integer = Integer.Parse(Request.QueryString("trapin"))
            Dim ADOTRa As New etra.com.ado.ole.ADOTRA
            
            Dim TRAobj As New etra.com.objects.TRAObj
            TRAobj.pin_save = tra_pin
            
            ADOTRa.GetTRAbyPIN(TRAobj)
            
            If TRAobj.tra_ID > 0 Then
                TRAobj.traTasks = New List(Of etra.com.objects.TRATaskObj)
                ADOTRa.GetTRAActivities(TRAobj.tra_ID, TRAobj.traTasks)
                Me.Session("new_tra_insession") = TRAobj
                load_success = True
                'Response.Write("TRA_Loaded")
            Else
                Response.Redirect("index.aspx?p=p_tras")
            End If
        Catch ex As Exception
            Response.Redirect("index.aspx?p=p_tras")
        End Try
    End If
    
    If Not IsNothing(Request.QueryString("tra_id")) Then
        Try
            Dim requested_tra_id As String = Request.QueryString("tra_id")
            Dim str_tra_id As String = Base64Con.DecodeBase64(requested_tra_id)
            Dim int_tra_id As Integer = Integer.Parse(str_tra_id)
            Dim tra_tofind As New etra.com.objects.TRAObj
            Dim ADOTRa As New etra.com.ado.ole.ADOTRA
            
            tra_tofind.tra_ID = int_tra_id
            ADOTRa.GetTRAbyID(tra_tofind)
            If tra_tofind.tra_ID > 0 Then
                tra_tofind.traTasks = New List(Of etra.com.objects.TRATaskObj)
                ADOTRa.GetTRAActivities(tra_tofind.tra_ID, tra_tofind.traTasks)
                
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
                    If ADOTRa.DuplicatePIN(pin_save) Then
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
            Response.Redirect("index.aspx?p=p_tras")
        End Try
    End If
%>
<%
    If load_success Then
        
   
 %>
<script>
    window.location.href = "index.aspx?p=p_createTRA";
</script>
<%
End If
 %>