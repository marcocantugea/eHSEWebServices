﻿Namespace com.ado
    Public NotInheritable Class ADOUserUtilities
        Inherits com.database.ole.OleDBConnectionObj

        Public Sub GetEmployeeNumberList(list_emp As Dictionary(Of String, String))
            Try
                OpenDB("DB-InfoCompany")
                SetCommand("select employee_num,Name,Last_name from tbl_employee_nums")
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row(0)) And Not IsDBNull(row(1)) And Not IsDBNull(row(2)) Then
                                Dim name As String = row(1).ToString.ToUpper & " " & row(2).ToString.ToUpper
                                Dim emp_num As String = row(0)
                                list_emp.Add(name, emp_num)
                            End If
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