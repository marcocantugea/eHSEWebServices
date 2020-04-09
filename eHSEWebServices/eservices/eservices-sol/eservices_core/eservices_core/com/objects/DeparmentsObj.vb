Namespace com.objects
    Public Class DeparmentsObj

        Private _idDeparment As Integer = -1
        Private _DeparmentName As String
        Private _active As Boolean
        Private _cDep_Id As Integer

        Public Property cDep_Id As Integer
            Get
                Return _cDep_Id
            End Get
            Set(value As Integer)
                _cDep_Id = value
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

        Public Property DeparmentName As String
            Get
                Return _DeparmentName
            End Get
            Set(value As String)
                _DeparmentName = value
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


    End Class
End Namespace
