<%@ Page Language="VB" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="TRA_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title></title>
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
        .auto-style6 {
            width: 500px;
        }
        .auto-style7 {
            height: 33px;
        }
    </style>


</head>
<body>
<form id="form1" runat="server">
<div>
<div id="divMensaje" runat="server">

<div id="overlay"></div> 
<div id="popup">
<div runat="server" id="divConfirmación">
    <table  style="border: thick solid #000000; width:500px; height:200px; background:#fff; vertical-align:bottom;" align="center">
        <tr>
            <td>
                <asp:Label ID="Label26" runat="server" Text="The TRA is going to be Delete. Are you sure?" CssClass="estiloTitulos"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="bDeleteTareaConfirm" runat="server" CssClass="button1" Height="35px" Text="DELETE TRA" Width="200px" />
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnEliminarNo" runat="server" CssClass="button" Text="Cancel" Height="35px" Width="200px" />
            </td>
        </tr>
    </table>
</div>
</div>

    </div>
<table style="width:908px; margin-left: auto; margin-right: auto;">
            
    <tr>
        <td>
            <table style="width:900px;">
                <tr>
                    <td>
                        <table style="width:900px; height: 0px;">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lDepartamento" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Text="Department:"></asp:Label>
                                    <asp:Label ID="lblUser" runat="server" Visible="False" ></asp:Label>
                                    <asp:Label ID="lblTRA_Id" runat="server" Visible="False" ></asp:Label>
                                </td>
                                <td style="text-align: right" class="auto-style6">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Text="TRA Description:"></asp:Label>
                                    <asp:TextBox ID="tSrcDescription" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Font-Strikeout="False" Width="200"></asp:TextBox>
                                    <asp:Label ID="Label5" runat="server" Visible="False" ></asp:Label>
                                    <asp:Label ID="Label6" runat="server" Visible="False" ></asp:Label>
                                </td>
                                <td style="text-align: right" class="auto-style6">
                                   <asp:Button ID="btnBorradores" runat="server" BackColor="#555555" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Small" ForeColor="White" Height="30px" Text="Drafts" Width="100px" />
&nbsp;<asp:Button ID="btnOnRevision" runat="server" BackColor="#555555" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Small" ForeColor="White" Height="30px" Text="On Revision" Width="100px" />
&nbsp;<asp:Button ID="btnOficiales" runat="server" BackColor="#555555" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Small" ForeColor="White" Height="30px" Text="Officials" Width="100px" />
&nbsp;<asp:Button ID="btnCrearTRA" runat="server" BorderStyle="Solid" BorderWidth="2px" Font-Names="Myriad Pro" Font-Size="Medium" Text="Create TRA" Height="30px" Width="151px" CssClass="button" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="2"  style="background-color: #329BD8">
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
                        <div><!--Repeater con Drafts-->
                                <asp:Repeater ID="rptFiles" runat="server">
                                    <HeaderTemplate>
                                        <table style="margin-left: auto; margin-right: auto;">
                                            <tr>
                                                <td align="center">
                                                    <asp:LinkButton ID="lbtnID" runat="server" Width="30px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro">ID</asp:LinkButton>
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
                                                <td align="center">
                                                        <asp:Label ID="brptDelete" runat="server" Text="Delete" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
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
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/images/btnTrash.png" ID="ImageButton2" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptDelete" ToolTip="Delete TRA"/>
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
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/images/btnTrash.png" ID="ImageButton2" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptDelete" ToolTip="Delete TRA"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                        </div><br />
                        <div><!--Repeater para Revision-->
                            <asp:Repeater ID="rptRevision" runat="server">
                                    <HeaderTemplate>
                                        <table style="margin-left: auto; margin-right: auto;">
                                            <tr>
                                                <td align="center">
                                                    <asp:LinkButton ID="lbtnID" runat="server" Width="30px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro" CommandName="tra_ID">ID</asp:LinkButton>
                                                </td>
                                                <td align="left">
                                                    <asp:LinkButton ID="lBtnDesc" runat="server" Width="300px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro" CommandName="tra_Dept">TRA Description</asp:LinkButton>
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="lrptDepart" runat="server" Text="Departament" Width="300px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td>  
                                                <td align="center">
                                                        <asp:Label ID="Label3" runat="server" Text="Revision" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td>  
                                                <td align="center">
                                                            <asp:Label ID="brptPrint" runat="server" Text="Print" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td>
                                                <td align="center">
                                                        <asp:Label ID="brptClone" runat="server" Text="Clone" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td>
                                                <td align="center">
                                                        <asp:Label ID="brptDelete" runat="server" Text="Delete" Width="60px" ForeColor="White" Font-Size="Small" Font-Names="Myriad Pro"></asp:Label>
                                                </td> 
                                                <td align="center">
                                                        
                                                </td> 
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table  style="margin-left: auto; margin-right: auto;" border="0" class="repeater">
                                           <tr  id="trID" runat="server">
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
                                                    <asp:ImageButton ImageUrl="~/images/btnEditTra.png" ID="ImageButton1" runat="server"
                                                        CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptEdit" ToolTip="Edit TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                <asp:ImageButton ImageUrl="~/Images/btnSmallPrinter.png" ID="Print" runat="server"
                                                        CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptPrint" ToolTip="Print TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/Images/btnClone.png" ID="Clone" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptClone" ToolTip="Clone TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/images/btnTrash.png" ID="ImageButton2" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptDelete" ToolTip="Delete TRA"/>
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="Label7" runat="server" 
                                                        Text='<%#Container.DataItem("tra_SentBack_Reason")%>' Width="300px" Font-Names="Myriad Pro" Font-Size="Small" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <table  style="margin-left: auto; margin-right: auto;" border="0" class="repeaterAlterno">
                                            <tr  id="trID" runat="server">
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
                                                    <asp:ImageButton ImageUrl="~/images/btnEditTra.png" ID="ImageButton1" runat="server"
                                                        CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptEdit" ToolTip="Edit TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                <asp:ImageButton ImageUrl="~/Images/btnSmallPrinter.png" ID="Print" runat="server"
                                                        CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptPrint" ToolTip="Print TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/Images/btnClone.png" ID="Clone" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptClone" ToolTip="Clone TRA"/>
                                                </td>
                                                <td style="width:60px; text-align:center;">
                                                    <asp:ImageButton ImageUrl="~/images/btnTrash.png" ID="ImageButton2" runat="server"
                                                    CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="brptDelete" ToolTip="Delete TRA"/>
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="Label7" runat="server" 
                                                        Text='<%#Container.DataItem("tra_SentBack_Reason")%>' Width="300px" Font-Names="Myriad Pro" Font-Size="Small" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                        </div>
                    </td>
                </tr>
                </table>  
        </td>
    </tr>
    <tr>
        <td style="background-color: #000000; text-align: center;">
           
    </td>
    </tr>
</table>
<div >
    
</div> 
    

</div>        
</form>
</body>
</html>
