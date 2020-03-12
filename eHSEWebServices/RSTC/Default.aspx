<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RSTC Page</title>
    <style type="text/css">
        .style1
        {
            width: 171px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
         <div>
    <div>
        Rows: <asp:TextBox ID="txtRows" runat="server" Width="95px">2013,1,1</asp:TextBox> <br />
        Cols: &nbsp;<asp:TextBox ID="txtCols" runat="server" Width="97px">2013,1,31</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnGenerate" OnClick="btnGenerate_Click" runat="server" Text="Generate" />&nbsp;<br />
        <table cellspacing="0" style="width:100%;">
            <tr>
                <td class="estiloEtiquetasTitulos">
                    CREW</td>
                <td rowspan="7" valign="top">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    A</td>
            </tr>
            <tr>
                <td class="style1">
                    B</td>
            </tr>
            <tr>
                <td class="style1">
                    C</td>
            </tr>
            <tr>
                <td class="style1">
                    D</td>
            </tr>
            <tr>
                <td class="style1">
                    E</td>
            </tr>
            <tr>
                <td class="style1">
                    F</td>
            </tr>
            <tr>
                <td class="style1">
                    1</td>
                <td rowspan="5" valign="top">
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    2</td>
            </tr>
            <tr>
                <td class="style1">
                    3</td>
            </tr>
            <tr>
                <td class="style1">
                    4</td>
            </tr>
            <tr>
                <td class="style1">
                    5</td>
            </tr>
        </table>
        <br /> <br />
        <br />
        <br />
        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
        <br />
        <br />
    </div>
    </div>
        <asp:Button ID="btnPost" runat="server" OnClick="Button1_Click" Text="Cause Postback" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:GridView ID="GridView4" runat="server">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
