Imports eservices_core.com.objects

Namespace com.ado

    Public NotInheritable Class ADOCategory
        Inherits com.database.mysql.MySQLConnectionObj

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

    End Class
End Namespace
