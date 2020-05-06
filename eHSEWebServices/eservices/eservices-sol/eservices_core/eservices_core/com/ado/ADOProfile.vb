Imports eservices_core.com.objects
Imports eservices_core.com.interface
Imports eservices_core.com.database

Namespace com.ado
    Public NotInheritable Class ADOProfile
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of ProfileObj)

        Private Const Table As String = "tbl_profiles"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub GetProfiles(list_profiles As List(Of ProfileObj))
            Dim ProfileObj As New com.objects.ProfileObj

            Dim qbuilder As New QueryBuilder(Of ProfileObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = ProfileObj
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
            Dim qbuilder As New QueryBuilder(Of ProfileObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = ProfileObj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("idprofile=" & ProfileObj.idprofile)
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

        Public Function GetAccessDeparments(userid As Integer) As List(Of Integer)
            Dim resultlist As List(Of Integer)
            Try
                OpenDB(Database)
                SetCommand("SELECT idDeparment from rel_supervisor_deparment where userid=" & userid.ToString)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        resultlist = New List(Of Integer)
                        For Each row As DataRow In dts.Tables(0).Rows
                            resultlist.Add(row("idDeparment"))
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()
            End Try
            Return resultlist
        End Function

        Public Sub Add(item As ProfileObj) Implements IADORepository(Of ProfileObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of ProfileObj)
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

        Public Sub Delete(item As ProfileObj) Implements IADORepository(Of ProfileObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & Table & " where idcategory=" & item.idprofile)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of ProfileObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where idprofile=" & id.ToString)
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

        Public Function GetById(id As Integer) As ProfileObj Implements IADORepository(Of ProfileObj).GetById
            If id <= 0 Then
                Return Nothing
            End If
            Dim ProfileObj As New ProfileObj
            ProfileObj.idprofile = id
            GetProfileById(ProfileObj)
            Return ProfileObj
        End Function

        Public Function GetLastId() As ProfileObj Implements IADORepository(Of ProfileObj).GetLastId
            Dim ProfileObj As New ProfileObj
            GetLastId(ProfileObj)
            Return ProfileObj
        End Function

        Public Sub GetLastId(item As ProfileObj) Implements IADORepository(Of ProfileObj).GetLastId
            Try
                OpenDB(Database)
                SetCommand("select max(idDocument) as MAXID from " & Table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            item.idprofile = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub Update(item As ProfileObj) Implements IADORepository(Of ProfileObj).Update
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                Dim qbuilder As New QueryBuilder(Of ProfileObj)
                qbuilder.TypeQuery = TypeQuery.Update
                qbuilder.Entity = item
                qbuilder.BuildUpdate(Table, "idprofile=" & item.idprofile)
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
