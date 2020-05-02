Imports eservices_core.com.ado
Imports eservices_core.com.objects
Imports etra.com.ado.ole
Imports etra.com.objects
Imports socmobile_core.com.ado.ole
Imports socmobile_core.com.objects
Imports System.Text
Imports System.Collections
Imports System.Collections.Generic


Public Class UnitOfWork

    Private _Category As ADOCategory
    Private _Company As ADOCompany
    Private _TRA As ADOTRA
    Private _Deparments As ADODeparments
    Private _Documents As ADODocument
    Private _DocumentStatus As ADODocumentStatus
    Private _Signatures As ADOeSignatures
    Private _ModulesMenus As ADOModulesMenus
    Private _Profiles As ADOProfile
    Private _User As ADOUser
    Private _UserUtilities As ADOUserUtilities
    Private _WorkUnit As ADOWorkUnit
    Private _SOCCard As ADOSOCCard
    Private _SOCCardUsuarios As ADOUsuarios

    Public ReadOnly Property SOCCardUsuarios As ADOUsuarios
        Get
            Return _SOCCardUsuarios
        End Get
    End Property
    Public ReadOnly Property SOCCard As ADOSOCCard
        Get
            Return _SOCCard
        End Get
    End Property


    Public ReadOnly Property WorkUnit As ADOWorkUnit
        Get
            Return _WorkUnit
        End Get
    End Property

    Public ReadOnly Property UserUtilities As ADOUserUtilities
        Get
            Return _UserUtilities
        End Get
    End Property

    Public ReadOnly Property User As ADOUser
        Get
            Return _User
        End Get
    End Property

    Public ReadOnly Property Profiles As ADOProfile
        Get
            Return _Profiles
        End Get
    End Property


    Public ReadOnly Property ModulesMenus As ADOModulesMenus
        Get
            Return _ModulesMenus
        End Get
    End Property

    Public ReadOnly Property Signatures As ADOeSignatures
        Get
            Return _Signatures
        End Get
    End Property

    Public ReadOnly Property DocumentStatus As ADODocumentStatus
        Get
            Return _DocumentStatus
        End Get
    End Property

    Public ReadOnly Property Documents As ADODocument
        Get
            Return _Documents
        End Get
    End Property

    Public ReadOnly Property Deparments As ADODeparments
        Get
            Return _Deparments
        End Get
    End Property
    Public ReadOnly Property TRA As ADOTRA
        Get
            Return _TRA
        End Get
    End Property

    Public ReadOnly Property Company As ADOCompany
        Get
            Return _Company
        End Get
    End Property


    Public ReadOnly Property Category As ADOCategory
        Get
            Return _Category
        End Get
    End Property

    Sub New()
        _Category = New ADOCategory
        _Company = New ADOCompany
        _TRA = New ADOTRA
        _Deparments = New ADODeparments
        _Documents = New ADODocument
        _DocumentStatus = New ADODocumentStatus
        _Signatures = New ADOeSignatures
        _ModulesMenus = New ADOModulesMenus
        _Profiles = New ADOProfile
        _User = New ADOUser
        _UserUtilities = New ADOUserUtilities
        _WorkUnit = New ADOWorkUnit
        _SOCCard = New ADOSOCCard
        _SOCCardUsuarios = New ADOUsuarios
    End Sub

End Class
