Imports eservices_core.com.objects

Namespace com.ado
    Public Class ADODeparments
        Inherits com.database.mysql.MySQLConnectionObj

        Public Sub GetDeparments(list_deparmentobj As List(Of DeparmentsObj))
            Dim deparment As New DeparmentsObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of DeparmentsObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = deparment
            qbuilder.BuildSelect("tbl_deparments", True)
            qbuilder.AddToQueryParameterForSelect("active=1")
            qbuilder.AddOrderByField("DeparmentName")
            Try
                OpenDB("DB-EWEBSERVICES")
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
            qbuilder.BuildSelect("tbl_deparments", True)
            qbuilder.AddToQueryParameterForSelect("idDeparment=" & DeparmentObj.idDeparment)
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

    End Class
End Namespace
