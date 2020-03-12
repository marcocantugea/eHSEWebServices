Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.OleDb
Imports System.Configuration
Imports System

Public Class clsDataBase
    Private objConn As OleDbConnection
    Private objCmd As OleDbCommand
    Private Trans As OleDbTransaction
    Private strConnString As String
    Public Sub New()
        strConnString = ConfigurationSettings.AppSettings("ConnectionString")
        ' ConfigurationSettings.AppSettings
        ' System.Configuration.ConfigurationSettings.AppSettings
    End Sub

    Public Function QueryDataReader(ByVal strSQL As String) As OleDbDataReader
        Dim dtReader As OleDbDataReader
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        objCmd = New OleDbCommand(strSQL, objConn)
        dtReader = objCmd.ExecuteReader()
        Return dtReader '*** Return DataReader ***'  
    End Function

    Public Function QueryDataSet(ByVal strSQL As String) As DataSet
        Dim ds As New DataSet
        Dim dtAdapter As New OleDbDataAdapter
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        objCmd = New OleDbCommand
        With objCmd
            .Connection = objConn
            .CommandText = strSQL
            .CommandType = CommandType.Text
        End With
        dtAdapter.SelectCommand = objCmd
        dtAdapter.Fill(ds)
        ' objConn.Close()
        Return ds   '*** Return DataSet ***'  
    End Function

    Public Function QueryDataTable(ByVal strSQL As String) As DataTable
        Dim dtAdapter As OleDbDataAdapter
        Dim dt As New DataTable
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        dtAdapter = New OleDbDataAdapter(strSQL, objConn)
        dtAdapter.Fill(dt)
        Return dt '*** Return DataTable ***'  
    End Function

    Public Function QueryExecuteNonQuery(ByVal strSQL As String) As Boolean
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Try
            objCmd = New OleDbCommand
            With objCmd
                .Connection = objConn
                .CommandType = CommandType.Text
                .CommandText = strSQL
            End With
            objCmd.ExecuteNonQuery()
            Return True '*** Return True ***'  
        Catch ex As Exception
            Return False  '*** Return False ***'  
        End Try
    End Function

    Public Function QueryExecuteScalar(ByVal strSQL As String) As Object
        Dim obj As Object
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Try
            objCmd = New OleDbCommand
            With objCmd
                .Connection = objConn
                .CommandType = CommandType.Text
                .CommandText = strSQL
            End With
            obj = objCmd.ExecuteScalar()  '*** Return Scalar ***'  
            Return obj
        Catch ex As Exception
            Return Nothing '*** Return Nothing ***'  
        End Try
    End Function

    Public Function TransStart()
        objConn = New OleDbConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Trans = objConn.BeginTransaction(IsolationLevel.ReadCommitted)
    End Function

    Public Function TransExecute(ByVal strSQL As String) As Boolean
        objCmd = New OleDbCommand
        With objCmd
            .Connection = objConn
            .Transaction = Trans
            .CommandType = CommandType.Text
            .CommandText = strSQL
        End With
        objCmd.ExecuteNonQuery()
    End Function

    Public Function TransRollBack()
        Trans.Rollback()
    End Function

    Public Function TransCommit()
        Trans.Commit()
    End Function

    Public Sub Close()
        objConn.Close()
        objConn = Nothing
    End Sub
End Class
