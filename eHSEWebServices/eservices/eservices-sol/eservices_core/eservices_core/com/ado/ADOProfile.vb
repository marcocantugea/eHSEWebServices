Imports eservices_core.com.objects

Namespace com.ado
    Public NotInheritable Class ADOProfile
        Inherits com.database.mysql.MySQLConnectionObj

        Public Sub GetProfiles(list_profiles As List(Of ProfileObj))
            Dim ProfileObj As New com.objects.ProfileObj

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of ProfileObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = ProfileObj
            qbuilder.BuildSelect("tbl_profiles", True)
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
                            Dim new_profile As New ProfileObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    new_profile.GetType.GetProperty(column.ColumnName).SetValue(new_profile, row(column.ColumnName), Nothing)
                                End If
                            Next
                            list_profiles.Add(new_profile)
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetProfileById(ProfileObj As ProfileObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of ProfileObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = ProfileObj
            qbuilder.BuildSelect("tbl_profiles", True)
            qbuilder.AddToQueryParameterForSelect("idprofile=" & ProfileObj.idprofile)
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
                                    ProfileObj.GetType.GetProperty(column.ColumnName).SetValue(ProfileObj, row(column.ColumnName), Nothing)
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
