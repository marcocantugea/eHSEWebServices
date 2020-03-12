<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pBicDirectory.aspx.vb" Inherits="pBicDirectory" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Directorio</title>
    <style type="text/css">
        .style1
        {
            width: 189px;
        }
        .style2
        {
            width: 440px;
        }
        .style3
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: small;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <table style="width: 572px;" border="0" align="center">
        <tr>
        <td class="style3">
        
            Phone Directory</td>
        </tr>
            <tr>
                <td class="style2">
                    <table style="width:100%;">
                        <tr>
                            <td class="style1">
                                <asp:TextBox ID="txtPhoneSrc" runat="server" CssClass="estiloPregunta" 
                                    Height="24px" Width="168px">Input Your Search</asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnPhoneSrc" runat="server" Text="Search" CssClass="Button2" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="rptPhoneDirectory" runat="server">
                        <HeaderTemplate>
                            <table border="0">
                                <tr>
                                   <td align="left" class="hdDirectorio" width="330px">
                                        <asp:Label ID="lblDesc" runat="server" Text="Description" ></asp:Label>
                                    </td>
                                    <td align="left" class="hdDirectorio" width="150px">
                                        <asp:Label ID="lblExt" runat="server" Text="Ext #"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0">
                                <tr>
                                    <td align="left" class="repeater" >
                                        <asp:Label ID="Desc" runat="server" width="330px"
                                            Text='<%#Container.DataItem("Desc")%>' ></asp:Label>
                                    </td>
                                    <td align="center" class="repeater" >
                                        <asp:Label ID="Ext" runat="server" width="150px"
                                            Text='<%#Container.DataItem("Ext")%>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0">
                                <tr>
                                    <td align="left" class="repeaterAlterno" >
                                        <asp:Label ID="Desc0" runat="server" width="330px"
                                            Text='<%#Container.DataItem("Desc")%>' ></asp:Label>
                                    </td>
                                    <td align="center" class="repeaterAlterno">
                                        <asp:Label ID="Ext0" width="150px" runat="server" 
                                            Text='<%#Container.DataItem("Ext")%>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
