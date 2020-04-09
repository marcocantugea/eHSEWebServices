Imports eservices_core.com.objects

Namespace com.ado
    Public NotInheritable Class ADOCompany
        Inherits com.database.mysql.MySQLConnectionObj

        Public Sub GetAllCompanies(CompanyList As List(Of com.objects.CompanyObj))
            Dim companyobj As New com.objects.CompanyObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = companyobj
            qbuilder.BuildSelect("tbl_company", True)
            qbuilder.AddToQueryParameterForSelect("active=1")
            Try
                OpenDB("DB-EWEBSERVICES")
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim new_companyobj As New com.objects.CompanyObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    new_companyobj.GetType.GetProperty(column.ColumnName).SetValue(new_companyobj, row(column.ColumnName), Nothing)
                                End If
                            Next
                            CompanyList.Add(new_companyobj)
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()

            End Try
        End Sub

        Public Sub GetCompanyByID(CompanyObj As CompanyObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = CompanyObj
            qbuilder.BuildSelect("tbl_company", True)
            qbuilder.AddToQueryParameterForSelect("idCompany=" & CompanyObj.idCompany)
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
                                    CompanyObj.GetType.GetProperty(column.ColumnName).SetValue(CompanyObj, row(column.ColumnName), Nothing)
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
    End Class
End Namespace