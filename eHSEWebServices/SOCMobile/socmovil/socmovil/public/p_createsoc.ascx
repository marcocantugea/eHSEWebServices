<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_createsoc.ascx.vb" Inherits="socmovil.p_createsoc" %>
<% 
    
    Dim show_sendinfo As Boolean = False
    Dim Load_info As Boolean = False
    Dim saveinfo As Boolean = False
    
    'obtiene el lenguaje que esta en session.
    Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
    'Obtiene la configuracion global
    Dim GlobalConfigReader As New socmobile_core.com.configuration.GlobalConfReader
    GlobalConfigReader.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    
    
    'Obtiene el nombre de todos los empleados registrados.
    Dim ADOUsuarios As New socmobile_core.com.ado.ole.ADOUsuarios
    Dim list_nombres As New Dictionary(Of String, socmobile_core.com.objects.UsuariosObj)
    ADOUsuarios.GetUserNames(list_nombres)
    Dim capt_soc As New socmobile_core.com.objects.SOCCardObj
    
    'revisa si el nombre esta guardado en una cookie
    Dim name_by_cookie As String = ""
    If Not IsNothing(Request.Cookies("NombreSOCCard")) Then
        Dim cookie As HttpCookie = HttpContext.Current.Request.Cookies("NombreSOCCard")
        name_by_cookie = cookie.Value
    End If
    
    'Recive los datos capturados
    If Request.HttpMethod = "POST" Then
        capt_soc.Nombre = Request.Form("name")
        capt_soc.Ubicacion = Request.Form("location")
        capt_soc.Observacion = Request.Form("observation")
        
        If Request.Form("unsafeact") = lang_configreader.GetValue("lbl_yes") Then
            capt_soc.Acto_Inseguro = True
        Else
            capt_soc.Acto_Inseguro = False
        End If
        
        capt_soc.Situation = Request.Form("consern")
        
        If Request.Form("stopjob") = lang_configreader.GetValue("lbl_yes") Then
            capt_soc.StopJob = True
        Else
            capt_soc.StopJob = False
        End If
        
        capt_soc.EPP = False
        If Not IsNothing(Request.Form("epp")) Then
            If Request.Form("epp").Contains("yes") Then
                capt_soc.EPP = True
            End If
            
        End If
        
        capt_soc.ch_Atrapamiento = False
        If Not IsNothing(Request.Form("pichcpoint")) Then
            If Request.Form("pichcpoint").Contains("yes") Then
                capt_soc.ch_Atrapamiento = True
            End If
        End If
        
        capt_soc.Posicion_Gente = False
        If Not IsNothing(Request.Form("bodyplacement")) Then
            If Request.Form("bodyplacement").Contains("yes") Then
                capt_soc.Posicion_Gente = True
            End If
        End If
        
        capt_soc.ch_Planeacion = False
        If Not IsNothing(Request.Form("poorplanning")) Then
            If Request.Form("poorplanning").Contains("yes") Then
                capt_soc.ch_Planeacion = True
            End If
        End If
        
        capt_soc.ch_SnBarreras = False
        If Not IsNothing(Request.Form("nobarriers")) Then
            If Request.Form("nobarriers").Contains("yes") Then
                capt_soc.ch_SnBarreras = True
            End If
        End If
        
        capt_soc.ch_AmbienteTox = False
        If Not IsNothing(Request.Form("toxicemvi")) Then
            If Request.Form("toxicemvi").Contains("yes") Then
                capt_soc.ch_AmbienteTox = True
            End If
        End If
        
        capt_soc.ch_TrabajoGrua = False
        If Not IsNothing(Request.Form("cranework")) Then
            If Request.Form("cranework").Contains("yes") Then
                capt_soc.ch_TrabajoGrua = True
            End If
        End If
        
        capt_soc.Otra = False
        If Not IsNothing(Request.Form("other")) Then
            If Request.Form("other").Contains("yes") Then
                capt_soc.Otra = True
            End If
        End If
        
        capt_soc.ch_Resbalon = False
        If Not IsNothing(Request.Form("slipfalls")) Then
            If Request.Form("slipfalls").Contains("yes") Then
                capt_soc.ch_Resbalon = True
            End If
        End If
        
        capt_soc.ch_NoPermiso = False
        If Not IsNothing(Request.Form("pwtnotinplace")) Then
            If Request.Form("pwtnotinplace").Contains("yes") Then
                capt_soc.ch_NoPermiso = True
            End If
        End If
        
        capt_soc.ch_Comms = False
        If Not IsNothing(Request.Form("comunication")) Then
            If Request.Form("comunication").Contains("yes") Then
                capt_soc.ch_Comms = True
            End If
        End If
        
        capt_soc.ch_CondMeteorologica = False
        If Not IsNothing(Request.Form("wheater")) Then
            If Request.Form("wheater").Contains("yes") Then
                capt_soc.ch_CondMeteorologica = True
            End If
        End If
        
        capt_soc.ch_AltaPresion = False
        If Not IsNothing(Request.Form("highpressure")) Then
            If Request.Form("highpressure").Contains("yes") Then
                capt_soc.ch_AltaPresion = True
            End If
        End If
        
        capt_soc.ch_Quimicos = False
        If Not IsNothing(Request.Form("chemicals")) Then
            If Request.Form("chemicals").Contains("yes") Then
                capt_soc.ch_Quimicos = True
            End If
        End If
        
        capt_soc.ch_Soldadura = False
        If Not IsNothing(Request.Form("welding")) Then
            If Request.Form("welding").Contains("yes") Then
                capt_soc.ch_Soldadura = True
            End If
        End If
        
        capt_soc.Accion = Request.Form("actiontaken")
        capt_soc.MinimizeRisk = Request.Form("actionmitigaterisk")
        
        If Request.Form("informsupervisor") = lang_configreader.GetValue("lbl_yes") Then
            capt_soc.InformSupervisor = True
        Else
            capt_soc.InformSupervisor = False
        End If
        show_sendinfo = True
        Load_info = True
        Me.Session("capt_soc") = capt_soc
        
        
        ' Si se da la opcion de guardar soc guarda la bandera
        If Not IsNothing(Request.Form("sendinfo")) Then
            Try
                saveinfo = Boolean.Parse(Request.Form("sendinfo"))
            Catch ex As Exception
                saveinfo = False
            End Try
        End If
    Else
        If Not IsNothing(Me.Session("capt_soc")) Then
            Me.Session("capt_soc") = Nothing
        End If
    End If
    
    'Redirecciona a la pagina de guardar soc
    If saveinfo Then
        Response.Redirect("index.aspx?p=t_createsoc")
    End If
%>

<script>
    $(function () {
        var availableTags = [
           <%
    'Carga los nombres en la pagina por jquery
    Dim index As Integer = 0
    Dim names As New StringBuilder
    For Each item As KeyValuePair(Of String, socmobile_core.com.objects.UsuariosObj) In list_nombres
        If index = 0 Then
            names.Append("""" & item.Value.Nombre & """")
        Else
            names.Append(",""" & item.Value.Nombre & """")
        End If
        index = index + 1
    Next
    'names.Replace("`", "")
    
    Response.Write(names.ToString)
           %>
        ];
        $("#namecontrol").autocomplete({
            source: availableTags
        });
    });
  </script>

<%
    If show_sendinfo Then
%>
<div class="container text-center mt-2 p-2 border border-danger">
   <p class="h3"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_createsoc"))%> </p>
   <div class="row">
       <div class="col text-left">
           <button type="button" class="btn btn-success btn-lg btn-block"  id="btn_saveinfotop"> <% Response.Write(lang_configreader.GetValue("lbl_yes"))%>  </button>
       </div>
       <div class="col text-rigth">
           <button type="button" class="btn btn-danger btn-lg btn-block"  id="btn_nosavetop"> <% Response.Write(lang_configreader.GetValue("lbl_no")) %>  </button>
       </div>
   </div>
</div>
<%
End If 
%>
<div class="containter-fluid text-center m-1 mb-3">
    <span class="h4"><% Response.Write(lang_configreader.GetValue("lbl_title_createsoccard")) %></span>
</div>
<div class="container-fluid bg-danger p-2">
<div class="container">
    <div class="row">
        <div class="col  text-center p-1 align-middle">
            <img class="border border-1 m-1" src="../<% Response.Write(GlobalConfigReader.GetValue("logo"))%>" alt="Grupo R Exploracion Marina" style="width:200px; background-color:white ">
        </div>
        <div class="col text-center align-middle">
            <span class="h6"><br /> <% Response.Write(lang_configreader.GetValue("p_createsoc_title_SOCCard")) %></span>
        </div>
    </div>
    <div class="row">
        
        <div class="col text-center h4" style="font-size:x-small"> <span><%Response.Write(lang_configreader.GetValue("p_createsoc_subtitile_SOCCard")) %></span></div>
        <div class="col text-center"></div>
    </div>

</div>
<form id="frm_createsoc" action=""  class="m-2 p-2 border bg-white needs-validation" method="post" novalidate >
     <div class="form-group">
        <label for="namecontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_name")) %></label>
        <input type="text" class="form-control" id="namecontrol" placeholder="" name="name" required  value="<% If Load_info Then Response.Write(capt_soc.Nombre) Else If name_by_cookie.Length > 0 Then Response.Write(name_by_cookie)%>">
         <div class="invalid-feedback">
            <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidname"))%>
        </div>
     </div>
    <div class="form-group">
        <label for="locacioncontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_location")) %></label>
        <input type="text" class="form-control" id="locacioncontrol" placeholder="" name="location" required  value="<% If Load_info Then Response.Write(capt_soc.Ubicacion)%>">
        <div class="invalid-feedback">
            <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidlocation"))%>
        </div>
     </div>
    <div class="form-group">
        <label for="observationcontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_observation")) %></label>
        <textarea class="form-control" id="observationcontrol" name="observation" required  rows="4"><% If Load_info Then Response.Write(capt_soc.Observacion)%></textarea>
        <div class="invalid-feedback">
            <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidobservation")) %>
        </div>
     </div>
    <div class="form-group">
        <label for="unsafeactcontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_unsafeact")) %></label>
        <select class="form-control" id="unsafeactcontrol" name="unsafeact">
          <option <% If capt_soc.Acto_Inseguro Then Response.Write("selected")%>><% Response.Write(lang_configreader.GetValue("lbl_yes"))%></option>
          <option <% If not capt_soc.Acto_Inseguro Then Response.Write("selected")%> ><% Response.Write(lang_configreader.GetValue("lbl_no"))%></option>
        </select>
    </div>
    <div class="form-group">
        <label for="conserncontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_concer")) %></label>
        <textarea class="form-control" id="conserncontrol" name="consern" required rows="4"><% If Load_info Then Response.Write(capt_soc.Situation)%></textarea>
         <div class="invalid-feedback">
            <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidconsern")) %>
        </div>
     </div>
    <div class="form-group">
        <label for="stopjobcontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_stopjob"))%> </label>
        <select class="form-control" id="stopjobcontrol" name="stopjob">
          <option <% If capt_soc.StopJob Then Response.Write("selected")%> ><% Response.Write(lang_configreader.GetValue("lbl_yes"))%></option>
          <option <% If not capt_soc.StopJob Then Response.Write("selected")%>><% Response.Write(lang_configreader.GetValue("lbl_no"))%></option>
        </select>
    </div>
    <div class="contrainer-fluid text-center">
         <span class="h3"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titleriskobser"))%></span>
    </div>
   
    <div class="row m-2 pt-3 pl-2 text-left border" style="font-size:medium ">
        <div class="col">
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="epp" id="eppcontrol" value="epp-yes" <% If capt_soc.EPP then Response.Write("checked") %>>
              <label class="form-check-label" for="eppcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_EPP"))%></label>
                <br />
            </div>
             <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="pichcpoint" id="pichcpointcontrol" value="pitchpoint-yes" <% If capt_soc.ch_Atrapamiento then Response.Write("checked") %>>
              <label class="form-check-label" for="pichcpointcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_pichcpoint"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="bodyplacement" id="bodyplacementcontrol" value="bodyplacement-yes" <% If capt_soc.Posicion_Gente Then Response.Write("checked")%>>
              <label class="form-check-label" for="bodyplacementcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_bodyplacement"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="poorplanning" id="poorplanningcontrol" value="poorplanning-yes" <% If capt_soc.ch_Planeacion Then Response.Write("checked")%>>
              <label class="form-check-label" for="poorplanningcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_poorplanning"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="nobarriers" id="nobarrierscontrol" value="nobarriers-yes" <% If capt_soc.ch_SnBarreras Then Response.Write("checked")%>>
              <label class="form-check-label" for="nobarrierscontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_nobarriers"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="toxicemvi" id="toxicemvicontrol" value="toxicemvi-yes" <% If capt_soc.ch_AmbienteTox Then Response.Write("checked")%>>
              <label class="form-check-label" for="toxicemvicontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_toxicemvi"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="cranework" id="craneworkcontrol" value="cranework-yes" <% If capt_soc.ch_TrabajoGrua Then Response.Write("checked")%>>
              <label class="form-check-label" for="craneworkcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_cranework"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input" type="checkbox" name="other" id="othercontrol" value="other-yes" <% If capt_soc.Otra then Response.Write("checked") %>>
              <label class="form-check-label" for="othercontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_other"))%></label>
            </div>
        </div>
        <div class="col">
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="slipfalls" id="slipcontrol" value="slipfalls-yes" <% If capt_soc.ch_Resbalon then Response.Write("checked") %>>
              <label class="form-check-label" for="slipcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_slipfalls"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="pwtnotinplace" id="pwtnotinplacecontrol" value="pwtnotinplace-yes" <% If capt_soc.ch_NoPermiso then Response.Write("checked") %>>
              <label class="form-check-label" for="pwtnotinplacecontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_pwtnotinplace"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="comunication" id="comunicationcontrol" value="comunication-yes" <% If capt_soc.ch_Comms Then Response.Write("checked")%>>
              <label class="form-check-label" for="comunicationcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_comunication"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="wheater" id="wheatercontrol" value="wheater-yes" <% If capt_soc.ch_CondMeteorologica Then Response.Write("checked")%>>
              <label class="form-check-label" for="wheatercontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_wheater"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="highpressure" id="highpressurecontrol" value="highpressure-yes" <% If capt_soc.ch_AltaPresion Then Response.Write("checked")%>>
              <label class="form-check-label" for="highpressurecontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_highpressure"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="chemicals" id="chemicalscontrol" value="chemicals-yes" <% If capt_soc.ch_Quimicos Then Response.Write("checked")%>>
              <label class="form-check-label" for="chemicalscontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_chemicals"))%></label>
            </div>
            <div class="form-check p-1">
              <input class="form-check-input " type="checkbox" name="welding" id="weldingcontrol" value="welding-yes" <% If capt_soc.ch_Soldadura then Response.Write("checked") %>>
              <label class="form-check-label" for="weldingcontrol"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_welding"))%></label>
            </div>
        </div>
    </div>

    <div class="form-group mt-2">
        <label for="conserncontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_consern"))%></label>
        <textarea class="form-control" id="actiontakencontrol" name="actiontaken" required  rows="4"><%If Load_info Then Response.Write(capt_soc.Accion)%></textarea>
        <div class="invalid-feedback">
           <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidactiontaken")) %>
        </div>
     </div>

     <div class="form-group mt-2">
        <label for="actionmitigateriskcontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_actionmitigaterisk"))%></label>
        <textarea class="form-control" id="actionmitigateriskcontrol" name="actionmitigaterisk" required  rows="4"><% If Load_info Then Response.Write(capt_soc.MinimizeRisk)%></textarea>
          <div class="invalid-feedback">
           <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_titile_invalidactionmitigaterisk")) %>
        </div>
     </div>

    <div class="form-group">
        <label for="informsupervisorcontrol" class="h5 pl-4"><% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_informsupervisor"))%></label>
        <select class="form-control" id="informsupervisorcontrol" name="informsupervisor">
          <option <% If capt_soc.InformSupervisor Then Response.Write("selected")%>><% Response.Write(lang_configreader.GetValue("lbl_yes"))%></option>
          <option  <% If Not capt_soc.InformSupervisor Then Response.Write("selected")%>><% Response.Write(lang_configreader.GetValue("lbl_no"))%></option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary btn-lg btn-block"> <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_continue"))%> </button>
    <input type="hidden" value="false" name="sendinfo"  id="sendinfo_flag"/>
</form>

</div>
<div class="content p-1">
    <div class="row">
        <div class="col text-left" style="font-size:small"><%Response.Write(lang_configreader.GetValue("p_createsoc_lbl_formatnumber"))%></div>
         <div class="col text-right" style="font-size:small"><%Response.Write(lang_configreader.GetValue("p_createsoc_lbl_revisionnum"))%></div>
    </div>
</div>


<%
    If show_sendinfo Then
%>
<div class="container text-center mt-2 p-2 border border-danger">
   <p class="h3"> <% Response.Write(lang_configreader.GetValue("p_createsoc_lbl_createsoc"))%> </p>
   <div class="row ">
       <div class="col text-left">
           <button type="button" class="btn btn-success btn-lg btn-block" id="btn_saveinfo"> <% Response.Write(lang_configreader.GetValue("lbl_yes"))%> </button>
       </div>
       <div class="col text-rigth">
           <button type="button" class="btn btn-danger btn-lg btn-block" id="btn_nosave"> <% Response.Write(lang_configreader.GetValue("lbl_no"))%>  </button>
       </div>
   </div>
</div>
<%
End If 
%>

<script>
    $("#btn_saveinfo").click(function () {
        $("#sendinfo_flag").val('true');
        $("#frm_createsoc").submit();
    });

    $("#btn_nosave").click(function () {
        window.location.href = "index.aspx";
    });
    $("#btn_saveinfotop").click(function () {
        $("#sendinfo_flag").val('true');
        $("#frm_createsoc").submit();
    });

    $("#btn_nosavetop").click(function () {
        window.location.href = "index.aspx";
    });

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>