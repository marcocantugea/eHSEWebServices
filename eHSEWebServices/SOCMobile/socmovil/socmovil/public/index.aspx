<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="socmovil.WebForm1" %>
<% 
    If IsNothing(Me.Session("LANG")) Then
        Me.Session("LANG") = "ES"
        Dim aCookie As New HttpCookie("LANG")
        aCookie.Value = "ES"
        aCookie.Expires = DateTime.Now.AddDays(60)
        Response.Cookies.Add(aCookie)
    Else
        If Request.Cookies("LANG") Is Nothing Then
            Dim aCookie As New HttpCookie("LANG")
            aCookie.Value = Me.Session("LANG")
            aCookie.Expires = DateTime.Now.AddDays(60)
            Response.Cookies.Add(aCookie)
        Else
            Dim cookie As HttpCookie = HttpContext.Current.Request.Cookies("LANG")
            cookie.Value = Me.Session("LANG")
            cookie.Expires = DateTime.Now.AddDays(60)
            Response.Cookies.Add(cookie)
            Me.Session("LANG") = cookie.Value
        End If
    End If
    
    ' Crea el objeto para el lenguaje y lo anexa en session
    
    'Obtiene el lenguaje seleccionado
    Dim lang As String = Me.Session("LANG")
    
    'Obtiene la clase para leer los datos del archivo de configuraciones de lenguajes.
    Dim lang_configreader As New socmobile_core.com.configuration.GlobalConfReader
    
    If lang.Equals("ES") Then
        'Carga la configuracion del archivo
        lang_configreader.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("LANG-ESP-Configfile"))
    End If
    If lang.Equals("EN") Then
        'Carga la configuracion del archivo
        lang_configreader.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("LANG-ENG-Configfile"))

    End If
    
    Me.Session("lang_obj") = lang_configreader
%>

<%@ Register Src="~/public/header-section.ascx" TagPrefix="headercontrol" TagName="HeaderC" %>
<%@ Register Src="~/public/menu-control.ascx" TagPrefix="menucontrol" TagName="MenuC" %>

<% Response.WriteFile("~/public/views/themes/basic/public/header.html")%>
<div class="container p-1 text-right mr-4">
<span class="navbar-text">
          <%Response.Write(lang_configreader.GetValue("lbl_idioma"))%> <a href="change_lang.aspx?lang=ES">ES</a> | <a href="change_lang.aspx?lang=EN"> EN </a>
</span>
</div>

<%--Header of the page--%>
 <headercontrol:HeaderC runat="server" id="headerandmenus" />
<%-- Control del menu --%>
 <menucontrol:MenuC runat="server" id="menucontrol" />

<%--Panel de contenido se carga con el query string--%>
 <asp:panel ID="ContentControl" runat="server"></asp:panel>  

<% Response.WriteFile("~/public/views/themes/basic/public/layout-footer.html")%>
<% Response.WriteFile("~/public/views/themes/basic/public/footer.html")%>
