
Namespace com.objects
    Public Class UsuariosObj
        Private _Empleado_ID As Integer = -1
        Private _Nombre As String
        Private _Crew As String
        Private _Rolls As String
        Private _Dpto_ID As Integer
        Private _Empresa_ID As Integer
        Private _Sexo As String
        Private _Nac_ID As Integer
        Private _Fecha_Nacimiento As String
        Private _Puesto As String
        Private _Foto As String
        Private _emp_Vigente As Boolean

        Public Property emp_Vigente As Boolean
            Get
                Return _emp_Vigente
            End Get
            Set(value As Boolean)
                _emp_Vigente = value
            End Set
        End Property

        Public Property Foto As String
            Get
                Return _Foto
            End Get
            Set(value As String)
                _Foto = value
            End Set
        End Property

        Public Property Puesto As String
            Get
                Return _Puesto
            End Get
            Set(value As String)
                _Puesto = value
            End Set
        End Property

        Public Property Fecha_Nacimiento As String
            Get
                Return _Fecha_Nacimiento
            End Get
            Set(value As String)
                _Fecha_Nacimiento = value
            End Set
        End Property

        Public Property Nac_ID As Integer
            Get
                Return _Nac_ID
            End Get
            Set(value As Integer)
                _Nac_ID = value
            End Set
        End Property

        Public Property Sexo As String
            Get
                Return _Sexo
            End Get
            Set(value As String)
                _Sexo = value
            End Set
        End Property

        Public Property Empresa_ID As Integer
            Get
                Return _Empresa_ID
            End Get
            Set(value As Integer)
                _Empresa_ID = value
            End Set
        End Property

        Public Property Dpto_ID As Integer
            Get
                Return _Dpto_ID
            End Get
            Set(value As Integer)
                _Dpto_ID = value
            End Set
        End Property

        Public Property Rolls As String
            Get
                Return _Rolls
            End Get
            Set(value As String)
                _Rolls = value
            End Set
        End Property

        Public Property Crew As String
            Get
                Return _Crew
            End Get
            Set(value As String)
                _Crew = value
            End Set
        End Property

        Public Property Nombre As String
            Get
                Return _Nombre
            End Get
            Set(value As String)
                _Nombre = value
            End Set
        End Property

        Public Property Empleado_ID As Integer
            Get
                Return _Empleado_ID
            End Get
            Set(value As Integer)
                _Empleado_ID = value
            End Set
        End Property
    End Class
End Namespace