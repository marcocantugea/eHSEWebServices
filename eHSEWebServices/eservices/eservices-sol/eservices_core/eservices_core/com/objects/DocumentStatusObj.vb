Namespace com.objects
    Public Class DocumentStatusObj

        Private _idDocumentStatus As Integer = -1
        Private _status As String
        Private _active As Boolean
        Private _label As String

        Public Property idDocumentStatus As Integer
            Get
                Return _idDocumentStatus
            End Get
            Set(value As Integer)
                _idDocumentStatus = value
            End Set
        End Property
        Public Property status As String
            Get
                Return _status
            End Get
            Set(value As String)
                _status = value
            End Set
        End Property
        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property
        Public Property label As String
            Get
                Return _label
            End Get
            Set(value As String)
                _label = value
            End Set
        End Property



    End Class
End Namespace
