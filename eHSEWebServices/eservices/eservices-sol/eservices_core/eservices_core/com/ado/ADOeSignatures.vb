Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.database

Namespace com.ado
    Public Class ADOeSignatures
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of eSignatureObj)

        Private Const Table As String = "tbl_usersignature"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub RegisterSignature(eSignature As eSignatureObj)
            Try
                AddSignature(eSignature)
                GetLastID(eSignature)
            Catch ex As Exception
                Throw
            End Try
        End Sub
        Private Sub AddSignature(eSignature As eSignatureObj)
            Dim qbuilder As New QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = eSignature
            qbuilder.BuildInsert(Table)
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub

        Private Sub GetLastID(eSignature As eSignatureObj) Implements IADORepository(Of eSignatureObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idsignature) as MAXID from " + Table)
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
            Dim qbuilder As New QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = eSignatureObj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("idsignature=" & eSignatureObj.idsignature & "")
            Try
                OpenDB(Database)
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
            Dim qbuilder As New QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = TypeQuery.Update
            qbuilder.Entity = eSignature
            qbuilder.BuildUpdate(Table, "idsignature", eSignature.idsignature)
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub

        Public Sub Add(item As eSignatureObj) Implements IADORepository(Of eSignatureObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of eSignatureObj)
                qbuilder.TypeQuery = TypeQuery.Insert
                qbuilder.Entity = item
                qbuilder.BuildInsert(Table)

                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Delete(item As eSignatureObj) Implements IADORepository(Of eSignatureObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & Table & " where idsignature=" & item.idsignature)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of eSignatureObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where idsignature=" & id.ToString)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("ExistRecord")) Then
                                If Integer.Parse(row("ExistRecord")) > 0 Then
                                    existrecord = True
                                End If
                            End If
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

            Return existrecord
        End Function

        Public Function GetById(id As Integer) As eSignatureObj Implements IADORepository(Of eSignatureObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim Signature As New eSignatureObj
            Signature.idsignature = id
            GetUserSignatureById(Signature)
            Return Signature
        End Function

        Public Function GetLastId() As eSignatureObj Implements IADORepository(Of eSignatureObj).GetLastId
            Dim signature As New eSignatureObj
            GetLastId(signature)
            Return signature
        End Function

    End Class
End Namespace
