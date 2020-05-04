<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_mytras.ascx.vb" Inherits="socmovil.p_mytras" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim list As SortedList(Of Integer, eservices_core.com.objects.DocumentObj) = UnitOfWork.Documents.GetDocuemntsByUser(SessionUser.UserObjSession, "TRA")
    
    Dim currentpage As String = "../index.aspx?p=tra%2fp_mytras"
    Dim show_duplicateapproval As Boolean = False
    If Not IsNothing(Request.QueryString("ed")) Then
        show_duplicateapproval = True
    End If
%>
<% If show_duplicateapproval Then%>
<div class="container bg-danger text-white text-center p-3 mt-4">
    <span class="h4 ">
        Error al mandar el documento para aprovacion, documento ya esta en lista de espera.
    </span>
</div>
<% End If  %>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span class="display-4">
            <%GetLbl("p_mytras_lbl_MainTitle")%>
        </span>
    </div>
    <div class="">
        <table class="table table-striped table-hover mt-3 text-left">
            <tbody>
                <tr>
                    <th scope="col"><%GetLbl("p_mytras_lbl_trapin") %></th>
                    <th scope="col" style="width:110px;"><%GetLbl("lbl_date") %></th>
                    <th scope="col"><%GetLbl("p_tras_lbl_cell_TRADescription")%></th>
                    <th scope="col"><%GetLbl("lbl_status") %></th>
                    <th colspan="2" scope="col"><%GetLbl("lbl_Options") %> </th>
                </tr>
                <%
                    For Each document As KeyValuePair(Of Integer, eservices_core.com.objects.DocumentObj) In list
                        Dim tra As etra.com.objects.TRAObj = document.Value
                        document.Value.LoadInfoByID()
                %>
                <tr>
                    <td><%=tra.pin_save%></td>
                    <td><%=document.Value.getDocumentDate.ToString("dd MMM yyyy")%></td>
                    <td><%=tra.tra_Activity_Job%></td>
                    <td><%
                            'If tra.tra_Status.Equals("temp") Then
                            '    Response.Write("")
                            'Else
                            '    Response.Write(tra.tra_Status)
                            'End If
                            'tra.LoadDocumentHeadInfo()
                            GetLbl(tra.getDocumentStatusObj.label)
                        %></td>
                    <td>
                        <% If Not tra.getLock Then%>
                        <button type="button" class="btn btn-primary" id="btn_opentra_<%=tra.pin_save%>" > <%GetLbl("lbl_edit") %></button>
                        <% Else%>
                        <button type="button" class="btn btn-primary" id="btn_viewtra_<%=Base64Encoder.EncodeBase64(tra.tra_ID)%>" > <%GetLbl("lbl_see") %></button>
                         <% End If%>
                    </td>
                    <td>
                        <% If tra.getDocumentStatusObj.idDocumentStatus = eservices_core.com.ado.DocumentStatus.Draft Then%>
                        <button type="button" class="btn btn-sm btn-warning text-white" id="btn_sendforapproval_<%=Base64Encoder.EncodeBase64(tra.getidDocument())%>">Enviar para aprobaci&oacute;n</button>
                       <% End If%>
                    </td>
                </tr>
                <%
                Next
                    %>
            </tbody>
        </table>
    </div>
</div>
<script>
    $("button[id*='btn_opentra_']").click(function () {
        var id = this.id;
        var values= id.split("_");
        window.open( "tra/t_loadtra.aspx?trapin=" + values[2]);
    });

    $("button[id*='btn_sendforapproval_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        document.location.href = "index.aspx?p=tra%2fp_confirmapproval&d=" + values[2]+"&pp=<%=Base64Encoder.EncodeBase64(currentpage)%>";
    });

    $("button[id*='btn_viewtra_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        window.open("tra/TRAFormat.aspx?tra_id="+ values[2]);
    });
</script>