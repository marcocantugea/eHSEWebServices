<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_tras.ascx.vb" Inherits="socmovil.p_tras" %>
<%
    
    'obtiene el lenguaje que esta en session y la configuracion global
    LoadConfiguration()
    LoadLanguage()
    
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    
    'Obtiene los departamentos
    Dim ADOTRAS As New etra.com.ado.ole.ADOTRA
    
    Dim list_department As New List(Of etra.com.objects.TRADeparment)
    Dim list_department_show As New List(Of etra.com.objects.TRADeparment)
    Dim dept_name_sel As String
    Dim show_clear_filter As Boolean = False
    
    ADOTRAS.GetDeparmentsName(list_department)
    
    If Not IsNothing(Request.QueryString("dep")) Then
        Dim dept_sel As New etra.com.objects.TRADeparment
        dept_name_sel = Request.QueryString("dep")
        If dept_name_sel.Equals("Todos") Then
            list_department_show = list_department
        Else
            For Each item As etra.com.objects.TRADeparment In list_department
                If item.cDep_Name.Equals(dept_name_sel) Then
                    list_department_show.Add(item)
                End If
            Next
        End If
    Else
        list_department_show = list_department
    End If
    Dim str_to_search As String = ""
    If Not IsNothing(Request.QueryString("qt")) Then
        show_clear_filter = True
         str_to_search=Request.QueryString("qt")
    End If
    
    
%>
<div class="container">
    <div class="row">
        <div class="container text-center m-3">
            <span class="h4">
                <% GetLbl("p_tras_MainTitile")%>
            </span>
        </div>
        <div class="container ">
            <div class="row " >
                <div class="col-lg mb-3 ">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <label class="input-group-text" for="departments_option"><% GetLbl("p_tras_lbl_deparments")%></label>
                      </div>
                      <select class="custom-select" id="departments_option">
                        <option value="Todos" selected><% GetLbl("p_tras_value_all") %></option>
                        <%
                            For Each dep_item As etra.com.objects.TRADeparment In list_department
                                Dim selecteddep As Boolean = False
                                If dep_item.cDep_Name.Equals(dept_name_sel) Then
                                    selecteddep = True
                                End If
                        %>
                         <option value="<% Response.Write(dep_item.cDep_Name)%>" <% If selecteddep then Response.Write("selected") %>> <% Response.Write(dep_item.cDep_Name)%></option>
                         <% Next%>
                      </select>
                    </div>
                </div>
                <div class="col text-left">
                      <div class="input-group">
                          <div class="input-group-prepend">
                              <label class="input-group-text" for="txt_loadTRA"><%GetLbl("p_tras_lbl_opentra")%></label>
                              <input id="txt_loadTRA" type="text" class="form-control" aria-label="" aria-describedby="inputGroup-sizing-default" value="" maxlength="4" style="width: 70px;" />
                              <button type="button" id="btn_opentra" class="btn btn-sm btn-success "><%GetLbl("p_tras_lbl_btn_opentra")%></button>
                          </div>
                      </div>
                     
                </div>
            </div>
            <div class="row">
                <div class="col mt-3">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text" id="seachtradesc"><% GetLbl("p_tras_lbl_findtra") %></span>
                      </div>
                      <input id="txt_searchtext" type="text" class="form-control" aria-label="" aria-describedby="inputGroup-sizing-default" value=" <% If show_clear_filter Then Response.Write(str_to_search)%>">
                        <%
                            If show_clear_filter Then
                        %>
                      <button type="button"  id="clearfiltertext" class="btn btn-sm btn-info "><% GetLbl("p_tras_lbl_cleanfilter")%></button>
                        <%
                        End If
                         %>
                    </div>
                </div>
                <div class="col-lg  mt-2 p-2">
                    <div class="row">
                        <div class="col-lg mb-3 ">
                            <button type="button" id="setfilter" class="btn btn-block btn-primary"> <% GetLbl("p_tras_lbl_searchtra") %></button>
                        </div>
                        <div class="col-lg mb-3">
                            <button type="button" id="createnewtra" class="btn btn-block btn-success"><% GetLbl("p_tras_lbl_newTRA")%></button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="container border item-aling-center table-responsive-sm">
            <div class="container mb-3 mt-3 text-center">
                <span class="h3"><%GetLbl("p_tras_lbl_titletable")%></span>
            </div>
            <table class="table table-hover table-bordered">
                <%
                    For Each dep_item As etra.com.objects.TRADeparment In list_department_show
                 %>
                <thead class="thead-light">
                    <tr>
                        <th colspan="3" scope="col" class="" style="background-color:ghostwhite">
                            <span class="h4"><% GetLbl("p_tras_lbl_cell_deparments")%> <%Response.Write(dep_item.cDep_Name)%></span>
                        </th>
                    </tr>
                    <tr class="text-center">
                        <th><% GetLbl("p_tras_lbl_cell_TRADescription")%></th>
                         <th colspan="2"><% GetLbl("p_tras_lbl_cell_Options")%></th>
                    </tr>
                </thead>
                <%
                    Dim tra_fields As New etra.com.objects.TRAObj
                    tra_fields.tra_ID = -7
                    tra_fields.tra_Activity_Job = "-7"
                    tra_fields.tra_Dept = "-7"
                    tra_fields.tra_Location = "-7"
                    
                    Dim listoftra As New List(Of etra.com.objects.TRAObj)
                    
                    If show_clear_filter Then
                        Dim query_search As String = "tra_Activity_job LIKE ""%" & SQLSanitize.SanitizeSTR(str_to_search) & "%"";"
                        ADOTRAS.GetTRAsByDeparment(tra_fields, dep_item, listoftra, query_search)
                    Else
                        ADOTRAS.GetTRAsByDeparment(tra_fields, dep_item, listoftra)
                    End If
                    
                    
                    If listoftra.Count > 0 Then
                        For Each tra_item As etra.com.objects.TRAObj In listoftra
                 %>
                <tr>
                    <td><% Response.Write(tra_item.tra_Activity_Job)%></td>
                    <td class="text-center">
                       <button type="button" class="btn btn-primary btn-sm m-1" id="showtra_<%Response.Write(Base64Con.EncodeBase64( tra_item.tra_ID))%>"><% GetLbl("p_tras_lbl_btn_open")%></button>
                        <button type="button" class="btn btn-primary btn-sm m-1" id="sendspoolprint_<%Response.Write(Base64Con.EncodeBase64(tra_item.tra_ID))%>" ><% GetLbl("p_tras_lbl_btn_Print")%></button>
                        <button type="button" class="btn btn-primary btn-sm m-1" id="clonetra_<%Response.Write(Base64Con.EncodeBase64( tra_item.tra_ID))%>"><% GetLbl("p_tras_lbl_btn_clone")%></button>
                    </td>
                </tr>
                <%
                Next
                
            Else
                    %>
                <tr class="text-center">
                    <td colspan="2"><% GetLbl("p_tras_lbl_notdocfound")%></td>
                </tr>
                    <%
                End If
                
                Next
                %>
            </table>
        </div>
    </div>
</div>
<script>
    $("button[id*='showtra_']").click(function () {
        var selop = $(this).attr("id");
        var values = selop.split("_");
        window.open("tra/TRAFormat.aspx?tra_id=" + values[1]);
        
    });
    $("button[id*='sendspoolprint_']").click(function () {
        var selop = $(this).attr("id");
        var values = selop.split("_");
        window.open("tra/TRAFormat.aspx?tra_id=" + values[1] + "&printview=true");
    });
    $("button[id*='clonetra_']").click(function () {
        var selop = $(this).attr("id");
        var values = selop.split("_");
        window.open("tra/t_loadtra.aspx?tra_id=" + values[1]);
    });
    $("#departments_option").change(function () {
        document.location.href = "index.aspx?p=tra/p_tras&dep=" + $(this).val();
    });
    $("#setfilter").click(function () {

        var locationValue = (new URL(location.href)).toString();

        var val_searchchar = locationValue.search("&qt=");
        var text_seach = $("#txt_searchtext").val();

        if (val_searchchar == -1) {
            locationValue = locationValue + "&qt=" + text_seach;

        } else {
            var new_location_str = locationValue.substr(0, val_searchchar);
            locationValue = new_location_str + "&qt=" + text_seach;

        }
        document.location.href =locationValue;
    });
    $("#clearfiltertext").click(function () {
        var locationValue = (new URL(location.href)).toString();
        var val_searchchar = locationValue.search("&qt=");
        var new_location_str=""
        if (val_searchchar > -1) {
            var new_location_str = locationValue.substr(0, val_searchchar);
        }
        document.location.href = new_location_str;
    });
    $("#createnewtra").click(function () {
        window.location.href="index.aspx?p=tra/p_createTRA&newtra=true"
    });

    $("#btn_opentra").click(function () {
        var trapin = $("#txt_loadTRA").val();
        var redirect = false;
        window.location.href = "tra/t_loadtra.aspx?trapin=" + trapin
        //$.ajax({
        //    method: "GET",
        //    url: "t_loadtra.aspx?trapin=" + trapin,
        //    dataType: "html",
        //    async: false,
        //    success: function (data) {
        //        if (data.redirectUrl) {
        //            redirect = true;
        //        }
        //    }
        //}).done(function (msg) {
        //    if (msg == "TRA_Loaded") {
        //        redirect = true;
        //    }
        //    //alert("response:" + msg);
        //});

        //if (redirect) {
        //    window.location.href = "index.aspx?p=p_createTRA";
        //}
    });

</script>