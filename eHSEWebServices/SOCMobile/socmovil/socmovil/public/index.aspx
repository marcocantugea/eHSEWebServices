<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="socmovil.WebForm1" %>
<% 
    'lenguaje
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
    

    'Session de usuario
    Dim user_loged As eservices_core.com.objects.UserObj
    Dim userlogged As Boolean = False
    
    If Not IsNothing(Me.Session("user_loged")) Then
        user_loged = CType(Me.Session("user_loged"), eservices_core.com.objects.UserObj)
        userlogged = True
    End If
%>

<%@ Register Src="~/public/header-section.ascx" TagPrefix="headercontrol" TagName="HeaderC" %>
<%@ Register Src="~/public/menu-control.ascx" TagPrefix="menucontrol" TagName="MenuC" %>

<% Response.WriteFile("~/public/views/themes/basic/public/header.html")%>
<div class="container-fluid p-1 text-left">
    <div class="row m-0">
        <div class="col text-left">
            <span>
                <% If userlogged Then Response.Write(lang_configreader.GetValue("lbl_gretings") & ", " & user_loged.InfoUserObj.Nombre & " " & user_loged.InfoUserObj.apellido_pat)%>
            </span>
        </div>
        <div class="col text-right">
            <span class="navbar-text">
                <%Response.Write(lang_configreader.GetValue("lbl_idioma"))%> <a href="change_lang.aspx?lang=ES">
                    <img src="../images/ES-LANG-FLAG.gif" height="15px" />&nbsp;ES</a> | <a href="change_lang.aspx?lang=EN"> <img src="../images/EN-LANG-FLAG.gif" height="15px" />&nbsp;EN </a>
            </span>
        </div>
    </div>

</div>

<%--Header of the page--%>
 <headercontrol:HeaderC runat="server" id="headerandmenus" />
<%-- Control del menu --%>
 <menucontrol:MenuC runat="server" id="menucontrol" />

<%--Panel de contenido se carga con el query string--%>
 <asp:panel ID="ContentControl" runat="server"></asp:panel>

<% Response.WriteFile("~/public/views/themes/basic/public/layout-footer.html")%>
<% Response.WriteFile("~/public/views/themes/basic/public/footer.html")%>
