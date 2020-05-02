<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_userregistration.ascx.vb" Inherits="socmovil.p_userregistration" %>
<%
    'obtiene el lenguaje que esta en session y Obtiene la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("transaction_valid_num") = viewclass.transaction
    
    Dim showinfo As Boolean = False
    Dim new_user As eservices_core.com.objects.UserObj
    If Not IsNothing(Me.Session("new_user")) Then
        new_user = CType(Me.Session("new_user"), eservices_core.com.objects.UserObj)
        showinfo = True
    End If
    
    'carga la lista de empleados
   
    Dim EmployeeList As New Dictionary(Of String, String)
    
    UnitOfWork.UserUtilities.GetEmployeeNumberList(EmployeeList)
    
%>
<div class="container-fluid" id="view_desktop">
    <div class="container text-center">
        <div class="m-3">
            <span class="display-3" id="p_usreg_lbl_titlepage"><%GetLbl("p_userregistration_lblMain_Title")%></span>
        </div>
        <div class="container border rounded-lg bg-light">
            <form id="frm_userreg" class="needs-validation" method="post"  action="usrregistration/t_confirmtrans.aspx" novalidate >
                <div class="row mb-3">
                        <div class="col">
                            <span class="display-4" id="p_usreg_lbl_titleform">
                                <% GetLbl("p_userregistration_lblMain_Subtitle")%>
                            </span>
                        </div>
                 </div>
                <div class="row mb-3">
                        <div class="col text-left">
                            <span class="lead">
                                <%GetLbl("p_userregistration_lblcompleteName")%>
                            </span>
                        </div>
                 </div>
                <div class="row mb-3 ">
                    <div class="col-lg">
                        <input type="text" class="form-control m-1" placeholder="<%GetLbl("p_userregistration_inputplaceholder_names")%>" name="name" id="name" required value="<%If showinfo Then Response.Write(new_user.InfoUserObj.Nombre)%>" >
                        <div class="invalid-feedback">
                            <% GetLbl("p_userregistration_inputinvalid_names")%>
                        </div>
                    </div>
                    <div class="col-lg">
                        <input type="text" class="form-control m-1" placeholder="<%GetLbl("p_userregistration_inputplaceholder_lastname1")%>" id="lastname1" name="lastname1" required  value="<%If showinfo Then Response.Write(new_user.InfoUserObj.apellido_pat)%>" >
                        <div class="invalid-feedback m-1">
                            <%GetLbl("p_userregistration_inputinvalid_lastname1")%>
                        </div>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control m-1" placeholder="<%GetLbl("p_userregistration_inputplaceholder_lastname2")%>" id="lastname2" name="lastname2"   value="<%If showinfo Then Response.Write(new_user.InfoUserObj.apellido_mat)%>">
                        <div class="invalid-feedback">
                            <% GetLbl("p_userregistration_inputinvalid_lastname2")%>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                        <div class="col-lg text-left mb-3">
                            <span class="lead">
                               <% GetLbl("p_userregistration_lblemail")%>
                            </span>
                            <div class="text-left">
                                <input type="email" class="form-control" placeholder="<% GetLbl("p_userregistration_inputplaceholder_email")%>" name="email" id="email" required value="<%If showinfo Then Response.Write(new_user.user_email)%>">
                                <div class="invalid-feedback">
                                    <% GetLbl("p_userregistration_inputinvalid_email")%>
                                </div>
                            </div>
                        </div>
                    <div class="col-lg text-left">
                            <span class="lead">
                              <% GetLbl("p_userregistration_lbluserlogin")%>
                            </span>
                        <div class="text-left">
                            <input type="text" class="form-control" placeholder="<% GetLbl("p_userregistration_inputplaceholder_userlogin")%>" id="user" name="userlogin" required value="<%If showinfo Then Response.Write(new_user.UserInfoCompanyObj.employeenum)%>">
                            <div class="invalid-feedback">
                                <% GetLbl("p_userregistration_inputinvalid_userlogin")%>
                            </div>
                        </div>
                        </div>
                 </div>
                <div class="row mb-3">
                    <div class="col text-left">
                        <span class="lead">
                            <% GetLbl("p_userregistration_lblnewpassword")%>
                        </span>
                        <div class="text-left">
                            <input type="password" class="form-control" placeholder="<% GetLbl("p_userregistration_inputplaceholder_newpassword")%>" id="password" name="password" required>
                            <div class="text-danger" id="lbl_nomatchpass">
                                <% GetLbl("p_userregistration_inputinvalid_newpassword")%>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm text-left">
                        <span class="lead">
                            <% GetLbl("p_userregistration_lblconfirmpassword")%>
                        </span>
                        <div class="text-left">
                            <input type="password" class="form-control" placeholder="<% GetLbl("p_userregistration_inputplaceholder_newpassword")%>" id="passwordval" required>
                            <div class="text-danger" id="lbl_nomatchpass2">
                                <% GetLbl("p_userregistration_inputinvalid_invalidconfirmpassword")%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm">
                        <div class="col text-left ml-2">
                            <input class="form-check-input" type="checkbox" id="showpass" value="showpass">
                            <label class="form-check-label" for="showpass"><% GetLbl("p_userregistration_inputcheck_showpass")%></label>
                        </div>
                    </div>
                </div>
                <div class="row m-2">
                        <div class="col text-left p-4">
                          
                        </div>
                     <div class="col text-left p-4">
                            
                        </div>
                     <div class="col text-left p-4">
                            <button type="submit" id="btn_continue" class="form-control btn btn-primary" > <%GetLbl("lbl_continue")%></button>
                            <input type="hidden"  id="transaction" value="<%Response.Write(enc_transaction_num)%>" name="transaction" />
                        </div>
                 </div>
            </form>
        </div>
    </div>
</div>

<script>
    var names_emp = [<%
    Dim index As Integer = 0
    For Each item As KeyValuePair(Of String, String) In EmployeeList
       
        If index <= 0 Then
            Response.Write("""" & item.Key & "|" & item.Value & """")
        Else
            Response.Write(",""" & item.Key & "|" & item.Value & """")
        End If
       
        index = index + 1
    Next
    %>];
    var arr_found = new Array();
    $("#name").change(function () {
        foundEmpNum()
    });

    $("#lastname1").change(function () {
        foundEmpNum()
    });

    function foundEmpNum() {
        $("#user").attr("readonly", false);
        $("#user").val("");
        arr_found = new Array();
        var value_name_sel = $("#name").val();
        var value_lastname_sel = $("#lastname1").val();

        if (value_name_sel != null && value_lastname_sel != null) {

            var value_sel = value_name_sel.toUpperCase() + " " + value_lastname_sel.toUpperCase();
            var found = false;
            for (var i = 0; i < names_emp.length && !found; i++) {
                if (names_emp[i].includes(value_sel)) {
                    arr_found.push(names_emp[i]);
                }
            }
            //alert(arr_found)
        }

        if (arr_found.length == 1) {
            var values = arr_found[0].split("|");
            $("#user").val(values[1]);
            $("#user").attr("readonly",true);
        }

       
    }

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    var cont1 = $("#password").val();
                    var cont2 = $("#passwordval").val();
                    var passequal = false;

                    if (cont1 == cont2) {
                        passequal = true;
                    }

                    if (!passequal) {
                        $("#password").css("border-color", "red");
                        $("#passwordval").css("border-color", "red");
                        $("#lbl_nomatchpass").show();
                        $("#lbl_nomatchpass2").show();

                        event.preventDefault();
                        event.stopPropagation();

                    } else {
                        $("#password").css("border-color", "green");
                        $("#passwordval").css("border-color", "green");
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
    $(document).ready(function () {
        $("#lbl_nomatchpass").hide();
        $("#lbl_nomatchpass2").hide();

    });

    $("#showpass").click(function () {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }

        var y = document.getElementById("passwordval");
        if (y.type === "password") {
            y.type = "text";
        } else {
            y.type = "password";
        }


    });    


</script>