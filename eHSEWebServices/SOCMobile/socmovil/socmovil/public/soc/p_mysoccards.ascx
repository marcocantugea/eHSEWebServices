<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="p_mysoccards.ascx.vb" Inherits="socmovil.p_mysoccards" %>
<% 
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim Base64encoder As New eservices_core.com.utilities.Base64Conversions
    Dim listSOCCards As New List(Of socmobile_core.com.objects.SOCCardObj)
    
    Dim Fields As New socmobile_core.com.objects.SOCCardObj
    Fields.id = -7
    Fields.Fecha = New DateTime(1, 1, 1)
    Fields.Ubicacion = "-7"
    Fields.Observacion = "-7"
    
    Dim firstDayOfTheMonth As Date = New DateTime(Date.Now.Year, Date.Now.Month, 1)
    Dim dayOfWeek = CInt(DateTime.Today.DayOfWeek)
    Dim startOfWeek = DateTime.Today.AddDays(-1 * dayOfWeek)
    Dim endOfWeek = DateTime.Today.AddDays(7 - dayOfWeek).AddSeconds(-1)
    
    Dim calculateLastDayOfTheMonth = DateTime.Now
    Dim lastDayOfTheMonth = New DateTime(calculateLastDayOfTheMonth.Year, calculateLastDayOfTheMonth.Month, DateTime.DaysInMonth(calculateLastDayOfTheMonth.Year, calculateLastDayOfTheMonth.Month))
    
    UnitOfWork.SOCCard.GetSocCardByUserName(SessionUser.UserObjSession.InfoUserObj, listSOCCards, firstDayOfTheMonth, lastDayOfTheMonth, Fields)
%>
<div class="container text-center">
    <div class="mt-3 mb-3">
        <span clasS="display-4"><%GetLbl("p_mysoccards_lbl_maintitle") %></span>
    </div>
    <div class=" text-left">
        <span class="h4 "><%GetLbl("p_mysoccards_lbl_thisweek") %></span>
        <br />
        <table class="table table-striped table-hover mt-3 text-center">
            <tbody>
                <tr>
                    <th scope="col"><%GetLbl("lbl_date") %></th>
                    <th scope="col"><%GetLbl("p_createsoc_lbl_location") %></th>
                    <th scope="col"><%GetLbl("p_createsoc_lbl_observation")%></th>
                    <th scope="col"><%GetLbl("lbl_Options") %></th>
                </tr>
                <%
                    Dim totalCardsIntheWeek As Integer = 0
                    For Each soc As socmobile_core.com.objects.SOCCardObj In listSOCCards
                        If soc.Fecha >= startOfWeek And soc.Fecha <= endOfWeek Then
                            totalCardsIntheWeek += 1
                       
                %>
                <tr>
                    <td><% Response.Write(soc.Fecha.ToString("dd MMM yyyy").ToUpper)%></td>
                    <td><% Response.Write(soc.Ubicacion)%></td>
                    <td><% Response.Write(soc.Observacion)%></td>
                    <td>
                         <button type="button" class="btn btn-primary" id="btn_showcard_<% Response.Write(Base64encoder.EncodeBase64(soc.id))%>"> <%GetLbl("lbl_see") %></button>
                    </td>
                </tr>
                <%
                End If
                Next
                   %>
            </tbody>
        </table>
        <div class="mt-3 mb-3">
            <span class="h5"><%GetLbl("p_mysoccards_lbl_totalcards") %> <% Response.Write(totalCardsIntheWeek)%></span>
        </div>
        
    </div> 
    <div class="mt-4 mb-3 text-left">
        <span class="h4 "><%GetLbl("p_mysoccards_lbl_thismonth") %> <% Response.Write(Date.Now.ToString("MMMM").ToUpper)%></span>
        <br />
        <table class="table table-striped table-hover mt-3 text-center">
            <tbody>
                <tr>
                    <th scope="col"><%GetLbl("lbl_date") %></th>
                    <th scope="col"><%GetLbl("p_createsoc_lbl_location") %></th>
                    <th scope="col"><%GetLbl("p_createsoc_lbl_observation")%></th>
                    <th scope="col"><%GetLbl("lbl_Options") %></th>
                </tr>
                <%
                    Dim totalCardsIntheMonth As Integer = 0
                    For Each soc As socmobile_core.com.objects.SOCCardObj In listSOCCards
                            totalCardsIntheMonth += 1
                       
                %>
                <tr>
                    <td><% Response.Write(soc.Fecha.ToString("dd MMM yyyy").ToUpper)%></td>
                    <td><% Response.Write(soc.Ubicacion)%></td>
                    <td><% Response.Write(soc.Observacion)%></td>
                    <td>
                        <button type="button" class="btn btn-primary" id="btn_showcard_<% Response.Write(Base64encoder.EncodeBase64(soc.id))%>">  <%GetLbl("lbl_see") %></button>
                    </td>
                </tr>
                <%
                Next
                   %>
            </tbody>
        </table>
        <div class="mt-3 mb-3">
            <span class="h5"><%GetLbl("p_mysoccards_lbl_totalcards") %> <% Response.Write(totalCardsIntheMonth)%></span>
        </div>
        
    </div>
</div>
<script>
    $("button[id*='btn_showcard_']").click(function () {
        var id = this.id;
        var values = id.split("_");
        window.open("index.aspx?p=soc/p_viewsoccard&soc=" + values[2])
    });
</script>