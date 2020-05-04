Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.ado

Namespace com.objects
    Public Class DocumentGeneric
        Inherits DocumentObj

        Public Property idDocument As Integer
            Get
                Return getidDocument()
            End Get
            Set(value As Integer)
                setidDocument(value)
            End Set
        End Property

        Public Property DocumentDate As Date
            Get
                Return getDocumentDate()
            End Get
            Set(value As Date)
                setDocumentDate(value)
            End Set
        End Property

        Public Property DocumentAprovalByID As Integer
            Get
                Return getDocumentAprovalByID()
            End Get
            Set(value As Integer)
                setDocumentAprovalByID(value)
            End Set
        End Property

        Public Property DocumentAprovalDate As Date
            Get
                Return getDocumentAprovalDate()
            End Get
            Set(value As Date)
                setDocumentAprovalDate(value)
            End Set
        End Property

        Public Property TypeOfObj As String
            Get
                Return getTypeOfObj()
            End Get
            Set(value As String)
                setTypeOfObj(value)
            End Set
        End Property

        Public Property IDObjField As String
            Get
                Return getIDObjField()
            End Get
            Set(value As String)
                setIDObjField(value)
            End Set
        End Property

        Public Property idOfDocument As Integer
            Get
                Return getIdOfDocument()
            End Get
            Set(value As Integer)
                setIdOfDocument(value)
            End Set
        End Property

        Public Property eSignatureFile As String
            Get
                Return geteSignatureFile()
            End Get
            Set(value As String)
                seteSignatureFile(value)
            End Set
        End Property

        Public Property CreatedByUserObj As UserObj
            Get
                Return getCreatedByUserObj()
            End Get
            Set(value As UserObj)
                setCreatedByUserObj(value)
            End Set
        End Property

        Public Property idDocumentStatus As Integer
            Get
                Return getidDocumentStatus()
            End Get
            Set(value As Integer)
                setidDocumentStatus(value)
            End Set
        End Property

        Public Property locked As Byte
            Get
                Return getLock()
            End Get
            Set(value As Byte)
                setLock(value)
            End Set
        End Property

        Public Property DocumentStatusObj As DocumentStatusObj
            Get
                Return getDocumentStatusObj()
            End Get
            Set(value As DocumentStatusObj)
                setDocumentStatusObj(value)
            End Set
        End Property

        Public Overrides Sub getObjData()
            setTypeOfObj(Me.GetType.FullName)
            setIDObjField("idDocument")
            setIdOfDocument(idDocument)
        End Sub

        Public Overrides Sub LoadInfoByID()
            Dim idfromdocument As Integer = Me.getIdOfDocument
            If idfromdocument > 0 Then
                idDocument = idfromdocument
                Dim ADODocument As New ADODocument
                ADODocument.GetById(idDocument, Me)
            End If
        End Sub
    End Class
End Namespace