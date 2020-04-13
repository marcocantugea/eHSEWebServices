Namespace com.objects
    Public Class TRAObj
        Inherits eservices_core.com.objects.DoclumentObj

        Private _tra_ID As Integer = -1
        Private _tra_Unit As String
        Private _tra_Dept As String
        Private _tra_Location As String
        Private _tra_Activity_Job As String
        Private _tra_Date As Date
        Private _tra_Hazard_Subs_NA As Boolean
        Private _tra_Hazard_Noise_NA As Boolean
        Private _tra_Hazard_Hand_NA As Boolean
        Private _tra_Hazard_Access_NA As Boolean
        Private _tra_Hazard_Equip_NA As Boolean
        Private _tra_Hazard_Overhead_NA As Boolean
        Private _tra_Hazard_Factors_NA As Boolean
        Private _tra_Hazard_Comms_NA As Boolean
        Private _tra_Hazard_Environ_NA As Boolean
        Private _tra_Hazard_Process_NA As Boolean
        Private _tra_Hazard_Vibration_NA As Boolean
        Private _tra_Hazard_Subs_Eval As Boolean
        Private _tra_Hazard_Noise_Eval As Boolean
        Private _tra_Hazard_Hand_Eval As Boolean
        Private _tra_Hazard_Access_Eval As Boolean
        Private _tra_Hazard_Equip_Eval As Boolean
        Private _tra_Hazard_Overhead_Eval As Boolean
        Private _tra_Hazard_Factors_Eval As Boolean
        Private _tra_Hazard_Comms_Eval As Boolean
        Private _tra_Hazard_Environ_Eval As Boolean
        Private _tra_Hazard_Process_Eval As Boolean
        Private _tra_Hazard_Vibration_Eval As Boolean
        Private _tra_FinalAssessment As String
        Private _tra_OveralRisk As String
        Private _tra_ApplicableProcedure As String
        Private _tra_Status As String
        Private _tra_AuthorityApproveDate As Date
        Private _tra_SafetyApproveDate As Date
        Private _tra_permitnumber As String
        Private _tra_Hazard_Weather_NA As Boolean
        Private _tra_Hazard_Weather_Eval As Boolean
        Private _tra_manning_required As String
        Private _tra_permit_holder As String
        Private _tra_permit_autority As String
        Private _traTasks As List(Of TRATaskObj)
        Private _tra_SentBack_Reason As String
        Private _pin_save As Integer

        Public Property pin_save As Integer
            Get
                Return _pin_save
            End Get
            Set(value As Integer)
                _pin_save = value
            End Set
        End Property

        Public Property tra_Hazard_Access_NA As Boolean
            Get
                Return _tra_Hazard_Access_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Access_NA = value
            End Set
        End Property

        Public Property tra_SentBack_Reason As String
            Get
                Return _tra_SentBack_Reason
            End Get
            Set(value As String)
                _tra_SentBack_Reason = value
            End Set
        End Property

        Public Property tra_Activity_Job As String
            Get
                Return _tra_Activity_Job
            End Get
            Set(value As String)
                _tra_Activity_Job = value
            End Set
        End Property

        Public Property traTasks As List(Of TRATaskObj)
            Get
                Return _traTasks
            End Get
            Set(value As List(Of TRATaskObj))
                _traTasks = value
            End Set
        End Property

        Public Property tra_permit_autority As String
            Get
                Return _tra_permit_autority
            End Get
            Set(value As String)
                _tra_permit_autority = value
            End Set
        End Property

        Public Property tra_permit_holder As String
            Get
                Return _tra_permit_holder
            End Get
            Set(value As String)
                _tra_permit_holder = value
            End Set
        End Property

        Public Property tra_manning_required As String
            Get
                Return _tra_manning_required
            End Get
            Set(value As String)
                _tra_manning_required = value
            End Set
        End Property

        Public Property tra_Hazard_Weather_Eval As Boolean
            Get
                Return _tra_Hazard_Weather_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Weather_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Weather_NA As Boolean
            Get
                Return _tra_Hazard_Weather_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Weather_NA = value
            End Set
        End Property
        Public Property tra_permitnumber As String
            Get
                Return _tra_permitnumber
            End Get
            Set(value As String)
                _tra_permitnumber = value
            End Set
        End Property

        Public Property tra_AuthorityApproveDate As Date
            Get
                Return _tra_AuthorityApproveDate
            End Get
            Set(value As Date)
                _tra_AuthorityApproveDate = value
            End Set
        End Property

        Public Property tra_Status As String
            Get
                Return _tra_Status
            End Get
            Set(value As String)
                _tra_Status = value
            End Set
        End Property

        Public Property tra_ApplicableProcedure As String
            Get
                Return _tra_ApplicableProcedure
            End Get
            Set(value As String)
                _tra_ApplicableProcedure = value
            End Set
        End Property

        Public Property tra_OveralRisk As String
            Get
                Return _tra_OveralRisk
            End Get
            Set(value As String)
                _tra_OveralRisk = value
            End Set
        End Property

        Public Property tra_FinalAssessment As String
            Get
                Return _tra_FinalAssessment
            End Get
            Set(value As String)
                _tra_FinalAssessment = value
            End Set
        End Property

        Public Property tra_Hazard_Vibration_Eval As Boolean
            Get
                Return _tra_Hazard_Vibration_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Vibration_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Process_Eval As Boolean
            Get
                Return _tra_Hazard_Process_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Process_Eval = value
            End Set
        End Property
        Public Property tra_Hazard_Environ_Eval As Boolean
            Get
                Return _tra_Hazard_Environ_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Environ_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Comms_Eval As Boolean
            Get
                Return _tra_Hazard_Comms_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Comms_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Factors_Eval As Boolean
            Get
                Return _tra_Hazard_Factors_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Factors_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Overhead_Eval As Boolean
            Get
                Return _tra_Hazard_Overhead_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Overhead_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Equip_Eval As Boolean
            Get
                Return _tra_Hazard_Equip_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Equip_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Access_Eval As Boolean
            Get
                Return _tra_Hazard_Access_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Access_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Hand_Eval As Boolean
            Get
                Return _tra_Hazard_Hand_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Hand_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Noise_Eval As Boolean
            Get
                Return _tra_Hazard_Noise_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Noise_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Subs_Eval As Boolean
            Get
                Return _tra_Hazard_Subs_Eval
            End Get
            Set(value As Boolean)
                _tra_Hazard_Subs_Eval = value
            End Set
        End Property

        Public Property tra_Hazard_Vibration_NA As Boolean
            Get
                Return _tra_Hazard_Vibration_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Vibration_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Process_NA As Boolean
            Get
                Return _tra_Hazard_Process_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Process_NA = value
            End Set
        End Property
        Public Property tra_Hazard_Environ_NA As Boolean
            Get
                Return _tra_Hazard_Environ_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Environ_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Comms_NA As Boolean
            Get
                Return _tra_Hazard_Comms_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Comms_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Factors_NA As Boolean
            Get
                Return _tra_Hazard_Factors_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Factors_NA = value
            End Set
        End Property
        Public Property tra_Hazard_Overhead_NA As Boolean
            Get
                Return _tra_Hazard_Overhead_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Overhead_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Equip_NA As Boolean
            Get
                Return _tra_Hazard_Equip_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Equip_NA = value
            End Set
        End Property
        Public Property tra_Hazard_Hand_NA As Boolean
            Get
                Return _tra_Hazard_Hand_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Hand_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Noise_NA As Boolean
            Get
                Return _tra_Hazard_Noise_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Noise_NA = value
            End Set
        End Property

        Public Property tra_Hazard_Subs_NA As Boolean
            Get
                Return _tra_Hazard_Subs_NA
            End Get
            Set(value As Boolean)
                _tra_Hazard_Subs_NA = value
            End Set
        End Property

        Public Property tra_Date As Date
            Get
                Return _tra_Date
            End Get
            Set(value As Date)
                _tra_Date = value
            End Set
        End Property

        Public Property tra_Location As String
            Get
                Return _tra_Location
            End Get
            Set(value As String)
                _tra_Location = value
            End Set
        End Property
        Public Property tra_Dept As String
            Get
                Return _tra_Dept
            End Get
            Set(value As String)
                _tra_Dept = value
            End Set
        End Property
        Public Property tra_Unit As String
            Get
                Return _tra_Unit
            End Get
            Set(value As String)
                _tra_Unit = value
            End Set
        End Property

        Public Property tra_ID As Integer
            Get
                Return _tra_ID
            End Get
            Set(value As Integer)
                _tra_ID = value
                setIdOfDocument(value)
            End Set
        End Property

        Public Overrides Function ToString() As String
            Dim strbulider As New Text.StringBuilder
            strbulider.Append("{")
            Dim index As Integer = -1
            For Each member In Me.GetType.GetProperties
                index = index + 1

                If member.CanRead Then

                    If index = 0 Then
                        strbulider.Append("""" & member.Name & ":" & member.GetValue(Me, Nothing) & """")
                    Else
                        strbulider.Append(",""" & member.Name & ":" & member.GetValue(Me, Nothing) & """")
                    End If
                End If
            Next
            strbulider.Append("}")
            Return strbulider.ToString
            'Return MyBase.ToString()
        End Function

        Sub New()
            getObjData()
        End Sub

        Public Overrides Sub getObjData()
            Dim type As Type = Me.GetType()
            Me.setTypeOfObj(type.Name)
            Me.setIDObjField("tra_ID")
        End Sub
    End Class
End Namespace
