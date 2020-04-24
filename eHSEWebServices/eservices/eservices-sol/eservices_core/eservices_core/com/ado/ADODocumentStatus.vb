Imports eservices_core.com.objects
Namespace com.ado
    Public Class ADODocumentStatus
        Inherits com.database.mysql.MySQLConnectionObj

        Private Const table As String = "tbl_documentstatus"
        Private Const database As String = "DB-EWEBSERVICES"

        Public Sub AddDocumentStatus(DocumentStatusObj As DocumentStatusObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of DocumentStatusObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = DocumentStatusObj
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
            getLasID(DocumentStatusObj)
        End Sub
        Private Sub getLasID(DocumentStatusObj As DocumentStatusObj)
            Try
                OpenDB(database)
                SetCommand("select max(iddocumentstatus) as MAXID from " & table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            DocumentStatusObj.idDocumentStatus = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub
        Public Sub GetDocumentStatusByID(DocumentStatusObj As DocumentStatusObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of DocumentStatusObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = DocumentStatusObj
            qbuilder.BuildSelect(table, True)
            qbuilder.AddToQueryParameterForSelect("idDocumentStatus=" & DocumentStatusObj.idDocumentStatus & "")
            Try
                OpenDB(database)
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    DocumentStatusObj.GetType.GetProperty(column.ColumnName).SetValue(DocumentStatusObj, row(column.ColumnName), Nothing)
                                End If
                            Next
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub


    End Class
End Namespace
