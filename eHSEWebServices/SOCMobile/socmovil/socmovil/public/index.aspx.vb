Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' load selected control on the page.
        If Not IsNothing(Request.QueryString("p")) Then
            Try
                Dim pagename As String = Request.QueryString("p") & ".ascx"
                Dim control As Control = Page.LoadControl(pagename)
                ContentControl.Controls.Add(control)
            Catch ex As Exception
                'Throw
                Dim control As Control = Page.LoadControl("pagenotfound.ascx")
                ContentControl.Controls.Add(control)
            End Try
        Else
            Response.Redirect("index.aspx?p=p_index")
        End If
    End Sub

End Class