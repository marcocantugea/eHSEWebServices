<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_confirmregistration.ascx.vb" Inherits="socmovil.p_confirmregistration" %>
<%
    'obtiene el lenguaje que esta en session y Obtiene la configuracion global
    
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim new_user As eservices_core.com.objects.UserObj
    
    If Not IsNothing(Me.Session("new_user")) Then
        new_user = CType(Me.Session("new_user"), eservices_core.com.objects.UserObj)
    Else
        Response.Redirect("index.aspx")
    End If
%>

<div class="container-fluid" id="view_desktop">
    <div class="container text-center">
        <div class="m-3">
            <span class="display-3" id="p_usreg_lbl_titlepage"><% Response.Write(lang_configreader.GetValue("p_confirmregistration_lblMain_Title")) %></span>
        </div>
        <div class="container border rounded-lg bg-light">
            <form id="frm_userreg" class="needs-validation" novalidate >
                <div class="row mb-3">
                        <div class="col">
                            <span class="display-4" id="p_usreg_lbl_titleform">
                                <% Response.Write(lang_configreader.GetValue("p_confirmregistration_lblMain_Subtitle")) %>
                            </span>
                        </div>
                 </div>
                <div class="row mb-3">
                        <div class="col">
                            <span class="lead">
                                <% Response.Write(lang_configreader.GetValue("p_confirmregistration_lblMain_completename")) %>
                            </span>
                        </div>
                 </div>
                <div class="row mb-3 ">
                    <div class="col-lg">        
                        <span class="h3 border p-2" style="background-color:lightyellow">
                            <% Response.Write(new_user.InfoUserObj.Nombre)%>&nbsp; <% Response.Write(new_user.InfoUserObj.apellido_pat)%>&nbsp;<% Response.Write(new_user.InfoUserObj.apellido_mat)%>
                        </span>
                    </div>
                </div>
                <div class="row mb-3">
                        <div class="col-lg mb-3">
                            <span class="lead">
                                <%Response.Write(lang_configreader.GetValue("p_confirmregistration_lblMain_email")) %>
                            </span>
                            <div class="">
                                <%--<input type="email" class="form-control" placeholder="email" name="email" id="email" required>
                                <div class="invalid-feedback">
                                    ingrese correctamente su correo electronico.
                                </div>--%>
                                <span class="h3 border p-1" style="background-color:lightyellow">

                                     <% Response.Write(new_user.user_email )%>
                                </span>
                            </div>
                        </div>
                    <div class="col-lg">
                            <span class="lead">
                              <% Response.Write(lang_configreader.GetValue("p_confirmregistration_lblMain_userlogin")) %>
                            </span>
                        <div class="">
                            <%--<input type="text" class="form-control" placeholder="Numero de empleado" id="user" name="userlogin" required>
                            <div class="invalid-feedback">
                                Ingrese su numero de empleado.
                            </div>--%>
                            <span class="h3 border p-1" style="background-color:lightyellow">

                                     <% Response.Write(new_user.UserInfoCompanyObj.employeenum )%>
                                </span>
                        </div>
                        </div>
                 </div>
                <div class="row m-2">
                        <div class="col-lg text-right p-4">
                          <button type="button" id="btn_back" class="form-control btn btn-block btn-danger" > <% Response.Write(lang_configreader.GetValue("lbl_back")) %></button>
                        </div>
                     <%--<div class="col-sm text-left p-4">
                            
                        </div>--%>
                     <div class="col-lg text-left p-4">
                            <button type="button" id="btn_save" class="form-control btn btn-block btn-success" > <% Response.Write(lang_configreader.GetValue("lbl_save")) %></button>
                        </div>
                 </div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#btn_back").click(function () {
        document.location.href = "index.aspx?p=usrregistration/p_userregistration"

    });
    $("#btn_save").click(function () {
        document.location.href = "usrregistration/t_saveuserreg.aspx"

    });
</script>