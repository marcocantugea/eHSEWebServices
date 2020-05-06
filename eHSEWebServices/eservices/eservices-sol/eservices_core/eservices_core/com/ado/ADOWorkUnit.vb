Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.database
Namespace com.ado
    Public NotInheritable Class ADOWorkUnit
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of WorkUnitObj)

        Private Const Table As String = "tbl_workunit"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub GetWorkUnits(listofUnitsObj As List(Of WorkUnitObj))
            Dim workuntiobj As New WorkUnitObj

            Dim qbuilder As New QueryBuilder(Of WorkUnitObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = workuntiobj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("active=1")
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim new_workunit As New WorkUnitObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    new_workunit.GetType.GetProperty(column.ColumnName).SetValue(new_workunit, row(column.ColumnName), Nothing)
                                End If
                            Next
                            listofUnitsObj.Add(new_workunit)
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()

            End Try
        End Sub

        Public Sub GetWorkUnitByID(WorkUnitObj As WorkUnitObj)
            Dim qbuilder As New QueryBuilder(Of WorkUnitObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = WorkUnitObj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("idWorkUnit=" & WorkUnitObj.idWorkUnit)
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
                                    WorkUnitObj.GetType.GetProperty(column.ColumnName).SetValue(WorkUnitObj, row(column.ColumnName), Nothing)
                                End If
                            Next
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Add(item As WorkUnitObj) Implements IADORepository(Of WorkUnitObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of WorkUnitObj)
                qbuilder.TypeQuery = com.database.TypeQuery.Insert
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

        Public Sub Delete(item As WorkUnitObj) Implements IADORepository(Of WorkUnitObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & Table & " where idWorkUnit=" & item.idWorkUnit)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of WorkUnitObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where idWorkUnit=" & id.ToString)
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

        Public Function GetById(id As Integer) As WorkUnitObj Implements IADORepository(Of WorkUnitObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim WorkObj As New WorkUnitObj
            WorkObj.idWorkUnit = id
            GetWorkUnitByID(WorkObj)
            Return WorkObj
        End Function

        Public Function GetLastId() As WorkUnitObj Implements IADORepository(Of WorkUnitObj).GetLastId
            Dim WorkUnit As New WorkUnitObj
            GetLastId(WorkUnit)
            Return WorkUnit
        End Function

        Public Sub GetLastId(item As WorkUnitObj) Implements IADORepository(Of WorkUnitObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idDocument) as MAXID from " & Table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            item.idWorkUnit = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Update(item As WorkUnitObj) Implements IADORepository(Of WorkUnitObj).Update
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of WorkUnitObj)
                qbuilder.TypeQuery = TypeQuery.Update
                qbuilder.Entity = item
                qbuilder.BuildUpdate(Table, "idWorkUnit=" & item.idWorkUnit)
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