Imports eservices_core.com.objects
Imports eservices_core.com.interface

Public Class WeeklyRiserCrane
    Inherits DocumentObj

    Private _id As Integer = -1
    Private _DocumentDate As Date
    Private _SectionAQ1 As Byte

    Public Property DocumentDate As Date
        Get
            Return _DocumentDate
        End Get
        Set(value As Date)
            _DocumentDate = value
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


    Public Overrides Sub getObjData()
        Throw New NotImplementedException
    End Sub

    Public Overrides Sub LoadInfoByID()
        Throw New NotImplementedException
    End Sub
End Class
