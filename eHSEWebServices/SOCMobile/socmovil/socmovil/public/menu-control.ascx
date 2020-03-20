<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="menu-control.ascx.vb" Inherits="socmovil.menu_control" %>
<%
    'obtiene el lenguaje que esta en session.
    Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
    
    'Carga menu en un objeto diccionario.
    Dim viewclass As New socmovil.view_classes
    Dim menus As New Dictionary(Of String, String)
    viewclass.ParseMenusItems(lang_configreader.GetValue("menus"), menus)
    
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
    </ul>
      <%--<span class="navbar-text ">
          <%Response.Write(lang_configreader.GetValue("lbl_idioma"))%> <a href="change_lang.aspx?lang=ES">ES</a> | <a href="change_lang.aspx?lang=EN"> EN </a>
       </span>--%>
  </div>
</nav>

<%
    
%>