<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_confirmapproval.ascx.vb" Inherits="socmovil.p_confirmapproval" %>

<% 
    LoadConfiguration()
    LoadLanguage()

    
    Dim idDocument As Integer = -1
    Dim parentpage As String
    
    If Not IsNothing(Request.QueryString("d")) And Not IsNothing(Request.QueryString("pp")) Then
        Try
            idDocument = Integer.Parse(Base64Encoder.DecodeBase64(Request.QueryString("d")))
            parentpage = Base64Encoder.DecodeBase64(Request.QueryString("pp"))
        Catch ex As Exception
            Response.Redirect("../index.aspx")
        End Try
    Else
        Response.Redirect("../index.aspx")
    End If
    

    
%>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span class="display-4">
            &#191;Desea mandar el documento para aprobaci&oacute;n?
        </span>
        <div class="row mt-3">
            <div class="col">
                <button type="button" class="btn btn-primary" id="btn_showdocument_<%=Base64Encoder.EncodeBase64(idDocument)%>">Ver Documento</button>
                <br />
                <br />
            </div>
        </div>
        <div class="row mt-4">
            <div class="col text-right mr-4">
                <button type="button" class="btn btn-success text-white" style="width:170px;" id="btn_yes_<%=Base64Encoder.EncodeBase64(idDocument)%>">Si</button>
            </div>
            <div class="col text-left ml-4">
                <button type="button" class="btn btn-danger text-white" style="width:170px;">No</button>
            </div>
        </div>
    </div>
</div>
<script>
    $("button[id*='btn_showdocument_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        window.open("document/t_loaddocument.aspx?d=" + values[2]);
    });

    $("button[id*='btn_yes_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        document.location.href = "document/t_sendforapproval.aspx?d=" + values[2] +"&pp=<%=Base64Encoder.EncodeBase64(parentpage)%>";
    });
</script>