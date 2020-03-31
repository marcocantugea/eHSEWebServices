Namespace com.objects

    Public Class TRATaskObj

        Private _traR_Id As Integer = -1
        Private _tra_ID As Integer
        Private _traR_TaskSteps As String
        Private _traR_Hazard As String
        Private _traR_Risk As String
        Private _traR_Ini_Severity As String
        Private _traR_Ini_Likeli As String
        Private _traR_Ini_Risk As String
        Private _traR_MinimizeRiskBy As String
        Private _traR_Res_Severity As String
        Private _traR_Res_Likeli As String
        Private _traR_Res_Risk As String
        Private _traR_Consecutivo As Integer

        Public Property traR_Consecutivo As Integer
            Get
                Return _traR_Consecutivo
            End Get
            Set(value As Integer)
                _traR_Consecutivo = value
            End Set
        End Property

        Public Property traR_Res_Risk As String
            Get
                Return _traR_Res_Risk
            End Get
            Set(value As String)
                _traR_Res_Risk = value
            End Set
        End Property

        Public Property traR_Res_Likeli As String
            Get
                Return _traR_Res_Likeli
            End Get
            Set(value As String)
                _traR_Res_Likeli = value
            End Set
        End Property

        Public Property traR_Res_Severity As String
            Get
                Return _traR_Res_Severity
            End Get
            Set(value As String)
                _traR_Res_Severity = value
            End Set
        End Property

        Public Property traR_MinimizeRiskBy As String
            Get
                Return _traR_MinimizeRiskBy
            End Get
            Set(value As String)
                _traR_MinimizeRiskBy = value
            End Set
        End Property

        Public Property traR_Ini_Risk As String
            Get
                Return _traR_Ini_Risk
            End Get
            Set(value As String)
                _traR_Ini_Risk = value
            End Set
        End Property

        Public Property traR_Ini_Likeli As String
            Get
                Return _traR_Ini_Likeli
            End Get
            Set(value As String)
                _traR_Ini_Likeli = value
            End Set
        End Property

        Public Property traR_Ini_Severity As String
            Get
                Return _traR_Ini_Severity
            End Get
            Set(value As String)
                _traR_Ini_Severity = value
            End Set
        End Property

        Public Property traR_Risk As String
            Get
                Return _traR_Risk
            End Get
            Set(value As String)
                _traR_Risk = value
            End Set
        End Property

        Public Property traR_Hazard As String
            Get
                Return _traR_Hazard
            End Get
            Set(value As String)
                _traR_Hazard = value
            End Set
        End Property

        Public Property traR_TaskSteps As String
            Get
                Return _traR_TaskSteps
            End Get
            Set(value As String)
                _traR_TaskSteps = value
            End Set
        End Property

        Public Property tra_ID As Integer
            Get
                Return _tra_ID
            End Get
            Set(value As Integer)
                _tra_ID = value
            End Set
        End Property
        Public Property traR_Id As Integer
            Get
                Return _traR_Id
            End Get
            Set(value As Integer)
                _traR_Id = value
            End Set
        End Property

    End Class
End Namespace