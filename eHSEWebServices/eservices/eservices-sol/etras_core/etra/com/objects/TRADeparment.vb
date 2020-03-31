Namespace com.objects
    Public Class TRADeparment
        Private _cDep_Id As Integer = -1
        Private _cDep_Name As String
        Private _TRAs As List(Of TRAObj)

        Public Property TRAs As List(Of TRAObj)
            Get
                Return _TRAs
            End Get
            Set(value As List(Of TRAObj))
                _TRAs = value
            End Set
        End Property

        Public Property cDep_Id As Integer
            Get
                Return _cDep_Id
            End Get
            Set(value As Integer)
                _cDep_Id = value
            End Set
        End Property

        Public Property cDep_Name As String
            Get
                Return _cDep_Name
            End Get
            Set(value As String)
                _cDep_Name = value
            End Set
        End Property

    End Class
End Namespace
