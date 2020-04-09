<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_userinfo.ascx.vb" Inherits="socmovil.p_userinfo" %>
<% 
    
    'obtiene el lenguaje que esta en sessiony Obtiene la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("userinfo_transaction_num") = viewclass.transaction
   
    'Se integro la session de usuario en el codebehind
    'Dim UserSession As New socmovil.UserStateClass(Me.Session, Response)
    
    Dim show_dateerror_msg As Boolean = False
    Dim show_Error_msg As Boolean = False
    
    If Not IsNothing( Request.QueryString("de")) Then
        show_dateerror_msg = True
    End If
    
    If Not IsNothing(Request.QueryString("e")) Then
        show_Error_msg = True
    End If
%>

<div class="container-fluid text-center">
    <div class="mt-2 mb-2">
        <span class="display-4">
           <%GetLbl("p_userinfo_lbl_maintitle") %>
        </span>
    </div>
    <% If show_dateerror_msg Then%>
    <div class="container bg bg-danger text-white p-2 h4 mt-3 mb-3">
       <%GetLbl("p_userinfo_lbl_invliddateselected") %>
    </div>
    <% End If  %>
     <% If show_Error_msg Then%>
    <div class="container bg bg-danger text-white p-2 h4 mt-3 mb-3">
        <%GetLbl("p_userinfo_lbl_errorupdateinfo")%>
    </div>
    <% End If  %>
    <div class="mt-3 mb-3">
        <span class="h4"><% Response.Write(SessionUser.UserObjSession.FullName)%></span>
    </div>
    <div class="container border rounded border-primary" style="background-color:#f1f2f6;">
        <form class="text-left p-3" method="post" action="userinfo/t_updateuserinfo.aspx">
            <div class="row">
                <div class="col">
                    <span class="lead"><%GetLbl("p_userinfo_lbl_birthday")%></span>
                    <div class="form-group mt-3">
                        <div class="row">
                            <div class="col">
                                <label for="day_birdthday"><%GetLbl("lbl_day") %></label>
                                <select class="form-control" id="day_birdthday" name="day_birdthday" required>
                                    <option value="-1"></option>
                                    <%
                                        For index As Integer = 1 To 31
                                            Dim selected = ""
                                            If index = Day(SessionUser.UserObjSession.InfoUserObj.fecha_nac) Then
                                                selected = "selected"
                                            End If
                                    %>
                                    <option <%Response.Write(selected)%> value="<%Response.Write(index)%>"><%Response.Write(index)%></option>
                                    <%
                                    Next
                                    %>
                                </select>
                            </div>
                            <div class="col">
                                <label for="day_birdthday"><%GetLbl("lbl_month") %></label>
                                <select class="form-control" id="month_birdthday" name="month_birdthday" required>
                                    <option value="-1"></option>
                                    <%
                                        For index As Integer = 1 To 12
                                            Dim selected = ""
                                            If index = Month(SessionUser.UserObjSession.InfoUserObj.fecha_nac) Then
                                                selected = "selected"
                                            End If
                                    %>
                                    <option <%Response.Write(selected)%> value="<%Response.Write(index)%>"><%Response.Write(MonthName(index).ToUpper)%></option>
                                    <%
                                    Next
                                    %>
                                </select>
                            </div>
                            <div class="col">
                                <label for="day_birdthday"><%GetLbl("lbl_year") %></label>
                                <select class="form-control" id="year_birdthday" name="year_birdthday" required>
                                    <option value="-1"></option>
                                    <%
                                        For index As Integer = 1940 To Year(Date.Now)
                                            Dim selected = ""
                                            If index = Year(SessionUser.UserObjSession.InfoUserObj.fecha_nac) Then
                                                selected = "selected"
                                            End If
                                    %>
                                    <option <%Response.Write(selected)%> value="<%Response.Write(index)%>"><%Response.Write(index)%></option>
                                    <%
                                    Next
                                    %>
                                </select>
                            </div>
                        </div>
                     </div>
                </div>
                <div class="col-lg">
                    <label class="lead" for="adress"><%GetLbl("p_userinfo_input_address") %></label>
                    <textarea class="form-control" id="adress" name="adress" placeholder="" rows="4"><%Response.Write(SessionUser.UserObjSession.InfoUserObj.direccion)%></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-lg">
                     <label class="lead" for="rfc"><%GetLbl("p_userinfo_input_rfc")%></label>
                    <div class="row ">
                        <div class="col form-inline">
                            <input type="text" class="form-control" id="rfc" name="rfc" placeholder="" style="width: 140px;" value="<%If SessionUser.UserObjSession.InfoUserObj.RFC.Count >= 10 Then Response.Write(SessionUser.UserObjSession.InfoUserObj.RFC.Substring(0, 10))%>" />
                            <input type="text" class="form-control" id="rfchomoclave" name="rfchomoclave" placeholder="" style="width: 80px;" maxlength="3" value="<%If SessionUser.UserObjSession.InfoUserObj.RFC.Count > 10 Then Response.Write(SessionUser.UserObjSession.InfoUserObj.RFC.Substring(10, 3))%>" />
                        </div>
                        
                    </div>
                   
                </div>
                <div class="col">
                     <div class="row">
                         <div class="col">
                             <label class="lead" for="phone_movile"><%GetLbl("p_userinfo_input_phonemovile")%></label>
                             <input type="text" class="form-control" id="phone_movile" name="phone_movile" placeholder="" style="width: 140px;" value="<%Response.Write(SessionUser.UserObjSession.InfoUserObj.telefono_movil)%>" />
                         </div>
                          <div class="col-lg">
                              <label class="lead" for="phone_emergency"><%GetLbl("p_userinfo_input_phoneemergency") %></label>
                             <input type="text" class="form-control" id="phone_emergency" name="phone_emergency" placeholder="" style="width: 140px;" value="<% Response.Write(SessionUser.UserObjSession.InfoUserObj.phone_emergency)%>"  />
                          </div>
                     </div>
                </div>
            </div>
            <div class="row">
                <div class="col">

                </div>
                <div class="col-lg">
                    <label class="lead" for="emergency_contact_name"><%GetLbl("p_userinfo_input_emergencyname") %></label>
                    <input type="text" class="form-control" id="emergency_contact_name" name="emergency_contact_name" placeholder="" value="<% Response.Write(SessionUser.UserObjSession.InfoUserObj.name_emerg_contanct)%>" />

                </div>
            </div>
            <div class="row mt-3">
                <div class="col"></div>
                <div class="col">
                    <input type="hidden"  name="transaction" value="<%Response.Write(enc_transaction_num) %>" />
                    <button type="submit" class="btn btn-block btn-success" > <%GetLbl("p_userinfo_btn_updateinfo") %> </button>
                </div>
                <div class="col"></div>
            </div>
        </form>
    </div>
  </div>
<script>
    <% If show_dateerror_msg Then%>
    $("#day_birdthday").css("border-color", "red")
    $("#month_birdthday").css("border-color", "red")
    $("#year_birdthday").css("border-color", "red")
    <% End If%>
    var nombre = ["<% Response.Write(SessionUser.UserObjSession.InfoUserObj.Nombre.ToUpper)%>", "<% Response.Write(SessionUser.UserObjSession.InfoUserObj.apellido_pat.ToUpper)%>", "<% Response.Write(SessionUser.UserObjSession.InfoUserObj.apellido_mat.ToUpper)%>"]

    $("#month_birdthday").change(function () {
        $("#rfc").val(MakeRFC());
        
    });
    
    $("#day_birdthday").change(function () {
        $("#rfc").val(MakeRFC());
        
    });

    $("#year_birdthday").change(function () {
        $("#rfc").val(MakeRFC());
        
    });


    function MakeRFC() {
        if (GetFirstLetterOfLastMotherName() != null && GetLast2DigMonth() != "0-1" && GetLast2DigYear() != "" && GetLast2DigDay != "0-1") {
            return GetFirstLetterOfLastName() + GetFirstVowelOfLastName() + GetFirstLetterOfLastMotherName() + GetFirstLetterOfName() + GetLast2DigYear() + GetLast2DigMonth() + GetLast2DigDay()
        } else {
            return ""
        }
    }

    function find_vowel(str1) {
        var vowel_list = 'aeiouAEIOU';
        var vcount = 0;

        for (var x = 0; x < str1.length ; x++) {
            if (vowel_list.indexOf(str1[x]) !== -1) {
                return x;
            }

        }
        return vcount;
    }

    function GetFirstLetterOfLastName() {
        return nombre[1].substring(0, 1);
    }
    function GetFirstVowelOfLastName() {
        var indexvowel = find_vowel(nombre[1]);
        return nombre[1].substring(indexvowel, indexvowel + 1);
    }
    function GetFirstLetterOfLastMotherName() {
        if (nombre[2] != null && nombre[2].length>1) {
            return nombre[2].substring(0,1)
        }
    }
    function GetFirstLetterOfName() {
        return nombre[0].substring(0,1)
    }

    function GetLast2DigYear() {
        var yearselected = $("#year_birdthday").val()
        return yearselected.substring(2,4)
    }
    function GetLast2DigMonth() {
        var month = $("#month_birdthday").val()
        var str_month="0"
        if (month < 10) {
            str_month = "0" + month
        } else {
            str_month=month
        }
        return str_month
       
    }
    function GetLast2DigDay() {
        var day = $("#day_birdthday").val()
        var str_day = "0"
        if (day < 10) {
            str_day = "0" + day
        } else {
            str_day = day
        }

        return str_day

    }

</script>