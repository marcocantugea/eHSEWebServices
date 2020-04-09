Namespace com.objects
    Public Class ProfileObj

        Private _idprofile As Integer = -1
        Private _profile As String
        Private _active As Boolean

        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property

        Public Property profile As String
            Get
                Return _profile
            End Get
            Set(value As String)
                _profile = value
            End Set
        End Property

        Public Property idprofile As Integer
            Get
                Return _idprofile
            End Get
            Set(value As Integer)
                _idprofile = value
            End Set
        End Property

    End Class
End Namespace
