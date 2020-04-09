﻿
Namespace com.database
    Public Class QueryBuilder(Of T)

        Private _Query As String
        Private _Fields As New List(Of String)
        Private _Values As New List(Of String)
        Private _TypeQuery As Integer
        Private _Entity As T
        Private _OrderByFields As New List(Of String)

        Public ReadOnly Property Fields As List(Of String)
            Get
                Return _Fields
            End Get
        End Property

        Public Property Entity() As T
            Get
                Return _Entity
            End Get
            Set(ByVal value As T)
                _Entity = value
            End Set
        End Property

        Public Property TypeQuery() As TypeQuery
            Get
                Return _TypeQuery
            End Get
            Set(ByVal value As TypeQuery)
                _TypeQuery = value
            End Set
        End Property

        Public ReadOnly Property Query() As String
            Get
                Return _Query
            End Get
        End Property

        Public Sub AddToQueryParameterForSelect(ByVal parameter As String)
            If Not IsNothing(_Query) Then
                If _Query.Contains("where") Then
                    _Query = _Query & " and " & parameter
                Else
                    _Query = _Query & " where " & parameter
                End If
            Else
                _Query = _Query & " where " & parameter
            End If
        End Sub
        Public Sub AddToQueryParameterInsertUpdate(ByVal variable As String, ByVal value As String)
            _Fields.Add(variable)
            _Values.Add(value)
        End Sub

        Public Sub AddOrderByField(fields As String)
            '_OrderByFields.Add(field)

            'If _OrderByFields.Count > 0 Then
            '    Dim index As Integer = 0
            '    Dim orderby As String = " order by "
            '    For Each item As String In _OrderByFields
            '        If index = 0 Then
            '            orderby = orderby & item
            '        Else
            '            orderby = orderby & "," & item
            '        End If
            '    Next
            '    _Query = _Query & orderby
            'End If

            If Not IsNothing(_Query) Then
                If Not _Query.Contains("order by") Then
                    Dim orderby As String = " order by " & fields
                    _Query = Query & orderby
                Else
                    _Query = Query & fields
                End If
            End If

        End Sub

        Public Sub BuildInsert(ByVal Table As String)
            For Each member In _Entity.GetType.GetProperties
                If member.CanRead Then
                    'Read members with values on entity
                    If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                        Select Case member.PropertyType.Name
                            Case "String"
                                If Not member.GetValue(_Entity, Nothing).Equals("") Then
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    v = v.Replace("'", "''")
                                    _Values.Add("'" & v & "'")
                                End If
                            Case "Int32"
                                If CType(member.GetValue(_Entity, Nothing), Integer) > -1 Then
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    _Values.Add(v)
                                End If
                            Case "DateTime"
                                If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                    _Fields.Add(member.Name)
                                    '20-Oct-2018
                                    'Modificado para usar MYSQL
                                    'Dim v As String = member.GetValue(_Entity, Nothing)
                                    '_Values.Add("'" & v & "'")
                                    Dim v As Date = CType(member.GetValue(_Entity, Nothing), Date)
                                    _Values.Add("'" & v.ToString("yyyy-MM-dd") & "'")
                                End If
                            Case "Boolean"
                                'Fix the problem with a false value is entered - 6-Ago-2017
                                'remove if condition to validate if is true value
                                'If CType(member.GetValue(_Entity, Nothing), Boolean) Then

                                '21-Oct-2018
                                'Aconidicionar insert para mysql
                                _Fields.Add(member.Name)
                                Dim v As String = member.GetValue(_Entity, Nothing)
                                If v Then
                                    _Values.Add("1")
                                Else
                                    _Values.Add("0")
                                End If

                                'End If



                        End Select
                    End If
                End If
            Next

            Dim fiels As String
            Dim values As String

            For Each fiel As String In _Fields
                If IsNothing(fiels) Then
                    fiels = fiel
                Else
                    fiels = fiels & "," & fiel
                End If
            Next

            For Each value As String In _Values
                If IsNothing(values) Then
                    values = value
                Else
                    values = values & "," & value
                End If
            Next

            _Query = "insert into " & Table & "(" & fiels & ") values (" & values & ")"

        End Sub

        Public Sub BuildUpdate(ByVal Table As String, ByVal IDParameter As String, ByVal IDValue As String)
            For Each member In _Entity.GetType.GetProperties
                If member.CanRead Then
                    'Read members with values on entity
                    If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                        Select Case member.PropertyType.Name
                            Case "String"
                                If Not member.GetValue(_Entity, Nothing).Equals("") Then
                                    If Not member.Name.Equals(IDParameter) Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = member.GetValue(_Entity, Nothing)
                                        v = v.Replace("'", "''")
                                        _Values.Add("'" & v & "'")
                                    End If
                                Else
                                    If Not member.Name.Equals(IDParameter) Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = ""
                                        v = v.Replace("'", "''")
                                        _Values.Add("'" & v & "'")
                                    End If
                                End If
                            Case "Int32"
                                If Not member.Name.Equals(IDParameter) Then
                                    If CType(member.GetValue(_Entity, Nothing), Integer) > -1 Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = member.GetValue(_Entity, Nothing)
                                        _Values.Add(v)
                                    End If
                                End If
                            Case "DateTime"
                                If Not member.Name.Equals(IDParameter) Then
                                    If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                        _Fields.Add(member.Name)
                                        '20-Oct-2018
                                        'Modificado para usar MYSQL
                                        'Dim v As String = member.GetValue(_Entity, Nothing)
                                        '_Values.Add("'" & v & "'")
                                        Dim v As Date = CType(member.GetValue(_Entity, Nothing), Date)
                                        _Values.Add("'" & v.ToString("yyyy-MM-dd") & "'")
                                    End If
                                End If
                            Case "Boolean"
                                If Not member.Name.Equals(IDParameter) Then
                                    'Fix the problem with a false value is entered - 6-Ago-2017
                                    'If CType(member.GetValue(_Entity, Nothing), Boolean) Then
                                    'remove if condition to validate if is true value

                                    '21-Oct-2018
                                    'Aconidicionado para Mysql
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    If v Then
                                        _Values.Add("1")
                                    Else
                                        _Values.Add("0")
                                    End If

                                    'End If
                                End If
                        End Select
                    End If
                End If
            Next

            Dim setvalues As String

            Dim valueindex As Integer = 0
            For Each fiel As String In _Fields
                If IsNothing(setvalues) Then
                    setvalues = fiel & "=" & _Values(valueindex)
                Else
                    setvalues = setvalues & "," & fiel & "=" & _Values(valueindex)
                End If
                valueindex += 1
            Next

            _Query = "update " & Table & " set " & setvalues & " where " & IDParameter & "=" & IDValue

        End Sub

        Public Sub BuildUpdate(ByVal Table As String, ByVal IDParameter As String, ByVal IDValue As String, ByVal allowblanks As Boolean)
            For Each member In _Entity.GetType.GetProperties
                If member.CanRead Then
                    'Read members with values on entity
                    If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                        Select Case member.PropertyType.Name
                            Case "String"
                                If Not member.GetValue(_Entity, Nothing).Equals("") Then
                                    If Not member.Name.Equals(IDParameter) Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = member.GetValue(_Entity, Nothing)
                                        v = v.Replace("'", "''")
                                        _Values.Add("'" & v & "'")
                                    End If
                                Else
                                    If Not member.Name.Equals(IDParameter) Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = ""
                                        v = v.Replace("'", "''")
                                        _Values.Add("'" & v & "'")
                                    End If
                                End If
                            Case "Int32"
                                If Not member.Name.Equals(IDParameter) Then
                                    If CType(member.GetValue(_Entity, Nothing), Integer) > -1 Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = member.GetValue(_Entity, Nothing)
                                        _Values.Add(v)
                                    End If
                                End If
                            Case "DateTime"
                                If Not member.Name.Equals(IDParameter) Then
                                    If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                        _Fields.Add(member.Name)
                                        Dim v As String = member.GetValue(_Entity, Nothing)
                                        _Values.Add("'" & v & "'")
                                    End If
                                End If
                            Case "Boolean"
                                If Not member.Name.Equals(IDParameter) Then
                                    'Fix the problem with a false value is entered - 6-Ago-2017
                                    'remove if condition to validate if is true value
                                    'If CType(member.GetValue(_Entity, Nothing), Boolean) Then

                                    '21-Oct-2018
                                    'Acondicionado para mysql
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    If v Then
                                        _Values.Add("1")
                                    Else
                                        _Values.Add("0")
                                    End If

                                    'End If
                                End If
                        End Select
                    End If
                End If
            Next

            Dim setvalues As String

            Dim valueindex As Integer = 0
            For Each fiel As String In _Fields
                If IsNothing(setvalues) Then
                    setvalues = fiel & "=" & _Values(valueindex)
                Else
                    setvalues = setvalues & "," & fiel & "=" & _Values(valueindex)
                End If
                valueindex += 1
            Next

            _Query = "update " & Table & " set " & setvalues & " where " & IDParameter & "=" & IDValue

        End Sub
        Public Sub BuildUpdate(ByVal Table As String, ByVal where As String)
            For Each member In _Entity.GetType.GetProperties
                If member.CanRead Then
                    'Read members with values on entity
                    If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                        Select Case member.PropertyType.Name
                            Case "String"
                                If Not member.GetValue(_Entity, Nothing).Equals("") Then
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    v = v.Replace("'", "''")
                                    _Values.Add("'" & v & "'")
                                End If
                            Case "Int32"
                                If CType(member.GetValue(_Entity, Nothing), Integer) > -1 Then
                                    _Fields.Add(member.Name)
                                    Dim v As String = member.GetValue(_Entity, Nothing)
                                    _Values.Add(v)
                                End If
                            Case "DateTime"
                                If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                    _Fields.Add(member.Name)
                                    '20-Oct-2018
                                    'Modificado para usar MYSQL
                                    'Dim v As String = member.GetValue(_Entity, Nothing)
                                    '_Values.Add("'" & v & "'")
                                    Dim v As Date = CType(member.GetValue(_Entity, Nothing), Date)
                                    _Values.Add("'" & v.ToString("yyyy-MM-dd hh:mm:ss") & "'")
                                End If
                            Case "Boolean"
                                'Fix the problem with a false value is entered - 6-Ago-2017
                                'remove if condition to validate if is true value
                                'If CType(member.GetValue(_Entity, Nothing), Boolean) Then
                                '20-Oct-2018
                                'Modificado para usar MYSQL
                                _Fields.Add(member.Name)
                                Dim v As String = member.GetValue(_Entity, Nothing)
                                If v Then
                                    _Values.Add("1")
                                Else
                                    _Values.Add("0")
                                End If
                                '_Values.Add(v)
                                'End If
                        End Select
                    End If
                End If
            Next

            Dim setvalues As String

            Dim valueindex As Integer = 0
            For Each fiel As String In _Fields
                If IsNothing(setvalues) Then
                    setvalues = fiel & "=" & _Values(valueindex)
                Else
                    setvalues = setvalues & "," & fiel & "=" & _Values(valueindex)
                End If
                valueindex += 1
            Next

            _Query = "update " & Table & " set " & setvalues & " where " & where

        End Sub

        Public Sub BuildSelect(ByVal Table As String)
            For Each member In _Entity.GetType.GetProperties
                If member.CanRead Then
                    'Read members with values on entity
                    If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                        Select Case member.PropertyType.Name
                            Case "String"
                                If member.GetValue(_Entity, Nothing).Equals("-7") Then
                                    _Fields.Add(member.Name)
                                End If
                            Case "Int32"
                                If CType(member.GetValue(_Entity, Nothing), Integer) = -7 Then
                                    _Fields.Add(member.Name)
                                End If
                            Case "DateTime"
                                If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                    _Fields.Add(member.Name)
                                End If
                            Case "Boolean"
                                'If CType(member.GetValue(_Entity, Nothing), Boolean) Then
                                _Fields.Add(member.Name)
                                'End If
                        End Select
                    End If
                End If
            Next

            Dim setselect As String

            For Each fiel As String In _Fields
                If IsNothing(setselect) Then
                    setselect = fiel
                Else
                    setselect = setselect & "," & fiel
                End If
            Next

            If IsNothing(_Query) Then
                _Query = "select " & setselect & " FROM " & Table
            Else
                If _Query.Length > 0 Then
                    Dim g As String
                    g = _Query
                    _Query = "select " & setselect & " FROM " & Table & " " & g
                Else
                    _Query = "select " & setselect & " FROM " & Table
                End If

            End If

           
        End Sub

        Public Sub BuildSelect(ByVal Table As String, Optional allfields As Boolean = False)
            If allfields Then
                For Each member In _Entity.GetType.GetProperties
                    If member.CanRead Then
                        'Read members with values on entity

                        Select Case member.PropertyType.Name
                            Case "String"
                                _Fields.Add(member.Name)
                            Case "Int32"
                                _Fields.Add(member.Name)
                            Case "DateTime"
                                _Fields.Add(member.Name)
                            Case "Boolean"
                                _Fields.Add(member.Name)
                        End Select
                    End If
                Next
            Else
                For Each member In _Entity.GetType.GetProperties
                    If member.CanRead Then
                        'Read members with values on entity
                        If Not IsNothing(member.GetValue(_Entity, Nothing)) Then
                            Select Case member.PropertyType.Name
                                Case "String"
                                    If member.GetValue(_Entity, Nothing).Equals("-7") Then
                                        _Fields.Add(member.Name)
                                    End If
                                Case "Int32"
                                    If CType(member.GetValue(_Entity, Nothing), Integer) = -7 Then
                                        _Fields.Add(member.Name)
                                    End If
                                Case "DateTime"
                                    If Not CType(member.GetValue(_Entity, Nothing), Date).ToString("mmddyyyy").Equals("00010001") Then
                                        _Fields.Add(member.Name)
                                    End If
                                Case "Boolean"
                                    'If CType(member.GetValue(_Entity, Nothing), Boolean) Then
                                    _Fields.Add(member.Name)
                                    'End If
                            End Select
                        End If
                    End If
                Next
            End If


            Dim setselect As String

            For Each fiel As String In _Fields
                If IsNothing(setselect) Then
                    setselect = fiel
                Else
                    setselect = setselect & "," & fiel
                End If
            Next

            If IsNothing(_Query) Then
                _Query = "select " & setselect & " FROM " & Table
            Else
                If _Query.Length > 0 Then
                    Dim g As String
                    g = _Query
                    _Query = "select " & setselect & " FROM " & Table & " " & g
                Else
                    _Query = "select " & setselect & " FROM " & Table
                End If

            End If

           


        End Sub

    End Class

    Public Enum TypeQuery
        Insert = 0
        Update = 1
        SelectInfo = 2
    End Enum
End Namespace
