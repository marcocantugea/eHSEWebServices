<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_docforsig.ascx.vb" Inherits="socmovil.p_docforsig" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim listofdocuments As Dictionary(Of Integer, Object)
    Dim listofdeparments As Integer() = SessionUser.UserObjSession.ProfileObj.AccessDeparments.ToArray
    
    listofdocuments = UnitOfWork.Documents.GetDocumentPendingForSignature(listofdeparments)
%>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span class="display-4">
           <%GetLbl("p_docforsig_lbl_maintitle") %>
        </span>
    </div>
    <div>
        <table class="table">
            <tr>
                <th scope="col"><%GetLbl("p_docforsig_table_lbldeparment")%></th>
                <th scope="col"><%GetLbl("p_docforsig_table_lbldoctype")%></th>
                <th scope="col"><%GetLbl("p_docforsig_table_lblrequestdate")%></th>
                <th scope="col"><%GetLbl("p_docforsig_table_lblrequestor")%></th>
                <th scope="col"><%GetLbl("lbl_Options")%></th>
            </tr>
            <%
                For Each item As KeyValuePair(Of Integer, Object) In listofdocuments
                    Dim values As List(Of Object) = item.Value
                    Dim tipodocumento As String = ""
                    Select Case GetValueList(values, "TypeOfObj")
                        Case "etra.com.objects.TRAObj"
                            tipodocumento = "TRA"
                            
                    End Select
                    
                    
             %>
            <tr>
                <td ><%PrintValueList(values, "DeparmentName")%></td>
                <td ><%=tipodocumento%></td>
                <td ><%=CType(GetValueList(values, "DocumentDate"), Date).ToString("dd MMM yyyy")%></td>
                <td ><%PrintValueList(values, "UserNameRequested") %></td>
                <td > 
                    <button type="button" id="btn_preview_<%=Base64Encoder.EncodeBase64(GetValueList(values, "idDocument"))%>" class="btn btn-sm btn-primary mr-2 mb-2"><%GetLbl("lbl_see") %></button>
                    <button type="button" id="btn_reject_<%=Base64Encoder.EncodeBase64(GetValueList(values, "idDocument"))%>" class="btn btn-sm btn-danger mr-2 mb-2"><%GetLbl("lbl_reject") %></button>
                    <button type="button" id="btn_sign_<%=Base64Encoder.EncodeBase64(GetValueList(values, "idDocument"))%>" class="btn btn-sm btn-success mr-2 mb-2"><%GetLbl("lbl_sign")%></button>
                </td>
            </tr>
            <%
            Next
             %>
        </table>
    </div>
</div>
<script>
    $("button[id*='btn_preview_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        window.open("document/t_loaddocument.aspx?d=" + values[2]);
    });
    $("button[id*='btn_sign_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        document.location.href="index.aspx?p=supervisor/p_confirmsignature&d=" + values[2];
    });
    $("button[id*='btn_reject_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        document.location.href = "index.aspx?p=supervisor/p_confirmreject&d=" + values[2];
    });
</script>