<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_confirmreject.ascx.vb" Inherits="socmovil.p_confirmreject" %>
<% 
    
    If IsNothing(Request.QueryString) Then
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
    If IsNothing(Request.QueryString("d")) Then
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
    Dim documentid As Integer

    Try
        Dim requested_Str = Request.QueryString("d")
        documentid = Integer.Parse(Base64Encoder.DecodeBase64(requested_Str))
    Catch ex As Exception
        Response.Redirect("index.aspx")
    End Try
    
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("rejectsignature_transaction_valid_num") = viewclass.transaction

%>
<div class="container text-center">
    <div class="mt-4 mb-4">
        <span class="display-4"> Confirmar Rechazo de Documento por firma</span>
    </div>
    <div class="h3 mt-5">
        <span>¿Desea rechazar documento?</span>
    </div>
    <div class="row mt-4 mb-5">
        <div class="col text-right mr-4">
            <button type="button" class="btn btn-success btn-lg" id="btn_yes_<%=Base64Encoder.EncodeBase64(documentid.ToString()) %>" >&nbsp;&nbsp;&nbsp;&nbsp;SI&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </div>
        <div class="col text-left ml-4">
            <button type="button" class="btn btn-danger btn-lg" id="btn_no" >&nbsp;&nbsp;&nbsp;&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </div>
    </div>
</div>
<script>
    $("#btn_no").click(function () {
        document.location.href = "index.aspx?p=supervisor/p_docforsig";
    });
    $("button[id*='btn_yes_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        document.location.href="supervisor/t_rejectdocument.aspx?d=" + values[2]+"&t=<%=enc_transaction_num%>";
    });
</script>
