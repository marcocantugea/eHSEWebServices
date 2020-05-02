<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_viewsoccard.ascx.vb" Inherits="socmovil.p_viewsoccard" %>
<% 
    
    
    ''obtiene el lenguaje que esta en session y la configuracion global
    LoadLanguage()
    LoadConfiguration()
    Dim Base64Encoder As New eservices_core.com.utilities.Base64Conversions
    
    Dim capt_soc As New socmobile_core.com.objects.SOCCardObj
    
    If Not IsNothing(Request.QueryString("soc")) Then
       
        Dim idsoc As String = Base64Encoder.DecodeBase64(Request.QueryString("soc"))
        If IsNumeric(idsoc) Then
            capt_soc.id = Integer.Parse(idsoc)
            UnitOfWork.SOCCard.GetSocCardByID(capt_soc)
        End If
    Else
        Response.Redirect("index.aspx")
    End If
    
    
%>
 

<div class="containter-fluid text-center m-1 mb-3">
    <span class="h4"><% GetLbl("lbl_title_createsoccard")%></span>
</div>
<div  id="maincontainer_soc" style="width:100%; align-content:center;"  >
<div class="container-fluid bg-danger p-2" id="container_soc_card">
<div class="container">
    <div class="row">
        <div class="col  text-center p-1 align-middle">
            <img class="border border-1 m-1" src="../<% Response.Write(PageGlobalConfigReader.GetValue("logo"))%>" alt="Grupo R Exploracion Marina" style="width:200px; background-color:white ">
        </div>
        <div class="col text-center align-middle">
            <span class="h6"><br /> <% GetLbl("p_createsoc_title_SOCCard") %></span>
        </div>
    </div>
    <div class="row">
        
        <div class="col text-center h4" style="font-size:x-small"> <span><%GetLbl("p_createsoc_subtitile_SOCCard")%></span></div>
        <div class="col text-center"></div>
    </div>

</div>
<form id="frm_createsoc" action=""  class="m-2 p-2 border bg-white needs-validation" method="post" novalidate >
     <div class="form-group">
        <label for="namecontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_name")%></label>
        <p class="lead pl-5 value border-bottom"><% Response.Write(capt_soc.Nombre)%></p>
     </div>
    <div class="form-group">
        <label for="locacioncontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_location") %></label>
        <p class="lead pl-5 border-bottom value" ><% Response.Write(capt_soc.Ubicacion)%></p>
     </div>
    <div class="form-group">
        <label for="observationcontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_observation") %></label>
     <p class="lead pl-5 border-bottom value" ><% Response.Write(capt_soc.Observacion)%></p>
        
     </div>
    <div class="form-group">
        <label for="unsafeactcontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_unsafeact")%></label>
       <p class="lead pl-5 border-bottom value" > <% If capt_soc.Acto_Inseguro Then GetLbl("lbl_yes")%>
           <% If Not capt_soc.Acto_Inseguro Then GetLbl("lbl_no")%></p>
    </div>
    <div class="form-group">
        <label for="conserncontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_concer") %></label>
       <p class="lead pl-5 border-bottom value" ><% Response.Write(capt_soc.Situation)%></p>
     </div>
    <div class="form-group">
        <label for="stopjobcontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_stopjob")%> </label>
       <p class="lead pl-5 border-bottom value" ><% If capt_soc.StopJob Then GetLbl("lbl_yes")%>
           <% If Not capt_soc.StopJob Then GetLbl("lbl_no")%></p>
    </div>
    <div class="contrainer-fluid text-center">
         <span class="h3"><% GetLbl("p_createsoc_lbl_titleriskobser")%></span>
    </div>
   
    <div class="row m-2 pt-3 pl-2 text-left border" style="font-size:medium ">
        <div class="col">
            <div class="form-check p-1">
              <input disabled  class="form-check-input" type="checkbox" name="epp" id="eppcontrol" value="epp-yes" <% If capt_soc.EPP then Response.Write("checked") %>>
              <label  class="form-check-label" for="eppcontrol"><% GetLbl("p_createsoc_lbl_EPP")%></label>
                <br />
            </div>
             <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="pichcpoint" id="pichcpointcontrol" value="pitchpoint-yes" <% If capt_soc.ch_Atrapamiento then Response.Write("checked") %>>
              <label class="form-check-label" for="pichcpointcontrol"><% GetLbl("p_createsoc_lbl_pichcpoint")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="bodyplacement" id="bodyplacementcontrol" value="bodyplacement-yes" <% If capt_soc.Posicion_Gente Then Response.Write("checked")%>>
              <label class="form-check-label" for="bodyplacementcontrol"><% GetLbl("p_createsoc_lbl_bodyplacement")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="poorplanning" id="poorplanningcontrol" value="poorplanning-yes" <% If capt_soc.ch_Planeacion Then Response.Write("checked")%>>
              <label class="form-check-label" for="poorplanningcontrol"><% GetLbl("p_createsoc_lbl_poorplanning")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="nobarriers" id="nobarrierscontrol" value="nobarriers-yes" <% If capt_soc.ch_SnBarreras Then Response.Write("checked")%>>
              <label class="form-check-label" for="nobarrierscontrol"><% GetLbl("p_createsoc_lbl_nobarriers")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="toxicemvi" id="toxicemvicontrol" value="toxicemvi-yes" <% If capt_soc.ch_AmbienteTox Then Response.Write("checked")%>>
              <label class="form-check-label" for="toxicemvicontrol"><% GetLbl("p_createsoc_lbl_toxicemvi")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="cranework" id="craneworkcontrol" value="cranework-yes" <% If capt_soc.ch_TrabajoGrua Then Response.Write("checked")%>>
              <label class="form-check-label" for="craneworkcontrol"><% GetLbl("p_createsoc_lbl_cranework")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input" type="checkbox" name="other" id="othercontrol" value="other-yes" <% If capt_soc.Otra then Response.Write("checked") %>>
              <label class="form-check-label" for="othercontrol"><% GetLbl("p_createsoc_lbl_other")%></label>
            </div>
        </div>
        <div class="col">
            <div class="form-check p-1">
              <input  disabled class="form-check-input " type="checkbox" name="slipfalls" id="slipcontrol" value="slipfalls-yes" <% If capt_soc.ch_Resbalon then Response.Write("checked") %>>
              <label class="form-check-label" for="slipcontrol"><% GetLbl("p_createsoc_lbl_slipfalls")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input " type="checkbox" name="pwtnotinplace" id="pwtnotinplacecontrol" value="pwtnotinplace-yes" <% If capt_soc.ch_NoPermiso then Response.Write("checked") %>>
              <label class="form-check-label" for="pwtnotinplacecontrol"><% GetLbl("p_createsoc_lbl_pwtnotinplace")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input " type="checkbox" name="comunication" id="comunicationcontrol" value="comunication-yes" <% If capt_soc.ch_Comms Then Response.Write("checked")%>>
              <label class="form-check-label" for="comunicationcontrol"><% GetLbl("p_createsoc_lbl_comunication")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input " type="checkbox" name="wheater" id="wheatercontrol" value="wheater-yes" <% If capt_soc.ch_CondMeteorologica Then Response.Write("checked")%>>
              <label class="form-check-label" for="wheatercontrol"><% GetLbl("p_createsoc_lbl_wheater")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input " type="checkbox" name="highpressure" id="highpressurecontrol" value="highpressure-yes" <% If capt_soc.ch_AltaPresion Then Response.Write("checked")%>>
              <label class="form-check-label" for="highpressurecontrol"><% GetLbl("p_createsoc_lbl_highpressure")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled class="form-check-input " type="checkbox" name="chemicals" id="chemicalscontrol" value="chemicals-yes" <% If capt_soc.ch_Quimicos Then Response.Write("checked")%>>
              <label class="form-check-label" for="chemicalscontrol"><% GetLbl("p_createsoc_lbl_chemicals")%></label>
            </div>
            <div class="form-check p-1">
              <input disabled  class="form-check-input " type="checkbox" name="welding" id="weldingcontrol" value="welding-yes" <% If capt_soc.ch_Soldadura then Response.Write("checked") %>>
              <label class="form-check-label" for="weldingcontrol"><% GetLbl("p_createsoc_lbl_welding")%></label>
            </div>
        </div>
    </div>

    <div class="form-group mt-2">
        <label for="conserncontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_consern")%></label>
        <p class="lead pl-5 border-bottom value" ><%Response.Write(capt_soc.Accion)%></p>
     </div>

     <div class="form-group mt-2">
        <label for="actionmitigateriskcontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_actionmitigaterisk")%></label>
        <p class="lead pl-5 border-bottom value" ><% Response.Write(capt_soc.MinimizeRisk)%></p>
     </div>

    <div class="form-group">
        <label for="informsupervisorcontrol" class="h5 pl-4"><% GetLbl("p_createsoc_lbl_informsupervisor")%></label>
       <p class="lead pl-5 border-bottom value" >
           <% If capt_soc.InformSupervisor Then GetLbl("lbl_yes")%>
           <% If Not capt_soc.InformSupervisor Then GetLbl("lbl_no")%>
           </p>
    </div>
</form>
<div class="content p-1">
    <div class="row">
        <div class="col text-left" style="font-size:small"><%GetLbl("p_createsoc_lbl_formatnumber")%></div>
         <div class="col text-right" style="font-size:small"><%GetLbl("p_createsoc_lbl_revisionnum")%></div>
    </div>
</div>
</div>

</div>
