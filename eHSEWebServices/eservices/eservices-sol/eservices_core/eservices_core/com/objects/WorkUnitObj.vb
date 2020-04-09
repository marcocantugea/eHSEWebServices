Namespace com.objects
    Public Class WorkUnitObj

        Private _idWorkUnit As Integer = -1
        Private _UnitName As String
        Private _active As Boolean

        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property

        Public Property UnitName As String
            Get
                Return _UnitName
            End Get
            Set(value As String)
                _UnitName = value
            End Set
        End Property

        Public Property idWorkUnit As Integer
            Get
                Return _idWorkUnit
            End Get
            Set(value As Integer)
                _idWorkUnit = value
            End Set
        End Property

    End Class
End Namespace
