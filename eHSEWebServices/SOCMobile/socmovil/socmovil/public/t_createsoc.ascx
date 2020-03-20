<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="t_createsoc.ascx.vb" Inherits="socmovil.t_createsoc" %>
<% 
    
    'obtiene el lenguaje que esta en session.
    Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
    
    Dim showsuccess_msg As Boolean = False
    Dim error_message As String
    
    If Not IsNothing(Me.Session("capt_soc")) Then
        Dim newsoccard As socmobile_core.com.objects.SOCCardObj
        newsoccard = CType(Me.Session("capt_soc"), socmobile_core.com.objects.SOCCardObj)
        
        newsoccard.Fecha = Date.Now
        newsoccard.Week = DatePart(DateInterval.WeekOfYear, newsoccard.Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
        newsoccard.Estatus = "Open"
        newsoccard.SOC_Hora = DateTime.Now.ToString("HH:mm:ss")
        newsoccard.SOC_Computadora = Request.ServerVariables("REMOTE_ADDR")
        
        Try
            Dim ADOSOCCard As New socmobile_core.com.ado.ole.ADOSOCCard
            ADOSOCCard.SaveSOCCard(newsoccard)
            showsuccess_msg = True
            
            'Crea galleta para el nombre del usuario
            If Request.Cookies("NombreSOCCard") Is Nothing Then
                Dim aCookie As New HttpCookie("NombreSOCCard")
                aCookie.Value = newsoccard.Nombre.ToString
                aCookie.Expires = DateTime.Now.AddDays(60)
                Response.Cookies.Add(aCookie)
            Else
                Dim cookie As HttpCookie = HttpContext.Current.Request.Cookies("NombreSOCCard")
                cookie.Value = newsoccard.Nombre.ToString
                cookie.Expires = DateTime.Now.AddDays(60)
                Response.Cookies.Add(cookie)
            End If
            
        Catch ex As Exception
         
        End Try
       
    Else
       Response.Redirect("index.aspx")
    End If
    
%>
<%
    If showsuccess_msg Then
    
%>
<div class="container text-center p-4">
    <p class="display-4"><% Response.Write(lang_configreader.GetValue("t_createsoc_lbl_titile_thanks"))%></p>
    <p class="display-4"><% Response.Write(lang_configreader.GetValue("t_createsoc_lbl_titile_othercard")) %></p>
     <div class="row">
       <div class="col text-left">
           <button type="button" class="btn btn-success btn-lg btn-block" id="btn_yes"> <% Response.Write(lang_configreader.GetValue("lbl_yes"))%> </button>
       </div>
       <div class="col text-rigth">
           <button type="button" class="btn btn-danger btn-lg btn-block" id="btn_no"> <% Response.Write(lang_configreader.GetValue("lbl_no")) %> </button>
       </div>
   </div>
</div>
<%
Else
%>
<div class="container text-center p-4">
    <p class="display-4 text-danger"><% Response.Write(lang_configreader.GetValue("t_createsoc_lbl_titile_errormain"))%> </p>
    <p class="display-4"><% Response.Write(lang_configreader.GetValue("t_createsoc_lbl_subtitile_error"))%> </p>

    <button type="button" class="btn btn-primary btn-lg btn-block" id="btn_no"><% Response.Write(lang_configreader.GetValue("t_createsoc_lbl_buttonback"))%>  </button>
    <input type="hidden" id="error" value="<% Response.Write(error_message)%>"
   </div>
</div>
<%
End If
 %>



<script>
    $("#btn_yes").click(function () {
        window.location.href = "index.aspx?p=p_createsoc";
    });
    $("#btn_no").click(function () {
        window.location.href = "index.aspx";
    });
</script>