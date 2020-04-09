Namespace com.database
    Public Interface DatabaseInterface

        Sub OpenDB(ByVal DB As String)
        Sub CreateConnection(ByVal ConnectionName As String, ByVal DatabaseToOpen As String)
        Sub CloseDB()
        Sub CloseDB(ByVal DB As String)
        Sub setCommand(Query As String)

        Sub setDataAdapter()


    End Interface
End Namespace