
Partial Class SOC_Been_Close
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim Context As HttpContext
            Context = HttpContext.Current
            If Context.Items.Contains("SOC") Then
                Me.Label1.Text = CType(Context.Items("SOC").ToString, String)
                Label1.Text = "The SOC " & Label1.Text & " had been close properly"
            Else
                Label1.Text = "Are Not SOC. Please go back"
            End If

            'If Len(Request.QueryString("UserID")) > 0 Then
            '    UserID.Text = Request.QueryString("UserID")

            'Else
            '    Response.Write("User ID had not been receive")
            'End If
        End If
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("FollowUpList.aspx")
    End Sub
End Class
