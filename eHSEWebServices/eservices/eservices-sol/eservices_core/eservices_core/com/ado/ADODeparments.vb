Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.database

Namespace com.ado
    Public Class ADODeparments
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of DeparmentsObj)

        Private Const Table As String = "tbl_deparments"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub GetDeparments(list_deparmentobj As List(Of DeparmentsObj))
            Dim deparment As New DeparmentsObj

            Dim qbuilder As New QueryBuilder(Of DeparmentsObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = deparment
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("active=1")
            qbuilder.AddOrderByField("DeparmentName")
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim new_deparment As New DeparmentsObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    new_deparment.GetType.GetProperty(column.ColumnName).SetValue(new_deparment, row(column.ColumnName), Nothing)
                                End If
                            Next
                            list_deparmentobj.Add(new_deparment)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub


        Public Sub GetDeparmentByID(DeparmentObj As DeparmentsObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of DeparmentsObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = DeparmentObj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("idDeparment=" & DeparmentObj.idDeparment)
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
                                    DeparmentObj.GetType.GetProperty(column.ColumnName).SetValue(DeparmentObj, row(column.ColumnName), Nothing)
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

        Public Sub Add(item As DeparmentsObj) Implements IADORepository(Of DeparmentsObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of DeparmentsObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = item
                qbuilder.BuildSelect(Table, True)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Delete(item As DeparmentsObj) Implements IADORepository(Of DeparmentsObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If
            Try
                OpenDB(Database)
                SetCommand("DELETE * FROM " & Table & " WHERE idDeparment=" & item.idDeparment)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of DeparmentsObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where idDeparment=" & id)
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

        Public Function GetById(id As Integer) As DeparmentsObj Implements IADORepository(Of DeparmentsObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim Deparment As New DeparmentsObj
            Deparment.idDeparment = id
            GetDeparmentByID(Deparment)
            Return Deparment
        End Function

        Public Function GetLastId() As DeparmentsObj Implements IADORepository(Of DeparmentsObj).GetLastId
            Dim deparment As New DeparmentsObj
            GetLastId(deparment)
            Return deparment
        End Function

        Public Sub GetLastId(item As DeparmentsObj) Implements IADORepository(Of DeparmentsObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idDocument) as MAXID from " & Table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            item.idDeparment = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Update(item As DeparmentsObj) Implements IADORepository(Of DeparmentsObj).Update
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of DeparmentsObj)
                qbuilder.TypeQuery = TypeQuery.Update
                qbuilder.Entity = item
                qbuilder.BuildUpdate(Table, "idDeparment=" & item.idDeparment)
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
