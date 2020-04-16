<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_mytras.ascx.vb" Inherits="socmovil.p_mytras" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    Dim ADODocuments As New eservices_core.com.ado.ADODocument
    Dim list As SortedList(Of Integer, eservices_core.com.objects.DocumentObj) = ADODocuments.GetDocuemntsByUser(SessionUser.UserObjSession, "TRA")
    
%>
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
                    <th scope="col"><%GetLbl("lbl_Options") %> </th>
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
                            If tra.tra_Status.Equals("temp") Then
                                Response.Write("")
                            Else
                                Response.Write(tra.tra_Status )
                            End If
                        %></td>
                    <td>
                        <button type="button" class="btn btn-primary" id="btn_opentra_<%=tra.pin_save%>" > <%GetLbl("lbl_edit") %></button>

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
</script>