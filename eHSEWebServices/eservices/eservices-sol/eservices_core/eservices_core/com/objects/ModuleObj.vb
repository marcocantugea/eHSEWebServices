Namespace com.objects
    Public Class ModuleObj

        Private _id_module As Integer = -1
        Private _label As String
        Private _pathlink As String
        Private _title As String
        Private _active As Boolean
        Private _frontui As Boolean
        Private _MenusList As List(Of MenuObj)

        Public Property id_module As Integer
            Get
                Return _id_module
            End Get
            Set(value As Integer)
                _id_module = value
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
        Public Property frontui As Boolean
            Get
                Return _frontui
            End Get
            Set(value As Boolean)
                _frontui = value
            End Set
        End Property
        Public Property MenuList As List(Of MenuObj)
            Get
                Return _MenusList
            End Get
            Set(value As List(Of MenuObj))
                _MenusList = value
            End Set
        End Property

        Public Sub LoadMenus()

        End Sub

    End Class
End Namespace
