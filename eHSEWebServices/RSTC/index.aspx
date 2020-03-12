<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css">
<script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-Frame-Options" content="allow">

    <title>BICENTENARIO - Web Services</title>
    <style type="text/css">
        #iframe1
        {
            height: 543px;
            width: 1220px;
        }
        .style1
        {
            width: 1060px;
        }
        .style3
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: 10px;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            width: 1060px;
            height: 29px;
        }
        .style4
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: 10px;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            width: 1060px;
            height: 11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:1220px;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style3">
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Small" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style4" align="left" valign="middle">
                    <div id="divMenu" runat=server  style="height: 11px; width: 1067px;">
                    &nbsp;<br />
                        <asp:Button ID="Button2" runat="server" Text="Back Main Menu"
                        Width="100px" CssClass="Button2" />
                    <asp:Button ID="Button1" runat="server" Text="Create SOC Card"
                        Width="96px" CssClass="Button2" />
                    <asp:Button ID="btnPhone" runat="server" Text="Manage SOC Cards" 
                        Width="108px" CssClass="Button2" />
                        <asp:Button ID="btnPhone3" runat="server" Text="Follow Up" 
                        Width="61px" CssClass="Button2" />
                        <asp:Button ID="btnPhone1" runat="server" Text="SOC Summary" 
                        Width="80px" CssClass="Button2" />
                        <asp:Button ID="btnPhone4" runat="server" Text="Workers" 
                        Width="55px" CssClass="Button2" />
                        <asp:Button ID="btnPhone0" runat="server" Text="Export SOC" 
                        Width="69px" CssClass="Button2" />
                        <asp:Button ID="btnPhone2" runat="server" Text="Users" 
                        Width="43px" CssClass="Button2" />
                        <asp:Button ID="btnPhone6" runat="server" Text="SOC Total" 
                        Width="61px" CssClass="Button2" />
                        <asp:Button ID="btnPhone7" runat="server" Text="Tracking SOC" 
                        Width="77px" CssClass="Button2" />
                        <asp:Button ID="btnPhone8" runat="server" Text="SOC - Stadistics" 
                        Width="87px" CssClass="Button2" />
                        <asp:Button ID="btnPhone5" runat="server" Text="Raffle" 
                        Width="70px" CssClass="Button2" />
                        <asp:Button ID="btnPhone9" runat="server" Text="Repetidas" 
                        Width="70px" CssClass="Button2" />
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <iframe id="iframe1" src="<%=Url %>" align="left" frameborder="0" 
                        marginheight="0" marginwidth="0" width="1400"></iframe>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
