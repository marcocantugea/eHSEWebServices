Imports eservices_core.com.objects
Imports System.Text
Namespace com.ado
    Public Class ADODocument
        Inherits com.database.mysql.MySQLConnectionObj

        Private table As String = "tbl_documents"
        Private database As String = "DB-EWEBSERVICES"
        Private str_fields As New List(Of String)

        Sub New()
            LoadFields()

        End Sub

        Public Sub AddDocument(DocumentObj As DocumentObj)
            Try
                OpenDB(database)
                Dim query As String = GetQueryStr(DocumentObj, TypeQuery.Insert)
                SetCommand(query)
                connection.Command.ExecuteNonQuery()
                getLasID(DocumentObj)
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Sub AddDocumentForApproval(DocumentForApproval As DocumentPendingForApprovalObj)
            Dim qbuilder As New eservices_core.com.database.QueryBuilder(Of DocumentPendingForApprovalObj)
            qbuilder.TypeQuery = eservices_core.com.database.TypeQuery.Insert
            qbuilder.Entity = DocumentForApproval
            qbuilder.BuildInsert("tbl_DocumentsPengindForApproval")
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

        Public Function CheckExistDocumentForApproval(iddocument As Integer) As Boolean
            Dim exist As Boolean = False
            Try
                OpenDB(database)
                Dim query As String
                query = "select count(1) as existrecord from tbl_DocumentsPengindForApproval where iddocument=" & iddocument.ToString
                SetCommand(query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("existrecord")) Then
                                If row("existrecord") >= 1 Then
                                    exist = True
                                End If
                            End If
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            End Try
            Return exist
        End Function

        Private Sub getLasID(DocumentObj As DocumentObj)
            Try
                OpenDB(database)
                SetCommand("select max(idDocument) as MAXID from " & table)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            DocumentObj.setidDocument(row("MAXID"))
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function GetDocumentByID(idDocument As Integer, Optional UserObj As UserObj = Nothing) As Object
            Dim document As Object
            Try
                OpenDB(database)
                Dim query As String
                query = "select " & GetFields() & " from " & table & " where iddocument=" & idDocument.ToString
                SetCommand(query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("TypeOfObj")) Then
                                Dim value() As String = row("TypeOfObj").ToString.Split(".")
                                Dim asm As System.Reflection.Assembly = System.Reflection.Assembly.Load(value(0))
                                If Not IsNothing(asm) Then
                                    document = asm.CreateInstance(row("TypeOfObj"))
                                    Dim doc As DocumentObj = CType(document, DocumentObj)
                                    SetValuesToFields(doc, row)
                                    If IsNothing(UserObj) Then
                                        If Not IsNothing(row("userid")) Then
                                            Dim user As New eservices_core.com.objects.UserObj
                                            user.userid = row("userid")
                                            Dim ADOUser As New ADOUser
                                            ADOUser.GetUserByID(user)
                                            user.Loadinfo()
                                            doc.setCreatedByUserObj(user)
                                        End If
                                    Else
                                        doc.setCreatedByUserObj(UserObj)
                                    End If
                                End If
                            End If
                        Next
                    End If
                End If
            Catch ex As Exception
                Throw
            End Try
            Return document
        End Function

        Public Function GetDocuemntsByUser(UserObj As UserObj, Optional DocumentType As String = Nothing) As SortedList(Of Integer, DocumentObj)
            Dim ListOfOdcuments As New SortedList(Of Integer, DocumentObj)
            Try
                OpenDB(database)
                Dim query As String
                If Not IsNothing(DocumentType) Then
                    query = "select " & GetFields() & " from " & table & " where userid=" & UserObj.userid.ToString & " and TypeOfObj like '%." & DocumentType & "%' order by documentdate"
                Else

                    query = "select " & GetFields() & " from " & table & " where userid=" & UserObj.userid.ToString & " order by documentdate"
                End If

                SetCommand(query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("TypeOfObj")) Then
                                Dim value() As String = row("TypeOfObj").ToString.Split(".")
                                Dim asm As System.Reflection.Assembly = System.Reflection.Assembly.Load(value(0))
                                If Not IsNothing(asm) Then
                                    Dim obj As Object = asm.CreateInstance(row("TypeOfObj"))
                                    Dim doc As DocumentObj = CType(obj, DocumentObj)

                                    SetValuesToFields(doc, row)
                                    doc.setCreatedByUserObj(UserObj)
                                    ListOfOdcuments.Add(row("iddocument"), doc)
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
            Return ListOfOdcuments
        End Function

        Private Function GetQueryStr(DocumentObj As DocumentObj, Type As TypeQuery, Optional where As Dictionary(Of String, String) = Nothing, Optional allfields As Boolean = False) As String
            Return CreateQuery(DocumentObj, Type, where, allfields)
        End Function

        Private Function CreateQuery(DocumentObj As DocumentObj, Type As TypeQuery, Optional Where As Dictionary(Of String, String) = Nothing, Optional allfields As Boolean = False) As String
            Dim query As String = ""

            Dim list_fieldsvalues As New SortedList(Of String, Object)
            'idDocument
            If DocumentObj.getidDocument > -1 Or allfields Then
                list_fieldsvalues.Add("idDocument", DocumentObj.getidDocument)
            End If

            'Document date field
            If (Not IsNothing(DocumentObj.getDocumentDate) And DocumentObj.getDocumentDate.Year > 1) Or allfields Then
                list_fieldsvalues.Add("DocumentDate", DocumentObj.getDocumentDate)
            End If
            'DocumentAprovalByID
            If (Not IsNothing(DocumentObj.getDocumentAprovalByID) And DocumentObj.getDocumentAprovalByID > 0) Or allfields Then
                list_fieldsvalues.Add("DocumentAprovalByID", DocumentObj.getDocumentAprovalByID)
            End If
            'DocumentAprovalDate
            If (Not IsNothing(DocumentObj.getDocumentAprovalDate) And DocumentObj.getDocumentAprovalDate.Year > 1) Or allfields Then
                list_fieldsvalues.Add("DocumentAprovalDate", DocumentObj.getDocumentAprovalDate)
            End If
            'TypeOfObj
            If (Not IsNothing(DocumentObj.getTypeOfObj)) Or allfields Then
                If Not DocumentObj.getTypeOfObj.Equals("") Then
                    list_fieldsvalues.Add("TypeOfObj", DocumentObj.getTypeOfObj)
                End If
            End If
            'IDObjField
            If Not IsNothing(DocumentObj.getIDObjField) Or allfields Then
                If Not DocumentObj.getIDObjField.Equals("") Then
                    list_fieldsvalues.Add("IDObjField", DocumentObj.getIDObjField)
                End If
            End If
            'IdOfDocument
            If (Not IsNothing(DocumentObj.getIdOfDocument) And DocumentObj.getIdOfDocument > 0) Or allfields Then
                If Not IsNothing(DocumentObj.getIdOfDocument) Then
                    list_fieldsvalues.Add("IdOfDocument", DocumentObj.getIdOfDocument)
                Else
                    list_fieldsvalues.Add("IdOfDocument", 0)
                End If

            End If
            'eSignatureFile1
            If Not IsNothing(DocumentObj.geteSignatureFile) Or allfields Then
                If Not IsNothing(DocumentObj.geteSignatureFile) Then
                    list_fieldsvalues.Add("eSignatureFile", DocumentObj.geteSignatureFile)
                Else
                    list_fieldsvalues.Add("eSignatureFile", "")
                End If
            End If
            'userid
            If (Not IsNothing(DocumentObj.getUserID) And DocumentObj.getUserID > 0) Or allfields Then
                list_fieldsvalues.Add("userid", DocumentObj.getUserID)
            End If
            'IdDocumentStatus
            If DocumentObj.getidDocumentStatus > 0 Or allfields Then
                list_fieldsvalues.Add("idDocumentStatus", DocumentObj.getidDocumentStatus)
            End If
            'Locked
            If allfields Then
                list_fieldsvalues.Add("locked", DocumentObj.getLock)
            End If

            Dim fields As New StringBuilder
            Dim values As New StringBuilder
            Dim val_upd As New StringBuilder
            Dim index As Integer = 0

            For Each item As KeyValuePair(Of String, Object) In list_fieldsvalues
                'agrega los campos
                If index > 0 Then
                    fields.Append(",")
                    values.Append(",")
                    val_upd.Append(",")
                End If

                fields.Append(item.Key)

                If Type = TypeQuery.Update Then
                    val_upd.Append(item.Key & "=")
                End If

                'agrega los valores
                Select Case item.Value.GetType.Name
                    Case "String"
                        values.Append("'" & item.Value.ToString & "'")
                        If Type = TypeQuery.Update Then
                            val_upd.Append("'" & item.Value.ToString & "'")
                        End If
                    Case "Int32"
                        values.Append(item.Value.ToString)
                        If Type = TypeQuery.Update Then
                            val_upd.Append(item.Value.ToString)
                        End If
                    Case "Byte"
                        values.Append(item.Value.ToString)
                        If Type = TypeQuery.Update Then
                            val_upd.Append(item.Value.ToString)
                        End If
                    Case "DateTime"
                        values.Append("'" & CType(item.Value, Date).ToString("yyyy-MM-dd") & "'")
                        If Type = TypeQuery.Update Then
                            val_upd.Append("'" & CType(item.Value, Date).ToString("yyyy-MM-dd") & "'")
                        End If
                    Case "Boolean"
                        Dim bol_val As Boolean = CType(item.Value, Boolean)
                        If bol_val Then
                            values.Append("1")
                        Else
                            values.Append("0")
                        End If
                        If Type = TypeQuery.Update Then
                            If bol_val Then
                                val_upd.Append("1")
                            Else
                                val_upd.Append("0")
                            End If
                        End If
                End Select
                index += 1
            Next

            'crear query 
            If Type = TypeQuery.Insert Then
                query = query & " insert into " & table & " (" & fields.ToString & ") values (" & values.ToString & ");"
            End If
            If Type = TypeQuery.SelectInfo Then
                query = query & "Select " & fields.ToString & " from " & table
                If Not IsNothing(Where) Then
                    If Where.Count > 0 Then
                        query = query & " where "
                        Dim str_where As New StringBuilder
                        Dim indexwhere As Integer = 0
                        For Each item As KeyValuePair(Of String, String) In Where
                            If indexwhere > 0 Then
                                str_where.Append(" and ")
                            End If
                            str_where.Append(item.Key & item.Value)
                            indexwhere += 1
                        Next
                        query = query & str_where.ToString
                    End If
                End If
            End If

            If Type = TypeQuery.Update Then

                query = query & "Update " & table & " set " & val_upd.ToString
                If Not IsNothing(Where) Then
                    If Where.Count > 0 Then
                        query = query & " where "
                        Dim str_where As New StringBuilder
                        Dim indexwhere As Integer = 0
                        For Each item As KeyValuePair(Of String, String) In Where
                            If indexwhere > 0 Then
                                str_where.Append(" and ")
                            End If
                            str_where.Append(item.Key & item.Value)
                            indexwhere += 1
                        Next
                        query = query & str_where.ToString
                    End If
                Else
                    If DocumentObj.getidDocument > 0 Then
                        query = query & " where idDocument=" & DocumentObj.getidDocument.ToString
                    Else
                        Throw New Exception("Document id not set")
                    End If
                End If
            End If

            Return query
        End Function

        Public Sub GetDocumentByObject(Document As DocumentObj)
            Try
                OpenDB(database)
                Dim query As String
                Dim where As New Dictionary(Of String, String)
                where.Add("TypeOfObj", "='" & Document.getTypeOfObj & "'")
                where.Add("IDObjField", "='" & Document.getIDObjField & "'")
                where.Add("IdOfDocument", "=" & Document.getIdOfDocument & "")
                query = GetQueryStr(Document, TypeQuery.SelectInfo, where, True)
                SetCommand(query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            If Not IsDBNull(row("iddocument")) Then
                                Document.setidDocument(row("iddocument"))
                            End If

                            If Not IsDBNull(row("documentdate")) Then
                                Document.setDocumentDate(Date.Parse(row("documentdate")))
                            End If

                            If Not IsDBNull(row("DocumentAprovalByID")) Then
                                Document.setDocumentAprovalByID(row("DocumentAprovalByID"))
                            End If

                            If Not IsDBNull(row("DocumentAprovalDate")) Then
                                Document.setDocumentAprovalDate(Date.Parse(row("DocumentAprovalDate")))
                            End If
                            If Not IsDBNull(row("TypeOfObj")) Then
                                Document.setTypeOfObj(row("TypeOfObj"))
                            End If
                            If Not IsDBNull(row("IDObjField")) Then
                                Document.setIDObjField(row("IDObjField"))
                            End If
                            If Not IsDBNull(row("IdOfDocument")) Then
                                Document.setIdOfDocument(row("IdOfDocument"))
                            End If

                            If Not IsDBNull(row("eSignatureFile")) Then
                                Document.seteSignatureFile(row("eSignatureFile"))
                            End If
                            If Not IsDBNull(row("idDocumentStatus")) Then
                                Document.setidDocumentStatus(row("idDocumentStatus"))
                            End If
                            If Not IsDBNull(row("locked")) Then
                                Document.setLock(row("locked"))
                            End If
                            If Not IsDBNull(row("userid")) Then
                                'todo
                                If IsNothing(Document.getCreatedByUserObj()) Then
                                    Document.setCreatedByUserObj(New UserObj())
                                    Document.getCreatedByUserObj().userid = row("userid")
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
        End Sub

        Public Sub LoadFields()
            str_fields.Add("iddocument")
            str_fields.Add("documentdate")
            str_fields.Add("DocumentAprovalByID")
            str_fields.Add("DocumentAprovalDate")
            str_fields.Add("TypeOfObj")
            str_fields.Add("IDObjField")
            str_fields.Add("IdOfDocument")
            str_fields.Add("eSignatureFile")
            str_fields.Add("userid")
            str_fields.Add("idDocumentStatus")
            str_fields.Add("locked")
        End Sub

        Public Function GetFields() As String
            Dim str_b As New StringBuilder()
            Dim index As Integer = 0
            For Each Str As String In str_fields
                If index > 0 Then
                    str_b.Append(",")
                End If
                str_b.Append(Str)

                index += 1
            Next
            Return str_b.ToString
        End Function

        Public Sub SetValuesToFields(doc As DocumentObj, row As DataRow)

            If Not IsDBNull(row("iddocument")) Then
                doc.setidDocument(row("iddocument"))
            End If

            If Not IsDBNull(row("documentdate")) Then
                doc.setDocumentDate(Date.Parse(row("documentdate")))
            End If

            If Not IsDBNull(row("DocumentAprovalByID")) Then
                doc.setDocumentAprovalByID(row("DocumentAprovalByID"))
            End If

            If Not IsDBNull(row("DocumentAprovalDate")) Then
                doc.setDocumentAprovalDate(Date.Parse(row("DocumentAprovalDate")))
            End If
            If Not IsDBNull(row("TypeOfObj")) Then
                doc.setTypeOfObj(row("TypeOfObj"))
            End If
            If Not IsDBNull(row("IDObjField")) Then
                doc.setIDObjField(row("IDObjField"))
            End If
            If Not IsDBNull(row("IdOfDocument")) Then
                doc.setIdOfDocument(row("IdOfDocument"))
            End If

            If Not IsDBNull(row("eSignatureFile")) Then
                doc.seteSignatureFile(row("eSignatureFile"))
            End If

            If Not IsDBNull(row("idDocumentStatus")) Then
                doc.setidDocumentStatus(row("idDocumentStatus"))
            End If

            If Not IsDBNull(row("locked")) Then
                doc.setLock(row("locked"))
            End If


        End Sub

        Public Sub UpdateDocumentStatusforApproval(iddocument As Integer)
            Try
                OpenDB(database)
                Dim query As String = "update " & table & " set iddocumentstatus=2,locked=1 where iddocument=" + iddocument.ToString
                SetCommand(query)
                connection.Command.ExecuteNonQuery()
            Catch ex As Exception
                Throw
            Finally
                CloseDB()
            End Try
        End Sub

        Public Function GetDocumentPendingForSignature(idDeparment As Integer()) As IDictionary(Of Integer, Object)
            Dim ListofValues As New Dictionary(Of Integer, Object)
            Try
                OpenDB("DB-EWEBSERVICES")
                Dim index As Integer = 0
                Dim queryids As String
                For Each i As Integer In idDeparment
                    If index > 0 Then
                        queryids = queryids & ","
                    End If

                    queryids = queryids & i.ToString()

                    index += 1
                Next
                SetCommand("SELECT * from vw_documentsforapproval where idDeparment in (" & queryids & ")")
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim rowvalue As New List(Of Object)
                            For Each colum As DataColumn In dts.Tables(0).Columns
                                Dim rv = New With {Key .Name = colum.ColumnName, Key .Value = row(colum)}
                                rowvalue.Add(rv)
                            Next
                            ListofValues.Add(row("idPendingForApproval"), rowvalue)
                        Next
                    End If
                End If
            Catch ex As Exception
            Finally
                CloseDB()
            End Try
            Return ListofValues
        End Function

    End Class
    Enum TypeQuery
        Insert = 0
        Update = 1
        SelectInfo = 2
    End Enum

    Public Enum DocumentStatus
        Draft = 1
        ForSignature = 2
        Signed = 3
    End Enum
End Namespace
