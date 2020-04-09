Imports eservices_core.com.objects
Namespace com.ado
    Public NotInheritable Class ADOWorkUnit
        Inherits com.database.mysql.MySQLConnectionObj

        Public Sub GetWorkUnits(listofUnitsObj As List(Of WorkUnitObj))
            Dim workuntiobj As New WorkUnitObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of WorkUnitObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = workuntiobj
            qbuilder.BuildSelect("tbl_workunit", True)
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
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of WorkUnitObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = WorkUnitObj
            qbuilder.BuildSelect("tbl_workunit", True)
            qbuilder.AddToQueryParameterForSelect("idWorkUnit=" & WorkUnitObj.idWorkUnit)
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
    End Class
End Namespace