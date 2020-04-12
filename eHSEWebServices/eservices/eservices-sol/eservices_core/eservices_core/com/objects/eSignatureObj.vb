Namespace com.objects
    Public Class eSignatureObj

        Private _idsignature As Integer = -1
        Private _password As String
        Private _signaturepath As String
        Private _iduser As Integer

        Public Property iduser As Integer
            Get
                Return _iduser
            End Get
            Set(value As Integer)
                _iduser = value
            End Set
        End Property

        Public Property signaturepath As String
            Get
                Return _signaturepath
            End Get
            Set(value As String)
                _signaturepath = value
            End Set
        End Property

        Public Property password As String
            Get
                Return _password
            End Get
            Set(value As String)
                _password = value
            End Set
        End Property

        Public Property idsignature As Integer
            Get
                Return _idsignature
            End Get
            Set(value As Integer)
                _idsignature = value
            End Set
        End Property

    End Class
End Namespace
