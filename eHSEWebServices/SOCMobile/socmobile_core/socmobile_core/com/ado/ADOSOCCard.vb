Imports socmobile_core.com.objects
Imports eservices_core.com.database
Imports eservices_core.com.objects

Namespace com.ado.ole

    Public NotInheritable Class ADOSOCCard
        Inherits eservices_core.com.database.ole.OleDBConnectionObj

        Private Const table As String = "tblStopCard"
        Private Const database As String = "DB-RSTC"

        Public Sub SaveSOCCard(SOCCardObj As SOCCardObj)
            Dim qbuilder As New QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = SOCCardObj
            qbuilder.BuildInsert(table)

            Try
                OpenDB(database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function GetSocCardByUserName(InfoUser As InfoUserObj) As List(Of SOCCardObj)
            Dim listofsoccars As List(Of SOCCardObj)

            Dim SOCCardObj As New SOCCardObj
            Dim qbuilder As New QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = SOCCardObj
            qbuilder.BuildSelect(table, True)

            If InfoUser.apellido_mat.Length > 0 Then
                qbuilder.AddToQueryParameterForSelect("nombre like '%" & InfoUser.apellido_pat & " " & InfoUser.apellido_mat & "%'")
            Else
                qbuilder.AddToQueryParameterForSelect("nombre like '%" & InfoUser.apellido_pat & "%'")
            End If
            qbuilder.AddOrderByField("ID desc")
            Try
                OpenDB(database)

                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        listofsoccars = New List(Of SOCCardObj)
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim soccard As New SOCCardObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    soccard.GetType.GetProperty(column.ColumnName).SetValue(soccard, row(column.ColumnName), Nothing)
                                End If
                            Next
                            listofsoccars.Add(soccard)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

            Return listofsoccars
        End Function

    End Class

End Namespace