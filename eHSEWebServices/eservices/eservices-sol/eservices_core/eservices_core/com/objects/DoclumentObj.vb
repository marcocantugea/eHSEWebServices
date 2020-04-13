Namespace com.objects
    Public MustInherit Class DoclumentObj

        Private _idDocument As Integer = -1
        Private _DocumentDate As Date
        Private _DocumentAprovalByID As Integer ' Store id user com UserObj
        Private _DocumentAprovalDate As Date
        Private _TypeOfObj As String 'Store the Obj Class name 
        Private _IDObjField As String ' Store the id file of the class{idfield}
        Private _IdOfDocument As Integer ' Store the input id value {value id)
        Private _eSignatureFile As String 'save the file name of the signature 


        Public MustOverride Sub getObjData()
        Sub New()

        End Sub
        Public Function getidDocument() As Integer
            Return _idDocument
        End Function
        Public Sub setidDocument(value As Integer)
            _idDocument = value
        End Sub
        Public Function getDocumentDate() As Date
            Return _DocumentDate
        End Function
        Public Sub setDocumentDate(value As Date)
            _DocumentDate = value
        End Sub
        Public Function getDocumentAprovalByID() As Integer
            Return _DocumentAprovalByID
        End Function
        Public Sub setDocumentAprovalByID(value As Integer)
            _DocumentAprovalByID = value
        End Sub
        Public Function getDocumentAprovalDate() As Date
            Return _DocumentAprovalDate
        End Function
        Public Sub setDocumentAprovalDate(value As Date)
            _DocumentAprovalDate = value
        End Sub
        Public Function getTypeOfObj() As String
            Return _TypeOfObj
        End Function

        Public Sub setTypeOfObj(value As String)
            _TypeOfObj = value
        End Sub
        Public Function getIDObjField() As String
            Return _IDObjField
        End Function

        Public Sub setIDObjField(value As String)
            _IDObjField = value
        End Sub
        Public Function getIdOfDocument() As Integer
            Return _IdOfDocument
        End Function
        Public Sub setIdOfDocument(value As Integer)
            _IdOfDocument = value
        End Sub
        Public Function geteSignatureFile() As String
            Return _eSignatureFile
        End Function
        Public Sub seteSignatureFile(value As String)
            _eSignatureFile = value
        End Sub


    End Class
End Namespace
