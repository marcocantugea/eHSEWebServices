Imports System.Collections.Generic
Imports System

Namespace com.interface
    Public Interface IADORepository(Of TEntity)

        Sub Add(item As TEntity)
        Sub Delete(item As TEntity)
        Function GetById(id As Integer) As TEntity
        Function Exist(id As Integer) As Boolean
        Function GetLastId() As TEntity
        Sub GetLastId(item As TEntity)
        Sub Update(item As TEntity)

        'Function Exist(query As Func(Of TEntity, Boolean)) As Boolean
        'Function FindBy(query As Func(Of TEntity, Boolean)) As ICollection(Of TEntity)

    End Interface
End Namespace
