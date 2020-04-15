
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TRAFormat.aspx.vb" Inherits="socmovil.TRAFormat"%>
<%
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    Dim tra_found As New etra.com.objects.TRAObj
    Dim ADOTRA As New etra.com.ado.ole.ADOTRA
    Dim loadfromsession As Boolean = False
    Dim show_As_word As Boolean = False
    Dim printfunction As Boolean = False
    
    If Not IsNothing(Request.QueryString) Then
        If Not IsNothing(Request.QueryString("tra_id")) Then
            Dim requested_tra_id As String = Request.QueryString("tra_id")
            Dim str_tra_id As String = Base64Con.DecodeBase64(requested_tra_id)
            Try
                'revisa si el valor del querystring es entero
                Dim int_tra_id As Integer = Integer.Parse(str_tra_id)
                
                'si es entero carga el tra solicitado
                tra_found.tra_ID = int_tra_id
                
                ADOTRA.GetTRAbyID(tra_found)
            Catch ex As Exception
                'Throw
                Response.Redirect("../index.aspx")
            End Try
        Else
            If Not IsNothing(Me.Session("new_tra_insession")) Then
                
                tra_found = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
                loadfromsession = True
            Else
                Response.Redirect("../index.aspx")
            End If
        End If
    Else
        If Not IsNothing(Me.Session("new_tra_insession")) Then
            tra_found = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
        Else
            Response.Redirect("../index.aspx")
        End If
        
    End If
    If Not IsNothing(Request.QueryString("printview")) Then
        printfunction = True
    End If
    
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="viewport" content="width=device-width, initial-scale=.5">
<head>
    
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/jquery-ui.css">
    <link rel="stylesheet" href="../../css/socmovil.css" />
    <link rel="stylesheet" href="../../css/TRA-view.css" /> 
    <title>Muralla IV - Servicios de HSE en linea.</title>
    <script src="../../js/jquery-3.4.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <link rel="icon" type="image/png" href="../../favicon.png">
</head>
<body>


<div class="container-left" id="maindiv"  >
    <table id="TRAMainTable" > 
       <%-- Seccion de planificacion--%>
        <tr>
            <td id="InitialLabel">
               <div style="width:20px;">
                   <img src="../../images/img-tra-planificacion.png" />
               </div>
            </td>
            <td>
                <table id="tbl_planning">
                    <tr>
                        <td colspan="8">
                            <div style="display:flex; align-items:center; padding:5px;">
                                <img src="../../images/gr-logo1.png" height="40px" width="250px" />
                                <h5 style="padding-left:15px;">TASK RISK ASSESSMENT FORM /</h5>
                                <span>Valoraci&oacute;n de Riesgo en la Tarea</span>
                                <h5 style="padding-left:15px;">(TRA)</h5>
                            </div>
                           
                        </td>
                        <td colspan="3" style="width:180px; text-align:center "><span class="cell-value"><% Response.Write(tra_found.pin_save)%></span> </td>
                    </tr>
                    <tr>
                        <td class="cell-header">
                            <span><strong> Unit </strong>/ Unidad:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="cell-value"><% Response.Write(tra_found.tra_Unit)%></span> 
                        </td>
                        <td class="cell-header">
                            <span><strong>Department </strong> <br />Departamento:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="cell-value"><% Response.Write(tra_found.tra_Dept)%></span> 
                        </td>
                        <td class="cell-header">
                            <span><strong>Job Location</strong> <br />Sitio de Trabajo</span>
                        </td>
                        <td class="cell-td-value" colspan="2">
                            <span class="cell-value"><% 
                                                         If IsNothing(tra_found.tra_Location) Then
                                                             Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
                                                         Else
                                                             Response.Write(tra_found.tra_Location)
                                                         End If
                                                         %></span> 
                        </td>
                        <td class="cell-header">
                            <span><strong>PERMIT NUMBER </strong> <br />Num. Permiso</span>
                        </td>
                        <td class="cell-td-value" colspan="3">
                            <span class="cell-value"><% Response.Write(tra_found.tra_permitnumber)%></span> 
                        </td>

                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td class="cell-header" colspan="2">
                            <span><strong>Activity / Job Descripcion /</strong> Actividad</span>
                        </td>
                        <td colspan="3" class="cell-td-value">
                            <span class="cell-value"><% Response.Write(tra_found.tra_Activity_Job)%></span>
                        </td>
                        <td colspan="2" class="cell-header" style="text-align:right;">
                           <span><strong>Date /</strong> Fecha:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="cell-value"><% Response.Write(tra_found.tra_Date.ToString("dd-MMMM-yyyy"))%></span>
                        </td>
                        <td class="cell-header">
                            <span><strong>#Pages/ No.</strong><br />P&aacute;ginas:</span>
                        </td>
                        <td class="cell-td-value">
                            <span class="cell-value" id="page_counter">&nbsp;&nbsp; 2&nbsp;&nbsp; </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Seccion de Actividades--%>
        <tr>
            <td id="InitialLabel">
                <img src="../../images/img-tra-desarrolloactividad.png" />
            </td>
            <td>
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
                    <%
                        Dim list_task As New List(Of etra.com.objects.TRATaskObj)
                        
                        If loadfromsession Then
                            If Not IsNothing(tra_found.traTasks) Then
                                list_task = tra_found.traTasks
                            End If
                        Else
                            ADOTRA.GetTRAActivities(tra_found.tra_ID, list_task)
                        End If
                       
                        
                        Dim index_Table As Integer = 0
                        For Each task As etra.com.objects.TRATaskObj In list_task
                            index_Table = index_Table + 1
                    %>
                    <tr class="table-values">
                        <td class="first-col">
                           <span><%Response.Write(task.traR_Consecutivo)%></span>
                        </td>
                        <td style="width:170px;">
                            <span><%Response.Write(task.traR_TaskSteps)%></span>
                        </td>
                        <td style="width:170px;">
                            <span><%Response.Write(task.traR_Hazard)%></span>
                        </td>
                        <td style="width:170px;">
                            <span><%Response.Write(task.traR_Risk)%></span>
                        </td>
                        <td>
                            <span><%
                                      If IsNothing(task.traR_Ini_Severity) Then
                                          task.traR_Ini_Severity = "-1"
                                      End If
                                      If Not task.traR_Ini_Severity.Equals("-1") Then
                                          Response.Write(task.traR_Ini_Severity)
                                      End If
                                      %>

                            </span>
                        </td>
                        <td>
                            <span><%
                                      If IsNothing(task.traR_Ini_Likeli) Then
                                          task.traR_Ini_Likeli = "-1"
                                      End If
                                      If Not task.traR_Ini_Likeli.Equals("-1") Then
                                          Response.Write(task.traR_Ini_Likeli)
                                      End If
                                      
                                      
                                      %></span>
                        </td>
                        <td>
                            <span><%
                                      If IsNothing(task.traR_Ini_Risk) Then
                                          task.traR_Ini_Risk = "-1"
                                      End If
                                      If Not task.traR_Ini_Risk.Equals("-1") Then
                                          Response.Write(task.traR_Ini_Risk)
                                      End If
                                      
                                      
                                      %></span>
                        </td>
                        <td style="width:180px;">
                           <span> <%Response.Write(task.traR_MinimizeRiskBy)%></span>
                        </td>
                        <td style="text-align:center;">
                            <span><%
                                      If IsNothing(task.traR_Res_Severity) Then
                                          task.traR_Res_Severity = "-1"
                                      End If
                                      If Not task.traR_Res_Severity.Equals("-1") Then
                                          Response.Write(task.traR_Res_Severity)
                                      End If
                                      
                                      %></span>
                        </td>
                        <td>
                            <span><%
                                      If IsNothing(task.traR_Res_Likeli) Then
                                          task.traR_Res_Likeli = "-1"
                                      End If
                                      If Not task.traR_Res_Likeli.Equals("-1") Then
                                          Response.Write(task.traR_Res_Likeli)
                                      End If
                                      
                                      %></span>
                        </td>
                        <td>
                            <span><%
                                      If IsNothing(task.traR_Res_Risk) Then
                                          task.traR_Res_Risk="-1"
                                      End If
                                      
                                      If Not task.traR_Res_Risk.Equals("-1") Then
                                          Response.Write(task.traR_Res_Risk)
                                      End If
                                      
                                      %></span>
                        </td>
                    </tr>
                    <%
                         Next
                     %>
                    <%--<tr class="table-values">
                        <td class="first-col">
                           <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td style="width:180px;">
                           <span></span>
                        </td>
                        <td style="text-align:center;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                           <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td style="width:180px;">
                           <span></span>
                        </td>
                        <td style="text-align:center;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                           <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td style="width:180px;">
                           <span></span>
                        </td>
                        <td style="text-align:center;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                           <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td style="width:180px;">
                           <span></span>
                        </td>
                        <td style="text-align:center;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                    <tr class="table-values">
                        <td class="first-col">
                           <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td style="width:170px;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td style="width:180px;">
                           <span></span>
                        </td>
                        <td style="text-align:center;">
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                        <td>
                            <span></span>
                        </td>
                    </tr>--%>

                    <%--Termina tabla de llenado--%>
                </table>
            </td>
        </tr>
       <%-- Seccion de Riesgos adicionales en sitio--%>
        <tr>
            <td id="InitialLabel">
                <img src="../../images/img-tra-riesgospotentciales.png" />
            </td>
            <td>
                <table id="AditionalRiskinSite">
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
                <img src="../../images/img-tra-desarrolloactividad.png" />
            </td>
            <td>
                <table style="width:10.9in">
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
                                    <td class="cell-value">
                                        <span class="colored"><% 
                                                                  If tra_found.tra_Hazard_Subs_NA Then
                                                                      Response.Write("N/A")
                                                                  Else
                                                                      Response.Write("&nbsp;")
                                                                  End If
                                                                  %></span>
                                    </td>
                                    <td class="cell-value">
                                        <span><% 
                                                  If tra_found.tra_Hazard_Subs_Eval Then
                                                      Response.Write("SI/YES")
                                                  Else
                                                      Response.Write("&nbsp;")
                                                  End If
                                                  
                                               
                                                  %></span>
                                    </td>
                                    <td>
                                         <span>PEOPLE/HUMAN FACTORS/<BR />Factores Humanos</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Factors_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                 If tra_found.tra_Hazard_Factors_Eval Then
                                                     Response.Write("SI/YES")
                                                 Else
                                                     Response.Write("&nbsp;")
                                                 End If

                                             %>
                                         </span>
                                    </td>
                                </tr>
                                 <tr id="RowsMandatory-content">
                                    <td>
                                        <span>NOISE/RUIDO</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                             <% If tra_found.tra_Hazard_Noise_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                        <span>
                                            <%
                                                If tra_found.tra_Hazard_Noise_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                         <span>COMMUNICATION/Comunicaci&oacute;n</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Comms_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                 If tra_found.tra_Hazard_Comms_Eval Then
                                                     Response.Write("SI/YES")
                                                 Else
                                                     Response.Write("&nbsp;")
                                                 End If
                                            %>
                                         </span>
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>MANUAL HANDLIG<BR />/Manipulaci&oacute;n/carga manual</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Hand_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                        <span>
                                            <%
                                                If tra_found.tra_Hazard_Hand_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                         <span>ENVIROMENT/Medio Ambiente</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Environ_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                If tra_found.tra_Hazard_Environ_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                         </span>
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>ACCESS/EGRESS/Entradas y salidas</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                             <% If tra_found.tra_Hazard_Access_NA Then
                                                     Response.Write("N/A")
                                                 Else
                                                     Response.Write("&nbsp;")
                                                 End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                        <span>
                                            <%
                                                If tra_found.tra_Hazard_Access_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                         <span>PROCESS / Proceso</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Process_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                If tra_found.tra_Hazard_Process_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                         </span>
                                    </td>
                                </tr>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>WORK EQUIPMENT<br />Herramienta y Equipo de trabajo</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Equip_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                        <span>
                                            <%
                                                If tra_found.tra_Hazard_Equip_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                         <span>VIBRATION/ REPETITIVE STRAIN /<br />Vibraciones /Esfuerzo repetitivo</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Vibration_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                If tra_found.tra_Hazard_Vibration_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                         </span>
                                    </td>
                                </tr>
                               <%-- <tr id="RowsMandatory-content">
                                    <td>
                                        <span>WORK EQUIPMENT<br />Herramienta y Equipo de trabajo</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored"></span>
                                    </td>
                                    <td class="cell-value">
                                        <span></span>
                                    </td>
                                    <td>
                                         <span>VIBRATION/ REPETITIVE STRAIN /<br />Vibraciones /Esfuerzo repetitivo</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored"></span>
                                    </td>
                                    <td class="cell-value">
                                         <span></span>
                                    </td>
                                </tr>--%>
                                <tr id="RowsMandatory-content">
                                    <td>
                                        <span>OVERHEAD WORK/LIFTING OPS<br /><span style="font-size:8pt">Trabajos en altura o maniobras de carga por encima del area de trabajo</span> </span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Overhead_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                        <span>
                                            <%
                                                If tra_found.tra_Hazard_Overhead_Eval Then
                                                    Response.Write("SI/YES")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                         <span>CONDICIONES CLIMATOLOGICAS<br />PREVAILING WEATHER</span>
                                    </td>
                                    <td class="cell-value">
                                        <span class="colored">
                                            <% If tra_found.tra_Hazard_Weather_NA Then
                                                    Response.Write("N/A")
                                                Else
                                                    Response.Write("&nbsp;")
                                                End If
                                            %>
                                        </span>
                                    </td>
                                    <td class="cell-value">
                                         <span>
                                             <%
                                                 If tra_found.tra_Hazard_Weather_Eval Then
                                                     Response.Write("SI/YES")
                                                 Else
                                                     Response.Write("&nbsp;")
                                                 End If
                                            %>
                                         </span>
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
                                        <img src="../../images/img-tra-probabilidad.png" />
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
                   <img src="../../images/img-tra-control.png" />
               </div>
            </td>
            <td>
                <%--tabla de control header--%>
                <table id="Tablecontrol-header">
                    <tr style="height:70px;">
                        <td class="cell-header" style="text-align:right; width:300px; padding-right :10px;">
                            <span style="">
                                <h6><strong>MANNING REQUIRED</strong><br /> Num. Personal Requerido:</h6>
                            </span>
                        </td>
                        <td style="width:90px; text-align:center;">
                            <span class="cell-value" style="font-size:15pt;font-weight:bold;">
                                <%Response.Write(tra_found.tra_manning_required ) %>

                            </span>
                        </td>
                        <td class="cell-header" style="text-align:right; width:250px; padding-right :10px;">
                              <span style="">
                                <h6><strong>APPLICABLE PROCEDURE</strong><br /> Procedimiento Aplicable:</h6>
                            </span>
                        </td>
                        <td colspan="2" style="text-align:center;">
                            <span >
                               <% Response.Write(tra_found.tra_ApplicableProcedure)%>
                            </span>
                        </td>
                    </tr>
                    <tr style="height:20px;">
                        <td class="cell-header" style="text-align:right;padding-right :10px;">
                             <span style="font-size:10pt;">
                                <strong>PERMIT HOLDER</strong>(Print name and signature)<br /> Solicitante del Permiso(Nombre y Firma):
                            </span>
                        </td>
                        <td colspan="2" style="text-align:center;font-size:10pt;font-weight:bold;" >
                            <span  >
                                <br />
                                <%Response.Write(tra_found.tra_permit_holder)%>
                            </span>
                        </td>
                        
                        <td class="cell-header" style="text-align:right;padding-right :10px;">
                            <span style="font-size:10pt;">
                                <strong>PERMIT AUTHORITY</strong><br /> Responsable de &aacute;rea<br />(Nombre y Firma):
                            </span>
                        </td>
                        <td style="width:200px;text-align:center;font-size:10pt;font-weight:bold;">
                            <span>
                                <br />
                                 <%Response.Write(tra_found.tra_permit_autority)%>
                            </span>
                        </td>
                    </tr>
                    <%--tabla de nombres tra--%>
                    <tr>
                        <td colspan="5">
                            <table id="Tablecontrol-names" class="Tablecontrol-names">
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
        <tr>
            <td colspan="2">
                <div class="content">
                        <div class="row">
                            <div class="col ml-2 mt-1" style="font-size:x-small ">812.SP19F1 </div>
                            <div class="col mr-2 mt-1 text-right" style="font-size:x-small ">REV. 00 </div>
                        </div>
                    </div>
            </td>
        </tr>
    </table>
    
</div>
<%
    If printfunction Then
     %>
    <script>
        window.print();
    </script>
<%
End If
    %>
</body>
</html>
