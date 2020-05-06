<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_confirmsignature.ascx.vb" Inherits="socmovil.p_confirmsignature" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    Dim show_errorpass As Boolean = False
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("signature_transaction_valid_num") = viewclass.transaction
    
    If IsNothing(Request.QueryString) Then
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
    If IsNothing(Request.QueryString("d")) Then
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
    If Not IsNothing(Request.QueryString("ep")) Then
        show_errorpass = True
    End If
    
    
    Dim iddocument As String = ""
    If Not IsNothing(Request.QueryString("d")) Then
        iddocument = Request.QueryString("d")
    End If
    
%>
<div class="container text-center">
    <div>
        <span class="display-4">Confirmar Firma Electronica</span>
        <% If show_errorpass Then%>
        <div class="bg bg-danger text-white p-3 mt-2 mb-2 ">
           <span class="h4"> Contrase&ntilde;a no valida, por favor intente nuevamente.</span>
        </div>
        <% end if %>
        <div class="container ">
            <div class="row ">
                <%--Vista en miniatura del documento por el momento el boton de ver--%>
                <div class="col  mr-5 inline ">
                    <table style="height:100%; width:100%">
                        <tr>
                            <td>
                                <button type="button" class=" btn btn-primary btn-lg" id="btn_preview_<%=iddocument %>">ver </button>
                            </td>
                        </tr>
                    </table>
                      
                </div>
                <div class="col  pl-0 ">
                    <form action="supervisor/t_signdocument.aspx" method="post">
                    <div class="rounded bg p-3" style="background-color:#f1f2f6; border:1px solid #636e72; ">
                        <span class="h4">Teclee su constraseña de firma</span>
                        <div class="form-group mt-3">
                            <label for="password">Contraseña de Firma</label>
                            <input type="password" class="form-control text-center" id="password" name="password" placeholder="" required>
                            <button type="submit" class="btn btn-success btn-lg mt-3"> Aceptar </button>
                            <input type="hidden"  name="transacction" value="<%=enc_transaction_num%>" />
                            <input type="hidden" name="document" value="<%=iddocument%>" />
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("button[id*='btn_preview_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        window.open("document/t_loaddocument.aspx?d=" + values[2]);
    });
</script>