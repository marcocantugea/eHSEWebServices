Public Class TRAFormatExport
    Inherits PageBaseController

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Clear()
        'Response.AddHeader("Content-Disposition", "Attachment;Filename=Word.doc")
        'Response.Buffer = True
        'Response.Charset = "UTF-8"
        'Response.ContentType = "application/vnd.word"
    End Sub

End Class