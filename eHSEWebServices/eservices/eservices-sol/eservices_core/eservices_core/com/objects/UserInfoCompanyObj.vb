Imports eservices_core.com.ado
Namespace com.objects
    Public Class UserInfoCompanyObj

        Private _idinfocompany As Integer = -1
        Private _category As String
        Private _guard As String
        Private _employeenum As String
        Private _idWorkUnit As Integer
        Private _idCompany As Integer
        Private _idDeparment As Integer
        Private _WorkUnitObj As WorkUnitObj
        Private _CompanyObj As CompanyObj
        Private _DeparmentObj As DeparmentsObj
        Private _idcategory As Integer
        Private _CategoryObj As CategoryObj



        Public Sub LoadInfo()
            GetWorkUnit()
            GetCompany()
            GetDeparment()
            GetCategory()
        End Sub

        Public Sub GetCategory()
            Try
                Dim ADOCategory As New ADOCategory
                If _idcategory < 0 Then
                    _CategoryObj = New CategoryObj
                    _CategoryObj.idcategory = _idcategory
                    ADOCategory.GetCategoryByID(_CategoryObj)
                End If
            Catch ex As Exception
                _CategoryObj = Nothing
            End Try
        End Sub

        Public Sub GetDeparment()
            Try
                Dim ADODeparments As New ADODeparments
                If _idDeparment > 0 Then
                    _DeparmentObj = New DeparmentsObj
                    _DeparmentObj.idDeparment = _idDeparment
                    ADODeparments.GetDeparmentByID(_DeparmentObj)
                End If
            Catch ex As Exception
                _DeparmentObj = Nothing
            End Try
        End Sub

        Public Sub GetCompany()
            Try
                Dim ADOCompany As New ADOCompany
                If _idCompany > 0 Then
                    _CompanyObj = New CompanyObj
                    _CompanyObj.idCompany = _idCompany
                    ADOCompany.GetCompanyByID(_CompanyObj)
                End If
            Catch ex As Exception
                _CompanyObj = Nothing
            End Try
        End Sub
        Public Sub GetWorkUnit()
            Try
                Dim ADOWorkUnit As New ADOWorkUnit
                If _idWorkUnit > 0 Then
                    _WorkUnitObj = New WorkUnitObj
                    _WorkUnitObj.idWorkUnit = _idWorkUnit
                    ADOWorkUnit.GetWorkUnitByID(_WorkUnitObj)
                End If
            Catch ex As Exception
                _WorkUnitObj = Nothing
            End Try
        End Sub

        Public Property CategoryObj As CategoryObj
            Get
                Return _CategoryObj
            End Get
            Set(value As CategoryObj)
                _CategoryObj = value
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

        Public Property DeparmentObj As DeparmentsObj
            Get
                Return _DeparmentObj
            End Get
            Set(value As DeparmentsObj)
                _DeparmentObj = value
            End Set
        End Property

        Public Property CompanyObj As CompanyObj
            Get
                Return _CompanyObj
            End Get
            Set(value As CompanyObj)
                _CompanyObj = value
            End Set
        End Property

        Public Property WorkUnitObj As WorkUnitObj
            Get
                Return _WorkUnitObj
            End Get
            Set(value As WorkUnitObj)
                _WorkUnitObj = value
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

        Public Property idCompany As Integer
            Get
                Return _idCompany
            End Get
            Set(value As Integer)
                _idCompany = value
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

        Public Property employeenum As String
            Get
                Return _employeenum
            End Get
            Set(value As String)
                _employeenum = value
            End Set
        End Property

        Public Property guard As String
            Get
                Return _guard
            End Get
            Set(value As String)
                _guard = value
            End Set
        End Property

        Public Property category As String
            Get
                Return _category
            End Get
            Set(value As String)
                _category = value
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


    End Class
End Namespace