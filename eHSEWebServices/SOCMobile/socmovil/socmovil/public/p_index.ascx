<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_index.ascx.vb" Inherits="socmovil.p_index" %>
<% 

    'obtiene el lenguaje que esta en session.
    'Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
    LoadLanguage()
    
%>
<div class="content text-center">
    <div class="content  border p-2">
        <span class="display-3" id="lbl_index_topmain"><% Response.Write(lang_configreader.GetValue("p_index_lbl_maintoptitle"))%></span>
    </div>
    <div class="content  border bg-warning border">
        <div class="content border-top border-bottom border-primary p-2">
            <div class="row m-0">
              <div class="col text-right bg-warning ">
                    <a href="index.aspx?p=soc/p_createsoc">
                        <img src="../images/soc-card-pic-300px.jpg" width="150px" alt="crea tu tarjeta SOC" class="img-thumbnail rounded-left border border-primary" align="middle" id="index_img_soccard" />
                    </a>
                </div>
                <div class="col text-left bg-white rounded-lg rounded-left border border-primary">
                    <span>
                        <a class="h6" href="index.aspx?p=soc/p_createsoc"><span class="display-4" id="lbl_index_createsoc_titile"><% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc"))%></span>
                            <br />
                            <br />
                            <span class="h4" id="lbl_index_createsoc"><% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc_subtext"))%></span></a>
                        <br />
                        <span class="h5" id="lbl_index_textsoc"><% Response.Write(lang_configreader.GetValue("p_index_lbl_createsoc_text"))%></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="TRAMainDiv" class="container-fluid border-top border-bottom" style="height: 700px; background-image: url('../images/background_electronic_tra.jpg'); background-size: cover; background-position: center center;">
    <div class="container text-center rounded-lg border border-primary pt-2 pb-3" style="margin-top: 5%; background-color: white; opacity: .96;">
        <span class="text-primary display-4"><%Response.Write(lang_configreader.GetValue("p_index_lbltramain"))%></span>
        <div class="container" style="">
            <div class="row">
                <div class="col text-left">
                    <span class="h4 m-0">
                        <%Response.Write(lang_configreader.GetValue("p_index_lbltrasubtitile"))%>
                    </span>
                    <a href="index.aspx?p=tra/p_tras">
                        <img src="../images/tra_electronic.JPG" class="img-thumbnail mb-3" /></a>
                </div>
                <div class="col">
                    <span class="h4 m-0">
                        <%Response.Write(lang_configreader.GetValue("p_index_lblhowtocreatetra"))%>
                    </span>
                    <video controls="controls" width="520" preload="metadata">
                        <source src="../media/TRA-ES-Crear%20nuevo.mp4#t=1" type="video/mp4">
                    </video>
                    <span class="h5">
                        <a href="index.aspx?p=tutorials/tutorials"><%Response.Write(lang_configreader.GetValue("p_index_lblmoretutorials"))%></a>
                    </span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <span class="h4">
                        <%Response.Write(lang_configreader.GetValue("p_index_lbltext1"))%><a href="index.aspx?p=tra/p_tras"><%Response.Write(lang_configreader.GetValue("p_index_lbltext2"))%></a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="TRAMainDiv_sm" class="container-fluid border-top border-bottom">
    <div class="container text-center rounded-lg border border-primary pt-2 pb-3" style="margin-top: 5%;">
        <span class="text-primary h3">e-TRA solucion en linea</span>
        <div class="row">
            <div class="col-lg text-left">
                <span class="h4 m-0">Crea tu e-TRA en linea
                </span>
                <a href="index.aspx?p=p_tras">
                    <img src="../images/tra_electronic.JPG" class="img-thumbnail mb-3" /></a>
            </div>
            <div class="col-lg mb-4">
                <span class="h4 m-0">¿Como crear un TRA?
                </span>
                <video controls="controls" width="100%" preload="metadata">
                    <source src="../media/TRA-ES-Crear%20nuevo.mp4#t=1" type="video/mp4">
                </video>
                <span class="h5">
                    <a href="index.aspx?p=tutorials/tutorials">Ver m&aacute;s tutoriales</a>
                </span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span class="h4">Ahora puedes crear tu TRA en linea, en tu computador
                            , portail y mobil.<br />
                    <a href="index.aspx?p=p_tras">Preciona aqui para crear tu TRA</a>
                </span>
            </div>
        </div>
    </div>

</div>
