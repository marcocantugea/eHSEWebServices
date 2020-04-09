Imports eservices_core.com.ado
Namespace com.objects
    Public Class UserObj
        Private _userid As Integer = -1
        Private _user_login As String
        Private _user_pwd As String
        Private _user_email As String
        Private _active As Boolean
        Private _idprofile As Integer
        Private _idInfoUser As Integer
        Private _idinfocompany As Integer
        Private _InfoUserObj As InfoUserObj
        Private _ProfileObj As ProfileObj
        Private _UserInfoCompanyObj As UserInfoCompanyObj

        Public Sub Loadinfo()
            GetProfileObj()
            GetInfoUser()
            GetInfoCompany()
        End Sub

        Public Sub GetInfoCompany()
            Try
                Dim ADOUser As New ADOUser
                _UserInfoCompanyObj = New UserInfoCompanyObj
                _UserInfoCompanyObj.idinfocompany = _idinfocompany
                If _idinfocompany > 0 Then
                    ADOUser.GetIUserInfoCompanyByID(_UserInfoCompanyObj)
                    _UserInfoCompanyObj.LoadInfo()
                End If
            Catch ex As Exception
                _UserInfoCompanyObj = Nothing
            End Try
        End Sub
        Public Sub GetInfoUser()
            Try
                Dim ADOUser As New ADOUser
                _InfoUserObj = New InfoUserObj
                _InfoUserObj.idInfoUser = _idInfoUser
                If _idInfoUser > 0 Then
                    ADOUser.GetUserInfoByID(_InfoUserObj)
                End If
            Catch ex As Exception
                _InfoUserObj = Nothing
            End Try
        End Sub

        Public Sub GetProfileObj()
            Try
                Dim ADOProfile As New ADOProfile
                _ProfileObj = New ProfileObj
                _ProfileObj.idprofile = Me._idprofile
                If _idprofile > 0 Then
                    ADOProfile.GetProfileById(_ProfileObj)
                End If

            Catch ex As Exception
                _idprofile = Nothing
            End Try
        End Sub

        Public Function FullName() As String
            Dim str_name As String = ""
            If Not IsNothing(_InfoUserObj) Then
                str_name = _InfoUserObj.Nombre & " " & _InfoUserObj.apellido_pat & " " & _InfoUserObj.apellido_mat
            End If
            Return str_name
        End Function

        Public Property UserInfoCompanyObj As UserInfoCompanyObj
            Get
                Return _UserInfoCompanyObj
            End Get
            Set(value As UserInfoCompanyObj)
                _UserInfoCompanyObj = value
            End Set
        End Property

        Public Property ProfileObj As ProfileObj
            Get
                Return _ProfileObj
            End Get
            Set(value As ProfileObj)
                _ProfileObj = value
            End Set
        End Property
        Public Property InfoUserObj As InfoUserObj
            Get
                Return _InfoUserObj
            End Get
            Set(value As InfoUserObj)
                _InfoUserObj = value
            End Set
        End Property

        Public Property idinfocompany As Integer
            Get
                Return _idinfocompany
            End Get
            Set(value As Integer)
                _idinfocompany = value
            End Set
        End Property

        Public Property idInfoUser As Integer
            Get
                Return _idInfoUser
            End Get
            Set(value As Integer)
                _idInfoUser = value
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


        Public Property active As Boolean
            Get
                Return _active
            End Get
            Set(value As Boolean)
                _active = value
            End Set
        End Property

        Public Property user_email As String
            Get
                Return _user_email
            End Get
            Set(value As String)
                _user_email = value
            End Set
        End Property

        Public Property user_pwd As String
            Get
                Return _user_pwd
            End Get
            Set(value As String)
                _user_pwd = value
            End Set
        End Property

        Public Property user_login As String
            Get
                Return _user_login
            End Get
            Set(value As String)
                _user_login = value
            End Set
        End Property

        Public Property userid As Integer
            Get
                Return _userid
            End Get
            Set(value As Integer)
                _userid = value
            End Set
        End Property

    End Class
End Namespace
