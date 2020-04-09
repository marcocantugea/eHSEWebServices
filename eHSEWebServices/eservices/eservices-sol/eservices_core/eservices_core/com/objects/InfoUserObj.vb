Namespace com.objects
    Public Class InfoUserObj

        Private _idInfoUser As Integer = -1
        Private _Nombre As String
        Private _apellido_pat As String
        Private _apellido_mat As String
        Private _fecha_nac As Date
        Private _RFC As String
        Private _telefono_movil As String
        Private _phone_emergency As String
        Private _name_emerg_contanct As String
        Private _direccion As String

        Public Property direccion As String
            Get
                Return _direccion
            End Get
            Set(value As String)
                _direccion = value
            End Set
        End Property

        Public Property name_emerg_contanct As String
            Get
                Return _name_emerg_contanct
            End Get
            Set(value As String)
                _name_emerg_contanct = value
            End Set
        End Property

        Public Property phone_emergency As String
            Get
                Return _phone_emergency
            End Get
            Set(value As String)
                _phone_emergency = value
            End Set
        End Property

        Public Property telefono_movil As String
            Get
                Return _telefono_movil
            End Get
            Set(value As String)
                _telefono_movil = value
            End Set
        End Property

        Public Property RFC As String
            Get
                Return _RFC
            End Get
            Set(value As String)
                _RFC = value
            End Set
        End Property

        Public Property fecha_nac As Date
            Get
                Return _fecha_nac
            End Get
            Set(value As Date)
                _fecha_nac = value
            End Set
        End Property

        Public Property apellido_mat As String
            Get
                Return _apellido_mat
            End Get
            Set(value As String)
                _apellido_mat = value
            End Set
        End Property

        Public Property apellido_pat As String
            Get
                Return _apellido_pat
            End Get
            Set(value As String)
                _apellido_pat = value
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

        Public Property idInfoUser As Integer
            Get
                Return _idInfoUser
            End Get
            Set(value As Integer)
                _idInfoUser = value
            End Set
        End Property

    End Class
End Namespace
