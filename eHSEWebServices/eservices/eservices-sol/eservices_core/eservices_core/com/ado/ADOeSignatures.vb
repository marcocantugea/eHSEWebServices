Imports eservices_core.com.objects

Namespace com.ado
    Public Class ADOeSignatures
        Inherits com.database.mysql.MySQLConnectionObj


        Public Sub RegisterSignature(eSignature As eSignatureObj)
            Try
                AddSignature(eSignature)
                GetLastID(eSignature)
            Catch ex As Exception
                Throw
            End Try
        End Sub
        Private Sub AddSignature(eSignature As eSignatureObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = eSignature
            qbuilder.BuildInsert("tbl_usersignature")
            Try
                OpenDB("DB-EWEBSERVICES")
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub

        Private Sub GetLastID(eSignature As eSignatureObj)
            Try
                OpenDB("DB-EWEBSERVICES")
                SetCommand("select max(idsignature) as MAXID from tbl_usersignature")
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            eSignature.idsignature = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetUserSignatureById(eSignatureObj As eSignatureObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = eSignatureObj
            qbuilder.BuildSelect("tbl_usersignature", True)
            qbuilder.AddToQueryParameterForSelect("idsignature=" & eSignatureObj.idsignature & "")
            Try
                OpenDB("DB-EWEBSERVICES")
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    eSignatureObj.GetType.GetProperty(column.ColumnName).SetValue(eSignatureObj, row(column.ColumnName), Nothing)
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

        Public Sub UpdateSignature(eSignature As eSignatureObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Update
            qbuilder.Entity = eSignature
            qbuilder.BuildUpdate("tbl_usersignature", "idsignature", eSignature.idsignature)
            Try
                OpenDB("DB-EWEBSERVICES")
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
