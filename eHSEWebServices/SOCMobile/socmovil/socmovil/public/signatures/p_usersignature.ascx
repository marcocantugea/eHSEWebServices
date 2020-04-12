<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_usersignature.ascx.vb" Inherits="socmovil.p_usersignature" %>
<% 
    'obtiene el lenguaje que esta en session y la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    'valida transaccion
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("signature_transaction_valid_num") = viewclass.transaction
    
    Dim user_hassignature As Boolean = False
    Dim show_error As Boolean = False
    If Not IsNothing(SessionUser.UserObjSession.eSignature) And SessionUser.UserObjSession.idsignature > 0 Then
        user_hassignature = True
    End If
    
    If Not IsNothing(Request.QueryString("e")) Then
        show_error = True
    End If
    
%>
<div class="container-fluid text-center" >
    <div class="container mt-3 mb-4">
        <span class="display-4">
            <%GetLbl("p_usersignature_lbl_maintitle")%>
        </span>
    </div>
    <% If show_error Then%>
    <div class="container bg-danger rounded text-white p-3 mt-2 mb-2">
        <span class="h4"><%GetLbl("p_usersignature_lbl_errormessage") %></span>
    </div>
    <% End If%>
    <% If Not SessionUser.UserObjSession.AgreeSignatureTerms Then%>
<%--Condiciones de uso de firma electronica--%>
    <div class="lead" id="conditions_of_use">
        <% If  Me.Session("LANG").Equals("ES") Then%>
        <div class="h4">
            Condiciones de uso.
        </div>
        <div class="container wrap text-left text-justify">
            <p>La funcionalidad de firma electrónica, es una herramienta con la ayuda de crear procesos digitales confiables, el uso de esta firma limita solamente a los documentos generados por la aplicación y son autorizados por el usuario. 
Para la validez de esta firma, la aplicación tiene métodos de seguridad que constan que el usuario es valido y puede utilizar la firma digital por esta plataforma. </p>
            <p>
                Procesos de seguridad.<br /><br />
Esta aplicación cuenta con las siguientes procesos para la seguridad de la firma electrónica mediante esta plataforma.
            </p>
            <ol>
                <li>Firmas digitales encryptadas<br />
                    Todas las firmas almacenadas en esta plataforma cuenta con un método de enctryptacion de 32 bits para almacenar los archivos binarios, lo cual solo esta aplicación puede abrir la firma mediante una contraseña  que defina el usuario.</li>
                <li>
                    Firma de documentos por contraseña de usuario<br />
                    Cada vez que el usuario firme algún documento digital por medio de esta plataforma, deberá ingresar la contraseña de la firma electrónica.
                </li>
                <li>
                    Registros de aprobación de documentos<br />
                    Se mantendrá los registros de cada documento que el usuario firme y se le mostrara mediante la aplicación los documentos firmados 
                </li>
            </ol>
        </div>
        <div>
            <span class="h4 mb-2">
                Limitaciones de uso.
            </span>
            <div class="container wrap text-left text-justify">
                <ol>
                    <li>
                        La firma electrónica solo sera disponible para aquellos documentos que lo solicite y estén definidos dentro de esta aplicación.
                    </li>
                    <li>
                        La firma solo sera usada por el usuario que acepte estas condiciones de uso de esta aplicación.
                    </li>
                    <li>
                        La firma electrónica requerir una contraseña para poder ser utilizada dentro de la aplicación.
                    </li>
                    <li>
                        La firma no puede ser modificada por medio de esta aplicación o por el usuario, si el usuario desea cambiarla tendrá que eliminarla y volver a crear una firma nueva.
                    </li>
                    <li>
                        La firma solo esta disponible para los usuarios con alguna responsabilidad en los procesos de autorización de documentos dentro de la aplicación.
                    </li>
                    <li>
                        Los Administradores del sistema tienen la facultad de eliminar las firmas electrónicas como parte del mantenimiento del sistema si un usuario es dado de baja en la aplicación. 
                    </li>
                    <li>
                        Los administradores del sistema no cuenta con la facultad de poder modificar la firma electrónica. 
                    </li>
                    <li>
                        No se hace responsable el mal uso de esta firma si el usuario comparte sus contraseñas y son utilizadas de mala fe.
                    </li>
                    <li>
                        La firma es una referencia gráfica de que el documento paso por un proceso de validación digital.
                    </li>
                </ol>
                <p>
                    Al aceptar estas condiciones de uso , el usuario podrá utilizar la aplicación para firmar cualquier documento y su firma sera digitalizada y encryptada para la seguridad de la misma y solo sera disponible al momento del uso que la aplicación lo requiera.
Esta firma digital es la responsabilidad de usuario hacer adecuado uso para la firma de documento dentro de esta aplicación.
                </p>
            </div>
        </div>
        <form id="frm_agreeconditions" method="post" action="signatures/t_agreeconditions.aspx">
        <div class="form-check text-center mt-4 ">
            <input id="chkagree" type="checkbox"  class="form-check-input" value="agreeterms" name="agreeterms" />
            <label class="form-check-label" for="chkagree"  >Acepto las condiciones de uso de la firma electrónica en esta aplicación.</label>
        </div>
        <div class="mt-5 mb-5" >
            <input type="hidden"   name="transaction" value="<%Response.Write(enc_transaction_num) %>"/>
            <button type="submit"  class="btn btn-success" style="height:55px" id="btn_continuar">Continuar</button>
        </div>
        </form>
        <% End If%>
        <% If Not IsNothing(Me.Session("LANG")) And Me.Session("LANG").Equals("EN") Then%>
        <div class="h4">
            Terms of use.
        </div>
        <div class="container wrap text-left text-justify">
            <p>
                The electronic signature functionality is a tool with the help of creating reliable digital processes, 
                the use of this signature is limited only to the documents generated by the application and are authorized by 
                the user. For the validity of this signature, the application has security methods that confirm that the user is 
                valid and can use the digital signature on this platform.
            </p>
            <p>
                Security process<br /><br />
                This application has the following processes for the security of the electronic signature through this platform.
            </p>
            <ol>
                <li>Encrypted digital signatures<br />
                    All the signatures stored on this platform have a 32-bit encryption method to store the binary files, which 
                    only this application can open the signature with a password defined by the user.

                </li>
                <li>
                    Document signing by user password<br />
                    Every time the user signs a digital document through this platform, they must enter the password of 
                    the electronic signature.
                </li>
                <li>
                    Document approval records<br />
                    The records of each document that the user signs will be kept and the signed documents will be 
                    shown through the application.
                </li>
            </ol>
        </div>
        <div>
            <span class="h4 mb-2">
                Limitations of use.
            </span>
            <div class="container wrap text-left text-justify">
                <ol>
                    <li>
                        The electronic signature will only be available for those documents that request it and are
                         defined within this application.
                    </li>
                    <li>
                        The signature will only be used by the user who accepts these conditions of use of this application.
                    </li>
                    <li>
                        The electronic signature requires a password to be used within the application.
                    </li>
                    <li>
                       The signature cannot be modified through this application or by the user, if the user wants to change it, 
                        they will have to delete it and recreate a new signature.
                    </li>
                    <li>
                        The signature is only available to users with some responsibility in the document authorization processes 
                        within the application.
                    </li>
                    <li>
                        System Administrators have the access to remove electronic signatures as part of system maintenance if a 
                        user is unsubscribed from the application.
                    </li>
                    <li>
                       System administrators do not have the power to modify the electronic signature.
                    </li>
                    <li>
                        The misuse of this signature is not responsible if the user shares their passwords and they are used in
                         bad faith.
                    </li>
                    <li>
                        The signature is a graphic reference that the document went through a digital validation process.
                    </li>
                </ol>
                <p>
                    By accepting these conditions of use, the user will be able to use the application to sign any document and their signature will be digitized and encrypted for its security and will only be available when the application requires it. This digital signature is the responsibility of the user to make appropriate use for the document signature within this application.
                </p>
            </div>
        </div>
        <form id="frm_agreeconditions" method="post" action="signatures/t_agreeconditions.aspx">
        <div class="form-check text-center mt-4 ">
            <input id="chkagree" type="checkbox"  class="form-check-input" value="agreeterms" name="agreeterms" />
            <label class="form-check-label" for="chkagree"  >I accept the terms of use of the electronic signature in this application.</label>
        </div>
        <div class="mt-5 mb-5" >
            <input type="hidden"   name="transaction" value="<%Response.Write(enc_transaction_num) %>"/>
            <button type="submit"  class="btn btn-success" style="height:55px" id="btn_continuar">Continue</button>
        </div>
        </form>
        <% End If%>
    </div>
    <% end if %>
<%--Configuracion de firma--%>
    <% If Not user_hassignature And SessionUser.UserObjSession.AgreeSignatureTerms Then%>
    <div class="container text-center">
        <div  id="p_usersignature_fillform"  class="container border border-primary rounded" style="background-color:#f1f2f6;">
            <span class="h5"><%GetLbl("p_usersignature_lbl_subtitleform")%></span>
            <div class="container text-left mt-3 mb-3 " style="" >
                 <span class="lead"><%GetLbl("p_usersignature_lbl_textselectfile")%></span><br />
                 <p class="bolder"></p>
                <p><% GetLbl("p_usersignature_lbl_textspecsfile")%></p>
                    <ol>
                        <li><%GetLbl("p_usersignature_lbl_textspecsfile1") %></li>
                        <li><% GetLbl("p_usersignature_lbl_textspecsfile2") %></li>
                    </ol>
                
                <form>
                    <div class="form-group">
                        <label for="file_esig"><% GetLbl("p_usersignature_input_lblfileselect") %></label>
                        <input type="file" class="form-control-file" id="file_esig" accept="image/png" >
                    </div>
                </form>
                <div class="mt-2 mb-2 text-center bg-white rounded">
                      <img src="" id="img" width="200" height="100">
                    <div class="bg-danger text-white p-3" id="error_image_upload">
                       <% GetLbl("p_usersignature_lbl_erroruploadfile") %>
                    </div>
                </div>
            </div>
            <form id="frm_newsignaturepassword" class="needs-validation" method="post" action="signatures/t_savesignature.aspx" novalidate >
                <div class="container text-left mt-3 mb-3 border">
                    <span class="lead"><% GetLbl("p_usersignature_lbl_newpass") %></span><br />
                    <div class="form-group mt-3">
                        <label for="password"><%GetLbl("p_useraccount_input_newpassword")%></label>
                        <input type="password" class="form-control text-center" id="password" name="password" placeholder="" required>
                        <div class="text-danger" id="lbl_nomatchpass">
                            <% GetLbl("p_userregistration_lblconfirmpassword")%>
                        </div>
                        <div class="invalid-feedback">
                            <% GetLbl("p_userregistration_lblconfirmpassword")%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password"><%GetLbl("p_useraccount_input_confirmpassword")%></label>
                        <input type="password" class="form-control text-center" id="passwordconf" name="passwordconf" placeholder="" required>
                        <div class="text-danger" id="lbl_nomatchpass2">
                            <% GetLbl("p_userregistration_inputinvalid_invalidconfirmpassword")%>
                        </div>
                        <div class="invalid-feedback">
                            <% GetLbl("p_userregistration_lblconfirmpassword")%>
                        </div>
                    </div>

                </div>
                <div class="mt-3 mb-3">
                    <input type="hidden"  name="transaction" value="<% Response.Write(enc_transaction_num) %>" />
                     <input type="hidden" id="fileinput" name="filepath" value="" />
                    <button type="submit" class="btn btn-primary btn-lg "><% GetLbl("lbl_save") %> </button>
                </div>
            </form>
        </div>
    </div>
    <% End If  %>
    <% If user_hassignature Then%>
    <div>
        <div  id="p_usersignature_updateform"  class="container border border-primary rounded" style="background-color:#f1f2f6;">
             <span class="h5"><% GetLbl("p_usersignature_lbl_subtitleform") %></span>
            <div class="mt-3 mb-3">
                <span class="lead"><% GetLbl("p_usersignature_lbl_showsignature") %></span>
            </div>
             <div class="container text-center mt-3 mb-3" style="" >
                 <img src="signatures/img_signature.aspx" />
            </div>
            <div class="container text-center mt-4 mb-3" style="" >
                <button type="button" class="btn btn-warning text-white" id="btn_update_signature"> <% GetLbl("p_usersignature_btn_changesignature") %></button>
            </div>
        </div>
        
    </div>
    <% End If%>
</div>
<script>
    $("#btn_update_signature").click(function () {
        document.location.href="signatures/t_updatesignature.aspx"
    });
    $("div[id*='lbl_nomatchpass']").hide();
    $("#img").hide();
    $("#error_image_upload").hide();
    $("#btn_continuar").prop("disabled", true);
    $("#chkagree").click(function () {
        var disablebutton = $("#btn_continuar").prop("disabled")
        if (disablebutton) {
            $("#btn_continuar").prop("disabled", false);
        }
    });
    $("#file_esig").change(function () {
        $("#error_image_upload").hide();
        var fd = new FormData();
        var files = $(this)[0].files[0];
        fd.append('file', files);
        $.ajax({
            url: 'signatures/t_uploadimage.aspx',
            type: 'post',
            data: fd,
            contentType: false,
            processData: false,
            success: function (response) {
                if (response != 0) {
                    $("#img").attr("src", response);
                    $("#img").show();

                } else {
                    $("#error_image_upload").show();
                }
                
            },
        });
    });

    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    var cont1 = $("#password").val();
                    var cont2 = $("#passwordconf").val();
                    var passequal = false;

                    if (cont1 == cont2) {
                        passequal = true;
                    }

                    if (!passequal) {
                        $("#password").css("border-color", "red");
                        $("#passwordconf").css("border-color", "red");
                        $("#lbl_nomatchpass").show();
                        $("#lbl_nomatchpass2").show();

                        event.preventDefault();
                        event.stopPropagation();

                    } else {
                        $("#password").css("border-color", "green");
                        $("#passwordconf").css("border-color", "green");
                        $("#lbl_nomatchpass").hide();
                        $("#lbl_nomatchpass2").hide();
                    }

                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>