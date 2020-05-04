Imports eservices_core.com.objects
Imports eservices_core.com.interface

Namespace com.ado
    Public Class ADOModulesMenus
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of ModuleObj)

        Private Const table_modules As String = "tbl_modules"
        Private Const table_menus As String = "tbl_menus"
        Private Const Database As String = "DB-EWEBSERVICES"


        Public Sub AddModule(ModuleObj As ModuleObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of ModuleObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = ModuleObj
            qbuilder.BuildInsert(table_modules)
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub
        Public Sub AddMenu(MenuObj As MenuObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of MenuObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = MenuObj
            qbuilder.BuildInsert(table_menus)
            Try
                OpenDB(Database)
                SetCommand(qbuilder.Query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub
        Private Sub GetLastIDModule(ModuleObj As ModuleObj)
            Try
                OpenDB(Database)
                SetCommand("select max(id_module) as MAXID from " & table_modules)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            ModuleObj.id_module = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub
        Private Sub GetLastIDMenu(MenuObj As MenuObj)
            Try
                OpenDB(Database)
                SetCommand("select max(id_menu) as MAXID from " & table_menus)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            MenuObj.id_menu = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub
        Public Sub GetModulesMenusByProfile(ProfileObj As ProfileObj, Optional frontui As Boolean = False)
            Dim ModuleList As New Dictionary(Of Integer, ModuleObj)
            Try
                OpenDB(Database)
                SetCommand("select id_module,id_menu from rel_profiles_modules_menus where idprofile=" & ProfileObj.idprofile)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim new_module As ModuleObj
                            If Not IsDBNull(row("id_module")) And Not ModuleList.ContainsKey(row("id_module")) Then
                                new_module = New ModuleObj
                                new_module.id_module = row("id_module")
                                GetModuleByID(new_module, frontui)
                                ModuleList.Add(new_module.id_module, new_module)
                            End If
                            If Not IsDBNull(row("id_menu")) And row("id_menu") > 0 Then
                                Dim new_menu As New MenuObj
                                new_menu.id_menu = row("id_menu")
                                GetMenuByID(new_menu, frontui)
                                If IsNothing(ModuleList.Item(row("id_module")).MenuList) Then
                                    ModuleList.Item(row("id_module")).MenuList = New List(Of MenuObj)
                                End If
                                ModuleList.Item(row("id_module")).MenuList.Add(new_menu)
                            End If
                        Next
                    End If
                End If
                ProfileObj.Modules = ModuleList
            Catch ex As Exception
                Throw
            Finally
                CloseDB()

            End Try
        End Sub

        Public Sub GetModuleByID(ModuleObj As ModuleObj, Optional frontui As Boolean = False)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of ModuleObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = ModuleObj
            qbuilder.BuildSelect(table_modules, True)
            qbuilder.AddToQueryParameterForSelect("id_module=" & ModuleObj.id_module & "")
            Dim frontui_val As Integer = 0
            If frontui Then
                frontui_val = 1
            End If
            qbuilder.AddToQueryParameterForSelect("frontui=" & frontui_val.ToString & "")
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
                                    ModuleObj.GetType.GetProperty(column.ColumnName).SetValue(ModuleObj, row(column.ColumnName), Nothing)
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
        Public Sub GetMenuByID(MenuObj As MenuObj, Optional frontui As Boolean = False)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of MenuObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = MenuObj
            qbuilder.BuildSelect(table_menus, True)
            qbuilder.AddToQueryParameterForSelect("id_menu=" & MenuObj.id_menu & "")
            Dim frontui_val As Integer = 0
            If frontui Then
                frontui_val = 1
            End If
            qbuilder.AddToQueryParameterForSelect("frontui=" & frontui_val.ToString & "")
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
                                    MenuObj.GetType.GetProperty(column.ColumnName).SetValue(MenuObj, row(column.ColumnName), Nothing)
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


        Public Sub Add(item As ModuleObj) Implements IADORepository(Of ModuleObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            AddModule(item)

        End Sub

        Public Sub Delete(item As ModuleObj) Implements IADORepository(Of ModuleObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & table_modules & " where id_module=" & item.id_module)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of ModuleObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & table_modules & " where id_module=" & id.ToString)
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

        Public Function GetById(id As Integer) As ModuleObj Implements IADORepository(Of ModuleObj).GetById
            Dim ModuleObj As New ModuleObj
            ModuleObj.id_module = id
            GetModuleByID(ModuleObj)
            Return ModuleObj
        End Function

        Public Function GetLastId() As ModuleObj Implements IADORepository(Of ModuleObj).GetLastId
            Dim ModuleObj As New ModuleObj
            GetLastIDModule(ModuleObj)
            Return ModuleObj
        End Function

        Public Sub GetLastId(item As ModuleObj) Implements IADORepository(Of ModuleObj).GetLastId
            GetLastId(item)
        End Sub
    End Class
End Namespace
