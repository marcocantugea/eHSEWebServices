
Partial Class StopCardSent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = "Your Stop Card had been sent to Safety Department"
        Label2.Text = "Su Tarjeta Stop ha sido enviada al departamento de Seguridad"
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("StopCard.aspx")
    End Sub
End Class
