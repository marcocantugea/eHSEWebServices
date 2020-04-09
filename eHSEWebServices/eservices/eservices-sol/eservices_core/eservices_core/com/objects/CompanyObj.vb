Namespace com.objects
    Public Class CompanyObj

        Private _idCompany As Integer = -1
        Private _CompanyName As String
        Private _active As Boolean

        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property

        Public Property CompanyName As String
            Get
                Return _CompanyName
            End Get
            Set(value As String)
                _CompanyName = value
            End Set
        End Property

        Public Property idCompany As Integer
            Get
                Return _idCompany
            End Get
            Set(value As Integer)
                _idCompany = value
            End Set
        End Property


    End Class
End Namespace