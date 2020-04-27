Imports eservices_core.com.ado

Namespace com.objects
    Public Class ProfileObj

        Private _idprofile As Integer = -1
        Private _profile As String
        Private _active As Boolean
        Private _Modules As Dictionary(Of Integer, ModuleObj)
        Private _AccessDeparments As List(Of Integer)
        Private _ADOProfile As New ADOProfile

        Public Sub GetAccessDeparments(userid As Integer)
            If _idprofile > 0 And userid > 0 And _idprofile > SysProfiles.Publico Then
                If IsNothing(_AccessDeparments) Then
                    _AccessDeparments = New List(Of Integer)
                End If
                _AccessDeparments = _ADOProfile.GetAccessDeparments(userid)
            End If
        End Sub

        Public Sub AddAccessDeparment(idDeparment As Integer)
            If _idprofile = SysProfiles.Supervisor Or _idprofile = SysProfiles.Administrator Then
                If IsNothing(_AccessDeparments) Then
                    _AccessDeparments = New List(Of Integer)
                End If

                AccessDeparments.Add(idDeparment)
            End If
        End Sub

        Public Property AccessDeparments As List(Of Integer)
            Get
                Return _AccessDeparments

            End Get
            Set(value As List(Of Integer))
                _AccessDeparments = value
            End Set
        End Property


        Public Property Modules As Dictionary(Of Integer, ModuleObj)
            Get
                Return _Modules
            End Get
            Set(value As Dictionary(Of Integer, ModuleObj))
                _Modules = value
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

        Public Sub LoadModules(Optional frontui As Boolean = False)
            If _idprofile > 0 Then
                Dim ADOModulesMenu As New ADOModulesMenus
                Try
                    ADOModulesMenu.GetModulesMenusByProfile(Me, frontui)
                Catch ex As Exception

                End Try
            End If
        End Sub
        Sub New()

        End Sub
        Sub New(idprofile As Integer)
            _idprofile = idprofile
        End Sub

    End Class

    Public Enum SysProfiles
        Publico = 1
        Supervisor = 2
        Administrator = 3
    End Enum
End Namespace
