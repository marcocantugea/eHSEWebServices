<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_createTRA.ascx.vb" Inherits="socmovil.p_createTRA" %>

<%
    
    'Obtiene la configuracion global
    Dim GlobalConfigReader As New socmobile_core.com.configuration.GlobalConfReader
    GlobalConfigReader.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    Dim ADOTRA As New etra.com.ado.ole.ADOTRA    
    Dim PINGenerator As New eservices_core.com.utilities.PINGenerator
    Dim showloadeddata As Boolean = False
    
    Dim list_department As New List(Of etra.com.objects.TRADeparment)
    ADOTRA.GetDeparmentsName(list_department)
    
    
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    
    Dim new_tra_inssession As etra.com.objects.TRAObj
    
    If Not IsNothing(Request.QueryString("newtra")) Then
        Me.Session("new_tra_insession") = Nothing
    End If
    
    If Not IsNothing(Me.Session("new_tra_insession")) Then
        new_tra_inssession = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
        showloadeddata = True
    Else
        new_tra_inssession = New etra.com.objects.TRAObj
        new_tra_inssession.tra_Unit = GlobalConfigReader.GetValue("main_unit")
        new_tra_inssession.tra_Date = Date.Now
        new_tra_inssession.tra_Hazard_Access_NA = True
        new_tra_inssession.tra_Hazard_Comms_NA = True
        new_tra_inssession.tra_Hazard_Environ_NA = True
        new_tra_inssession.tra_Hazard_Equip_NA = True
        new_tra_inssession.tra_Hazard_Factors_NA = True
        new_tra_inssession.tra_Hazard_Hand_NA = True
        new_tra_inssession.tra_Hazard_Noise_NA = True
        new_tra_inssession.tra_Hazard_Overhead_NA = True
        new_tra_inssession.tra_Hazard_Process_NA = True
        new_tra_inssession.tra_Hazard_Subs_NA = True
        new_tra_inssession.tra_Hazard_Vibration_NA = True
        new_tra_inssession.tra_Hazard_Weather_NA = True
        new_tra_inssession.tra_Status = "temp"
        'genera pin pero valida si esta repetido el pin
        Dim pin_save As Integer = Integer.Parse(PINGenerator.GeneratePIN4digit)
        
        Dim gen_pin As Boolean = True
        While gen_pin
            If ADOTRA.DuplicatePIN(pin_save) Then
                pin_save = Integer.Parse(PINGenerator.GeneratePIN4digit)
            Else
                gen_pin = False
            End If
        End While
        
        new_tra_inssession.pin_save = pin_save
        Me.Session("new_tra_insession") = new_tra_inssession
        
    End If
    
    
%>
<div id="dialog" title="">
  <span class="h4  text-success" id="messagesave"></span>
</div>
<div class="container-fluid mt-3 mb-3">
    <span class="h4 ">Solicitud de nuevo TRA</span>
</div>

<div class="ml-2" >
<form id="frm_main" name="frm_main">
<%-- version de escritorio--%>
<div class="" id="desktopver">
    <table id="TRAMainTable" > 
       <%-- Seccion de planificacion--%>
        <tr>
            <td id="InitialLabel">
               <div style="width:20px;">
                   <img src="../images/img-tra-planificacion.png" /  >
               </div>
            </td>
            <td>
                <%--tabla de encabezado--%>
                <table id="tbl_planning">
                    <tr>
                        <td colspan="8">
                            <div style="display:flex; align-items:center; padding:5px;">
                                <img src="../images/gr-logo1.png" / height="40px" width="250px" >
                                <h5 style="padding-left:15px;">TASK RISK ASSESSMENT FORM /</h5>
                                <span>Valoraci&oacute;n de Riesgo en la Tarea</span>
                                <h5 style="padding-left:15px;">(TRA)</h5>
                            </div>
                           
                        </td>
                        <td colspan="3" style="width:180px; text-align:center"><span class="cell-value"><% If showloadeddata then Response.Write(new_tra_inssession.pin_save)  %></span> </td>
                    </tr>
                    <tr>
                        <td class="cell-header">
                            <span><strong> Unit </strong>/ Unidad:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="">
                                <input type="text" class="form-control form-control-sm" id="txt_unit" name="unit" value="<% Response.Write(GlobalConfigReader.GetValue("main_unit"))%>" readonly />
                            </span> 
                        </td>
                        <td class="cell-header">
                            <span><strong>Department </strong> <br />Departamento:</span>
                        </td>
                        <td class="cell-td-value">
                             <select class="form-control form-control-sm" style="background-color:lightyellow" id="cmb_departments" name="deparments">
                              <option selected ></option>
                              <%
                                  Dim selected As String = ""
                                  For Each item As etra.com.objects.TRADeparment In list_department
                                      If showloadeddata Then
                                          If item.cDep_Name.Equals(new_tra_inssession.tra_Dept) Then
                                              selected = "selected"
                                          Else
                                              selected=""
                                          End If
                                      End If
                               %>
                                 <option value="<%Response.Write(item.cDep_Name)%>" <%Response.Write(selected)%>><%Response.Write(item.cDep_Name) %></option>
                              <%
                              Next
                               %>
                            </select>
                        </td>
                        <td class="cell-header">
                            <span><strong>Job Location</strong> <br />Sitio de Trabajo</span>
                        </td>
                        <td class="cell-td-value" colspan="2">
                            <%--<span class="cell-value"></span> --%>
                            <input type="text" class="form-control form-control-sm" id="txt_location" name="location" value="<% If showloadeddata then Response.Write(new_tra_inssession.tra_Location ) %>"  style="background-color:lightyellow" />
                        </td>
                        <td class="cell-header">
                            <span><strong>PERMIT NUMBER </strong> <br />Num. Permiso</span>
                        </td>
                        <td class="cell-td-value" colspan="3">
                            <span class="cell-value"></span> 
                        </td>

                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td class="cell-header" colspan="2">
                            <span><strong>Activity / Job Descripcion /</strong> Actividad</span>
                        </td>
                        <td colspan="3" class="cell-td-value">
                            
                            <input  type="text" class="form-control form-control-sm" id="txt_activity" name="activity" value="<% If showloadeddata then Response.Write(new_tra_inssession.tra_Activity_Job ) %>" style="background-color:lightyellow" />
                        </td>
                        <td colspan="2" class="cell-header" style="text-align:right;">
                           <span><strong>Date /</strong> Fecha:</span>
                        </td>
                        <td class="cell-td-value">
                            <%--<span class="cell-value"></span>--%>
                            <input type="text" class="form-control form-control-sm" id="txt_date" name="datetra" value="<% Response.Write(Date.now.ToString("dd-MM-yyyy"))%>" style="background-color:lightyellow;width:110px;padding-left:20px;" />
                        </td>
                        <td class="cell-header">
                            <span><strong>#Pages/ No.</strong><br />P&aacute;ginas:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="cell-value" id="page_counter">&nbsp;&nbsp; &nbsp;&nbsp; </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Seccion de Actividades--%>
        <tr>
            <td id="InitialLabel">
                <img src="../images/img-tra-desarrolloactividad.png" />
            </td>
            <td style="vertical-align:top;">
                <table id="Tasklist">
                    <tr>
                        <td rowspan="3" class="first-col">
                           <span>No.</span>
                        </td>
                        <td rowspan="3" class="cell-header" style="width:170px;">
                            <span>Break down / pasos de trabajo</span>
                        </td>
                        <td rowspan="3" class="cell-header" style="width:170px;">
                            <span>DANGER / Peligro</span>
                        </td>
                        <td rowspan="3" class="cell-header" style="width:170px;">
                            <span>RISK DESCRIPTION / Descripci&oacute;n del Riesgo</span>
                        </td>
                        <td colspan="3" class="cell-header">
                            <span>Initial Risk / Riesgo Inicial</span>
                        </td>

                        <td rowspan="3" class="cell-header" style="width:195px;">
                           <span> MINIMIZE RISK BY (CONTROLS) /<br /> Minimizar el riesgo por(Controles)</span>
                        </td>
                        <td colspan="3" style="text-align:center;">
                            <span class="cell-value" ><strong>Residual risk /</strong> Riesgo Residual</span>
                        </td>

                    </tr>
                    <tr class="microSubtitle">
                        <td>
                           <span><strong> Severity /</strong><br />Severidad</span>
                        </td>
                        <td>
                            <span><strong>Likelihood /</strong> <br />Probabilidad</span>
                        </td>
                        <td>
                            <span><strong>Risk /</strong> Riesgo</span>
                        </td>
                        <td>
                           <span> <strong>Severity /</strong><br />Severidad</span>
                        </td>
                        <td>
                            <span><strong>Likelihood /</strong> <br />Probabilidad</span>
                        </td>
                        <td>
                            <span><strong>Risk /</strong> Riesgo</span>
                        </td>
                    </tr>
                    <tr class="microSubtitle">
                        <td>
                           <span><strong>(L/ M/ H)</strong><br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> <br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> </span>
                        </td>
                        <td>
                           <span> <strong>(L/ M/ H)</strong><br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> <br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong></span>
                        </td>
                    </tr>
                    <%--Inicia tabla de llenado--%>
                    
                    <tr class="table-values" id="form_input">
                        <td class="first-col">
                           <span>
                             <input type="text" class="form-control form-control-sm" id="txt_task_order" name="task_order" value="" style="background-color:lightyellow;width:40px;"  readonly   />
                           </span>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_brakedown" name="task_brakedown" rows="3" style="background-color:lightyellow; width:167px; font-size:small " ></textarea>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_danger" name="task_danger" rows="3" style="background-color:lightyellow; width:167px; font-size:small " ></textarea>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_risk" name="task_risk" rows="3" style="background-color:lightyellow; width:150px; font-size:small " ></textarea>
                        </td>
                        <td>
                            <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_initialrisk_severity" name="task_initialrisk_severity">
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_initialrisk_probability" name="task_initialrisk_probability">
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td>
                           <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;width:60px;" id="cmb_task_initialrisk_risk" name="task_initialrisk_risk" >
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td style="width:180px;">
                           <textarea class="form-control form-control-sm" id="txt_task_minimizerisk" name="task_minimizerisk" rows="3" style="background-color:lightyellow; width:150px; font-size:small " ></textarea>
                        </td>
                        <td style="text-align:center;">
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_residualrisk_severity" name="task_residualrisk_severity">
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td>
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_residualrisk_Probability" name="task_residualrisk_Probability">
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td>
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;width:55px;" id="cmb_task_residualrisk_Risk" name="task_residualrisk_Risk">
                                <option selected  value="-1"></option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                            </select>
                        </td>
                        <td>
                            <button type="button" id="btn_addtask" style="margin :10px; padding:5px;"  > Agregar</button>
                        </td>
                    </tr>
                    <% 
                        Dim index As Integer = 0
                        If showloadeddata Then
                            For Each item As etra.com.objects.TRATaskObj In new_tra_inssession.traTasks
                                index = index + 1
                            
                        
                     %>
                    <tr class="table-values" id="form_input_<% Response.Write(index)%>>">
                        <td class="first-col">
                           <span>
                             <input type="text" class="form-control form-control-sm" id="txt_task_order_<% Response.Write(index)%>" name="task_order" value="<% If showloadeddata Then Response.Write(item.traR_Consecutivo)%>" style="background-color:lightyellow;width:40px;"  readonly   />
                           </span>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_brakedown_<% Response.Write(index)%>" name="task_brakedown" rows="3" style="background-color:lightyellow; width:167px; font-size:small " ><% If showloadeddata Then Response.Write(item.traR_TaskSteps)%></textarea>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_danger_<% Response.Write(index)%>" name="task_danger" rows="3" style="background-color:lightyellow; width:167px; font-size:small " ><% If showloadeddata Then Response.Write(item.traR_Hazard)%></textarea>
                        </td>
                        <td style="width:170px;">
                            <textarea class="form-control form-control-sm" id="txt_task_risk_<% Response.Write(index)%>" name="task_risk" rows="3" style="background-color:lightyellow; width:150px; font-size:small " ><% If showloadeddata Then Response.Write(item.traR_Risk)%></textarea>
                        </td>
                        <td>
                            <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_initialrisk_severity_<% Response.Write(index)%>" name="task_initialrisk_severity">
                                 <%
                                     Dim selectl As String = ""
                                     Dim selectm As String = ""
                                     Dim selecth As String = ""
                                     If showloadeddata Then
                                         Select Case item.traR_Ini_Severity
                                             Case "L"
                                                 selectl = "selected"
                                             Case "M"
                                                 selectm = "selected"
                                             Case "H"
                                                 selecth = "selected"
                                         End Select
                                     End If
                                 %>
                                <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_initialrisk_probability_<% Response.Write(index)%>" name="task_initialrisk_probability">
                                <%
                                    selectl = ""
                                    selectm = ""
                                    selecth = ""
                                     If showloadeddata Then
                                        Select Case item.traR_Ini_Likeli
                                            Case "L"
                                                selectl = "selected"
                                            Case "M"
                                                selectm = "selected"
                                            Case "H"
                                                selecth = "selected"
                                        End Select
                                     End If
                                 %>
                                <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td>
                           <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;width:60px;" id="cmb_task_initialrisk_risk_<% Response.Write(index)%>" name="task_initialrisk_risk" >
                               <%
                                    selectl = ""
                                    selectm = ""
                                    selecth = ""
                                     If showloadeddata Then
                                         Select Case item.traR_Ini_Risk
                                             Case "L"
                                                 selectl = "selected"
                                             Case "M"
                                                 selectm = "selected"
                                             Case "H"
                                                 selecth = "selected"
                                         End Select
                                     End If
                                 %> 
                               <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td style="width:180px;">
                           <textarea class="form-control form-control-sm" id="txt_task_minimizerisk_<% Response.Write(index)%>" name="task_minimizerisk" rows="3" style="background-color:lightyellow; width:150px; font-size:small " ><% If showloadeddata Then Response.Write(item.traR_MinimizeRiskBy)%></textarea>
                        </td>
                        <td style="text-align:center;">
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_residualrisk_severity_<% Response.Write(index)%>" name="task_residualrisk_severity">
                                 <%
                                    selectl = ""
                                    selectm = ""
                                    selecth = ""
                                     If showloadeddata Then
                                         Select Case item.traR_Res_Severity
                                             Case "L"
                                                 selectl = "selected"
                                             Case "M"
                                                 selectm = "selected"
                                             Case "H"
                                                 selecth = "selected"
                                         End Select
                                     End If
                                 %> 
                               <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td>
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;" id="cmb_task_residualrisk_Probability_<% Response.Write(index)%>" name="task_residualrisk_Probability">
                                 <%
                                    selectl = ""
                                    selectm = ""
                                    selecth = ""
                                     If showloadeddata Then
                                         Select Case item.traR_Res_Likeli
                                             Case "L"
                                                 selectl = "selected"
                                             Case "M"
                                                 selectm = "selected"
                                             Case "H"
                                                 selecth = "selected"
                                         End Select
                                     End If
                                 %> 
                               <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td>
                             <select class="form-control form-control-sm" style="background-color:lightyellow;height:67px;width:55px;" id="cmb_task_residualrisk_Risk_<% Response.Write(index)%>" name="task_residualrisk_Risk">
                                 <%
                                    selectl = ""
                                    selectm = ""
                                    selecth = ""
                                     If showloadeddata Then
                                         Select Case item.traR_Res_Risk
                                             Case "L"
                                                 selectl = "selected"
                                             Case "M"
                                                 selectm = "selected"
                                             Case "H"
                                                 selecth = "selected"
                                         End Select
                                     End If
                                 %> 
                               <option selected  value="-1"></option>
                                <option <%Response.Write(selectl)%> value="L">L</option>
                                <option <%Response.Write(selectm)%> value="M">M</option>
                                <option <%Response.Write(selecth)%> value="H">H</option>
                            </select>
                        </td>
                        <td>
                            <button type="button" id="btn_deleterow_<% Response.Write(index)%>" style="margin :10px; padding:5px;"  > Borrar Delete</button>
                        </td>
                    </tr>
                    <%
                    Next
                    End If
                    %>
                    

                    <%--Termina tabla de llenado--%>
                </table>
            </td>
        </tr>
       <%-- Seccion de Riesgos adicionales en sitio--%>
        <tr>
            <td id="InitialLabel">
                <img src="../images/img-tra-riesgospotentciales.png" />
            </td>
            <td>
                <table id="AditionalRiskinSite" style="width:100%;">
                    <tr>
                        <td colspan="10" class="cell-header">
                            <h4>ADITIONAL RISK AT THE WORK SITE / RIESGOS ADICIONALES EN SITIO DE TRABAJO</h4>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3"  colspan="2" class="cell-header" style="width:120px;">
                            <span>DANGER / Peligro</span>
                        </td>
                        <td rowspan="3" class="cell-header" style="width:290px;">
                             <span>RISK DESCRIPTION / Descripcion de riesgo</span>
                        </td>
                        <td colspan="3" class="cell-header">
                            <span><strong>RESIDUAL RISK /</strong>Riesgo Residual</span>
                        </td>
                        <td rowspan="3" class="cell-header" style="width:160px;">
                            <span> MINIMIZE RISK BY (CONTROLS) /<br /> Minimizar el riesgo por(Controles)</span>
                        </td>
                        <td colspan="3" class="cell-header" style="width:80px;">
                            <span><strong>RESIDUAL RISK /</strong>Riesgo Residual</span>
                        </td>
                    </tr>
                    <tr class="microSubtitle">
                        <td>
                           <span><strong> Severity /</strong><br />Severidad</span>
                        </td>
                        <td>
                            <span><strong>Likelihood /</strong> <br />Probabilidad</span>
                        </td>
                        <td>
                            <span><strong>Risk /</strong> Riesgo</span>
                        </td>
                        <td>
                           <span> <strong>Severity /</strong><br />Severidad</span>
                        </td>
                        <td>
                            <span><strong>Likelihood /</strong> <br />Probabilidad</span>
                        </td>
                        <td>
                            <span><strong>Risk /</strong> Riesgo</span>
                        </td>
                    </tr>
                    <tr class="microSubtitle">
                        <td>
                           <span><strong>(L/ M/ H)</strong><br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> <br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> </span>
                        </td>
                        <td>
                           <span> <strong>(L/ M/ H)</strong><br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong> <br /></span>
                        </td>
                        <td>
                            <span><strong>(L/ M/ H)</strong></span>
                        </td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                            <span>1</span>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                            <span>2</span>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Seccion de peligros evaluados--%>
        <tr>
             <td id="InitialLabel">
                <img src="../images/img-tra-desarrolloactividad.png" />
            </td>
            <td>
                <table style="width:100%">
                    <tr>
                        <%--Tabla de peligros--%>
                        <td valign="top" style="height:auto ">
                            <table id="TableMandatory">
                                <tr>
                                    <td colspan="6" class="cell-header" style="padding-top:2px;">
                                        <h4> <strong>MANDATORY/OBLIGATORIO</strong> </h4>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cell-header">
                                        <h6><strong> Hazard /</strong> Peligro</h6>
                                    </td>
                                    <td class="cell-header">
                                          <h6><strong> N/A</strong></h6>
                                    </td>
                                    <td class="cell-header">
                                        <h6><strong> Assessed /</strong> Evaluado</h6>
                                    </td>
                                    <td class="cell-header">
                                        <h6><strong> Hazard /</strong> Peligro</h6>
                                    </td>
                                    <td class="cell-header">
                                        <h6><strong> N/A</strong></h6>
                                    </td>
                                    <td class="cell-header">
                                        <h6><strong> Assessed /</strong> Evaluado</h6>
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>HAZZARDOUS SUBSTANCES(COSHH)/<BR />Sustancias Peligrosas</span>
                                    </td>
                                    <%
                                        Dim checkedvaluena As String = "checked"
                                        Dim checkedvalueyes As String = ""
                                        If Not new_tra_inssession.tra_Hazard_Subs_NA And new_tra_inssession.tra_Hazard_Subs_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_hazard" name="mandatory_hazard" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%>  /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <input type="radio"  id="rd_mandatory_hazard" name="mandatory_hazard" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%>  /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>PEOPLE/HUMAN FACTORS/<BR />Factores Humanos</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Factors_NA And new_tra_inssession.tra_Hazard_Factors_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_humanfac" name="mandatory_humanfac" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%-- <span></span>--%>
                                        <input type="radio"  id="mandatory_humanfac" name="mandatory_humanfac" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                </tr>
                                 <tr id="RowsMandatory-content">
                                    <td>
                                        <span>NOISE/RUIDO</span>
                                    </td>
                                     <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                         If Not new_tra_inssession.tra_Hazard_Noise_NA And new_tra_inssession.tra_Hazard_Noise_Eval Then
                                             checkedvaluena = ""
                                             checkedvalueyes = "checked"
                                         End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_noise" name="mandatory_noise" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%>  /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_noise" name="mandatory_noise" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%>  /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>COMMUNICATION/Comunicaci&oacute;n</span>
                                    </td>
                                     <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                         If Not new_tra_inssession.tra_Hazard_Comms_NA And new_tra_inssession.tra_Hazard_Comms_Eval Then
                                             checkedvaluena = ""
                                             checkedvalueyes = "checked"
                                         End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_comm" name="mandatory_comm" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%>  /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                         <%--<span></span>--%>
                                         <input type="radio"  id="rd_mandatory_comm" name="mandatory_comm" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>MANUAL HANDLIG<BR />/Manipulaci&oacute;n/carga manual</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Hand_NA And new_tra_inssession.tra_Hazard_Hand_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                       <%-- <span class="colored"></span>--%>
                                         <input type="radio"  id="rd_mandatory_manuhand" name="mandatory_manuhand" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_manuhand" name="mandatory_manuhand" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>ENVIROMENT/Medio Ambiente</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Environ_NA And new_tra_inssession.tra_Hazard_Environ_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                       <%-- <span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_enviro" name="mandatory_enviro" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                         <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_enviro" name="mandatory_enviro" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>ACCESS/EGRESS/Entradas y salidas</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Access_NA And new_tra_inssession.tra_Hazard_Access_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_access" name="mandatory_access" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_access" name="mandatory_access" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>PROCESS / Proceso</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Process_NA And new_tra_inssession.tra_Hazard_Process_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                       <%-- <span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_process" name="mandatory_process" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%-- <span></span>--%>
                                        <input type="radio"  id="rd_mandatory_process" name="mandatory_process" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /> <br />SI/YES
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>WORK EQUIPMENT<br />Herramienta y Equipo de trabajo</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Equip_NA And new_tra_inssession.tra_Hazard_Equip_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                       <%-- <span class="colored"></span>--%>
                                       <input type="radio"  id="rd_mandatory_workequip" name="mandatory_workequip" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_workequip" name="mandatory_workequip" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>VIBRATION/ REPETITIVE STRAIN /<br />Vibraciones /Esfuerzo repetitivo</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Vibration_NA And new_tra_inssession.tra_Hazard_Vibration_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_vibration" name="mandatory_vibration" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%>  /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%-- <span></span>--%>
                                        <input type="radio"  id="rd_mandatory_vibration" name="mandatory_vibration" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>OVERHEAD WORK/LIFTING OPS<br /><span style="font-size:8pt">Trabajos en altura o maniobras de carga por encima del area de trabajo</span> </span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Overhead_NA And new_tra_inssession.tra_Hazard_Overhead_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                       <%-- <span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_overhead" name="mandatory_overhead" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_overhead" name="mandatory_overhead" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%> /><br />SI/YES
                                    </td>
                                    <td>
                                         <span>CONDICIONES CLIMATOLOGICAS<br />PREVAILING WEATHER</span>
                                    </td>
                                    <%
                                        checkedvaluena = "checked"
                                        checkedvalueyes = ""
                                        If Not new_tra_inssession.tra_Hazard_Weather_NA And new_tra_inssession.tra_Hazard_Weather_Eval Then
                                            checkedvaluena = ""
                                            checkedvalueyes = "checked"
                                        End If
                                     %>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                        <%--<span class="colored"></span>--%>
                                        <input type="radio"  id="rd_mandatory_weather" name="mandatory_weather" value="N/A" <% If showloadeddata Then Response.Write(checkedvaluena) Else Response.Write("checked")%> /><br />N/A
                                    </td>
                                    <td class="cell-value" style="font-size:small;background-color:lightyellow;">
                                         <%--<span></span>--%>
                                        <input type="radio"  id="rd_mandatory_weather" name="mandatory_weather" value="SI/YES" <% If showloadeddata Then Response.Write(checkedvalueyes)%>  /><br />SI/YES
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%--Tabla de Severidad--%>
                        <td>
                            <table id="TableRiskMatrix">
                                <tr style="height:80px;">
                                    <td colspan="3" rowspan="3" class="cell-header">
                                        <h5> <strong> RISK MATRIX /<br /> </strong></h5><h6><strong> Matriz de riesgo</strong> </h6>
                                    </td>
                                    <td colspan="5" class="cell-header">
                                        <h5>DANGER SEVERITY / Severidad de Peligo</h5>
                                    </td>

                                </tr>
                                <tr class="microSubtitle">
                                    <td colspan="2">
                                        <span> Low / Bajo</span>
                                    </td>
                                    <td>
                                        <span> Medium / Medio</span>
                                    </td>
                                    <td colspan="2">
                                       <span> High / Alto</span>
                                    </td>

                                </tr>
                                <tr class="microSubtitle">
                                    <td>
                                        <span><strong>NEGLIGIBLE/</strong><br />Insignificante</span>
                                    </td>
                                    <td>
                                        <span><strong>SLIGHT/</strong><br />Leve</span>
                                    </td>
                                    <td>
                                        <span><strong>MODERATE/</strong><br />Moderado</span>
                                    </td>
                                    <td>
                                         <span><strong>HIGH/</strong><br />Alto</span>
                                    </td>
                                    <td>
                                        <span><strong>VERY HIGH/</strong><br />Muy Alto</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="5" class="cell-header">
                                        <img src="../images/img-tra-probabilidad.png" />
                                    </td>
                                    <td rowspan="2" class="microSubtitle">
                                        <span>LOW<br />BAJO</span>
                                    </td>
                                    <td style="text-align:center;">
                                        <span class="text-verysmall">
                                            <strong>Very Unlikely/</strong><br />Muy poco probable
                                        </span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;"> 
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;">
                                        <span class="text-verysmall">
                                            <strong>Unlikely/</strong><br />Poco probable
                                        </span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                     <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td class="microSubtitle">
                                        <span>MEDIUM<br />MEDIO</span>
                                    </td>
                                    <td style="text-align:center;">
                                        <span class="text-verysmall">
                                            <strong>Possible/</strong><br />Posible
                                        </span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td rowspan="2"class="microSubtitle">
                                        <span>HIGH<br />ALTO</span>
                                    </td>
                                    <td style="text-align:center;">
                                        <span class="text-verysmall">
                                            <strong>Likely/</strong><br />Probable
                                        </span>
                                    </td>
                                    <td class="cell-green" style="border-color:black;">
                                        <span>LOW BAJO</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center;">
                                        <span class="text-verysmall">
                                            <strong>Very Likely/</strong><br />Muy probable
                                        </span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-yellow" style="border-color:black;">
                                        <span>MED</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                    <td class="cell-red" style="border-color:black;">
                                        <span>HIGH ALTO</span>
                                    </td>
                                </tr>
                                <tr style="height:15px;">
                                    <td colspan="4" class="cell-header" style="padding-top:4px; ">
                                        <h6><strong>OVERALL RISK</strong> <br /> Riesgo General:</h6>
                                    </td>
                                    <td style="text-align:center; border-color:white;">
                                        <span style="font-size:10pt"><strong>LOW/<br />BAJO</strong></span>
                                    </td>
                                    <td style="text-align:center; border-color:white;">
                                        <span style="font-size:10pt"><strong>MEDIUM/<br />MEDIO</strong></span>
                                    </td>
                                    <td colspan="2" style="text-align:center; border-color:white;">
                                        <span style="font-size:10pt"><strong>HIGH/<br />ALTO</strong></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Tabla Responsables--%>
        <tr>
            <td id="InitialLabel">
                <div style="width:20px;">
                   <img src="../images/img-tra-control.png" /  >
               </div>
            </td>
            <td>
                <%--tabla de control header--%>
                <table id="Tablecontrol-header" style="width:100%">
                    <tr style="height:70px;">
                        <td class="cell-header" style="text-align:right; width:300px; padding-right :10px;">
                            <span style="">
                                <h6><strong>MANNING REQUIRED</strong><br /> Num. Personal Requerido:</h6>
                            </span>
                        </td>
                        <td style="width:90px; text-align:center;">
                           <%-- <span class="cell-value" style="font-size:15pt;font-weight:bold;"></span>--%>
                            <input type="text" class="form-control form-control-sm" id="txt_manningreq" name="manningreq" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_manning_required)%>" style="background-color:lightyellow;height:90px;text-align:center;font-size:large ;" maxlength="2"  />
                        </td>
                        <td class="cell-header" style="text-align:right; width:250px; padding-right :10px;">
                              <span style="">
                                <h6><strong>APPLICABLE PROCEDURE</strong><br /> Procedimiento Aplicable:</h6>
                            </span>
                        </td>
                        <td colspan="2" style="text-align:center;">
                            <%--<span ></span>--%>
                            <textarea class="form-control form-control-sm" id="txt_app_procedures" name="app_procedures" rows="4" style="background-color:lightyellow; width:100%; font-size:small " ><% If showloadeddata Then Response.Write(new_tra_inssession.tra_ApplicableProcedure)%></textarea>
                        </td>
                    </tr>
                    <tr style="height:20px;">
                        <td class="cell-header" style="text-align:right;padding-right :10px;">
                             <span style="font-size:10pt;">
                                <strong>PERMIT HOLDER</strong>(Print name and signature)<br /> Solicitante del Permiso(Nombre y Firma):
                            </span>
                        </td>
                        <td colspan="2" style="text-align:center;font-size:10pt;font-weight:bold;" >
                         <%--   <span  ></span>--%>
                             <input type="text" class="form-control form-control-sm" id="txt_permitholder" name="permitholder" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_permit_holder)%>" style="background-color:lightyellow;height:70px;font-size:medium ; width:100%;" />
                        </td>
                        
                        <td class="cell-header" style="text-align:right;padding-right :10px;">
                            <span style="font-size:10pt;">
                                <strong>PERMIT AUTHORITY</strong><br /> Responsable de &aacute;rea<br />(Nombre y Firma):
                            </span>
                        </td>
                        <td style="width:200px;text-align:center;font-size:10pt;font-weight:bold;">
                            <%--<span></span>--%>
                            <input type="text" class="form-control form-control-sm" id="txt_permitauthority" name="permitauthority" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_permit_autority )%>" style="background-color:lightyellow;height:70px;font-size:medium ; width:250px;" />
                        </td>
                    </tr>
                    <%--tabla de nombres tra--%>
                    <tr>
                        <td colspan="5">
                            <table id="Tablecontrol-names" class="Tablecontrol-names" style="width:100%">
                                <tr>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Name-Position/</strong> Nombre-Categoria
                                        </span>
                                    </td>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Company/</strong> Compañia
                                        </span>
                                    </td>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Signature/</strong> Firma
                                        </span>
                                    </td>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Name-Position/</strong> Nombre-Categoria
                                        </span>
                                    </td>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Company/</strong> Compañia
                                        </span>
                                    </td>
                                    <td class="header-cell">
                                        <span>
                                            <strong>Signature/</strong> Firma
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       <%-- footer de la pagina--%>
        <tr>
            <td colspan="2">
                <div class="content">
                        <div class="row">
                            <div class="col ml-2 mt-1" style="font-size:x-small ">812.SP19F1 </div>
                            <div class="col mr-2 mt-1 text-right" style="font-size:x-small; "><span style="margin-right:50px;">REV. 00</span> </div>
                        </div>
                    </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-right p-2">
                <%--<button type="button" class="btn btn-success " style="margin-right:50px; " id="btn_downloadmsword" >Descargar en Formato Word</button>--%>
                <button type="button" class="btn btn-success" style="margin-right:50px; " id="btn_savemytra" >Guardar TRA</button>
                <button type="button" class="btn btn-primary " style="margin-right:50px; " id="btn_viewformat" >Ver en Formato</button>
                <button type="button" class="btn btn-warning " style="margin-right:50px; " id="btn_printformat" >Imprimir</button>
            </td> 
        </tr>
    </table>
   
</div>
<%-- version de mobil--%>
<div class="" id="smallscreenver">
    <div class="container">
<%--Seccion de encabezado--%>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="txt_sm_unit">Unidad/Unidad</label>
                    <input type="text" class="form-control" id="txt_sm_unit" name="sm_unit" value="<% Response.Write(GlobalConfigReader.GetValue("main_unit"))%>" placeholder="" readonly >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="cmb_sm_deparment">Department/Departamento:</label>
                    <select class="form-control" id="cmb_sm_deparment" name="deparments" >
                        <option selected ></option>
                              <%
                                  Dim selected_sm As String = ""
                                  For Each item As etra.com.objects.TRADeparment In list_department
                                      If showloadeddata Then
                                          If item.cDep_Name.Equals(new_tra_inssession.tra_Dept) Then
                                              selected_sm = "selected"
                                          Else
                                              selected_sm=""
                                          End If
                                      End If
                               %>
                                 <option <% If showloadeddata Then Response.Write(selected_sm)%> value="<%Response.Write(item.cDep_Name)%>"><%Response.Write(item.cDep_Name) %></option>
                              <%
                              Next
                               %>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="txt_sm_location">Job Location/Sitio de Trabajo:</label>
                    <input type="text" class="form-control" id="txt_sm_location" name="location" value="<%If showloadeddata Then Response.Write(new_tra_inssession.tra_Location)%>" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="txt_sm_Activity">Activity / Job Descripcion / Actividad:</label>
                    <textarea id="txt_sm_Activity" class="form-control" rows="4" name="activity"  ><% If showloadeddata then Response.Write(new_tra_inssession.tra_Activity_Job) %></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="txt_sm_date">TRA Date / Fecha de TRA:</label>
                    <input style="text-align:center;" type="text" id="txt_sm_date" class="form-control" name="datetra"  value="<%Response.Write(new_tra_inssession.tra_Date.ToString("dd-MM-yyyy")) %>">
                </div>
            </div>
        </div>
<%--Seccion de tareas--%>
        <div class="row">
            <div class="col">
                <div class="container">
                    <div class="container text-center">
                        <span class="h4">Task / Actividades</span>
                    </div>
<%--Tabla de actividades--%>
                    <div class="table-responsive m-0 p-0" id="Activities_section">
<%--tabla de tareas --%>
                        <table class="table table-sm table-striped table-bordered " style="font-size:small;" id="TableTask_sm">
                            <tr class="text-center">
                                <th scope="col" rowspan="3" >No</th>
                                <th scope="col" rowspan="3">Break Down /<br />Pasos Trabajo</th>
                                <th scope="col" rowspan="3">Danger /<br />Peligro</th>
                                <th scope="col" rowspan="3">Risk Description /<br />Descripcion del Riesgo</th>
                                <th scope="col" colspan="3">Initial Risk /<br /> Riesgo Inicial</th>
                                <th scope="col" rowspan="3">Minimize Risk By(Controls)/<br /> Minimizar el riesgo por(controles)</th>
                                <th scope="col" colspan="3">Residual Risk / Riesgo Residual</th>
                            </tr>
                            <tr  class="text-center">
                                <td>Severity/<br />Severidad</td>
                                <td>Likelihood/<br />Probabilidad</td>
                                <td>Risk/<br />Riesgo</td>
                                
                                 <td>Severity/<br />Severidad</td>
                                <td>Likelihood/<br />Probabilidad</td>
                                <td>Risk/<br />Riesgo</td>
                            </tr>
                            <tr  class="text-center">
                                <td>(L/M/H)</td>
                                <td>(L/M/H)</td>
                                <td>(L/M/H)</td>
                               
                                <td>(L/M/H)</td>
                                <td>(L/M/H)</td>
                                <td>(L/M/H)</td>
                            </tr>
<%--inicia valores de tabla--%>
                            <%--<tr>
                                <td colspan="11" class="text-center">
                                     - No Items / Sin Actividades -
                                </td>
                            </tr>--%>
                             <tr style="display:none;" id="row_fill">
                                <td>
                                    <input type="text" class="form-control form-control-sm" value="" id="txt_task_order_sm" name="task_order" style="width:33px;"  />
                                 </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_brakedown_sm" name="task_brakedown" style="width:140px;font-size:small;  " rows="3"></textarea>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_danger_sm" name="task_danger" style="width:140px;font-size:small; " rows="3"></textarea>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_risk_sm" name="task_risk" style="width:140px;font-size:small; " rows="3"></textarea>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_initialrisk_severity_sm" name="task_initialrisk_severity" style="">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_initialrisk_probability_sm" name="task_initialrisk_probability" style="">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                     <select class="form-control form-control-sm" id="cmb_task_initialrisk_risk_sm" name="task_initialrisk_risk" style="width:50px;">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_minimizerisk_sm" name="task_minimizerisk" style="width:140px;font-size:small; " rows="3"></textarea>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_residualrisk_severity_sm" name="task_residualrisk_severity" style="">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_residualrisk_Probability_sm" name="task_residualrisk_Probability" style="">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                     <select class="form-control form-control-sm" id="cmb_task_residualrisk_Risk_sm" name="task_residualrisk_Risk" style="width:53px">
                                        <option selected value="-1"></option>
                                        <option  value="L">L</option>
                                        <option  value="M">M</option>
                                        <option  value="H">H</option>
                                    </select>
                                </td>
                                 <td>
                                     <button type="button" class="btn btn-sm btn-danger" id="btn_sm_deleterow" > Borrar <br /> Delete</button>
                                 </td>
                            </tr>
<%--Seccion de llenado si carga TRA--%>
                            <% 
                                If showloadeddata Then
                                    Dim index_tra_task_sm As Integer = 0
                                    For Each item As etra.com.objects.TRATaskObj In new_tra_inssession.traTasks
                                        index_tra_task_sm = index_tra_task_sm + 1
                             %>
                            <tr style="" id="row_fill_<% Response.Write(index_tra_task_sm)%>">
                                <td>
                                    <input type="text" class="form-control form-control-sm" value="<% Response.Write(item.traR_Consecutivo)%>" id="txt_task_order_sm_<%Response.Write(index_tra_task_sm)%>" name="task_order" style="width:33px;"  />
                                 </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_brakedown_sm_<%Response.Write(index_tra_task_sm)%>" name="task_brakedown" style="width:140px;font-size:small;  " rows="3"><% Response.Write(item.traR_TaskSteps)%></textarea>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_danger_sm_<%Response.Write(index_tra_task_sm)%>" name="task_danger" style="width:140px;font-size:small; " rows="3"><% Response.Write(item.traR_Hazard)%></textarea>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_risk_sm_<%Response.Write(index_tra_task_sm)%>" name="task_risk" style="width:140px;font-size:small; " rows="3"><% Response.Write(item.traR_Risk)%></textarea>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_initialrisk_severity_sm_<%Response.Write(index_tra_task_sm)%>" name="task_initialrisk_severity" style="">
                                        <% 
                                            Dim selectlvalue_sm As String = ""
                                            Dim selectmvalue_Sm As String = ""
                                            Dim selecthvalue_sm As String = ""
                                            Select Case item.traR_Ini_Severity
                                                Case "L"
                                                    selectlvalue_sm = "selected"
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = ""
                                                Case "M"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = "selected"
                                                    selecthvalue_sm = ""
                                                Case "H"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = "selected"
                                            End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_initialrisk_probability_sm_<%Response.Write(index_tra_task_sm)%>" name="task_initialrisk_probability" style="">
                                       <% 
                                           selectlvalue_sm = ""
                                           selectmvalue_Sm = ""
                                           selecthvalue_sm = ""
                                           Select Case item.traR_Ini_Likeli
                                               Case "L"
                                                   selectlvalue_sm = "selected"
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = ""
                                               Case "M"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = "selected"
                                                   selecthvalue_sm = ""
                                               Case "H"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = "selected"
                                           End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                     <select class="form-control form-control-sm" id="cmb_task_initialrisk_risk_sm_<%Response.Write(index_tra_task_sm)%>" name="task_initialrisk_risk" style="width:50px;">
                                       <% 
                                           selectlvalue_sm = ""
                                           selectmvalue_Sm = ""
                                           selecthvalue_sm = ""
                                           Select Case item.traR_Ini_Risk
                                               Case "L"
                                                   selectlvalue_sm = "selected"
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = ""
                                               Case "M"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = "selected"
                                                   selecthvalue_sm = ""
                                               Case "H"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = "selected"
                                           End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <textarea class="form-control form-control-sm" id="txt_task_minimizerisk_sm_<%Response.Write(index_tra_task_sm)%>" name="task_minimizerisk" style="width:140px;font-size:small; " rows="3"><% Response.Write(item.traR_MinimizeRiskBy)%></textarea>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_residualrisk_severity_sm_<%Response.Write(index_tra_task_sm)%>" name="task_residualrisk_severity" style="">
                                       <% 
                                           selectlvalue_sm = ""
                                           selectmvalue_Sm = ""
                                           selecthvalue_sm = ""
                                           Select Case item.traR_Res_Severity
                                               Case "L"
                                                   selectlvalue_sm = "selected"
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = ""
                                               Case "M"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = "selected"
                                                   selecthvalue_sm = ""
                                               Case "H"
                                                   selectlvalue_sm = ""
                                                   selectmvalue_Sm = ""
                                                   selecthvalue_sm = "selected"
                                           End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control form-control-sm" id="cmb_task_residualrisk_Probability_sm_<%Response.Write(index_tra_task_sm)%>" name="task_residualrisk_Probability" style="">
                                        <% 
                                           selectlvalue_sm = ""
                                           selectmvalue_Sm = ""
                                           selecthvalue_sm = ""
                                            Select Case item.traR_Res_Likeli
                                                Case "L"
                                                    selectlvalue_sm = "selected"
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = ""
                                                Case "M"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = "selected"
                                                    selecthvalue_sm = ""
                                                Case "H"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = "selected"
                                            End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                <td>
                                     <select class="form-control form-control-sm" id="cmb_task_residualrisk_Risk_sm_<%Response.Write(index_tra_task_sm)%>" name="task_residualrisk_Risk" style="width:53px">
                                        <% 
                                           selectlvalue_sm = ""
                                           selectmvalue_Sm = ""
                                           selecthvalue_sm = ""
                                            Select Case item.traR_Res_Risk
                                                Case "L"
                                                    selectlvalue_sm = "selected"
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = ""
                                                Case "M"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = "selected"
                                                    selecthvalue_sm = ""
                                                Case "H"
                                                    selectlvalue_sm = ""
                                                    selectmvalue_Sm = ""
                                                    selecthvalue_sm = "selected"
                                            End Select
                                        %>
                                        <option selected value="-1"></option>
                                        <option <%Response.Write(selectlvalue_sm)%> value="L">L</option>
                                        <option <%Response.Write(selectmvalue_Sm)%> value="M">M</option>
                                        <option <%Response.Write(selecthvalue_sm)%> value="H">H</option>
                                    </select>
                                </td>
                                 <td>
                                     <button type="button" class="btn btn-sm btn-danger" id="btn_sm_deleterow_<%Response.Write(index_tra_task_sm)%>" > Borrar <br /> Delete</button>
                                 </td>
                            </tr>
                            <%
                            Next
                        End If
                                
                            %>
                        </table>
                    </div>
<%--Tabla de captura de activivdades--%>
                    <div class="container mt-4 p-0" style="background-color:lightgray" id="from_activities_fill">
                        <div class="container text-center">
                            <span class="h4"> Add Task / Agregar Tarea </span>
                        </div>
                        <table class="responsive-table table-bordered text-right" style="width:100%" id="Table_inputactivities_sm">
                            <tbody> 
                                <tr>
                                    <th style="width:150px;">Break down /<br /> pasos del trabajo:</th>
                                    <td>
                                        <textarea id="txt_sm_ActivityTable_breakdown" class="form-control" rows="3"  name="sm_ActivityTable_breakdown"  reference="txt_task_brakedown_sm"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Danger /<br /> Peligro:</th>
                                    <td>
                                        <textarea id="txt_sm_ActivityTable_danger" class="form-control" rows="3" name="sm_ActivityTable_danger" reference="txt_task_danger_sm" ></textarea>
                                    </td>
                                </tr>
                                 <tr>
                                    <th>RISK DESCRIPTION /<br /> Descripcion del riesgo:</th>
                                    <td>
                                        <textarea id="txt_sm_ActivityTable_riskdesc" class="form-control" rows="3" name="sm_ActivityTable_riskdesc" reference="txt_task_risk_sm" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table class="table-bordered text-center" style="font-size:small;width:100%" id="table_risrisk">
                                            <tr>
                                                <td colspan="3">Initial Risk / Riesgo Inicial</td>
                                            </tr>
                                            <tr>
                                                <td>Severity/<br />Severidad</td>
                                                <td>Likelihood/<br />Probabilidad</td>
                                                <td>Risk/<br />Riesgo</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_risk_severity" name="sm_ActivityTable_risk_severity" reference="cmb_task_initialrisk_severity_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_risk_likelihood" name="sm_ActivityTable_risk_likelihood" reference="cmb_task_initialrisk_probability_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                                <td>
                                                     <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_risk_risk" name="sm_ActivityTable_risk_risk" reference="cmb_task_initialrisk_risk_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <th>MINIMIZE RISK BY/<br /> Minimizar el riesgo por(Controles):</th>
                                    <td>
                                        <textarea id="txt_sm_ActivityTable_riskdesc" class="form-control" rows="3" name="sm_ActivityTable_riskdesc" reference="txt_task_minimizerisk_sm" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <table class="table-bordered text-center" style="font-size:small;width:100%" id="table_residualrisk">
                                        <tbody>
                                            <tr>
                                                <td colspan="3">Residual Risk / Riesgo Residual</td>
                                            </tr>
                                            <tr>
                                                <td>Severity/<br />Severidad</td>
                                                <td>Likelihood/<br />Probabilidad</td>
                                                <td>Risk/<br />Riesgo</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_residual_severity" name="sm_ActivityTable_residual_severity" reference="cmb_task_residualrisk_severity_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_residual_likelihood" name="sm_ActivityTable_residual_likelihood" reference="cmb_task_residualrisk_Probability_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                                <td>
                                                     <select class="form-control form-control-sm" style="" id="cmb_sm_ActivityTable_residual_risk" name="sm_ActivityTable_residual_risk" reference="cmb_task_residualrisk_Risk_sm">
                                                        <option selected  value=""></option>
                                                        <option value="L">L</option>
                                                        <option value="M">M</option>
                                                        <option value="H">H</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                      </table>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <img src="../images/tbl-hazardseverity.JPG" style="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <button type="button" class="btn btn-block btn-primary" id="btn_additem_sm" > Add item / Agregar </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
<%--Seccion de evaluacion obligatoria--%>
        <div class="row text-center mt-3">
            <div class="col bg-secondary text-white">
                <span class="h4 ">MANDATORY / OBLIGATORIO</span>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>HAZARDOUS SUBSTANCES(COSHH)/<br />Sustancias Peligrosas</span>
            </div>
        </div>
        <div class="row text-center">
            <%
                Dim checkedNA_sm As String = "checked"
                Dim checkedYes As String = ""
                If showloadeddata Then
                    If Not new_tra_inssession.tra_Hazard_Subs_NA And new_tra_inssession.tra_Hazard_Subs_Eval Then
                        checkedNA_sm = ""
                        checkedYes="checked"
                    End If
                End If
                %>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_hazzardussubs_NA" name="mandatory_hazard_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>/>
                <label for="rd_sm_mandatory_hazzardussubs_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_hazzardussubs_Assessed" name="mandatory_hazard_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_hazzardussubs_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>Noise / Ruido</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Noise_NA And new_tra_inssession.tra_Hazard_Noise_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_noise_NA" name="mandatory_noise_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>/>
                <label for="rd_sm_mandatory_noise_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_noise_Assessed" name="mandatory_noise_sm" class="form-check-input" value="SI/YES"  <%Response.Write(checkedYes)%>/>
                <label for="rd_sm_mandatory_noise_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>MANUAL HANDLING / Manipulacion/Carga manual</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Hand_NA And new_tra_inssession.tra_Hazard_Hand_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_manualhand_NA" name="mandatory_manuhand_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>  />
                <label for="rd_sm_mandatory_manualhand_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_manualhand_Assessed" name="mandatory_manuhand_sm" class="form-check-input" value="SI/YES"  <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_manualhand_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>ACESS/ EGRESS / Entrada y Salida</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Access_NA And new_tra_inssession.tra_Hazard_Access_Eval  Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_acessegress_NA" name="mandatory_access_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>  />
                <label for="rd_sm_mandatory_acessegress_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_acessegress_Assessed" name="mandatory_access_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_acessegress_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>WORK EQUIPMENT/ Herramienta y equipo de trabajo</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Equip_NA  And new_tra_inssession.tra_Hazard_Equip_Eval  Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_workequipment_NA" name="mandatory_workequip_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_workequipment_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_workequipment_Assessed" name="mandatory_workequip_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_workequipment_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>OVERHEAD WORK/LIFT OPS / Trabajos en altura o maniobras de carga</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Overhead_NA And new_tra_inssession.tra_Hazard_Overhead_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_overhead_NA" name="mandatory_overhead_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_overhead_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_overhead_Assessed" name="mandatory_overhead_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_overhead_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>PEOPLE/HUMAN FACTORS / Factores humanos</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Factors_NA And new_tra_inssession.tra_Hazard_Factors_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_humanfac_NA" name="mandatory_humanfac_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_humanfac_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_humanfac_Assessed" name="mandatory_humanfac_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_humanfac_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>COMMUNICATION/Comunicaci&oacute;n</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Comms_NA  And new_tra_inssession.tra_Hazard_Comms_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_comms_NA" name="mandatory_comm_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_comms_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_comms_Assessed" name="mandatory_comm_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_comms_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>ENVIROMENT/Medio Ambiente</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Environ_NA And new_tra_inssession.tra_Hazard_Environ_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_enviroment_NA" name="mandatory_enviro_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_enviroment_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_enviroment_Assessed" name="mandatory_enviro_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_enviroment_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>Process/Proceso</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Process_NA And new_tra_inssession.tra_Hazard_Process_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_process_NA" name="mandatory_process_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_process_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_process_Assessed" name="mandatory_process_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_process_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>VIBRATION/ REPETITIVE STRAIN/ Vibraciones/ Esfuersos repetitivos</span>
            </div>
        </div>
        <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Vibration_NA And new_tra_inssession.tra_Hazard_Vibration_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_vibration_NA" name="mandatory_vibration_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_vibration_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_vibration_Assessed" name="mandatory_vibration_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_vibration_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
        <div class="row text-center mt-3 h5 border" style="background-color:lightgray">
            <div class="col-sm">
                <span>PREVAILING WEATHER / Condiciones Climatologicas</span>
            </div>
        </div>
         <%
            checkedNA_sm = "checked"
            checkedYes = ""
            If showloadeddata Then
                If Not new_tra_inssession.tra_Hazard_Weather_NA And new_tra_inssession.tra_Hazard_Weather_Eval Then
                    checkedNA_sm = ""
                    checkedYes = "checked"
                End If
            End If
        %>
        <div class="row text-center">
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_weather_NA" name="mandatory_weather_sm" class="form-check-input" value="N/A" <%Response.Write(checkedNA_sm)%>   />
                <label for="rd_sm_mandatory_weather_NA" class="form-check-label h5">N/A</label>
            </div>
            <div class="col">
                 <input type="radio" id="rd_sm_mandatory_weather_Assessed" name="mandatory_weather_sm" class="form-check-input" value="SI/YES" <%Response.Write(checkedYes)%> />
                <label for="rd_sm_mandatory_weather_Assessed" class="form-check-label h5">Assessed/Evaluado</label>
            </div>
        </div>
<%--seccion final de formulario--%>
        <div class="row">
            <div class="container mt-5">
                <div class="form-group">
                    <label for="txt_sm_procedures">APPLICABLE PROCEDURES /<br />
                        Procedimientos aplicable:</label>
                    <textarea id="txt_sm_procedures" name="app_procedures" class="form-control" rows="4"><% If showloadeddata Then Response.Write(new_tra_inssession.tra_ApplicableProcedure)%></textarea>
                </div>
                <div class="form-group">
                    <label for="txt_sm_manning">MANNING REQUIRED / Num. Personal Requerido</label>
                    <input type="text" id="txt_sm_manning" name="manningreq" class="form-control text-center" maxlength="3" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_manning_required)%>" />
                </div>
                <div class="form-group">
                    <label for="txt_sm_holder">PERMIT HOLDER/ Solicitante del Permiso</label>
                    <input type="text" id="txt_sm_holder" name="permitholder" class="form-control" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_permit_holder)%>" />
                </div>
                <div class="form-group">
                    <label for="txt_sm_holder">PERMIT AUTHORITY / Responsable de área<br />(Nombre y Firma):</label>
                    <input type="text" id="txt_sm_authority" name="permitauthority" class="form-control" value="<% If showloadeddata Then Response.Write(new_tra_inssession.tra_permit_autority)%>" />
                </div>
            </div>         
        </div>
        <div class="row">
            <div class="container">
                <button type="button" class="btn btn-success btn-block mb-3" id="btn_sm_savetra" >Guardar TRA </button>
                <button type="button" class="btn btn-primary btn-block mb-3" id="btn_sm_viewformat">Ver en Formato </button>
                <%--<button type="button" class="btn btn-warning btn-block mb-3">Imprimir </button>--%>
            </div>
        </div>
    </div>
    
</div>
</form>

</div>
<script>
    var regex = /^(.*)(\d)+$/i;
    var indextable = 0
    var indextable_sm = 0
    //controles para desktop version

    $("#btn_addtask").click(function () {
        var id = this.id;
        var btn_add = id.indexOf("btn_addtask");
        var params_values = new Array();
        //revisa si es el boton de agrear actividad
        if (btn_add > -1) {

            //revisa si hay elementos en la tabla para reiniciar el contador
            var sizetr = $("#Tasklist tr[id*='form_input_']").length;
            if (sizetr <= 0) {

                indextable = 0;
            }

            var $Trtoclone = $("#form_input");
            var $tr_clone = $Trtoclone.clone(true)
            indextable++;
            
            //Cambia el indice de la fila de la tabla
            $tr_clone.attr("id", $tr_clone.attr("id") + "_" + (indextable))

            //por cada elemento encontrado en la fila clonada
            $tr_clone.find("*").each(function () {
                //cambia el id de los controles y les agrega un consecutivo
                var id = this.id || "";
                //si es caja de texto
                var n = id.indexOf("txt_");
                if (n > -1) {                    
                    //revisa si es la columna de ordenamiento
                    var n = this.id.indexOf("task_order");
                    if (n > -1) {
                        $(this).val(indextable);
                    }
                    
                    //cambia el id del control
                    this.id = id + "_" + (indextable);
                    var v_name = $(this).attr("name");
                    var V_value = $(this).val()
                    //guarda en array el campo y el valor

                    params_values.push({[v_name]: V_value });
                    
                }
                //si es boton
                var n = id.indexOf("btn_");
                if (n > -1) {
                    $(this).attr("id", "btn_deleterow_" + (indextable));
                    $(this).text("Borrar Delete");
                    //this.id = id + "_" + (indextable);
                }
                //si es select
                var n = id.indexOf("cmb_");
                if (n > -1) {
                    $(this).val($("#form_input #" + this.id).val());
                    this.id = id + "_" + (indextable);

                    var v_name = $(this).attr("name");
                    var V_value = $(this).val()
                 
                    params_values.push({[v_name]: V_value });
                }
                
            });
          
            updatevaluepost("table_task", JSON.stringify(params_values));
            //Agrega la fila llenada
            $("#Tasklist tr:last").after($tr_clone);
            
            $("#Tasklist #form_input input[id*='txt_']").val("");
            $("#Tasklist #form_input textarea[id*='txt_']").val("");
            $('#Tasklist #form_input select[id*="cmb_"]').val("-1");

        } else {
            $($(this).closest("tr")).remove();
            var reindex=0;
            $("#Tasklist input[id*='txt_task_order_']").each(function () {
                reindex++;
                $(this).val(reindex);
                indextable = reindex;
            });
            updateTableTask();

        }
    });

    $("button[id*=btn_deleterow_]").click(function(){
        $($(this).closest("tr")).remove();
        var reindex=0;
        $("#Tasklist input[id*='txt_task_order_sm_']").each(function () {
            reindex++;
            $(this).val(reindex);
            indextable = reindex;
        });
        updateTableTask();
    });

    $("button[id*=btn_sm_deleterow]").click(function(){
        $($(this).closest("tr")).remove();
        var indextable_sm=0;
        $("#TableTask_sm input[type='text']").each(function () {
            var indexcontrol= this.id.substring(this.id.length,this.id.length-1)
            if(!isNaN(indexcontrol)){
                indextable_sm++;
                $(this).val(indextable_sm);
                indextable = indextable_sm;
            }
        });
        updateTableTask_sm();
    });

    $("#cmb_task_initialrisk_severity").change(function () {

        var strid = this.id
        var n = strid.indexOf("cmb_task_initialrisk_severity_");
        var val = this.id.substring(strid.length - 1, strid.length);

        if (n == -1) {
            var valueselected1 = $(this).val();
            var valueselected2 = $("#cmb_task_initialrisk_risk").val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_initialrisk_risk").val(result);
        } else {
            var valueselected1 = $(this).val();
            var valueselected2 = $("#cmb_task_initialrisk_risk_"+val).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_initialrisk_risk_"+val).val(result);
        }

        
    });

    $("#cmb_task_initialrisk_probability").change(function () {

        var strid = this.id
        var n = strid.indexOf("cmb_task_initialrisk_probability_");
        var val = this.id.substring(strid.length - 1, strid.length);

        if (n == -1) {
            var valueselected1 = $("#cmb_task_initialrisk_severity").val();
            var valueselected2 = $(this).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_initialrisk_risk").val(result);
        } else {
            var valueselected1 = $("#cmb_task_initialrisk_severity_"+val).val();
            var valueselected2 = $(this).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_initialrisk_risk_"+val).val(result);

        }

       
    });

    $("#cmb_task_residualrisk_severity").change(function () {
        var strid = this.id
        var n = strid.indexOf("cmb_task_residualrisk_severity_");
        var val = this.id.substring(strid.length - 1, strid.length);

        if (n == -1) {
            var valueselected1 = $(this).val();
            var valueselected2 = $("#cmb_task_residualrisk_Probability").val();
            
            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_residualrisk_Risk").val(result);
        } else {
            var valueselected1 = $(this).val();
            var valueselected2 = $("#cmb_task_residualrisk_Probability_"+val).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_residualrisk_Risk_" + val).val(result);

        }
    });

    $("#cmb_task_residualrisk_Probability").change(function () {
        var strid = this.id
        var n = strid.indexOf("cmb_task_residualrisk_Probability_");
        var val = this.id.substring(strid.length - 1, strid.length);

        if (n == -1) {
            var valueselected1 = $("#cmb_task_residualrisk_severity").val();
            var valueselected2 = $(this).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_residualrisk_Risk").val(result);
        } else {
            var valueselected1 = $("#cmb_task_residualrisk_severity_" + val).val();
            var valueselected2 = $(this).val();

            var result = GetRiskMatrix(valueselected1, valueselected2);
            $("#cmb_task_residualrisk_Risk_" + val).val(result);

        }
    });

    $("#TRAMainTable input[type='text']").change(function () {
        var txt_field = $(this).attr("name");
        var txt_value = $(this).val();
        updatevalue(txt_field, txt_value);
    });

    $("#TRAMainTable input[type='radio']").change(function () {
        var txt_field = $(this).attr("name");
        var txt_value = $(this).val();
        updatevalue(txt_field, txt_value);
    });
    
    $("#cmb_departments").change(function () {
        var txt_field = $(this).attr("name");
        var txt_value = $(this).val();
        updatevalue(txt_field, txt_value);
    });

    $("#txt_app_procedures").change(function(){
        var txt_field = $(this).attr("name");
        var txt_value = $(this).val();
        updatevalue(txt_field, txt_value);
    });

    $("#btn_viewformat").click(function(){
        window.open("TRAFormat.aspx");
    });

    $("#btn_printformat").click(function(){
        window.open("TRAFormat.aspx?printview=true");
    });
    
    $("#Tasklist textarea").change(function(){
        var id= this.id;
        var lastchar = id.substring(id.length,id.length-1);
        if(!isNaN(lastchar)){
            updateTableTask();
        }
    });

    $("#Tasklist select").change(function(){
        var id= this.id;
        var lastchar = id.substring(id.length,id.length-1);
        if(!isNaN(lastchar)){
            updateTableTask();
        }
    });

    $("#btn_savemytra").click(function(){
        SaveTRA();
    });

    // controles para mobil version

    $("#smallscreenver input").change(function(){
        var txt_field = $(this).attr("name");
        var txt_value = $(this).val();
        updatevalue(txt_field, txt_value);
    });


    $("#smallscreenver textarea").change(function(){
        var id= this.id
        var idindextable = id.substring(id.length,id.length-1);

        if(!isNaN(idindextable)){
            updateTableTask_sm()
        }else{
            var txt_field = $(this).attr("name");
            var txt_value = $(this).val();
            updatevalue(txt_field, txt_value);
        }
    });

    $("#smallscreenver select").change(function(){
        var id= this.id
        var idindextable = id.substring(id.length,id.length-1);
        if(!isNaN(idindextable)){
            updateTableTask_sm()
        }else{

            if(id=="cmb_sm_ActivityTable_risk_severity"){
                var valueselected1 = $(this).val();
                var valueselected2 = $("#cmb_sm_ActivityTable_risk_likelihood").val();

                var result = GetRiskMatrix(valueselected1, valueselected2);
                $("#cmb_sm_ActivityTable_risk_risk").val(result);
            }

            if(id=="cmb_sm_ActivityTable_risk_likelihood"){
                var valueselected1 = $(this).val();
                var valueselected2 = $("#cmb_sm_ActivityTable_risk_severity").val();

                var result = GetRiskMatrix(valueselected1, valueselected2);
                $("#cmb_sm_ActivityTable_risk_risk").val(result);
            }

            if(id=="cmb_sm_ActivityTable_residual_severity"){
                var valueselected1 = $(this).val();
                var valueselected2 = $("#cmb_sm_ActivityTable_residual_likelihood").val();

                var result = GetRiskMatrix(valueselected1, valueselected2);
                $("#cmb_sm_ActivityTable_residual_risk").val(result);
            }

            if(id=="cmb_sm_ActivityTable_residual_likelihood"){
                var valueselected1 = $(this).val();
                var valueselected2 = $("#cmb_sm_ActivityTable_residual_severity").val();

                var result = GetRiskMatrix(valueselected1, valueselected2);
                $("#cmb_sm_ActivityTable_residual_risk").val(result);
            }

            var txt_field = $(this).attr("name");
            var txt_value = $(this).val();
            updatevalue(txt_field, txt_value);
        }
    });

    $("#btn_sm_viewformat").click(function(){
        window.open("TRAFormat.aspx");
    });

    $("#btn_sm_savetra").click(function(){
        SaveTRA();
    });

    $("#btn_additem_sm").click(function(){
        var params_values = new Array();

        //revisa la info capturada para agregarla la fila que se clonara
        $("#Table_inputactivities_sm textarea").each(function(){
            var referenceitem= $(this).attr("reference");
            var value_input = $(this).val();
            //alert("#"+referenceitem+" = " + value_input)
            $("#"+referenceitem).val(value_input);
        });
        
        //clona el tr
        //$("#row_fill").removeAttr("style").hide();
        //$("#row_fill").show();

        //revisa si hay elementos en la tabla para reiniciar el contador
        var sizetr = $("#TableTask_sm tr[id*='row_fill_']").length;
        if (sizetr <= 0) {

            indextable_sm = 0;
        }else{
            indextable_sm=sizetr;
        }

        var $Trtoclone = $("#row_fill");
        var $tr_clone = $Trtoclone.clone(true)
        $tr_clone.removeAttr("style").show();
        indextable_sm++;
            
        ////Cambia el indice de la fila de la tabla
        $tr_clone.attr("id", $tr_clone.attr("id") + "_" + (indextable_sm))

        ////cambia el id de cada elemento en la tabla
        $tr_clone.find("*").each(function () {
            //    //si es caja de texto
            var id= this.id;
            var n = id.indexOf("txt_task_");
            if(n>-1){
                //revisa si es la columna de ordenamiento
                var n = this.id.indexOf("txt_task_order");
                if (n > -1) {
                    $(this).val(indextable_sm);
                }
                    
                //cambia el id del control
                this.id = id + "_" + (indextable_sm);

                var v_name = $(this).attr("name");
                var V_value = $(this).val()
                 
                params_values.push({[v_name]: V_value });
                
            }

            //si es select
            var n = id.indexOf("cmb_");
            if (n > -1) {

                //var value=$("#table_risrisk select[reference*='"+ this.id +"']").val();
                //alert(value);
                //var value=$("#table_residualrisk select[reference*='"+ this.id +"']").val();

                this.id = id + "_" + (indextable_sm);
                //var v_name = $(this).attr("name");
                //var V_value = $(this).val()
                 
                //params_values.push({[v_name]: V_value });
            }

            //si es boton
            var n = id.indexOf("btn_");
            if (n > -1) {
                this.id = id + "_" + (indextable_sm);
            }

        });

        ////clonamos la fila
        $("#TableTask_sm tr:last").after($tr_clone);

        //llena los valores de los selects
        $("#Table_inputactivities_sm select").each(function(){
            var referenceitem= $(this).attr("reference");
            var value_input = $(this).val();
            //alert("#"+referenceitem+" = " + value_input)
            $("#"+referenceitem+"_"+indextable_sm).val(value_input);
            var v_name =  $("#"+referenceitem+"_"+indextable_sm).attr("name");
            var V_value = value_input
                 
            params_values.push({[v_name]: V_value });
        });

        $("#table_residualrisk select").each(function(){
            var referenceitem= $(this).attr("reference");
            var value_input = $(this).val();
            //alert("#"+referenceitem+" = " + value_input)
            $("#"+referenceitem+"_"+indextable_sm).val(value_input);
            var v_name =  $("#"+referenceitem+"_"+indextable_sm).attr("name");
            var V_value = value_input
                 
            params_values.push({[v_name]: V_value });
        });

        //actualiza la info de la base de datos
        //alert(JSON.stringify(params_values));
        updatevaluepost("table_task", JSON.stringify(params_values));

        //te lleva a la tabla una vez agregado los campos
        $('html, body').animate({
            scrollTop: $("#Activities_section").offset().top
        }, 500);

        //limpia cajas de entrada
        $("#from_activities_fill textarea").each(function(){
            $(this).val("");
        });
        $("#from_activities_fill select").each(function(){
            $(this).val("-1");
        });

    });

    // general functions
    function GetRiskMatrix(val1, val2) {
        //Tabla de valores de matriz
        //todo resutaldo es igual a L
        //excepto 
        //L + H = M
        //M + M = M
        //M + H = H
        //H + L = M
        //H + H = H

        var result = "L";
        //alert(val1);
        //alert(val2);
        //revisamos el valor de val1

        if (val1 != null || val2 != null) {
            
            if (val1 == "L") {
                //revisa si el valor1 es L y el valor 2 H regresa M
                if (val2 == "H") {
                    result = "M";
                }
            }

            
            if (val1 == "M") {
                //revisa si el valor1 es M y el valor2 es M regresa M ;
                if (val2 == "M") {
                    result = "M";
                }
                //revisa si el valor1 es M y el valor2 es H regresa H
                if (val2 == "H") {
                    result = "H";
                }
            }

            if (val1 == "H") {
                //revisa si el valor1 es H y el valor2 es H regresa M ;
                if (val2 == "L") {
                    result = "M";
                }
                //revisa si el valor1 es H y el valor2 es M regresa H ;
                if (val2 == "M") {
                    result = "H";
                }
                //revisa si el valor1 es H y el valor2 es H regresa H ;
                if (val2 == "H") {
                    result = "H";
                }
            }

        }


        return result;
    }

    function updatevalue(param, value) {
        $.ajax({
            method: "GET",
            url: "t_tra_saveitem.aspx?p="+param+"&v="+value,
            dataType: "html"
        }).done(function (msg) {
            //alert("response:" + msg);
        });
    }

    function updatevaluepost(param, value) {
        $.ajax({
            method: "POST",
            url: "t_tra_saveitem.aspx",
            data :{p:param,v:value},
            dataType: "html",
            async: false
        }).done(function (msg) {
            //alert("response:" + msg);
        });
    }

    function updateTableTask(){
        clearMemoryTableTask()
        var updatetr=false;
        var colindex=0;

        $("#Tasklist").find("tr").each(function(){
            var params_values = new Array();
            //busca todas las cajas de texto input
            $(this).find("input").each(function(){
                var id =this.id;
                var n= id.indexOf("txt_");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " input si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });
            //busca todas las textarea
            $(this).find("textarea").each(function(){
                var id =this.id;
                var n= id.indexOf("txt_");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " textarea si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });
            //busca todos los selectors
            $(this).find("select").each(function(){
                var id =this.id;
                var n= id.indexOf("cmb_");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " textarea si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });

            if(params_values.length>0){
                updatevaluepost("table_task", JSON.stringify(params_values));
            }
            

        });
    }

    function updateTableTask_sm(){
        clearMemoryTableTask()
        var updatetr=false;
        var colindex=0;

        $("#TableTask_sm").find("tr").each(function(){
            var params_values = new Array();
            //busca todas las cajas de texto input
            $(this).find("input").each(function(){
                var id =this.id;
                var n= id.indexOf("txt_task");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " input si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });
            //busca todas las textarea
            $(this).find("textarea").each(function(){
                var id =this.id;
                var n= id.indexOf("txt_task");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " textarea si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });
            //busca todos los selectors
            $(this).find("select").each(function(){
                var id =this.id;
                var n= id.indexOf("cmb_task");
                if(n>-1){
                    var lastchar = id.substring(id.length,id.length-1)
                    if(!isNaN(lastchar)){
                        //alert(id + " textarea si entra en array");
                        var v_name = $(this).attr("name");
                        var V_value = $(this).val();
                        params_values.push({[v_name]: V_value });
                    }
                }
            });

            if(params_values.length>0){
                //alert(JSON.stringify(params_values));
                updatevaluepost("table_task", JSON.stringify(params_values));
            }
            

        });
    }

    function clearMemoryTableTask(){
        updatevalue("clear_table_task","true");
    }

    function SaveTRA(){
        $.ajax({
            method: "GET",
            url: "t_saveTRAinstorage.aspx",
            dataType: "html",
            async: false
        }).done(function (msg) {
            var l_msg=msg;
            var k= l_msg.split(":");
            $("#messagesave").html("TRA Guardado con <br/>PIN numero:<% Response.Write(new_tra_inssession.pin_save)%>");
                $( "#dialog" ).dialog({modal:true,buttons:{ok:function(){
                    $(this).dialog("close")
                }}});
            });
        }
</script>