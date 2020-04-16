Imports System.Data.OleDb
Imports System.Configuration
Imports System.Collections

Namespace com.database.ole
    Public Class OleDBConnectionObj
        Implements com.database.DatabaseInterface

        Protected connections As New Collection
        Protected connection As com.database.ole.OleConnectionsProperty

        Public Sub New()
            Dim cont As Boolean = False
            For Each s As String In System.Configuration.ConfigurationSettings.AppSettings
                If s.Contains("DB-") Then
                    cont = True
                    Dim con As New com.database.ole.OleConnectionsProperty
                    con.Name = s
                    con.ConectionString = System.Configuration.ConfigurationSettings.AppSettings(s)
                    connections.Add(con, con.Name)
                End If
            Next
            If Not cont Then
                Throw New Exception("There no any Database configure please configure at least 1 database.")
            End If
        End Sub

        Public Sub New(ByVal ConnectionProperty As com.database.ole.OleConnectionsProperty)
            connections.Add(ConnectionProperty, ConnectionProperty.Name)
        End Sub

        Protected Sub OpenDB(ByVal DB As String) Implements com.database.DatabaseInterface.OpenDB
            Try
                connection = connections.Item(DB)
                If Not connection.Connection.State = ConnectionState.Open Then
                    connection.Connection.Open()
                End If
            Catch ex As Exception
                Throw
            End Try
        End Sub

        Protected Sub CreateConnection(ByVal ConnectionName As String, ByVal DatabaseToOpen As String) Implements com.database.DatabaseInterface.CreateConnection
            Dim con As New com.database.ole.OleConnectionsProperty
            con.Name = ConnectionName
            con.ConectionString = System.Configuration.ConfigurationSettings.AppSettings(DatabaseToOpen)
            connections.Add(con, con.Name)
        End Sub

        Protected Sub CloseDB() Implements com.database.DatabaseInterface.CloseDB
            Try
                If Not IsNothing(connection.Adap) Then
                    connection.Adap.Dispose()
                End If
                If Not IsNothing(connection.Command) Then
                    connection.Command.Dispose()
                End If
                If Not IsNothing(connection.Connection) Then
                    connection.Connection.Close()
                End If
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub CloseDB(ByVal DB As String) Implements com.database.DatabaseInterface.CloseDB
            Try
                connection = connections.Item(DB)

                If Not IsNothing(connection.Adap) Then
                    connection.Adap.Dispose()
                End If
                If Not IsNothing(connection.Command) Then
                    connection.Command.Dispose()
                End If
                If Not IsNothing(connection.Connection) Then
                    connection.Connection.Close()
                End If
                connections.Remove(DB)
            Catch ex As Exception

            End Try
        End Sub

        Public Sub SetCommand(Query As String) Implements com.database.DatabaseInterface.setCommand
            connection.Command = New OleDbCommand(Query, connection.Connection)
        End Sub

        Public Sub SetDataAdapter() Implements com.database.DatabaseInterface.setDataAdapter
            connection.Adap = New OleDbDataAdapter(connection.Command)
        End Sub

    End Class
End Namespace