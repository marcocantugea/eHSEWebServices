<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_mytras.ascx.vb" Inherits="socmovil.p_mytras" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    Dim docstatus As Integer = 0
    If Not IsNothing(Request.QueryString("fe")) Then
        Try
            docstatus = Integer.Parse(Request.QueryString("fe"))
        Catch ex As Exception

        End Try
    End If
    
    Dim list As SortedList(Of Integer, eservices_core.com.objects.DocumentObj) = UnitOfWork.Documents.GetDocuemntsByUser(SessionUser.UserObjSession, "TRA", docstatus)
    Dim currentpage As String = "../index.aspx?p=tra%2fp_mytras"
    Dim show_duplicateapproval As Boolean = False
    If Not IsNothing(Request.QueryString("ed")) Then
        show_duplicateapproval = True
    End If
    
   
%>
<% If show_duplicateapproval Then%>
<div class="container bg-danger text-white text-center p-3 mt-4">
    <span class="h4 ">
       <%GetLbl("p_mytra_lbl_error_sendforapproval") %>
    </span>
</div>
<% End If  %>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span class="display-4">
            <%GetLbl("p_mytras_lbl_MainTitle")%>
        </span>
    </div>
    <div class="mt-4  text-left">
        <div class="row ">
            <div class="col ">
                <div class="form-group">
                    <label for="cmb_selectstatus"><%GetLbl("lbl_status")%></label>
                    <select id="cmb_selectstatus" class="form-control rounded">
                        <option <%If docstatus = 0 Then Response.Write("selected")%> value=""> <%GetLbl("p_tras_value_all") %></option>
                        <option <%If docstatus = 1 Then Response.Write("selected")%> value="1"><%GetLbl("lbl_document") %></option>
                        <option <%If docstatus = 2 Then Response.Write("selected")%>  value="2"><%GetLbl("lbl_estatus_watingforsignature") %></option>
                        <option <%If docstatus = 3 Then Response.Write("selected")%>  value="3"><%GetLbl("lbl_estatus_approved") %></option>
                    </select>
                </div>
            </div>
            <div class="col">
                <table style="height:100%;width:300px;">
                    <tr>
                        <td><button type="button" id="createnewtra" class="btn btn-block btn-success mt-3"><% GetLbl("p_tras_lbl_newTRA")%></button></td>
                    </tr>
                </table>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <div class="">
        <table class="table table-striped table-hover mt-3 text-left">
            <tbody>
                <tr>
                    <th scope="col"><%GetLbl("p_mytras_lbl_trapin") %></th>
                    <th scope="col" style="width:110px;"><%GetLbl("lbl_date") %></th>
                    <th scope="col"><%GetLbl("p_tras_lbl_cell_TRADescription")%></th>
                    <th class="text-center" scope="col" style="background-color:#fffa65"><%GetLbl("lbl_status") %></th>
                    <th colspan="2" scope="col"><%GetLbl("lbl_Options") %> </th>
                </tr>
                <%
                    For Each document As KeyValuePair(Of Integer, eservices_core.com.objects.DocumentObj) In list.OrderByDescending(Function(c) c.Key)
                        Dim tra As etra.com.objects.TRAObj = document.Value
                        document.Value.LoadInfoByID()
                %>
                <tr>
                    <td><%=tra.pin_save%></td>
                    <td><%=document.Value.getDocumentDate.ToString("dd MMM yyyy")%></td>
                    <td><%=tra.tra_Activity_Job%></td>
                    <td class="text-center" style="background-color:#fffa65"><strong><%GetLbl(tra.getDocumentStatusObj.label)%></strong></td>
                    <td>
                        <% If Not tra.getLock Then%>
                        <button type="button" class="btn btn-primary" id="btn_opentra_<%=tra.pin_save%>" > <%GetLbl("lbl_edit") %></button>
                        <% Else%>
                        <button type="button" class="btn btn-primary" id="btn_viewtra_<%=Base64Encoder.EncodeBase64(tra.tra_ID)%>" > <%GetLbl("lbl_see") %></button>
                         <% End If%>
                    </td>
                    <td>
                        <% If tra.getDocumentStatusObj.idDocumentStatus = eservices_core.com.ado.DocumentStatus.Draft Then%>
                        <button type="button" class="btn btn-warning text-white" id="btn_sendforapproval_<%=Base64Encoder.EncodeBase64(tra.getidDocument())%>"><%GetLbl("p_mytra_button_sendforsignature") %></button>
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

    $("#cmb_selectstatus").change(function () {
        var selected = $(this).val();
        document.location.href = "index.aspx?p=tra/p_mytras&fe="+selected 
    });
    $("#createnewtra").click(function () {
        window.location.href = "index.aspx?p=tra/p_createTRA&newtra=true"
    });
</script>