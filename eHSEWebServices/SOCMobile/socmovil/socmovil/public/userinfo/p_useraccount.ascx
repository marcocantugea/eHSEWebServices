<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_useraccount.ascx.vb" Inherits="socmovil.p_useraccount" %>
<% 
    
    'obtiene el lenguaje que esta en session y la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    'Se integro la session de usuario en el codebehind
    'Dim SessionUser As New socmovil.UserStateClass(Me.Session, Response)
    
    'Carga la listas de opciones
    Dim list_companies As New List(Of eservices_core.com.objects.CompanyObj)
    Dim list_workunits As New List(Of eservices_core.com.objects.WorkUnitObj)
    Dim list_deparment As New List(Of eservices_core.com.objects.DeparmentsObj)
    Dim list_categories As New List(Of eservices_core.com.objects.CategoryObj)

    
    UnitOfWork.Company.GetAllCompanies(list_companies)
    UnitOfWork.WorkUnit.GetWorkUnits(list_workunits)
    UnitOfWork.Deparments.GetDeparments(list_deparment)
    UnitOfWork.Category.GetCategories(list_categories)

    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("transaction_valid_num") = viewclass.transaction
    
    Dim show_pwderror_message As Boolean = False
    Dim show_pwdsuccess_message As Boolean = False
    Dim show_infoerror_message As Boolean = False
    Dim show_infosuccess_message As Boolean = False
    
    If Not IsNothing(Request.QueryString("pe")) Then
        show_pwderror_message = True
    End If
    If Not IsNothing(Request.QueryString("ps")) Then
        show_pwdsuccess_message = True
    End If
    
    If Not IsNothing(Request.QueryString("ie")) Then
        show_infoerror_message = True
    End If
    If Not IsNothing(Request.QueryString("is")) Then
        show_infosuccess_message = True
    End If
    
%>

<div class="container-fluid text-center">
    <div class="mt-2 mb-2">
        <span class="display-4">
            <% GetLbl("p_useraccount_lblMain")%>
        </span>
        <br /><br />
        <% If show_pwderror_message Then%>
        <div class="container bg bg-danger h4 text-white p-2">
           <% GetLbl("p_useraccount_lblerror")%>
        </div>
        <% End If%>
        <% If show_pwdsuccess_message Then%>
        <div class="container bg bg-success h4 text-white p-2">
           <% GetLbl("p_useraccount_lblsuccess") %>
        </div>
        <% End If  %>
        <% If show_infoerror_message Then%>
        <div class="container bg bg-danger h4 text-white p-2">
            <%GetLbl("p_useraccount_lblerror_info") %>
        </div>
        <% End If%>
        <% If show_infosuccess_message Then%>
        <div class="container bg bg-success h4 text-white p-2">
            <%GetLbl("p_useraccount_lblsuccess_info")%> 
        </div>
        <% End If  %>
        <span class="h4">
            <% Response.Write(SessionUser.UserObjSession.FullName & "  ")%>
        </span>
    </div>
    <div class="container border rounded border-primary" style="background-color:#f1f2f6;">
        <div class="row">
            <div class="col pt-3 pb-3">
                <div class="">
                    <span class="h4">
                        <%GetLbl("p_useraccount_lblpass_subtitle")%>
                    </span>
                </div>
                <div class="mt-3">
                    <form id="frm_changepass" class="needs-validation" method="post" action="userinfo/t_changepass.aspx" novalidate>
                        <span class="lead">
                            <%GetLbl("p_useraccount_lblpass_text") %>
                        </span>
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
                            <label for="password"><%GetLbl("p_useraccount_input_confirmpassword") %></label>
                            <input type="password" class="form-control text-center" id="passwordconf" name="passwordconf" placeholder="" required>
                            <div class="text-danger" id="lbl_nomatchpass2">
                                <% GetLbl("p_userregistration_inputinvalid_invalidconfirmpassword") %>
                            </div>
                            <div class="invalid-feedback">
                                 <% GetLbl("p_userregistration_lblconfirmpassword")%>
                            </div>
                        </div>
                        <div class="container text-left ">
                            <div class="form-group form-check-inline">
                                <input type="checkbox" class="form-check-input" id="showpassword" />
                                <label class="form-check-label" for="showpassword"><%GetLbl("p_useraccount_input_showpassword")%></label>
                            </div>
                        </div>
                        
                        <input type="hidden" name="transaction" value="<%Response.Write(enc_transaction_num) %>" />
                        <button type="submit" class="btn btn-primary btn-block"><%GetLbl("p_useraccount_button_showpassword")%></button>
                    </form>
                </div>
            </div>
            <div class="col-lg border-left border-primary pt-3">
                <span class="h4 ">
                        <%GetLbl("p_useraccount_lbl_companyinfo") %>
                    </span>
                <div>
                    <form method="post" action="userinfo/t_updateusercompanyinfo.aspx">
                         <div class="form-group mt-3 text-left">
                            <label class="" for="cmb_company"><%GetLbl("p_useraccount_input_company")%></label>
                            <select class="form-control" id="cmb_company" name="company">
                                <option selected  value="-1"></option>
                                <%
                                    
                                    If list_companies.Count > 0 Then
                                        For Each company As eservices_core.com.objects.CompanyObj In list_companies
                                            Dim selectedoption As String = ""
                                            Dim idcompany As Integer = SessionUser.UserObjSession.UserInfoCompanyObj.idCompany
                                            If Not IsNothing(idcompany) And idcompany > 0 And company.idCompany.Equals(idcompany) Then
                                                selectedoption = "selected"
                                            Else
                                                If company.idCompany = PageGlobalConfigReader.GetValue("DefaultIdCompany") Then
                                                    selectedoption = "selected"
                                                End If
                                            End If
                                            
                                            %>
                                <option <%Response.Write(selectedoption)%> value="<%Response.Write(company.idCompany)%>" ><% Response.Write(company.CompanyName)%></option>
                                            <%
                                        Next
                                    End If
                                %>
                            </select>
                        </div>
                        <div class="form-group mt-3 text-left">
                            <label class="" for="cmb_company"><% GetLbl("p_useraccount_input_workunit")%></label>
                            <select class="form-control" id="cmb_workunit" name="workunit" disabled >
                                <option  value="-1"></option>
                                <%
                                    
                                    If list_workunits.Count > 0 Then
                                        For Each unit As eservices_core.com.objects.WorkUnitObj In list_workunits
                                            Dim selectedoption As String = ""
                                            Dim idunit As Integer = SessionUser.UserObjSession.UserInfoCompanyObj.idWorkUnit
                                            If Not IsNothing(idunit) And idunit > 0 And idunit.Equals(unit.idWorkUnit) Then
                                                selectedoption = "selected"
                                            Else
                                                If unit.idWorkUnit = PageGlobalConfigReader.GetValue("DefaultIDWorkUnit") Then
                                                    selectedoption = "selected"
                                                End If
                                            End If
                                            
                                            %>
                                <option <%Response.Write(selectedoption)%> value="<%Response.Write(unit.idWorkUnit)%>" ><% Response.Write(unit.UnitName)%></option>
                                            <%
                                        Next
                                    End If
                                %>
                            </select>
                        </div>
                        <div class="form-group mt-3 text-left">
                            <label class="" for="cmb_company"><%GetLbl("p_useraccount_input_deparment") %></label>
                            <select class="form-control" id="cmb_Deparment" name="deparment" >
                                <option selected  value="-1"></option>
                                <%
                                    
                                    If list_deparment.Count > 0 Then
                                        For Each deparment As eservices_core.com.objects.DeparmentsObj In list_deparment
                                            Dim selectedoption As String = ""
                                            Dim iddeparment As Integer = SessionUser.UserObjSession.UserInfoCompanyObj.idDeparment
                                            If Not IsNothing(iddeparment) And iddeparment > 0 And iddeparment.Equals(deparment.idDeparment) Then
                                                selectedoption = "selected"
                                            End If
                                            %>
                                <option <%Response.Write(selectedoption)%> value="<%Response.Write(deparment.idDeparment)%>" ><% Response.Write(deparment.DeparmentName)%></option>
                                            <%
                                        Next
                                    End If
                                %>
                            </select>
                        </div>
                        <div class="form-group mt-3 text-left">
                            <label class="" for="cmb_company"><%GetLbl("p_useraccount_input_category")%></label>
                            <select class="form-control" id="cmb_category" name="category" >
                                <option selected  value="-1"></option>
                                <%                             
                                    If list_categories.Count > 0 Then
                                        For Each category As eservices_core.com.objects.CategoryObj In list_categories
                                            Dim selectedoption As String = ""
                                            Dim idcategory As Integer = SessionUser.UserObjSession.UserInfoCompanyObj.idcategory
                                            If Not IsNothing(idcategory) And idcategory > 0 And idcategory.Equals(category.idcategory) Then
                                                selectedoption = "selected"
                                            End If
                                            %>
                                <option <%Response.Write(selectedoption) %> value="<%Response.Write(category.idcategory)%>" ><% Response.Write(category.Category_ES)%></option>
                                            <%
                                        Next
                                    End If
                                %>
                            </select>
                        </div>
                        <div class="form-group mt-3 text-left">
                            <label class="" for="cmb_company"><%GetLbl("p_useraccount_input_guard")%></label>
                            <input type="text" id="guard" name="guard" class="form-control" value="<% If Not IsNothing(SessionUser.UserObjSession.UserInfoCompanyObj.guard) Then Response.Write(SessionUser.UserObjSession.UserInfoCompanyObj.guard)%>" />
                        </div>
                        <input type="hidden" name="transaction"  value="<%Response.Write(enc_transaction_num)%>" />
                        <button type="submit" class="btn btn-success btn-block mb-3" ><%GetLbl("p_useraccount_button_update") %></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
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

    $(document).ready(function () {
        $("#lbl_nomatchpass").hide();
        $("#lbl_nomatchpass2").hide();

    });

    $("#showpassword").click(function () {
        
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }

        var y = document.getElementById("passwordconf");
        if (y.type === "password") {
            y.type = "text";
        } else {
            y.type = "password";
        }


    });
</script>