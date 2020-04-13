Imports eservices_core.com.objects
Namespace com.ado
    Public Class ADOModulesMenus
        Inherits com.database.mysql.MySQLConnectionObj

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
            qbuilder.AddToQueryParameterForSelect("frontui=" & frontui & "")
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
            qbuilder.AddToQueryParameterForSelect("frontui=" & frontui & "")
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


    End Class
End Namespace
