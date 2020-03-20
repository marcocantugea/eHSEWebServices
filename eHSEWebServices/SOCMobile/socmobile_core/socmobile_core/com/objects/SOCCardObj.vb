
Namespace com.objects

    Public Class SOCCardObj

        Private _id As Integer = -1
        Private _Nombre As String
        Private _Fecha As Date
        Private _Ubicacion As String
        Private _Observacion As String
        Private _Accion As String
        Private _Acto_Inseguro As Boolean
        Private _EPP As Boolean
        Private _Posicion_Gente As Boolean
        Private _Orden_Limpieza As Boolean
        Private _Condicion_Insegura As Boolean
        Private _Procedimiento As Boolean
        Private _Herramientas As Boolean
        Private _Observacion_Positiva As Boolean
        Private _Otra As Boolean
        Private _A_C As String
        Private _U_P As String
        Private _Estatus As String
        Private _Dpto As String
        Private _Week As Integer
        Private _SOC_Relevante As Boolean
        Private _SOC_Hora As String
        Private _SOC_Computadora As String
        Private _SOC_Usuario As String
        Private _NomineeWeek As Boolean
        Private _NomineeMonth As Boolean
        Private _Situation As String
        Private _StopJob As Boolean
        Private _MinimizeRisk As String
        Private _InformSupervisor As Boolean
        Private _ch_Atrapamiento As Boolean
        Private _ch_Planeacion As Boolean
        Private _ch_SnBarreras As Boolean
        Private _ch_AmbienteTox As Boolean
        Private _ch_TrabajoGrua As Boolean
        Private _ch_Resbalon As Boolean
        Private _ch_NoPermiso As Boolean
        Private _ch_Comms As Boolean
        Private _ch_CondMeteorologica As Boolean
        Private _ch_AltaPresion As Boolean
        Private _ch_Quimicos As Boolean
        Private _ch_Soldadura As Boolean

        Public Property ch_Soldadura As Boolean
            Get
                Return _ch_Soldadura
            End Get
            Set(value As Boolean)
                _ch_Soldadura = value
            End Set
        End Property

        Public Property ch_Quimicos As Boolean
            Get
                Return _ch_Quimicos
            End Get
            Set(value As Boolean)
                _ch_Quimicos = value
            End Set
        End Property

        Public Property ch_AltaPresion As Boolean
            Get
                Return _ch_AltaPresion
            End Get
            Set(value As Boolean)
                _ch_AltaPresion = value
            End Set
        End Property

        Public Property ch_CondMeteorologica As Boolean
            Get
                Return _ch_CondMeteorologica
            End Get
            Set(value As Boolean)
                _ch_CondMeteorologica = value
            End Set
        End Property

        Public Property ch_Comms As Boolean
            Get
                Return _ch_Comms
            End Get
            Set(value As Boolean)
                _ch_Comms = value
            End Set
        End Property

        Public Property ch_NoPermiso As Boolean
            Get
                Return _ch_NoPermiso
            End Get
            Set(value As Boolean)
                _ch_NoPermiso = value
            End Set
        End Property

        Public Property ch_Resbalon As Boolean
            Get
                Return _ch_Resbalon
            End Get
            Set(value As Boolean)
                _ch_Resbalon = value
            End Set
        End Property

        Public Property ch_TrabajoGrua As Boolean
            Get
                Return _ch_TrabajoGrua
            End Get
            Set(value As Boolean)
                _ch_TrabajoGrua = value
            End Set
        End Property

        Public Property ch_AmbienteTox As Boolean
            Get
                Return _ch_AmbienteTox
            End Get
            Set(value As Boolean)
                _ch_AmbienteTox = value
            End Set
        End Property

        Public Property ch_SnBarreras As Boolean
            Get
                Return _ch_SnBarreras
            End Get
            Set(value As Boolean)
                _ch_SnBarreras = value
            End Set
        End Property

        Public Property ch_Planeacion As Boolean
            Get
                Return _ch_Planeacion
            End Get
            Set(value As Boolean)
                _ch_Planeacion = value
            End Set
        End Property

        Public Property ch_Atrapamiento As Boolean
            Get
                Return _ch_Atrapamiento
            End Get
            Set(value As Boolean)
                _ch_Atrapamiento = value
            End Set
        End Property

        Public Property InformSupervisor As Boolean
            Get
                Return _InformSupervisor
            End Get
            Set(value As Boolean)
                _InformSupervisor = value
            End Set
        End Property

        Public Property MinimizeRisk As String
            Get
                Return _MinimizeRisk
            End Get
            Set(value As String)
                _MinimizeRisk = value
            End Set
        End Property
        Public Property StopJob As Boolean
            Get
                Return _StopJob
            End Get
            Set(value As Boolean)
                _StopJob = value
            End Set
        End Property

        Public Property Situation As String
            Get
                Return _Situation
            End Get
            Set(value As String)
                _Situation = value
            End Set
        End Property


        Public Property NomineeMonth As Boolean
            Get
                Return _NomineeMonth
            End Get
            Set(value As Boolean)
                _NomineeMonth = value
            End Set
        End Property

        Public Property NomineeWeek As Boolean
            Get
                Return _NomineeWeek
            End Get
            Set(value As Boolean)
                _NomineeWeek = value
            End Set
        End Property

        Public Property SOC_Usuario As String
            Get
                Return _SOC_Usuario
            End Get
            Set(value As String)
                _SOC_Usuario = value
            End Set
        End Property

        Public Property SOC_Computadora As String
            Get
                Return _SOC_Computadora
            End Get
            Set(value As String)
                _SOC_Computadora = value
            End Set
        End Property

        Public Property SOC_Hora As String
            Get
                Return _SOC_Hora
            End Get
            Set(value As String)
                _SOC_Hora = value
            End Set
        End Property

        Public Property SOC_Relevante As Boolean
            Get
                Return _SOC_Relevante
            End Get
            Set(value As Boolean)
                _SOC_Relevante = value
            End Set
        End Property
        Public Property Week As Integer
            Get
                Return _Week

            End Get
            Set(value As Integer)
                _Week = value
            End Set
        End Property

        Public Property Dpto As String
            Get
                Return _Dpto
            End Get
            Set(value As String)
                _Dpto = value
            End Set
        End Property

        Public Property Estatus As String
            Get
                Return _Estatus
            End Get
            Set(value As String)
                _Estatus = value
            End Set
        End Property

        Public Property U_P As String
            Get
                Return _U_P
            End Get
            Set(value As String)
                _U_P = value
            End Set
        End Property

        Public Property A_C As String
            Get
                Return _A_C
            End Get
            Set(value As String)
                _A_C = value
            End Set
        End Property

        Public Property Otra As Boolean
            Get
                Return _Otra
            End Get
            Set(value As Boolean)
                _Otra = value
            End Set
        End Property

        Public Property Observacion_Positiva As Boolean
            Get
                Return _Observacion_Positiva
            End Get
            Set(value As Boolean)
                _Observacion_Positiva = value
            End Set
        End Property

        Public Property Herramientas As Boolean
            Get
                Return _Herramientas
            End Get
            Set(value As Boolean)
                _Herramientas = value
            End Set
        End Property


        Public Property Procedimiento As Boolean
            Get
                Return _Procedimiento
            End Get
            Set(value As Boolean)
                _Procedimiento = value
            End Set
        End Property

        Public Property Orden_Limpieza As Boolean
            Get
                Return _Orden_Limpieza
            End Get
            Set(value As Boolean)
                _Orden_Limpieza = value
            End Set
        End Property

        Public Property Posicion_Gente As Boolean
            Get
                Return _Posicion_Gente
            End Get
            Set(value As Boolean)
                _Posicion_Gente = value
            End Set
        End Property

        Public Property EPP As Boolean
            Get
                Return _EPP
            End Get
            Set(value As Boolean)
                _EPP = value
            End Set
        End Property

        Public Property Acto_Inseguro As Boolean
            Get
                Return _Acto_Inseguro
            End Get
            Set(value As Boolean)
                _Acto_Inseguro = value
            End Set
        End Property

        Public Property Accion As String
            Get
                Return _Accion
            End Get
            Set(value As String)
                _Accion = value
            End Set
        End Property

        Public Property Observacion As String
            Get
                Return _Observacion
            End Get
            Set(value As String)
                _Observacion = value
            End Set
        End Property

        Public Property Ubicacion As String
            Get
                Return _Ubicacion
            End Get
            Set(value As String)
                _Ubicacion = value
            End Set
        End Property

        Public Property id As Integer
            Get
                Return _id
            End Get
            Set(value As Integer)
                _id = value
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

        Public Property Fecha As Date
            Get
                Return Format(_Fecha, "dd/MM/yyyy")
            End Get
            Set(value As Date)
                _Fecha = value
            End Set
        End Property


    End Class
End Namespace
