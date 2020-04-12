<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="menu-control.ascx.vb" Inherits="socmovil.menu_control" %>
<%
    'obtiene el lenguaje que esta en session.
    LoadLanguage()
    LoadConfiguration()
    
    
    'Carga menu en un objeto diccionario.
    Dim viewclass As New socmovil.view_classes
    Dim menus As New Dictionary(Of String, String)
    viewclass.ParseMenusItems(lang_configreader.GetValue("menus"), menus)
    
    'Carga menu de usuario
    Dim usr_menus As New Dictionary(Of String, String)
    viewclass.ParseMenusItems(lang_configreader.GetValue("menus_user"), usr_menus)
    
    ' revisa la session del usuario
    
    Dim user_loged As eservices_core.com.objects.UserObj
    Dim userlogged As Boolean = False
    
    If Not IsNothing(Me.Session("user_loged")) Then
        user_loged = CType(Me.Session("user_loged"), eservices_core.com.objects.UserObj)
        userlogged = True
    End If
    
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><% Response.Write(Date.Now.ToString("dd MMMM yyyy").ToUpper )%></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto" style="font-size:large ">
    <% 
        For Each menu_item As KeyValuePair(Of String, String) In menus
    %>
        <li class="nav-item">
        <a class="nav-link active" href="<% Response.Write(menu_item.Value)%>">
            <% Response.Write(menu_item.Key)%>
        </a>
      </li>
    <% 
    Next
    %>
       <%-- <li class="nav-item">
            <a  class="nav-link active" href="#">
                
               <img src="../images/log2-icon-png.png" style="vertical-align: middle; height:15px; width:15px;"  />  INICIAR SESSION
            </a>
        </li>--%>

         <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <img src="../images/log2-icon-png.png" style="vertical-align: middle; height:15px; width:15px;"  /> <%Response.Write(lang_configreader.GetValue("lbl_myprofile"))%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        <% If Not userlogged Then%>
          <a class="dropdown-item" href="index.aspx?p=p_login"><%Response.Write(lang_configreader.GetValue("lbl_login"))%></a>
         <%
         Else
             For Each Menu As KeyValuePair(Of String, String) In usr_menus
          %>
            <a class="dropdown-item" href="<%Response.Write(Menu.Value)%>"><%Response.Write(Menu.Key)%></a>
            <% 
            Next
            %>
            <hr />
            <%--Menu comun de usuarios con privilegios--%>
            <% If userlogged And user_loged.idprofile <> Integer.Parse(GlobalConfigReader.GetValue("publicprofileid")) Then%>
            <a class="dropdown-item" href="index.aspx?p=signatures/p_usersignature"><%GetLbl("menu-control_lbl_electronicsignature") %></a>
             <hr />
            <% End If%>
            <a class="dropdown-item" href="t_logoff.aspx"><%Response.Write(lang_configreader.GetValue("lbl_logout"))%></a>
            <%
        End If
            %>
            
        </div>
      </li>

    </ul>
      <%--<span class="navbar-text ">
          <%Response.Write(lang_configreader.GetValue("lbl_idioma"))%> <a href="change_lang.aspx?lang=ES">ES</a> | <a href="change_lang.aspx?lang=EN"> EN </a>
       </span>--%>
     
      


  </div>
</nav>

<%
    
%>