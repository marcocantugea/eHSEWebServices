<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_messagesavereg.ascx.vb" Inherits="socmovil.p_messagesavereg" %>
<%

    ''obtiene el lenguaje que esta en session y Obtiene la configuracion global
    LoadConfiguration()
    LoadLanguage()

    
    Dim lbl As String
    Dim type_msg As String = ""
    Dim error_msg As Boolean = False

    If Not IsNothing(Request.QueryString("m")) And Not IsNothing(Request.QueryString("t")) Then
        lbl = Base64Encoder.DecodeBase64(Request.QueryString("m"))
        type_msg = Request.QueryString("t")
        If type_msg.Equals("e") Then
            error_msg = True
        End If
        
        If type_msg.Equals("c") Then
            Me.Session("new_user")=Nothing 
        End If
    Else
        Response.Redirect("index.aspx")
    End If
    
%>

<div class="container-fliud text-center">
    <div class="container mt-3 mb-3">
        <span class="display-4 ">
            <%Response.Write(Pagelang_configreader.GetValue("p_messagesavereg_lblmain_title"))%>
        </span>
    </div>
    <div class="container " id="message">
        <span class="h4">
            <%Response.Write(Pagelang_configreader.GetValue(lbl))%>
        </span>
    </div>
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col">
                <% If error_msg Then%>
                 <button type="button" class="btn btn-danger btn-block" id="btn_backtoregister" ><%Response.Write(Pagelang_configreader.GetValue("p_messagesavereg_lblmain_btnback"))%></button>
                <% End If%>
            </div>
            <div class="col">
                <button type="button"  class="btn btn-primary btn-block" id="btn_confirmar"><%Response.Write(Pagelang_configreader.GetValue("lbl_ok"))%></button>
            </div>
            <div class="col">

            </div>
        </div>
    </div>
</div>

<script>


<% If error_msg Then%>
    $("#btn_backtoregister").click(function () {
        document.location.href = "index.aspx?p=usrregistration/p_userregistration"
    });
<% End If%>

    $("#btn_confirmar").click(function () {
        document.location.href = "index.aspx"
    });
</script>