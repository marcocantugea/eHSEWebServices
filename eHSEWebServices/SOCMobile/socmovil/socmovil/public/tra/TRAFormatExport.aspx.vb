Imports System.IO
Imports System.Web
Imports SelectPdf
Public Class TRAFormatExport
    Inherits PageBaseController

    Private startConversion As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete

    End Sub

    Protected Overrides Sub Render(writer As HtmlTextWriter)
        If startConversion Then
            ' get html of the page
            Dim myWriter As TextWriter = New StringWriter()
            Dim htmlWriter As New HtmlTextWriter(myWriter)
            MyBase.Render(htmlWriter)

            ' instantiate a html to pdf converter object
            Dim converter As New HtmlToPdf()

            ' create a new pdf document converting the html string of the page
            Dim doc As PdfDocument = converter.ConvertHtmlString(myWriter.ToString(), _
                                                                 Request.Url.AbsoluteUri)

            ' save pdf document
            doc.Save(Response, False, "Sample.pdf")

            ' close pdf document
            doc.Close()
        Else
            ' render web page in browser
            MyBase.Render(writer)
        End If
    End Sub

    Protected Sub ExportToPdf()
        ' get html of the page
        Dim myWriter As TextWriter = New StringWriter()
        Dim htmlWriter As New HtmlTextWriter(myWriter)
        MyBase.Render(htmlWriter)

        ' instantiate a html to pdf converter object
        Dim converter As New HtmlToPdf()
        converter.Options.PdfPageSize = PdfPageSize.Letter
        converter.Options.MarginTop = 5
        converter.Options.MarginBottom = 5
        converter.Options.MarginLeft = 5
        converter.Options.MarginRight = 5

        ' create a new pdf document converting the html string of the page
        Dim doc As PdfDocument = converter.ConvertHtmlString(myWriter.ToString(), _
                                                             Request.Url.AbsoluteUri)

        ' save pdf document
        doc.Save(Response, False, "Sample.pdf")

        ' close pdf document
        doc.Close()
    End Sub

    Protected Sub exportPDF()
        startConversion = True
    End Sub
End Class