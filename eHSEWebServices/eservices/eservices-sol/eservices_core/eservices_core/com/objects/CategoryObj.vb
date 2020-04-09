Namespace com.objects
    Public Class CategoryObj

        Private _idcategory As Integer = -1
        Private _Category_ES As String
        Private _Category_EN As String
        Private _active As Boolean

        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property

        Public Property Category_EN As String
            Get
                Return _Category_EN
            End Get
            Set(value As String)
                _Category_EN = value
            End Set
        End Property

        Public Property Category_ES As String
            Get
                Return _Category_ES
            End Get
            Set(value As String)
                _Category_ES = value
            End Set
        End Property

        Public Property idcategory As Integer
            Get
                Return _idcategory
            End Get
            Set(value As Integer)
                _idcategory = value
            End Set
        End Property

    End Class
End Namespace