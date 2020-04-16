Namespace com.objects
    Public Class MenuObj

        Private _id_menu As Integer = -1
        Private _label As String
        Private _pathlink As String
        Private _title As String
        Private _active As Boolean
        Private _frontui As Boolean

        Public Property id_menu As Integer
            Get
                Return _id_menu
            End Get
            Set(value As Integer)
                _id_menu = value
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
        Public Property pathlink As String
            Get
                Return _pathlink
            End Get
            Set(value As String)
                _pathlink = value
            End Set
        End Property
        Public Property title As String
            Get
                Return _title
            End Get
            Set(value As String)
                _title = value
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
        Public Property frontui As Integer
            Get
                Return _frontui
            End Get
            Set(value As Integer)
                _frontui = value
            End Set
        End Property


    End Class
End Namespace
