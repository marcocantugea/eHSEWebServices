<%@ Page Language="VB" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="TRA_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title>TRA e-Format</title>
    <link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>
    <style type="text/css">
        #overlay {
    position: absolute;
    top:0;
    left:0;
    bottom:0;
    right:0;
    width:100%;
    height:100%;
    z-index:998;
    background-color: Black;
    opacity: .5;
}

#popup {
    position: absolute;
    align-content:center;
    vertical-align:middle;
    width:100%;
    height:100%;
    z-index: 999;
}
        .auto-style2 {
        }
        .estiloRptHD
{
background-color:#333333;
color:#FFF;
font-weight:bold;
font-size:small;
text-indent:3px;
	text-align: center;
}
.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;

font-size:small;
text-indent:3px;
}
.repeaterAlterno
{
background-color:#FFFFFF;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
font-size:small;
text-indent:3px;
}
        .auto-style5 {
            width: 297px;
        }
        .auto-style6 {
            width: 319px;
        }
        .auto-style7 {
            height: 37px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div >
    
        <table style="width:908px; margin-left: auto; margin-right: auto;">
            <tr>
                <td style="align-content:center; text-align: center;">
                    <asp:Image ImageAlign="Top" ID="Image1" runat="server" ImageUrl="~/Images/tra_Header.png" />
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width:900px;">
                        <tr>
                            <td>
                                <table style="width:900px; height: 0px;">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="lMain_Departamentos" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Text="Departamentos:"></asp:Label>
                                        </td>
                                        <td class="auto-style5" >
                                            <asp:DropDownList ID="dbDepartamento" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="254px" Height="25px" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td>

                                        </td>
                                        <td style="text-align: right" class="auto-style6">
                                            
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Text="TRA Description:"></asp:Label>
                                        </td>
                                        <td >
                                            <asp:TextBox ID="tSrcDescription" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Width="300"></asp:TextBox>
                                        </td>
                                         <td>
                                             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/btnSearch.png" Width="25px" />
                                         </td>
                                        <td style="text-align: right" class="auto-style6">
                                           <asp:Button ID="btnBorradores" runat="server" BackColor="#555555" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Small" ForeColor="White" Text="Official" Height="30px" Width="131px" />
&nbsp;<asp:Button ID="btnCrearTRA" runat="server" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Small" Text="Create TRA" Height="30px" Width="152px" PostBackUrl="~/TRA/TRA_Input_Data.aspx" CssClass="button" />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="auto-style7" colspan="4" style="background-color: #329BD8">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblStatus0" runat="server" Font-Bold="False" Font-Names="Myriad Pro" Font-Size="Medium" ForeColor="White" Text="    TRAs on STATUS:"></asp:Label>
&nbsp;
                                            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Myriad Pro" Font-Overline="False" Font-Size="Large" ForeColor="White" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr   style="text-align:center;">
                            <td style="background-color: #333333;text-align:center;">

			<table style=" width:500px; margin-left: auto; margin-right: auto; background-color: #333333;">
                <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table style="margin-left: auto; margin-right: auto;">
                                
                                <tr>
                                <td align="center">
                                                    <asp:Label ID="Label9" runat="server" Text="ID" Width="30px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td>
                                   <td align="left">
                                        <asp:Label ID="lrptDesc" runat="server" Text="TRA Description" Width="300px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>

                                    </td>
                                        <td align="left">
                                            <asp:Label ID="lrptDepart" runat="server" Text="Departament" Width="300px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                    </td>    
                                    <td align="center">
                                               <asp:Label ID="brptPrint" runat="server" Text="Print" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                    </td>
                                    <td align="center">
                                         <asp:Label ID="brptClone" runat="server" Text="Clone" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table  style="margin-left: auto; margin-right: auto;" border="0" class="repeater">
                                <tr>
                                <td align="left">
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("tra_ID")%>' 
                                            Width="30px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    
                                    <td align="left">
                                        <asp:Label ID="Descripcion" runat="server" Text='<%#Container.DataItem("tra_Activity_Job")%>' 
                                            Width="300px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="tra_Dept" runat="server" 
                                            Text='<%#Container.DataItem("tra_Dept")%>' Width="300px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    <td style="width:60px; text-align:center;">
                                    <asp:ImageButton ImageUrl="~/Images/btnSmallPrinter.png" ID="Print" runat="server"
                                            CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptPrint" ToolTip="Print"/>
                                    </td>
                                    <td style="width:60px; text-align:center;">
                                    <asp:ImageButton ImageUrl="~/Images/btnClone.png" ID="Clone" runat="server"
                                            CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptClone" ToolTip="Clone"/>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table  style="margin-left: auto; margin-right: auto;" border="0" class="repeaterAlterno">
                                <tr>
                               <td align="left">
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("tra_ID")%>' 
                                            Width="30px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    
                                    <td align="left">
                                        <asp:Label ID="Descripcion" runat="server" Text='<%#Container.DataItem("tra_Activity_Job")%>' 
                                            Width="300px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="tra_Dept" runat="server" 
                                            Text='<%#Container.DataItem("tra_Dept")%>' Width="300px" Font-Names="Myriad Pro" Font-Size="Small"></asp:Label>
                                    </td>
                                    <td style="width:60px; text-align:center;">
                                    <asp:ImageButton ImageUrl="~/Images/btnSmallPrinter.png" ID="Print" runat="server"
                                            CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptPrint" ToolTip="Print"/>
                                    </td>
                                    <td style="width:60px; text-align:center;">
                                    <asp:ImageButton ImageUrl="~/Images/btnClone.png" ID="Clone" runat="server"
                                            CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptClone" ToolTip="Clone"/>
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                
			                </td>
                        </tr>
                       
                </td>
            </tr>
            <tr>
                <td style="background-color: #000000; text-align: center;">
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Text="IT DEPARTMENT" Font-Names="Myriad Pro" style="font-size: x-small"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" ForeColor="White" Text="©BICENTENARIO  WEB SERVICES 2016" Font-Names="Myriad Pro" style="font-size: x-small"></asp:Label>
            </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
