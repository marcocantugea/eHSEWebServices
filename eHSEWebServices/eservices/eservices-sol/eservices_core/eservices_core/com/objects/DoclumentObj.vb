Imports eservices_core.com.ado

Namespace com.objects
    Public MustInherit Class DocumentObj

        Private _idDocument As Integer = -1
        Private _DocumentDate As Date
        Private _DocumentAprovalByID As Integer ' Store id user com UserObj
        Private _DocumentAprovalDate As Date
        Private _TypeOfObj As String 'Store the Obj Class name 
        Private _IDObjField As String ' Store the id file of the class{idfield}
        Private _IdOfDocument As Integer ' Store the input id value {value id)
        Private _eSignatureFile As String 'save the file name of the signature 
        Private _CreatedByUserObj As UserObj
        Private _idDocumentSatus As Integer
        Private _locked As Byte
        Private _DocumentStatusObj As DocumentStatusObj

        Public MustOverride Sub getObjData()
        Public MustOverride Sub LoadInfoByID()

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

        Public Sub setCreatedByUserObj(UserObj As UserObj)
            If Not IsNothing(UserObj) Then
                _CreatedByUserObj = UserObj
            End If
        End Sub
        Public Function getCreatedByUserObj() As UserObj
            Return _CreatedByUserObj
        End Function

        Public Function getUserID() As Integer
            If Not IsNothing(_CreatedByUserObj) Then
                Return _CreatedByUserObj.userid
            End If
            Return -1
        End Function
        Public Function GetFields() As List(Of String)
            Dim list_offields As New List(Of String)
            list_offields.Add("idDocument")
            list_offields.Add("DocumentDate")
            list_offields.Add("DocumentAprovalByID")
            list_offields.Add("DocumentAprovalDate")
            list_offields.Add("TypeOfObj")
            list_offields.Add("IDObjField")
            list_offields.Add("IdOfDocument")
            list_offields.Add("eSignatureFile")
            list_offields.Add("userid")
            Return list_offields
        End Function


        Public Function getidDocumentStatus() As Integer
            Return _idDocumentSatus
        End Function

        Public Sub setidDocumentStatus(value As Integer)
            _idDocumentSatus = value
        End Sub

        Public Function getLock() As Byte
            Return _locked
        End Function

        Public Sub setLock(value As Boolean)
            _locked = value
        End Sub

        Public Sub setDocumentStatusObj(value As DocumentStatusObj)
            _DocumentStatusObj = value
        End Sub
        Public Function getDocumentStatusObj() As DocumentStatusObj
            If IsNothing(_DocumentStatusObj) And _idDocumentSatus > 0 Then
                Dim ADODocumentStatus As New ADODocumentStatus
                _DocumentStatusObj = New DocumentStatusObj
                _DocumentStatusObj.idDocumentStatus = _idDocumentSatus
                ADODocumentStatus.GetDocumentStatusByID(_DocumentStatusObj )
            End If
            Return _DocumentStatusObj
        End Function

        Public Sub LoadDocumentHeadInfo()
            If _TypeOfObj.Length > 0 And _IDObjField.Length > 0 And _IdOfDocument > 0 Then
                Dim ADODocument As New ADODocument

                ADODocument.GetDocumentByObject(Me)
            End If
        End Sub

    End Class
End Namespace
