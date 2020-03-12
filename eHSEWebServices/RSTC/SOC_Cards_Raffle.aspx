<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SOC_Cards_Raffle.aspx.vb" Inherits="SOC_Cards_Raffle" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stop Card Had Been Sent</title>
    <style type="text/css">
        .style1
        {
            height: 75px;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 671px;" border="0">
        <tr>
        <td class="estiloRptHD">
        
            &nbsp;
            SOC CARDS - TARJETAS SOC<span class="style3"><br />
            RIFA<br />
            <br />
            Del
            Dia: </span>
            <asp:TextBox ID="tFechas" runat="server"></asp:TextBox>
            &nbsp; Al Dia:
            <asp:TextBox ID="tFechas2" runat="server"></asp:TextBox>
            <br />
                    </td>
        </tr>
        <tr>
        <td class="style1">
        
            <br />
        
        <asp:Button ID="btnBack" runat="server" Text="LOT" CssClass="Button2" 
                Height="25px" style="font-size: x-small" 
                Width="174px" />
    
            <br />
            <br />
        
            <br />
            <br />
            <br />
            <br />
            </td>
        </tr>
        <tr>
        <td class="style3">
        
            <asp:Label ID="Label1" runat="server" CssClass="Identificadores" 
                Width="450px" Height="16px"></asp:Label>
            <br />
        
            <asp:Label ID="Label2" runat="server" CssClass="Identificadores" 
                Width="450px" Height="16px" Font-Size="Small"></asp:Label>
            <br />
            <br />
            <br />
        
            <br />
            <br />
        
            <asp:Label ID="Label3" runat="server" CssClass="estiloPregunta" 
                Width="450px" Height="16px"></asp:Label>
                    <br />
        
            <asp:Label ID="Ganador" runat="server" CssClass="estiloRptHD2" 
                Width="450px" Height="16px"></asp:Label>
                    <br />
                    <asp:GridView ID="gvEmpleados" runat="server" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        Font-Names="Verdana" Font-Size="7pt" ForeColor="#333333" Height="16px" 
                        Width="448px">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    </td>
        </tr>
        </table>
    
    </div>
    </form>
</body>
</html>