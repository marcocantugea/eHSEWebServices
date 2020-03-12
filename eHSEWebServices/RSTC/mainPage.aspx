<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mainPage.aspx.vb" Inherits="mainPage" %>

<script language="VB" runat="server"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-Frame-Options" content="allow">

    <title>SAFETY DEPARTMENT</title>
    <style type="text/css">

                .auto-style1 {
            height: 30px;
            width: 1142px;
        }

                </style>
    <link href="Styles/CQS.css" rel="stylesheet" type="text/css">
    <script src="Scripts/jquery-3.1.1.min.js"></script>

</head>
<body style="background-color:#0a5e89">
    <form id="form1" runat="server">
        <br>
    <div align="center">
    <table style="background-color:White" border="0" cellpadding="0" 
            cellspacing="0">
        <tr>
            <td colspan="2">
                </td>
        </tr>
        <tr>
            <td colspan="2" class="estiloEtiquetasTitulos">
                <table cellpadding="3" cellspacing="3" style="width:100%">
                    <tr>
                        <td style="color:white; background:#074d52; padding:8px; margin:2px; font-size:small; font-weight:bold;" class="auto-style1">
                    <table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td width="50%"><asp:Label ID="lblDeptAuthority" runat="server" Text="Welcome" Font-Bold="True" Font-Size="X-Small" ForeColor="White" ></asp:Label></td>
    <td width="35%" align="right"><img src="../Images/LogOn_User.png" width="26" height="26" /></td>
    <td width="15%" align="left"><asp:Label ID="lblUser" runat="server" Font-Size="X-Small" ForeColor="White" ></asp:Label>&nbsp;<br />
        <asp:LinkButton ID="lnkLogout" runat="server" ForeColor="#CCFFFF">Logout</asp:LinkButton>
      </td>
  </tr>
</table>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td style="width:190px; vertical-align:top; text-align: left;">
                    <asp:Repeater ID="rptMenu" runat="server">
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                            <td align="left"><asp:Button ID="btnrptDelete1" runat="server" class="button"
                                CommandArgument='<%#Container.DataItem("Menu_ID")%>'
                                CommandName="btnDeleteRpt" Text=<%#Container.DataItem("Menu_Name")%> ToolTip="Delete Item" Width="190px" Height="35px" Font-Size="Medium" />
                            </td>
                          </tr>
                        </table>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                            <td align="left"><asp:Button ID="btnrptDelete4" runat="server" class="button" 
                                CommandArgument='<%#Container.DataItem("Menu_ID")%>' 
                                CommandName="btnDeleteRpt" Text=<%#Container.DataItem("Menu_Name")%> 
                                    ToolTip="Delete Item" Width="190px" Height="35px" Font-Size="Medium" />
                            </td>
                               </tr>
                        </table>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </td>
        <td align="center">
            <iframe id="iframe1" src="<%=Url %>" align="center" frameborder="0" 
                        marginheight="0" marginwidth="0"></iframe>
        </td>
        </tr>
    </table>
        <p style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: x-small; font-weight: bold; color: #FFFFFF">Powered by Juan Luis Rios © </p>
    </div>
        <script type="text/javascript">
            var windowheight = $(window).height();
            var windowwidth = $(window).width();
            //alert(windowheight);
            $("#iframe1").height(windowheight - 120);
            $("#iframe1").width(windowwidth-210);
            $(window).resize(function () {
                var windowheight = $(window).height();
                var windowwidth = $(window).width();
                if (windowheight > 350) {
                    $("#iframe1").height(windowheight - 130);
                    $("#iframe1").width(windowwidth-210);
                }
                //alert("Resiziando");
            }
            );

    </script>
    </form>
</body>
</html>
