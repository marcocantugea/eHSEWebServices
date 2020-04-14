Imports socmobile_core.com.objects
Imports eservices_core.com.database
Imports eservices_core.com.objects

Namespace com.ado.ole

    Public NotInheritable Class ADOSOCCard
        Inherits eservices_core.com.database.ole.OleDBConnectionObj

        Private Const table As String = "tblStopCard"
        Private Const database As String = "DB-RSTC"

        Public Sub SaveSOCCard(SOCCardObj As SOCCardObj)
            Dim qbuilder As New QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = TypeQuery.Insert
            qbuilder.Entity = SOCCardObj
            qbuilder.BuildInsert(table)

            Try
                OpenDB(database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub GetSocCardByUserName(InfoUser As InfoUserObj, listofsoccards As List(Of SOCCardObj), Optional initialdate As Date = Nothing, Optional endate As Date = Nothing, Optional FieldsToSelect As SOCCardObj = Nothing)
            Dim listdocuments As List(Of DoclumentObj)

            listdocuments = GetSocCardByUserName(InfoUser, initialdate, endate, FieldsToSelect)

            If Not IsNothing(listdocuments) And listdocuments.Count > 0 Then
                For Each document As DoclumentObj In listdocuments
                    If document.getTypeOfObj.Equals("SOCCardObj") Then
                        Dim found_card As SOCCardObj = CType(document, SOCCardObj)
                        listofsoccards.Add(found_card)
                    End If
                Next
            End If
        End Sub

        Public Function GetSocCardByUserName(InfoUser As InfoUserObj, Optional initialdate As Date = Nothing, Optional endate As Date = Nothing, Optional FieldsToSelect As SOCCardObj = Nothing) As List(Of DoclumentObj)
            Dim listofsoccars As List(Of DoclumentObj)
            Dim SOCCardObj As New SOCCardObj

            Dim qbuilder As New QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = TypeQuery.Insert

            If IsNothing(FieldsToSelect) Then
                qbuilder.Entity = SOCCardObj
                qbuilder.BuildSelect(table, True)
            Else
                qbuilder.Entity = FieldsToSelect
                qbuilder.BuildSelect(table)
            End If



            If InfoUser.apellido_mat.Length > 0 Then
                qbuilder.AddToQueryParameterForSelect("nombre like '%" & InfoUser.Nombre & " " & InfoUser.apellido_pat & " " & InfoUser.apellido_mat & "%'")
            Else
                qbuilder.AddToQueryParameterForSelect("nombre like '%" & InfoUser.Nombre & " " & InfoUser.apellido_pat & "%'")
            End If

            If Not IsNothing(initialdate) And Not IsNothing(endate) Then
                qbuilder.AddToQueryParameterForSelect(" fecha between #" & initialdate.ToString("yyyy-MM-dd") & "# and #" & endate.ToString("yyyy-MM-dd") & "#")
            End If

            qbuilder.AddOrderByField("ID desc")
            Try
                OpenDB(database)

                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        listofsoccars = New List(Of DoclumentObj)
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim soccard As New SOCCardObj
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    soccard.GetType.GetProperty(column.ColumnName).SetValue(soccard, row(column.ColumnName), Nothing)
                                End If
                            Next
                            listofsoccars.Add(soccard)
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

            Return listofsoccars
        End Function

        Public Sub GetSocCardByID(SOCCardObj As SOCCardObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of SOCCardObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = SOCCardObj
            qbuilder.BuildSelect(table, True)
            qbuilder.AddToQueryParameterForSelect("id=" & SOCCardObj.id)
            Try
                OpenDB(database)
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            For Each column As DataColumn In dts.Tables(0).Columns
                                If Not IsDBNull(row(column.ColumnName)) Then
                                    SOCCardObj.GetType.GetProperty(column.ColumnName).SetValue(SOCCardObj, row(column.ColumnName), Nothing)
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