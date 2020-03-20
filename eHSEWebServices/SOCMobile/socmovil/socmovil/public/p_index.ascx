<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_index.ascx.vb" Inherits="socmovil.p_index" %>
<% 

    'obtiene el lenguaje que esta en session.
    Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
%>
<div class="content text-center">
    <div class="content  border p-2">
        <span class="display-4" style="font-size:2rem;"><% Response.Write(lang_configreader.GetValue("p_index_lbl_maintoptitle")) %></span>
    </div>
    <div class="content-fliud text-inline border bg-warning">
        <div class="content border-top border-bottom border-primary p-2">
            <div class="row">
                <div class="col text-right bg-warning">
                    <a href="index.aspx?p=p_createsoc"> 
                        <img src="../images/soc-card-pic-300px.jpg" width="150px" alt="crea tu tarjeta SOC" class="img-thumbnail rounded-left border border-primary" align="middle" /> 
                    </a>
                </div>
                <div class="col text-justify bg-white p-2 rounded-lg rounded-left">
                    <span>
                    <a class="h6" href="index.aspx?p=p_createsoc"> <% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc"))%>
                             <br /> <br /> <span  class="" style="font-size:small"><% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc_subtext")) %></span></a>
                            <br /> <span  class="" style="font-size:small"> <% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc_text")) %></span>
                    </span>
                </div>
            </div>
          <span>
         
        </div>
    </div>
</div>