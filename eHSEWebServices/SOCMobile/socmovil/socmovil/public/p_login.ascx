<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_login.ascx.vb" Inherits="socmovil.p_login" %>
<% 
    'obtiene el lenguaje que esta en session y la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    Dim viewclass As New socmovil.view_classes()
    Dim enc_transaction_num As String = viewclass.MakeTransaction
    Me.Session("login_transaction_num") = viewclass.transaction
    
    Dim showerror As Boolean = False
    If Not IsNothing(Request.QueryString("e")) Then
        showerror = True
    End If
    
%>
<div class="container text-center">
       <div class="container">
            <span class="display-4"><% Response.Write(lang_configreader.GetValue("p_login_lblMainTitle"))%></span>
       </div>
    <% If showerror Then%>
    <div class="container bg-danger text-white p-2 lead">
        <%Response.Write(lang_configreader.GetValue("p_login_lblinvalidlogin")) %>
    </div>
    <% end if %>
    <div class="container mb-2">
        <div class="row"> 
            <div class="col p-2">
                <div class="container border border-info rounded  float-lg-right" style="width: 300px; height:300px;" >
                    <div class="mt-3">
                        <span class="h2 "> <%Response.Write(lang_configreader.GetValue("p_login_lblLoginTitle")) %>
                        </span>
                    </div>
                    <div>
                        <span class="lead">
                            <%Response.Write(lang_configreader.GetValue("p_login_lblLoginText")) %>
                        </span>
                        <form method="post" action="t_loginuser.aspx" >
                            <div class="text-left">
                                <div class="form-group">
                                    <label for="user"><% Response.Write(lang_configreader.GetValue("p_login_lblloginUserLogin")) %></label>
                                    <input type="text" class="form-control" id="user" name="user" placeholder="" required>
                                </div>
                                <div class="form-group">
                                    <label for="password"><%Response.Write(lang_configreader.GetValue("p_login_lblLoginUserPass"))%></label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="" required>
                                </div>
                                <input type="hidden" name="transaction" value="<% Response.Write(enc_transaction_num)%>"  />
                                <button type="submit" class="btn btn-primary btn-block"><%Response.Write(lang_configreader.GetValue("p_login_btnLogin")) %></button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
            <div class="col p-2">
                <div class="container border border-info rounded  float-lg-left" style="width: 300px; height:300px;" >
                    <div class="mt-3">
                        <span class="h2"><% Response.Write(lang_configreader.GetValue("p_login_lblRegisterTitle")) %>
                        </span>
                    </div>
                    <div class="m-3">
                       <span class="lead"> <% Response.Write(lang_configreader.GetValue("p_login_lblRegisterText")) %>
                           </span>
                    </div>
                    <div class="m-3">
                       <button type="button" class="btn btn-success btn-block" id="btn_signup"><%Response.Write(lang_configreader.GetValue("p_login_btnRegister")) %></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btn_signup").click(function () {
        document.location.href="index.aspx?p=usrregistration/p_userregistration"
    });
</script>