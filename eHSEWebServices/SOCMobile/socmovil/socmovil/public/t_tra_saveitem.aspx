<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_tra_saveitem.aspx.vb" Inherits="socmovil.t_tra_saveitem"  %>

<% 
    If Not IsNothing(Request.QueryString("p")) And Not IsNothing(Request.QueryString("v")) Then
        'revisa en si existe en session un tra
        
        If Not IsNothing(Me.Session("new_tra_insession")) Then
            Dim new_tra_inssession As etra.com.objects.TRAObj = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
            
            If Not IsNothing(new_tra_inssession) Then
                Dim parameter_name As String = Request.QueryString("p")
                Dim parameter_value As String = Request.QueryString("v")
                Dim boolean_value As Boolean = False
                Try
                    'TODO: Actualziar metodo
                    If parameter_name.Equals("table_task") Then
                        'Response.Write(parameter_value)
                        'Dim jjserial As New System.Web.Script.Serialization.JavaScriptSerializer
                        'Dim row As List(Of Object) = jjserial.Deserialize(Of List(Of Object))(parameter_value)
                        'For Each item As Dictionary(Of String, Object) In row
                        '    For Each Val As KeyValuePair(Of String, Object) In item
                        '        Response.Write(Val.Key & "=" & Val.Value)
                        '    Next
                        'Next
                        'Response.Write(row.ToString)
                        'For Each item As KeyValuePair(Of String, String) In dic
                        '    Response.Write(item.Key & "=" & item.Value.ToString & vbNewLine)
                        'Next
                        
                    Else
                        Dim tablefield As String = ""
                        If parameter_name.Equals("activity") Then
                            tablefield = "tra_Activity_Job"
                        End If
                        If parameter_name.Equals("location") Then
                            tablefield = "tra_Location"
                        End If
                        
                        If parameter_name.Equals("manningreq") Then
                            tablefield = "tra_manning_required"
                        End If
                        
                        If parameter_name.Equals("permitholder") Then
                            tablefield = "tra_permit_holder"
                        End If
                        
                        If parameter_name.Equals("permitauthority") Then
                            tablefield = "tra_permit_autority"
                        End If
                        If parameter_name.Equals("deparments") Then
                            tablefield = "tra_Dept"
                        End If
                        
                        If parameter_name.Equals("app_procedures") Then
                            tablefield = "tra_ApplicableProcedure"
                        End If
                        
                        If parameter_name.Equals("datetra") Then
                            tablefield = "tra_Date"
                            boolean_value = True
                            Try
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Date.Parse(parameter_value), Nothing)
                            Catch ex As Exception
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Date.Parse(Date.Now().ToString("dd-MM-yyyy")), Nothing)
                            End Try
                        End If
                        
                        If parameter_name.Equals("mandatory_hazard") Or parameter_name.Equals("mandatory_hazard_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Subs_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Subs_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Subs_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Subs_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        
                        
                        If parameter_name.Equals("mandatory_noise") Or parameter_name.Equals("mandatory_noise_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Noise_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Noise_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Noise_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Noise_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_manuhand") Or parameter_name.Equals("mandatory_manuhand_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Hand_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Hand_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Hand_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Hand_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        
                        If parameter_name.Equals("mandatory_access") Or parameter_name.Equals("mandatory_access_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Access_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Access_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Access_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Access_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        
                        If parameter_name.Equals("mandatory_workequip") Or parameter_name.Equals("mandatory_workequip_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Equip_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Equip_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Equip_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Equip_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_overhead") Or parameter_name.Equals("mandatory_overhead_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Overhead_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Overhead_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Overhead_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Overhead_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_humanfac") Or parameter_name.Equals("mandatory_humanfac_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Factors_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Factors_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Factors_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Factors_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_comm") Or parameter_name.Equals("mandatory_comm_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Comms_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Comms_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Comms_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Comms_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_enviro") Or parameter_name.Equals("mandatory_enviro_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Environ_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Environ_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Environ_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Environ_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_process") Or parameter_name.Equals("mandatory_process_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Process_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Process_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Process_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Process_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_vibration") Or parameter_name.Equals("mandatory_vibration_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Vibration_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Vibration_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Vibration_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Vibration_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        If parameter_name.Equals("mandatory_weather") Or parameter_name.Equals("mandatory_weather_sm") Then
                            boolean_value = True
                            If parameter_value.Equals("N/A") Then
                                tablefield = "tra_Hazard_Weather_NA"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Weather_Eval").SetValue(new_tra_inssession, False, Nothing)
                            End If
                            If parameter_value.Equals("SI/YES") Then
                                tablefield = "tra_Hazard_Weather_Eval"
                                parameter_value = "true"
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                new_tra_inssession.GetType.GetProperty("tra_Hazard_Weather_NA").SetValue(new_tra_inssession, False, Nothing)
                            End If
                        End If
                        
                        If parameter_name.Equals("clear_table_task") Then
                            If parameter_value.Equals("true") Then
                                If Not IsNothing(new_tra_inssession.traTasks) Then
                                    new_tra_inssession.traTasks.Clear()
                                    new_tra_inssession.traTasks = Nothing
                                Else
                                    new_tra_inssession.traTasks = New List(Of etra.com.objects.TRATaskObj)
                                End If
                                Me.Session("new_tra_insession") = new_tra_inssession
                            End If
                        End If
                        
                        If Not tablefield.Equals("") Then
                            If boolean_value Then
                                'new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, Boolean.Parse(parameter_value), Nothing)
                                'Response.Write(new_tra_inssession.GetType.GetProperty(tablefield).Name & "=" & new_tra_inssession.GetType.GetProperty(tablefield).GetValue(new_tra_inssession, Nothing))
                            Else
                                new_tra_inssession.GetType.GetProperty(tablefield).SetValue(new_tra_inssession, parameter_value, Nothing)
                                'Response.Write(new_tra_inssession.GetType.GetProperty(tablefield).Name & "=" & new_tra_inssession.GetType.GetProperty(tablefield).GetValue(new_tra_inssession, Nothing))
                            End If
                            'Response.Write("<br/>" & new_tra_inssession.ToString)
                            Me.Session("new_tra_insession") = new_tra_inssession
                        End If
                        
                       
                    End If
                
                Catch ex As Exception
                    Throw
                End Try
            End If
           
        End If
    Else
        If Not IsNothing(Request.Params("p")) And Not IsNothing(Request.Params("v")) Then
            
            If Not IsNothing(Me.Session("new_tra_insession")) Then
                Dim new_tra_inssession As etra.com.objects.TRAObj = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
            
                If Not IsNothing(new_tra_inssession) Then
                    Dim parameter_name As String = Request.Params("p")
                    Dim parameter_value As String = Request.Params("v")
                    Dim boolean_value As Boolean = False
                    If parameter_name.Equals("table_task") Then
                        Dim jjserial As New System.Web.Script.Serialization.JavaScriptSerializer
                        Dim row As List(Of Object) = jjserial.Deserialize(Of List(Of Object))(parameter_value)
                        Dim new_tratask As New etra.com.objects.TRATaskObj
                        For Each item As Dictionary(Of String, Object) In row
                            For Each Val As KeyValuePair(Of String, Object) In item
                                If Val.Key.Equals("task_order") Then
                                    new_tratask.traR_Consecutivo = Val.Value
                                End If
                                If Val.Key.Equals("task_brakedown") Then
                                    new_tratask.traR_TaskSteps = Val.Value
                                End If
                                If Val.Key.Equals("task_danger") Then
                                    new_tratask.traR_Hazard = Val.Value
                                End If
                                If Val.Key.Equals("task_risk") Then
                                    new_tratask.traR_Risk = Val.Value
                                End If
                                If Val.Key.Equals("task_initialrisk_severity") Then
                                    new_tratask.traR_Ini_Severity = Val.Value
                                End If
                                If Val.Key.Equals("task_initialrisk_probability") Then
                                    new_tratask.traR_Ini_Likeli = Val.Value
                                End If
                                If Val.Key.Equals("task_initialrisk_risk") Then
                                    new_tratask.traR_Ini_Risk = Val.Value
                                End If
                                If Val.Key.Equals("task_minimizerisk") Then
                                    new_tratask.traR_MinimizeRiskBy = Val.Value
                                End If
                                If Val.Key.Equals("task_residualrisk_severity") Then
                                    new_tratask.traR_Res_Severity = Val.Value
                                End If
                                If Val.Key.Equals("task_residualrisk_Probability") Then
                                    new_tratask.traR_Res_Likeli = Val.Value
                                End If
                                If Val.Key.Equals("task_residualrisk_Risk") Then
                                    new_tratask.traR_Res_Risk = Val.Value
                                End If 
                                'Response.Write(Val.Key & "=" & Val.Value)
                            Next
                        Next
                        If Not IsNothing(new_tra_inssession.traTasks) Then
                            new_tra_inssession.traTasks.Add(new_tratask)
                        Else
                            new_tra_inssession.traTasks = New List(Of etra.com.objects.TRATaskObj)
                            new_tra_inssession.traTasks.Add(new_tratask)
                        End If
                        Me.Session("new_tra_insession") = new_tra_inssession
                    End If
                End If
            End If
            
           
        End If
    End If
    
    
%>