<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="header-section.ascx.vb" Inherits="socmovil.header_section" %>

<%
       LoadConfiguration()
    
%>
<div class="containter-fluid text-center p-2">
<img src="../<% Response.Write(GlobalConfigReader.GetValue("logo"))%>" alt="Grupo R Exploracion Marina" style="width:310px;height:40px;">
</div>
<div class="containter-fluid text-center border" style="background-color:yellow ">
    <br />
         <span class="h2 pt-1">
             <% Response.Write(GlobalConfigReader.GetValue("MainTitle"))%>
         </span>
    <br />
    <br />
</div>