<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRA_Revision_1.aspx.vb" Inherits="TRA_TRA_Revision_1" %>
<%@ Import Namespace="System.Security.Principal" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>e-TRA System</title>
        
      <link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>
    
      <style type="text/css">

	
        td a
        {
            padding: 10px;
        }
    
        .style3
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: x-small;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            height: 40px;
            width: 700px;
        }
    
td { 
    font-family:verdana,arial; 
    font-size:8pt;
	}
        td { 
    font-family:verdana,arial; 
    font-size:8pt;
	}
        .style2
        {
            width: 700px;
        }
        .style16
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 153px;
        }
        .estiloEtiquetasA{ 
    background-color:#ffffff; 
    color:#333333; 
    font-weight:700; 
    font-size:7pt; 
    text-indent:3px;
    font-family: Verdana;
}
        .style20
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 117px;
        }
        .style21
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 147px;
        }
        .style15
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 150px;
        }
        .hdDirectorio
{
background-color:#443e39;
color:#FFFFFF;
font-weight:bold;
font-size:x-small;
text-indent:3px;
            text-align: center;
        }
.hdDirectorio
{
    background-color: #333333;
color: #FFF;
font-weight: bold;
font-size: xx-small;
text-indent: 3px;
 padding: 0px 0px 0px 5px;
height: 8px;
 }

        .style12
        {
            width: 37px;
            height: 28px;
        }
        .style24
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 184px;
        }
        .normalBold
{
font:Verdana, Arial, Helvetica, sans-serif;
color:#000000;
font-size:12px;
font-weight:bold;
}
        .style14
        {
            height: 28px;
        }
            	
        .style25
        {
            width: 37px;
        }
        .style26
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            margin-left: 0px;
            vertical-align: middle ;
            }
        .style22
        {
            color: #800000;
            font-style: italic;
            font-family: Aharoni;
            font-size: xx-small;
        }
        .estiloRptHD2
{
background-color:#009FC2;
color:#FFF;
font-weight:bold;
font-size:16px;
text-indent:3px;
padding: 0px 0px 0px 5px;
/*border-bottom:double;*/
}

.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
        .auto-style2 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 536px;
        }
        .auto-style5 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 239px;
            height: 30px;
        }
        .auto-style8 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 28px;
            font-family: Verdana;
            width: 239px;
        }
        .auto-style11 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 190px;
        }
        .estiloRojo
{
background-color:#810000; /*443e39*/
color: #fff;
font-size: xx-small;
font-weight: 700;
}
        .auto-style29 {
            color: #FFF;
            font-weight: bold;
            font-size: xx-small;
            text-indent: 3px;
            height: 20px;
            text-align: center;
            padding-left: 5px;
            padding-right: 0px;
            padding-top: 0px;
            padding-bottom: 0px;
            background-color: #333333;
            width: 990px;
        }
        .auto-style36 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 190px;
        }
        .auto-style37 {
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 796px;
            background-color: #ffffff;
        }
        .auto-style38 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 795px;
        }
        .auto-style39 {
            width: 400px;
        }
        .auto-style40 {
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 795px;
            background-color: #ffffff;
        }
        .auto-style41 {
            width: 700px;
            height: 139px;
        }
        .Button2 {}
        .auto-style42 {
            height: 35px;
        }
        .auto-style43 {
            height: 28px;
            width: 368px;
        }
        .auto-style44 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 239px;
        }
        .auto-style45 {
            width: 368px;
        }
        .auto-style46 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 340px;
        }
          .auto-style47 {
              width: 1194px;
          }
          .auto-style48 {
              height: 17px;
          }
          .auto-style49 {
              background-color: #ffffff;
              color: #333333;
              font-weight: 700;
              font-size: 7pt;
              text-indent: 3px;
              font-family: Verdana;
              width: 340px;
              height: 20px;
          }
          .auto-style50 {
              width: 28px;
          }
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
      </style>
</head>
<body style="margin:0px 0px 0px 0px;font-family: verdana; font-size: x-small; font-weight: bold; font-variant: normal; color: #990000">
    <form  id="form2" runat="server" style="font-family:Verdana; font-size:small ">
    <div style="font-family:Verdana; font-size:small ">
        <div id="divProcedimientos" runat="server">
<div id="overlay"></div>
<div id="popup">
  <div runat="server" id="divtablaProc">
       <table style="border: thick solid #000000; width:750px; height:600px; background:#fff; vertical-align:top;" align="center">
           <tr>
               <td style="vertical-align:top;">
<table style="width: 650px;" align="center">
            <tr>
                <td class="auto-style48"></td>
                <td class="auto-style48"></td>
                <td class="auto-style48"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="estiloRptHD2" style="height:40px">
                    <table cellpadding="6" cellspacing="3">
                        <tr >
                            <td>
                                <div >
                                    <asp:Label ID="lblProcDepartamento" runat="server" ForeColor="White" CssClass="normalBold" Text="Department"></asp:Label><br /><br />                   
                                </div>
                                <div>
                                    <asp:Label ID="lblTipoDocumento" runat="server" ForeColor="White" CssClass="normalBold" Text="Document Type"></asp:Label><br /><br />
                                </div>
                                <div>
                                   <asp:Label ID="Label11" runat="server" ForeColor="White" CssClass="normalBold" Text="Search: "></asp:Label>
                                </div>
                            </td>
                            <td>
                                <asp:DropDownList ID="dbProcDepartamento" runat="server" AutoPostBack="True" Width="200px">
                                                        <asp:ListItem>Select One</asp:ListItem>
                                                        <asp:ListItem Value="Perforación">Drilling/Perforación</asp:ListItem>
                                                        <asp:ListItem Value="HSE">HSE/Seguridad</asp:ListItem>
                                                        <asp:ListItem Value="Mantenimiento">Maintenance/Mantenimiento</asp:ListItem>
                                                        <asp:ListItem Value="Marina">Marine / Marina</asp:ListItem>
                                                        <asp:ListItem>Subsea</asp:ListItem>
                                                    </asp:DropDownList><br /><br />
                                <asp:DropDownList ID="dbDocTipo" runat="server" AutoPostBack="True" Width="200px">
                                    <asp:ListItem>Select One</asp:ListItem>
                                    <asp:ListItem Value="Instructivos">Instructives/Instructivos</asp:ListItem>
                                    <asp:ListItem Value="Procedimiento">Procedures/Procedimientos</asp:ListItem>
                                </asp:DropDownList><br /><br />
                                <asp:TextBox ID="tSearchDoc" runat="server" Width="200"></asp:TextBox> <asp:Button ID="btnSearchDoc" runat="server" Text="Search" CssClass="button" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                
                    <asp:Repeater ID="rptProcedimientos" runat="server">
                        <HeaderTemplate>
                             <table  style="margin:0; padding:0;border:0;" class="hdDirectorio">
                              <tr>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Task0" runat="server" 
                                            Text="Code" Width="100px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top; text-align:left ">
                                       <asp:Label ID="Label1" runat="server" 
                                            Text="Description" Width="534px"></asp:Label>
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:Label ID="Label9" runat="server" 
                                            Text="" Width="16px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table  style="margin:0; padding:0;border:0;" class="repeater">
                              <tr>
                                    <td style="vertical-align:top;"  align="center">
                                        <asp:Label ID="Task0" runat="server" 
                                            Text='<%#Container.DataItem("proc_Codigo")%>' Width="100px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Hazard0" runat="server" 
                                            Text='<%#Container.DataItem("proc_Descripcion")%>' Width="534px"></asp:Label>
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Images/rpt_Add.png" 
                                          CommandArgument='<%#Container.DataItem("proc_Codigo")%>' CommandName="bAdd"
                                          />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table style="margin:0; padding:0;border:0;" class="repeaterAlterno">
                              <tr>
                                <td style="vertical-align:top;" align="center">
                                        <asp:Label ID="Task0" runat="server" 
                                            Text='<%#Container.DataItem("proc_Codigo")%>' Width="100px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Hazard0" runat="server" 
                                            Text='<%#Container.DataItem("proc_Descripcion")%>' Width="534px"></asp:Label>
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Images/rpt_Add.png" 
                                          CommandArgument='<%#Container.DataItem("proc_Codigo")%>' CommandName="bAdd"
                                          />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:670px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo2" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    </td>
                <td>&nbsp;</td>
            </tr>
        </table>
                   <div style="overflow: hidden;">
           <table style="width: 670px; font-family:Verdana; font-size:xx-small; " border="0" 
            align="center">
                    <tr>
                        <td style="width:670px">
        <asp:Repeater ID="rptPaging" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="btnPage"
                 style="padding:8px; margin:1px; background:#D6D6D6; border-color:#333333; font:8pt tahoma;"
                CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                 runat="server" ForeColor="#333333" Font-Bold="True"><%# Container.DataItem %>
                                </asp:LinkButton>
                  
           </ItemTemplate>
        </asp:Repeater>
                            </td></tr></table> 
        </div>
               </td>
           </tr>
           <tr>
               <td>
                   
               </td>
           </tr>
           <tr>
               <td>
<table style="vertical-align:bottom " align="center">
            <tr>
                <td>
                                                    <asp:Button ID="bProcedureDone" runat="server" CssClass="buttonGreen " Text="Done" 
                                    Width="150px" Height="29px" Font-Size="X-Small" />
                                    
                </td>
            </tr>
        </table>
               </td>
           </tr>
       </table>
   </div>     
<div runat="server" id="divConfirmación">
    <table  style="border: thick solid #000000; width:500px; height:200px; background:#fff; vertical-align:bottom;" align="center">
        <tr>
            <td>
                <asp:Label ID="Label26" runat="server" Text="The Task is going to be Delete. Are you sure?" CssClass="estiloTitulos"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="bDeleteTareaConfirm" runat="server" CssClass="button1" Height="35px" Text="DELETE TASK" Width="200px" />
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

        
       
       <table style="width: 671px; font-family:Verdana; font-size:xx-small; " border="0" 
            align="center">
        <tr>
        <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thick; border-bottom-color: #000000;"><asp:Image ImageAlign="Top" ID="Image1" runat="server" ImageUrl="~/Images/tra_Header.png" />
            
                             
                    <asp:Label ID="TraR_ID" runat="server" style="font-size: xx-small" Visible="False"></asp:Label>
                             
            </td>
        </tr>
           <tr >
               <td style="height:30px; color:white; background:#008001; padding:8px; margin:2px; font-size:small; ">
                   <table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td width="50%"><asp:Label ID="lblDeptAuthority" runat="server" Text="Revision by Dept Authority" ></asp:Label>
        <p></p>
        <asp:Label ID="lblRazon" runat="server" Font-Size="Medium" ForeColor="#FF9900" Visible="False" ></asp:Label>
    </td>
    
    <td width="35%" align="right"><img src="../Images/LogOn_User.png" width="26" height="26" /></td>
    <td width="15%" align="left"><asp:Label ID="lblUser" runat="server" Text="" ></asp:Label></td>
  </tr>
</table>
                   </td>
           </tr>
            <tr>
                <td class="auto-style41">
                    <table style="border: thin ridge #808080; width: 1298PX;">
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="Label12" runat="server" Text="TRA Id:"></asp:Label>
                            </td>
                            <td class="auto-style46">
                                <asp:Label ID="ltraId" runat="server" Visible="True" Font-Size="Medium"></asp:Label>
                            </td>
                            <td class="auto-style37" rowspan="4">
                                
                                              </tr>
                        <tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lUnidad" runat="server" Text="Unit:"></asp:Label>
                            </td>
                            <td class="auto-style46">
                                <asp:DropDownList ID="dbUnit" runat="server" CssClass="estiloEtiquetasA" 
                                    TabIndex="9" Width="300px" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style37" rowspan="4">
                                
                                              </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lDepartamento" runat="server" Text="Department:"></asp:Label>
                            </td>
                            <td class="auto-style46">
                                <asp:DropDownList ID="dbDepartamento" runat="server" CssClass="estiloEtiquetasA" 
                                    TabIndex="9" Width="300px" Enabled="False">
                                </asp:DropDownList>
                            </td>
                                                    </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lActivityDesc" runat="server" Text="Activity/Job Description:"></asp:Label>
                            </td>
                            <td class="auto-style49">
                                <asp:TextBox ID="txtActividad" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="300px" TabIndex="500"></asp:TextBox>
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lFecha" runat="server" Text="Date:"></asp:Label>
                            </td>
                            <td class="auto-style46">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="300px" TabIndex="500" Enabled="False"></asp:TextBox>
                            </td>
                           
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table runat="server" id="tbl_PasosTRA" style="border: thin ridge #808080; width: 1000PX;">
                        <tr align="left">
                            <td class="auto-style42">
                                <table  style="border-style: none; border-color: inherit; border-width: 0; padding: 0; margin-left: 0; margin-right: 0; margin-top: 0;" >
                                
                                <tr class="estiloRptHD">
                                
                                <td  rowspan="3" align="left">
                                  <asp:Label ID="Label2" runat="server" Text="No" Width="30px"></asp:Label></td>
                                <td  rowspan="3" align="center">
                                    <asp:Label ID="Label3" runat="server" Text="Task" Width="180px"></asp:Label></td>
                                 <td  rowspan="3" align="center">
                                                <asp:Label ID="Label5" runat="server" Text="Hazard" Width="180px"></asp:Label></td>
                                 <td  rowspan="3" align="center">
                                                <asp:Label ID="Label6" runat="server" Text="Risks" Width="180px"></asp:Label>
                                 </td>
                                 <td colspan="3" align="center">
                                                    <asp:Label ID="Label4" runat="server" Text="INITIAL RISK" Width="150px"></asp:Label>
                                        </td>
                                                <td  rowspan="3" align="center">
                                                    <asp:Label ID="Label10" runat="server" Text="Minimise Risk By" Width="180px"></asp:Label>
                                                </td>
                                                <td colspan="3" align="center">
                                                    <asp:Label ID="Label7" runat="server" Text="MINIMISE RISK BY" Width="150px"></asp:Label>
                                        </td>
                                                <td  rowspan="3" align="center">
                                                    <asp:Label ID="Label8" runat="server" Text="Mod." Width="153px"></asp:Label>
                                                </td>
                                </tr>
                                <tr class="estiloRptHD">
                                    <td align="center">
                                                    <asp:Label ID="Label14" runat="server" Text="Severity" Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                  <td align="center">
                                                    <asp:Label ID="Label15" runat="server" Text="Likelihood"  Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                  <td align="center">
                                                    <asp:Label ID="Label16" runat="server" Text="Risk"  Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                     <td align="center">
                                                    <asp:Label ID="Label17" runat="server" Text="Severity"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label18" runat="server" Text="Likelihood"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label19" runat="server" Text="Risk"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                </tr>
                                 <tr class="estiloRptHD">
                                    <td align="center">
                                                    <asp:Label ID="Label20" runat="server" Text="(L/M/H)" Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                  <td align="center">
                                                    <asp:Label ID="Label21" runat="server" Text="(L/M/H)"  Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                  <td align="center">
                                                    <asp:Label ID="Label22" runat="server" Text="(L/M/H)"  Width="50px" Font-Size="7px"></asp:Label>
                                  </td>
                                     <td align="center">
                                                    <asp:Label ID="Label23" runat="server" Text="(L/M/H)"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label24" runat="server" Text="(L/M/H)"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label25" runat="server" Text="(L/M/H)"  Width="50px" Font-Size="7px"></asp:Label>
                                                </td>
                                </tr>
                            </table>
                          </td>
                                </tr>
                        <tr align="left">
                            <td>
                                <table border="0" cellspacing="2" cellpadding="2" class="repeaterAlterno">
                              <tr>
                                <td ALIGN="center" style="vertical-align:top;" class="auto-style50">
                                    <asp:TextBox ID="lConsecutivoTras" runat="server" Width="28"></asp:TextBox>
                                    </td>
                                    <td style="vertical-align:top;">
                                            <asp:TextBox ID="tTarea" runat="server" Height="60px" Width="180px" TextMode="MultiLine" TabIndex="200"></asp:TextBox>
                                    </td>
                                    <td style="vertical-align:top;">
                                            <asp:TextBox ID="tPeligro" runat="server" Height="60px" Width="180px" TextMode="MultiLine" TabIndex="210"></asp:TextBox>
                                    </td>
                                    <td style="vertical-align:top;">
                                            <asp:TextBox ID="tRiesgos" runat="server" Height="60px" Width="180px" TextMode="MultiLine" TabIndex="220"></asp:TextBox>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbInSev" runat="server" Height="60px" Width="50px" TabIndex="230">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                  </td>
                                     <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbInLike" runat="server" Height="60px" Width="50px" TabIndex="240">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbInRisk" runat="server" Height="60px" Width="50px" TabIndex="250">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                    <td style="vertical-align:top;">
                                            <asp:TextBox ID="tMinimise" runat="server" Height="60px" Width="180px" TextMode="MultiLine" TabIndex="260"></asp:TextBox>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbResSev" runat="server" Height="60px" Width="50px" TabIndex="270">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbResLike" runat="server" Height="60px" Width="50px" TabIndex="280">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                            <asp:DropDownList ID="dbResRisk" runat="server" Height="60px" Width="50px" TabIndex="290">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="L">Low</asp:ListItem>
                                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                                <asp:ListItem Value="H">Hi</asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                    <td style="vertical-align:top;">
                                <asp:Button ID="bSaveTask" runat="server" CssClass="button" Text="Save" 
                                    Width="150px" Height="25px" Font-Size="X-Small"/>
                                        <br />
                                <asp:Button ID="bCancelarTask" runat="server" CssClass="button1" Text="Cancel" 
                                    Width="150px" Height="29px" Font-Size="X-Small" />
                                    </td>
                                   
                                </tr>
                            </table></tr>
                        <tr align="left">
                            <td>
                                 <table style="width:1290px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6" class="auto-style47">&nbsp;
                                        </td>
                                </tr>
                            </table>
                                </td>
                                </tr>
                        <tr>
                            <td class="auto-style2">
                
                    <asp:Repeater ID="rptTRADetail" runat="server">
                        <HeaderTemplate>
                            
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table  style="margin:0; padding:0;border:0;" class="repeater">
                              <tr>
                                <td ALIGN="center" style="vertical-align:top;">
                                        <asp:Label ID="Number" runat="server" Text='<%#Container.DataItem("No")%>' 
                                            Width="30px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Task" runat="server" 
                                            Text='<%#Container.DataItem("traR_TaskSteps")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Hazard" runat="server" 
                                            Text='<%#Container.DataItem("traR_Hazard")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Risks" runat="server" Text='<%#Container.DataItem("traR_Risk")%>' 
                                            Width="180px"></asp:Label>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InSeverity" runat="server" Text='<%#Container.DataItem("traR_Ini_Severity")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InLikelihood" runat="server" Text='<%#Container.DataItem("traR_Ini_Likeli")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InRisk" runat="server" Text='<%#Container.DataItem("traR_Ini_Risk")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Minimise" runat="server" 
                                            Text='<%#Container.DataItem("traR_MinimizeRiskBy")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResSeverity" runat="server" Text='<%#Container.DataItem("traR_Res_Severity")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResLikelihood" runat="server" Text='<%#Container.DataItem("traR_Res_Likeli")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResRisk" runat="server" Text='<%#Container.DataItem("traR_Res_Risk")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                   <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/rpt_Up.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bUp" ToolTip="Move Task Up"
                                          />
                                      <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/rpt_Down.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bDown" ToolTip="Move Task Down"
                                          />
                                    <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/rpt_Modificar.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bModify" ToolTip="Edit Task"
                                          />
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/rpt_Eliminar.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bDelete" ToolTip="Delete Task"
                                          />
                                    </td>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table style="margin:0; padding:0;border:0;" class="repeaterAlterno">
                              <tr>
                                <td ALIGN="center" style="vertical-align:top;">
                                        <asp:Label ID="Number" runat="server" Text='<%#Container.DataItem("No")%>' 
                                            Width="30px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Task" runat="server" 
                                            Text='<%#Container.DataItem("traR_TaskSteps")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Hazard" runat="server" 
                                            Text='<%#Container.DataItem("traR_Hazard")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Risks" runat="server" Text='<%#Container.DataItem("traR_Risk")%>' 
                                            Width="180px"></asp:Label>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InSeverity" runat="server" Text='<%#Container.DataItem("traR_Ini_Severity")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InLikelihood" runat="server" Text='<%#Container.DataItem("traR_Ini_Likeli")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="InRisk" runat="server" Text='<%#Container.DataItem("traR_Ini_Risk")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <asp:Label ID="Minimise" runat="server" 
                                            Text='<%#Container.DataItem("traR_MinimizeRiskBy")%>' Width="180px"></asp:Label>
                                    </td>
                                    <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResSeverity" runat="server" Text='<%#Container.DataItem("traR_Res_Severity")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResLikelihood" runat="server" Text='<%#Container.DataItem("traR_Res_Likeli")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                     <td align="center" style="vertical-align:top;">
                                        <asp:Label ID="ResRisk" runat="server" Text='<%#Container.DataItem("traR_Res_Risk")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/rpt_Up.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bUp" ToolTip="Move Task Up"
                                          />
                                      <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/rpt_Down.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bDown" ToolTip="Move Task Down"
                                          />
                                    <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/rpt_Modificar.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bModify" ToolTip="Edit Task"
                                          />
                                    </td>
                                  <td style="vertical-align:top;">
                                      <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/rpt_Eliminar.png" 
                                          CommandArgument='<%#Container.DataItem("tra_ID")%>' CommandName="bDelete" ToolTip="Delete Task"
                                          />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:1290px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo1" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>

                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td >
                    <table runat="server" id="tbl_TRAMain2" style="border: thin ridge #808080; width: 1298PX;">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="lSubstancias" runat="server" Text="Hazardous Substances (COSHH):"></asp:Label>
                            </td>
                            <td class="auto-style45">
                                <asp:RadioButtonList ID="RadioButtonList1"  runat="server" Width="350px" RepeatDirection="Horizontal" Font-Size="XX-Small" CssClass="style26">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>  <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                    
                                </asp:RadioButtonList>
                            </td>
                            <td class="auto-style39" rowspan="11">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Hazard Severity Web 2.png" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lNoise" runat="server" Text="Noise:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lManipulacion" runat="server" Text="Manual Handling:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lAccesos" runat="server" Text="Access/Egress:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList4" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="lEquipoTrabajo" runat="server" Text="Work Equipment:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList5" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lAreasDTrabajo" runat="server" Text="Overhead Work/Lifting OPS:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList6" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lFactores" runat="server" Text="People/Human Factors:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList7" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lComunicacion" runat="server" Text="Communication:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList8" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lAmbiente" runat="server" Text="Environment:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList9" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="lProceso" runat="server" Text="Process:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList10" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">
                                <asp:Label ID="lVibraciones" runat="server" Text="Vibration/Repetitive Strain:"></asp:Label>
                            </td>
                            <td class="auto-style43">
                                <asp:RadioButtonList ID="RadioButtonList11" runat="server" CssClass="style26" Width="350px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="rb1" Selected="True">N/A</asp:ListItem>
                                    <asp:ListItem Value="rb2">Assessed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td >
                    <table runat="server" id="tbl_TRAMain3" style="border: thin ridge #808080; width: 1298PX;">
                        <tr>
                            <td class="auto-style36">
                                <asp:Label ID="lEvaluacionFinal" runat="server" Text="Final Assessment:"></asp:Label>
                            </td>
                            <td class="auto-style38">
                                            <asp:DropDownList ID="txtAssessment" runat="server" Width="300px">
                                                <asp:ListItem Value="L">L</asp:ListItem>
                                                <asp:ListItem Value="M">M</asp:ListItem>
                                                <asp:ListItem Value="H">H</asp:ListItem>
                                            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lRiesgoGral" runat="server" Text="Overall Risk:"></asp:Label>
                            </td>
                            <td class="auto-style38">
                                            <asp:DropDownList ID="dbOverall" runat="server" Width="300px">
                                                <asp:ListItem Value="L">L</asp:ListItem>
                                                <asp:ListItem Value="M">M</asp:ListItem>
                                                <asp:ListItem Value="H">H</asp:ListItem>
                                            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lProcedimiento" runat="server" Text="Applicable Procedure:"></asp:Label>
                            </td>
                            <td class="auto-style38" style="vertical-align:middle">
                                <asp:TextBox ID="txtProcedure" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="300px" TabIndex="10"></asp:TextBox>
                            
                            &nbsp;
                                <asp:ImageButton ID="ImageButton10" runat="server" Height="20px" ImageUrl="~/Images/btnSearch.png" Width="20px" ImageAlign="Middle" />
                            
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                </td>
                            <td class="auto-style40">
                                &nbsp;<asp:Button ID="btnPhoneSrc" runat="server" Text="Save / Guardar" CssClass="button" 
                                    Height="35px" Width="155px" TabIndex="50"/>                                 
                            &nbsp;&nbsp;
                                <asp:Button ID="btnPrint" runat="server" Text="Print / Imprimir" CssClass="buttonGreen" 
                                    Height="35px" Width="155px" TabIndex="50"/>    
                               
                               &nbsp;
                                <asp:Button ID="btnPhoneSrc0" runat="server" Text="Send to Revision" CssClass="buttonGreen" 
                                    Height="35px" Width="155px" TabIndex="50" OnClick="btnPhoneSrc0_Click"/>                                 
                               
                               </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 1298PX;">
                        <tr>
                            <td class="auto-style29">
                                Powered by Bicentenario IT Services</td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td align=center>&nbsp;
                
                    </td>
            </tr>
            </table>
    
    </div>
        
    </form>
    
    <script type = "text/javascript">
        function DisableButton() {
            document.getElementById("<%=btnPhoneSrc0.ClientID%>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
</script>
</body>
</html>
