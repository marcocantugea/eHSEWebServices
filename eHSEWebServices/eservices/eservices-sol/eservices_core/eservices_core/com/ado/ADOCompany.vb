Imports eservices_core.com.objects
Imports eservices_core.com.interface

Namespace com.ado
    Public NotInheritable Class ADOCompany
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of CompanyObj)

        Private Const Table As String = "tbl_company"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub GetAllCompanies(CompanyList As List(Of com.objects.CompanyObj))
            Dim companyobj As New com.objects.CompanyObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = companyobj
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
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("idCompany=" & CompanyObj.idCompany)
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

        Public Sub Add(item As CompanyObj) Implements IADORepository(Of CompanyObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of CompanyObj)
                qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
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

        Public Sub Delete(item As CompanyObj) Implements IADORepository(Of CompanyObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If
            Try
                OpenDB(Database)
                SetCommand("DELETE * FROM " & Table & " WHERE idCompany=" & item.idCompany)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of CompanyObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where idCompany=" & id)
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

        Public Function GetById(id As Integer) As CompanyObj Implements IADORepository(Of CompanyObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim company As New CompanyObj
            company.idCompany = id
            GetCompanyByID(company)
            Return company
        End Function

        Public Function GetLastId() As CompanyObj Implements IADORepository(Of CompanyObj).GetLastId
            Dim company As New CompanyObj
            GetLastId(company)
            Return company
        End Function

        Public Sub GetLastId(item As CompanyObj) Implements IADORepository(Of CompanyObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idDocument) as MAXID from " & Table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            item.idCompany = row("MAXID")
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