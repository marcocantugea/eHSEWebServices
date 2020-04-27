<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_docforsig.ascx.vb" Inherits="socmovil.p_docforsig" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    Dim Base64 As New eservices_core.com.utilities.Base64Conversions
    
    Dim ADODocuments As New eservices_core.com.ado.ADODocument
    
    Dim listofdocuments As Dictionary(Of Integer, Object)
    Dim listofdeparments As Integer() = SessionUser.UserObjSession.ProfileObj.AccessDeparments.ToArray
    
    listofdocuments = ADODocuments.GetDocumentPendingForSignature(listofdeparments)
%>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span class="display-4">
            Documentos por Firmar Electronica
        </span>
    </div>
    <div>
        <table class="table">
            <tr>
                <th scope="col">Departamento</th>
                <th scope="col">Tipo de Documento</th>
                <th scope="col">Fecha de Solicitud</th>
                <th scope="col">Solicitante</th>
                <th scope="col">Opciones</th>
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
                    <button type="button" id="btn_preview_<%=Base64.EncodeBase64(GetValueList(values, "idDocument"))%>" class="btn btn-sm btn-primary mr-2 mb-2">Ver</button>
                    <button type="button" id="btn_reject_" class="btn btn-sm btn-danger mr-2 mb-2">Rechazar</button>
                     <button type="button" id="btn_sign_" class="btn btn-sm btn-success mr-2 mb-2">Firmar</button>
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
</script>