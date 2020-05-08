<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_signeddocumentsuccess.ascx.vb" Inherits="socmovil.p_signeddocumentsuccess" %>

<%

    LoadLanguage()
    
    If IsNothing(Request.QueryString) Then
        Response.Redirect("../index.aspx")
    End If
    
    If IsNothing(Request.QueryString("d")) Then
        Response.Redirect("../index.aspx") 
    End If
    
    Dim iddocument As Integer
    Dim document As eservices_core.com.objects.DocumentObj
    Dim traopen As etra.com.objects.TRAObj
    Try
        iddocument = Integer.Parse(Base64Encoder.DecodeBase64(Request.QueryString("d")))
        traopen = UnitOfWork.Documents.GetDocumentByID(iddocument)
        traopen.LoadInfoByID()
        
    Catch ex As Exception
        'Response.Redirect("../index.aspx")
    End Try
    
   
 %>
<div class="container text-center">
    <div class="mt-3">
        <span class="display-4"> <%GetLbl("p_signeddocumentsuccess_lblmaintitle") %></span>
    </div>
    <div class="row text-right" >
        <div class="col"> 
            <div class="mt-3 mr-5">
                <img src="../images/document-approval-signed.gif" style="height:250px" />
            </div>
        </div>
        <div class="col text-center">
            <table style="height:100%; width:100%">
                <tr>
                    <td>
                        <span class="h3"><%GetLbl("p_signeddocumentsuccess_lblsubtitle")%>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="btn btn-success btn-lg" id="btn_viewsigneddoc"> <%GetLbl("p_signeddocumentsuccess_button_previwedoc") %></button> 
                    </td>
                </tr>
                 <tr>
                    <td>
                        <button type="button" class="btn btn-warning btn-lg" id="btn_printsigneddoc"> <%GetLbl("p_tras_lbl_btn_Print") %></button> 
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
 <script>
     $("#btn_viewsigneddoc").click(function () {
         window.open("tra/TRAFormat.aspx?tra_id=<%=Base64Encoder.EncodeBase64(traopen.tra_ID)%>")
     });
     $("#btn_printsigneddoc").click(function () {
         window.open("tra/TRAFormat.aspx?tra_id=<%=Base64Encoder.EncodeBase64(traopen.tra_ID)%>&printview=true")
     });

     
 </script>