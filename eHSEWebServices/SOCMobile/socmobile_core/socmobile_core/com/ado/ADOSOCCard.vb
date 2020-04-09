Imports socmobile_core.com.objects
Imports eservices_core.com.database

Namespace com.ado.ole

    Public Class ADOSOCCard
        Inherits eservices_core.com.database.ole.OleDBConnectionObj

        Public Sub SaveSOCCard(SOCCardObj As SOCCardObj)
            Dim qbuilder As New QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = SOCCardObj
            qbuilder.BuildInsert("tblStopCard")

            Try
                OpenDB("DB-RSTC")
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

    End Class

End Namespace