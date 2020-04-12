<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_uploadimage.aspx.vb" Inherits="socmovil.t_uploadimage" %>
<% 
    If Not IsNothing(Request.Files) And Request.Files.Count > 0 Then
        Try
            Dim file As HttpPostedFile = Request.Files(0)
            Dim logicalpath As String = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\"
            Me.Session("tmp_saved_img") = logicalpath & file.FileName
            Dim webpath As String = "../" & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\"
            file.SaveAs(logicalpath & file.FileName)
            Response.Write(webpath & file.FileName)
        Catch ex As Exception
            Response.Write("0")
        End Try
    Else
        Response.Redirect("../index.aspx")
    End If
%>