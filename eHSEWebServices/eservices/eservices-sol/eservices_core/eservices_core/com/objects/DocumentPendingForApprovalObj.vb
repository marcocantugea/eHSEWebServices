Namespace com.objects
    Public Class DocumentPendingForApprovalObj

        Private _idPendingForApproval As Integer = -1
        Private _idDocument As Integer
        Private _UseridRequested As Integer
        Private _StatusOpenClose As Byte
        Private _idDeparment As Integer
        Private _UseridSigned As Integer
        Private _DocumentObj As DocumentObj
        Private _UserObjRequested As UserObj
        Private _UserObjSigned As UserObj
        Private _DeparmentObj As DeparmentsObj

        Public Property idPendingForApproval As Integer
            Get
                Return _idPendingForApproval
            End Get
            Set(value As Integer)
                _idPendingForApproval = value
            End Set
        End Property
        Public Property idDocument As Integer
            Get
                Return _idDocument
            End Get
            Set(value As Integer)
                _idDocument = value
            End Set
        End Property
        Public Property UseridRequested As Integer
            Get
                Return _UseridRequested
            End Get
            Set(value As Integer)
                _UseridRequested = value
            End Set
        End Property
        Public Property StatusOpenClose As Byte
            Get
                Return _StatusOpenClose
            End Get
            Set(value As Byte)
                _StatusOpenClose = value
            End Set
        End Property
        Public Property idDeparment As Integer
            Get
                Return _idDeparment
            End Get
            Set(value As Integer)
                _idDeparment = value
            End Set
        End Property
        Public Property UseridSigned As Integer
            Get
                Return _UseridSigned
            End Get
            Set(value As Integer)
                _UseridSigned = value
            End Set
        End Property
        Public Property DocumentObj As DocumentObj
            Get
                Return _DocumentObj
            End Get
            Set(value As DocumentObj)
                _DocumentObj = value
            End Set
        End Property
        Public Property UserObjRequested As UserObj
            Get
                Return _UserObjRequested
            End Get
            Set(value As UserObj)
                _UserObjRequested = value
            End Set
        End Property
        Public Property UserObjSigned As UserObj
            Get
                Return _UserObjSigned
            End Get
            Set(value As UserObj)
                _UserObjSigned = value
            End Set
        End Property
        Public Property DeparmentObj As DeparmentsObj
            Get
                Return _DeparmentObj
            End Get
            Set(value As DeparmentsObj)
                _DeparmentObj = value
            End Set
        End Property

        Public Sub LoadData()
            'TODO: Load DocumentObj as DocumentObj if is not 0 or null
            'TODO: Load UserObjRequested as UserObj if is not 0 or null
            'TODO: Load UserObjSigned as UserObj if is not 0 or null
            'TODO: Load DeparmentObj as DeparmentsObj if is not 0 or null
        End Sub
        Sub New()

        End Sub
        Sub New(idPendingForApproval As Integer)
            _idPendingForApproval = idPendingForApproval
        End Sub

    End Class
End Namespace
