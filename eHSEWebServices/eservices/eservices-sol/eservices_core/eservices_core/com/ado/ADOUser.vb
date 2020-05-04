Imports eservices_core.com.interface
Imports eservices_core.com.objects
Imports MySql.Data.MySqlClient

Namespace com.ado
    Public NotInheritable Class ADOUser
        Inherits com.database.mysql.MySQLConnectionObj
        Implements IADORepository(Of UserObj)

        Private Const Table As String = "tbl_userslogin"
        Private Const TableInfoUser As String = "tbl_infouser"
        Private Const TableInfoCompany As String = "tbl_userinfocompany"
        Private Const Database As String = "DB-EWEBSERVICES"

        Public Sub RegisterUser(UserObj As UserObj)
            If Not IsNothing(UserObj) Then

                'salva la info de usuario general
                If Not IsNothing(UserObj.InfoUserObj) Then
                    Try
                        If Not ValidateRecordInfoUser(UserObj.InfoUserObj) And Not ValidateRecordUserLogin(UserObj) Then
                            AddUserInfo(UserObj.InfoUserObj)
                            GetUserInfoLastID(UserObj.InfoUserObj)
                            UserObj.idInfoUser = UserObj.InfoUserObj.idInfoUser
                        Else
                            Throw New Exception("ERROR:FULLNAMEDUPLICATED:User Name is already registered")
                        End If

                    Catch ex As Exception
                        Throw
                    End Try
                End If

                If Not IsNothing(UserObj.UserInfoCompanyObj) Then
                    Try
                        If Not ValidateRecordUserLogin(UserObj) Then
                            AddUserInfoCompany(UserObj.UserInfoCompanyObj)
                            GetUserInfoCompanyLastID(UserObj.UserInfoCompanyObj)
                            UserObj.idinfocompany = UserObj.UserInfoCompanyObj.idinfocompany
                        Else
                            Throw New Exception("ERROR:LOGINDUPLICATED:User Name is already registered")
                        End If

                    Catch ex As Exception
                        Throw
                    End Try
                End If

                'salva la informacion de login
                Try
                    If Not ValidateRecordUserLogin(UserObj) Then
                        AddUserLogin(UserObj)
                        GetUserLastID(UserObj)
                    Else
                        Throw New Exception("ERROR:LOGINDUPLICATED:User Name is already registered")
                    End If

                Catch ex As Exception
                    Throw New Exception("ERROR:LOGINDUPLICATED:User Name is already registered")
                End Try

            End If

        End Sub

        Public Sub LoginUser(UserObj As UserObj)
            Try
                GetLogin(UserObj)
                If UserObj.userid > -1 Then
                    GetUserByID(UserObj)
                    UserObj.Loadinfo()
                Else
                    Throw New Exception("invalid user or password")
                End If
            Catch ex As Exception
                Throw
            End Try
        End Sub

        Private Sub GetLogin(UserObj As UserObj)
            Dim fields As New UserObj
            fields.userid = -7
            fields.user_login = "-7"
            fields.user_pwd = "-7"

            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = fields
            qbuilder.BuildSelect(Table)
            qbuilder.AddToQueryParameterForSelect("user_login='" & UserObj.user_login & "' and user_pwd='" & UserObj.user_pwd & "'")
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
                                    UserObj.GetType.GetProperty(column.ColumnName).SetValue(UserObj, row(column.ColumnName), Nothing)
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

        Private Sub AddUserLogin(UserObj As UserObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = UserObj
            qbuilder.BuildInsert(Table)
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

        Private Sub AddUserInfo(InfoUserObj As InfoUserObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of InfoUserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = InfoUserObj
            qbuilder.BuildInsert(Table)
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

        Private Sub AddUserInfoCompany(UserInfoCompany As UserInfoCompanyObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserInfoCompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = UserInfoCompany
            qbuilder.BuildInsert(Table)
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

        Private Sub AddUserSignature(eSignatureObj As eSignatureObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of eSignatureObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = eSignatureObj
            qbuilder.BuildInsert(Table)
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

        Private Sub GetUserLastID(UserObj As UserObj)
            Try
                OpenDB(Database)
                SetCommand("select max(userid) as MAXID from " & Table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            UserObj.userid = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub GetUserInfoLastID(InfoUserObj As InfoUserObj)
            Try
                OpenDB(Database)
                SetCommand("select max(idInfoUser) as MAXID from " & TableInfoUser)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            InfoUserObj.idInfoUser = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Sub GetUserInfoCompanyLastID(InfoCompanyUserObj As UserInfoCompanyObj)
            Try
                OpenDB(Database)
                SetCommand("select max(idinfocompany) as MAXID from " & TableInfoCompany)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            InfoCompanyUserObj.idinfocompany = row("MAXID")
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try

        End Sub

        Private Function ValidateRecordUserLogin(UserObj As UserObj) As Boolean
            Dim exist As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as CountVal from " & Table & " where user_login='" & UserObj.user_login & "'")
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Try
                                If Not IsDBNull(row(0)) Then
                                    exist = row(0)
                                End If
                            Catch ex As Exception
                                Throw
                            End Try
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
            Return exist
        End Function

        Private Function ValidateRecordInfoUser(InfoUserObj As InfoUserObj) As Boolean
            Dim exist As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as CountVal from " & Table & " where UPPER(nombre)='" & InfoUserObj.Nombre.ToUpper & "' and UPPER(apellido_pat)='" & InfoUserObj.apellido_pat.ToUpper & "' and UPPER(apellido_mat)='" & InfoUserObj.apellido_mat.ToUpper & "'")
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Try
                                If Not IsDBNull(row(0)) Then
                                    exist = row(0)
                                End If
                            Catch ex As Exception
                                Throw
                            End Try
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
            Return exist
        End Function

        Public Sub GetUserByID(UserObj As UserObj)
            Try
                'load user login
                getUserLoginByID(UserObj)
                'load user info
                UserObj.InfoUserObj = New InfoUserObj
                GetUserInfoByID(UserObj.InfoUserObj, UserObj.idInfoUser)
                'load user company info
                UserObj.UserInfoCompanyObj = New UserInfoCompanyObj
                getCompanyUserInfoByID(UserObj.UserInfoCompanyObj, UserObj.idinfocompany)
            Catch ex As Exception
                Throw
            End Try

        End Sub

        Private Sub getUserLoginByID(UserObj As UserObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = UserObj
            qbuilder.BuildSelect(Table, True)
            qbuilder.AddToQueryParameterForSelect("userid=" & UserObj.userid & "")
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
                                    UserObj.GetType.GetProperty(column.ColumnName).SetValue(UserObj, row(column.ColumnName), Nothing)
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

        Public Sub GetUserInfoByID(InfoUserObj As InfoUserObj)
            GetUserInfoByID(InfoUserObj, InfoUserObj.idInfoUser)
        End Sub

        Private Sub getUserInfoByID(InfoUserObj As InfoUserObj, idinfouser As Integer)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of InfoUserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = InfoUserObj
            qbuilder.BuildSelect(TableInfoUser, True)
            qbuilder.AddToQueryParameterForSelect("idInfoUser=" & idinfouser & "")
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
                                    InfoUserObj.GetType.GetProperty(column.ColumnName).SetValue(InfoUserObj, row(column.ColumnName), Nothing)
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

        Public Sub GetIUserInfoCompanyByID(InfoCompany As UserInfoCompanyObj)
            getCompanyUserInfoByID(InfoCompany, InfoCompany.idinfocompany)
        End Sub

        Private Sub getCompanyUserInfoByID(UserInfoCompanyObj As UserInfoCompanyObj, idinfocompany As Integer)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserInfoCompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.SelectInfo
            qbuilder.Entity = UserInfoCompanyObj
            qbuilder.BuildSelect(TableInfoCompany, True)
            qbuilder.AddToQueryParameterForSelect("idinfocompany=" & idinfocompany & "")
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
                                    UserInfoCompanyObj.GetType.GetProperty(column.ColumnName).SetValue(UserInfoCompanyObj, row(column.ColumnName), Nothing)
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

        Public Sub UpdateUserPass(UserObj As UserObj)
            UpdateUserLogin(UserObj)
        End Sub

        Public Sub UpdateInfoUserCompany(InfoUsesrCompanyObj As UserInfoCompanyObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserInfoCompanyObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = InfoUsesrCompanyObj
            qbuilder.BuildUpdate(TableInfoCompany, "idinfocompany", InfoUsesrCompanyObj.idinfocompany)
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

        Public Sub UpdateUserInfo(Userinfo As InfoUserObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of InfoUserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = Userinfo
            qbuilder.BuildUpdate(TableInfoUser, "idInfoUser", Userinfo.idInfoUser)
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

        Public Sub UpdateUserLogin(UserObj As UserObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of UserObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Update
            qbuilder.Entity = UserObj
            qbuilder.BuildUpdate(Table, "userid", UserObj.userid)
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

        Public Sub Add(item As UserObj) Implements IADORepository(Of UserObj).Add
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            AddUserLogin(item)

        End Sub

        Public Sub Delete(item As UserObj) Implements IADORepository(Of UserObj).Delete
            If IsNothing(item) Then
                Throw New NullReferenceException
            End If

            Try
                OpenDB(Database)
                SetCommand("delete * from " & Table & " where idcategory=" & item.userid)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function Exist(id As Integer) As Boolean Implements IADORepository(Of UserObj).Exist
            Dim existrecord As Boolean = False
            Try
                OpenDB(Database)
                SetCommand("select count(1) as ExistRecord from " & Table & " where userid=" & id.ToString)
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

        Public Function GetById(id As Integer) As UserObj Implements IADORepository(Of UserObj).GetById
            Dim UserObj As New UserObj
            UserObj.userid = id
            GetUserByID(UserObj)
            Return UserObj
        End Function

        Public Function GetLastId() As UserObj Implements IADORepository(Of UserObj).GetLastId
            Dim UserObj As New UserObj
            GetLastId(UserObj)
            Return UserObj
        End Function

        Public Sub GetLastId(item As UserObj) Implements IADORepository(Of UserObj).GetLastId
            GetUserLastID(item)
        End Sub
    End Class
End Namespace
