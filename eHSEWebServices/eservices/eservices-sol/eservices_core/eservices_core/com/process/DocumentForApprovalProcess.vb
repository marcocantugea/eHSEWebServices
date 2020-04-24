Imports eservices_core.com.objects
Imports eservices_core.com.ado

Namespace com.process
    Public NotInheritable Class DocumentForApprovalProcess

        Public Sub SendDocumentForApproval(DocumentObj As DocumentObj)
            Dim ADODocuments As New ADODocument

            'Revisar si el documento no esta en la lista de aprovacion
            If ADODocuments.CheckExistDocumentForApproval(DocumentObj.getidDocument) Then
                Throw New Exception("Document is already on the list for approval.")
            End If

            'Revisar que cuente con los requisitos usuario creador, id de documento,departamento.
            If DocumentObj.getidDocument > 0 And DocumentObj.getCreatedByUserObj.userid > 0 And DocumentObj.getCreatedByUserObj.UserInfoCompanyObj.idDeparment > 0 Then
                Dim DocumenForapproval As New eservices_core.com.objects.DocumentPendingForApprovalObj
                DocumenForapproval.idDocument = DocumentObj.getidDocument
                DocumenForapproval.idDeparment = DocumentObj.getCreatedByUserObj.UserInfoCompanyObj.idDeparment
                DocumenForapproval.UseridRequested = DocumentObj.getCreatedByUserObj.userid
                DocumenForapproval.StatusOpenClose = 1

                AddDocumentPendingForApproval(DocumenForapproval)
                ADODocuments.UpdateDocumentStatusforApproval(DocumenForapproval.idDocument)
                DocumentObj.setidDocumentStatus(DocumentStatus.ForSignature)
                DocumentObj.LoadDocumentHeadInfo()

            Else
                Throw New Exception("Document is missing ids information.")
            End If

        End Sub
        Public Sub AddDocumentPendingForApproval(DocumentPendingForApprovalObj As DocumentPendingForApprovalObj)
            If Not IsNothing(DocumentPendingForApprovalObj) Then
                If DocumentPendingForApprovalObj.idDocument > 0 And DocumentPendingForApprovalObj.UseridRequested > 0 And DocumentPendingForApprovalObj.idDeparment > 0 Then
                    Dim ADODocumentForAporval As New ADODocument()
                    ADODocumentForAporval.AddDocumentForApproval(DocumentPendingForApprovalObj)
                Else
                    Throw New NullReferenceException

                End If
            End If
        End Sub

    End Class
End Namespace
