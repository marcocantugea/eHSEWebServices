Imports eservices_core.com.database

Namespace com.ado.ole

    Public Class ADOTRA
        Inherits eservices_core.com.database.OleDBConnectionObj


        Public Sub SaveTRA(TRAObject As com.objects.TRAObj)
            'Save TRA Header
            Try
                If TRAObject.tra_ID > 0 Then
                    ''updatemetod
                    Try
                        UpdateTRAHeader(TRAObject)
                        If Not IsNothing(TRAObject.traTasks) Then
                            If TRAObject.traTasks.Count > 0 Then
                                DeleteTRATask(TRAObject)

                                For Each Task As etra.com.objects.TRATaskObj In TRAObject.traTasks
                                    Task.tra_ID = TRAObject.tra_ID
                                    SaveTRATasks(Task)
                                    GetLastIDTRATask(Task)
                                Next
                                '    If Task.traR_Id > 0 Then
                                '        Try
                                '            If ExistTRATask(Task) Then
                                '                UpdateTRATasks(Task)
                                '            Else
                                '                SaveTRATasks(Task)
                                '            End If

                                '        Catch ex As Exception
                                '            Throw
                                '        End Try
                                '    Else
                                '        Try
                                '            If ExistTRATask(Task) Then
                                '                UpdateTRATasks(Task)
                                '            Else
                                '                SaveTRATasks(Task)
                                '            End If
                                '        Catch ex As Exception

                                '        End Try

                                '    End If
                                'Next
                            End If
                        End If

                    Catch ex As Exception
                        Throw
                    End Try


                Else
                    GetLastIDTRA(TRAObject)
                    TRAObject.tra_ID = TRAObject.tra_ID + 1
                    SaveTRAHeader(TRAObject)
                    'get the ID
                    GetLastIDTRA(TRAObject)

                    'save tasks
                    Try
                        If Not IsNothing(TRAObject.traTasks) Then
                            If TRAObject.traTasks.Count > 0 Then
                                For Each Task As com.objects.TRATaskObj In TRAObject.traTasks
                                    Task.tra_ID = TRAObject.tra_ID
                                    Try
                                        SaveTRATasks(Task)
                                        GetLastIDTRATask(Task)
                                    Catch ex As Exception
                                        Throw
                                    End Try
                                Next
                            End If
                        End If
                    Catch ex As Exception
                        Throw
                    End Try
                End If
            Catch ex As Exception
                Throw
            End Try
        End Sub

        Private Sub SaveTRAHeader(TRAObject As com.objects.TRAObj)
            Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = TRAObject
            qbuilder.BuildInsert("traRecords")

            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub UpdateTRAHeader(TRAObject As com.objects.TRAObj)
            Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
            qbuilder.TypeQuery = TypeQuery.Update
            qbuilder.Entity = TRAObject
            qbuilder.BuildUpdate("traRecords", "tra_ID", TRAObject.tra_ID.ToString)

            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub SaveTRATasks(TaskObj As com.objects.TRATaskObj)
            Dim qbuilder As New QueryBuilder(Of com.objects.TRATaskObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = TaskObj
            qbuilder.BuildInsert("traTasks")

            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Private Sub UpdateTRATasks(TaskObj As com.objects.TRATaskObj)
            Dim qbuilder As New QueryBuilder(Of com.objects.TRATaskObj)
            qbuilder.TypeQuery = TypeQuery.Update
            qbuilder.Entity = TaskObj
            qbuilder.BuildUpdate("traTasks", "traR_ID", TaskObj.traR_Id.ToString)

            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Private Function getTRATaskCount(TRAObj As com.objects.TRAObj) As Integer
            Dim result As Integer = -1
            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("select count(traR_ID) as CountID from traTasks where tra_ID=" & TRAObj.tra_ID.ToString, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("CountID")) Then
                                result = Integer.Parse(row("CountID"))
                            End If
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
            Return result
        End Function

        Private Function ExistTRATask(Task As com.objects.TRATaskObj) As Boolean
            Dim result As Boolean = False
            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("select count(1) as CountID from traTasks where tra_ID=" & Task.tra_ID.ToString & " and traR_Consecutivo=" & Task.traR_Consecutivo.ToString, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("CountID")) Then
                                Try
                                    Dim db_value As Boolean = Boolean.Parse(row("CountID"))
                                    If db_value Then
                                        result = True
                                    End If
                                Catch ex As Exception

                                End Try
                            End If
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
            Return result
        End Function

        Private Sub DeleteTRATask(TRAObj As com.objects.TRAObj)

            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("delete from traTasks where tra_id=" & TRAObj.tra_ID.ToString, connection.Connection)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Private Sub GetLastIDTRATask(TaskObj As com.objects.TRATaskObj)
            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("select max(traR_ID) as MAXID from traTasks", connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            TaskObj.traR_Id = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub GetLastIDTRA(TRAObject As com.objects.TRAObj)
            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("select max(tra_ID) as MAXID from traRecords", connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            TRAObject.tra_ID = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub GetTRABy(fields As com.objects.TRAObj, listoftra As List(Of com.objects.TRAObj), Optional searchoption As String = "")
            Try
                OpenDB("DB-RSTC")
                Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = fields
                qbuilder.BuildSelect("traRecords", True)
                If Not searchoption.Equals("") Then
                    qbuilder.AddToQueryParameterForSelect(searchoption)
                End If

                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim tra_found As New etra.com.objects.TRAObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    tra_found.GetType.GetProperty(column.ColumnName).SetValue(tra_found, row(column.ColumnName), Nothing)
                                End If
                            Next
                            listoftra.Add(tra_found)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetTRAsByDeparment(fiedls As com.objects.TRAObj, deparment As com.objects.TRADeparment, TRAsFound As List(Of com.objects.TRAObj), Optional searchoptions As String = "")
            Try
                OpenDB("DB-RSTC")
                Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = fiedls
                qbuilder.AddToQueryParameterForSelect("tra_Dept='" & deparment.cDep_Name & "' and (tra_Status='Authority' or tra_Status='Oficial')")
                qbuilder.BuildSelect("traRecords")

                If Not searchoptions.Equals("") Then
                    qbuilder.AddToQueryParameterForSelect(searchoptions)
                End If

                Dim table_cam As List(Of String) = qbuilder.Fields
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim tra_found As New com.objects.TRAObj
                            For Each c As String In table_cam
                                If Not IsDBNull(row(c)) Then
                                    tra_found.GetType.GetProperty(c).SetValue(tra_found, row(c), Nothing)
                                End If
                            Next
                            TRAsFound.Add(tra_found)
                        Next
                    End If
                End If
                dts = Nothing
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetTRAbyPIN(TRAObj As com.objects.TRAObj)
            Try
                OpenDB("DB-RSTC")
                Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = TRAObj
                qbuilder.AddToQueryParameterForSelect("pin_save=" & TRAObj.pin_save)
                qbuilder.BuildSelect("traRecords", True)

                Dim table_cam As List(Of String) = qbuilder.Fields
                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            For Each c As String In table_cam
                                If Not IsDBNull(row(c)) Then
                                    TRAObj.GetType.GetProperty(c).SetValue(TRAObj, row(c), Nothing)
                                End If
                            Next
                        Next
                    End If
                End If
                dts = Nothing
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetDeparmentsName(Departments As List(Of com.objects.TRADeparment))
            Try
                OpenDB("DB-RSTC")

                connection.Command = New OleDb.OleDbCommand("select cDep_Id,cDep_name from ctgDepartTRA where cDep_id>1", connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim dep As New com.objects.TRADeparment
                            dep.cDep_Id = row("cDep_Id")
                            dep.cDep_Name = row("cDep_name")
                            Departments.Add(dep)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetTRAbyID(TRAObj As com.objects.TRAObj)

            Try
                OpenDB("DB-RSTC")
                Dim qbuilder As New QueryBuilder(Of com.objects.TRAObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = TRAObj
                qbuilder.AddToQueryParameterForSelect("tra_ID=" & TRAObj.tra_ID.ToString)
                qbuilder.BuildSelect("traRecords", True)

                Dim table_cam As List(Of String) = qbuilder.Fields

                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            For Each c As String In table_cam
                                If Not IsDBNull(row(c)) Then
                                    TRAObj.GetType.GetProperty(c).SetValue(TRAObj, row(c), Nothing)
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

        Public Sub GetTRAActivities(tra_id As Integer, list_TRATask As List(Of com.objects.TRATaskObj))
            Dim traTask As New com.objects.TRATaskObj
            Try
                OpenDB("DB-RSTC")
                Dim qbuilder As New QueryBuilder(Of com.objects.TRATaskObj)
                qbuilder.TypeQuery = TypeQuery.SelectInfo
                qbuilder.Entity = traTask
                qbuilder.AddToQueryParameterForSelect("tra_ID=" & tra_id)
                qbuilder.BuildSelect("traTasks", True)

                Dim table_cam As List(Of String) = qbuilder.Fields

                connection.Command = New OleDb.OleDbCommand(qbuilder.Query, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim task_found As New com.objects.TRATaskObj
                            For Each c As String In table_cam
                                If Not IsDBNull(row(c)) Then
                                    task_found.GetType.GetProperty(c).SetValue(task_found, row(c), Nothing)
                                End If
                            Next
                            list_TRATask.Add(task_found)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function DuplicatePIN(pin As Integer) As Boolean
            Dim duplicated As Boolean = False
            Try
                OpenDB("DB-RSTC")
                connection.Command = New OleDb.OleDbCommand("select count(1) as CPIN from traRecords where pin_save=" & pin.ToString, connection.Connection)
                connection.Adap = New OleDb.OleDbDataAdapter(connection.Command)
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("CPIN")) Then
                                Dim res As Integer = Integer.Parse(row("CPIN"))
                                If res > 0 Then
                                    duplicated = True
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

            Return DuplicatePIN
        End Function

    End Class
End Namespace