Imports socmobile_core.com.objects
Imports eservices_core.com.database

Namespace com.ado.ole
    Public Class ADOUsuarios
        Inherits eservices_core.com.database.ole.OleDBConnectionObj

        Public Sub GetUserNames(list_users As Dictionary(Of String, UsuariosObj))
            Dim Usuario As New UsuariosObj
            Usuario.Empleado_ID = -7
            Usuario.Nombre = "-7"

            Dim qbuilder As New QueryBuilder(Of UsuariosObj)
            qbuilder.TypeQuery = TypeQuery.SelectInfo
            qbuilder.Entity = Usuario
            qbuilder.BuildSelect("ctgEmpleados")
            Try
                OpenDB("DB-USUARIOS")
                SetCommand(qbuilder.Query)
                SetDataAdapter()
                Dim dts As New DataSet
                connection.Adap.Fill(dts)
                If dts.Tables.Count > 0 Then
                    If dts.Tables(0).Rows.Count > 0 Then
                        For Each row As DataRow In dts.Tables(0).Rows
                            Dim newusuario As New UsuariosObj
                            newusuario.Empleado_ID = row("Empleado_ID")
                            newusuario.Nombre = row("Nombre")

                            list_users.Add(newusuario.Nombre & "-" & newusuario.Empleado_ID, newusuario)
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
