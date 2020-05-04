Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.database

Namespace com.ado

    Public NotInheritable Class ADOCategory
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of CategoryObj)

        Private table As String = "tbl_categoy"
        Private Database As String = "DB-EWEBSERVICES"

        Public Sub GetCategories(list_categories As List(Of CategoryObj))
            Dim category As New CategoryObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CategoryObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = category
            qbuilder.BuildSelect("tbl_categoy", True)
            qbuilder.AddToQueryParameterForSelect("active=1")
            qbuilder.AddOrderByField("Category_ES")

            Try
                OpenDB("DB-EWEBSERVICES")
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim new_Category As New CategoryObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    new_Category.GetType.GetProperty(column.ColumnName).SetValue(new_Category, row(column.ColumnName), Nothing)
                                End If
                            Next
                            list_categories.Add(new_Category)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub

        Public Sub GetCategoryByID(CategoryObj As CategoryObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CategoryObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = CategoryObj
            qbuilder.BuildSelect("tbl_categoy", True)
            qbuilder.AddToQueryParameterForSelect("idcategory=" & CategoryObj.idcategory)

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
                                    CategoryObj.GetType.GetProperty(column.ColumnName).SetValue(CategoryObj, row(column.ColumnName), Nothing)
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

        Public Sub Add(item As CategoryObj) Implements IADORepository(Of CategoryObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of CategoryObj)
                qbuilder.TypeQuery = com.database.TypeQuery.Insert
                qbuilder.Entity = item
                qbuilder.BuildInsert(table)

                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Public Sub Delete(item As CategoryObj) Implements IADORepository(Of CategoryObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & table & " where idcategory=" & item.idcategory)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of CategoryObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & table & " where idcategory=" & id.ToString)
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

        Public Function GetById(id As Integer) As CategoryObj Implements IADORepository(Of CategoryObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim Cagetory As New CategoryObj
            Cagetory.idcategory = id
            GetCategoryByID(Cagetory)
            Return Cagetory
        End Function

        Public Function GetLastId() As CategoryObj Implements IADORepository(Of CategoryObj).GetLastId
            Dim category As New CategoryObj
            GetLastId(category)
            Return category
        End Function

        Public Sub GetLastId(item As CategoryObj) Implements IADORepository(Of CategoryObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idDocument) as MAXID from " & table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            item.idcategory = row("MAXID")
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
