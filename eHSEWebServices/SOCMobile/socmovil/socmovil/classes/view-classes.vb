Public Class view_classes
    Public Sub ParseMenusItems(strmenus As String, Menus As Dictionary(Of String, String))
        If strmenus.Contains("{") And strmenus.Contains("}") Then
            Dim formated_Values As String = strmenus.Substring(1, strmenus.Length - 2)
            If formated_Values.Contains(";") Then
                Dim var_values As String() = formated_Values.Split(";")
                If var_values.Length > 0 Then
                    For Each value As String In var_values
                        Dim spl_values As String() = value.Split(":")
                        Menus.Add(spl_values(0), spl_values(1))
                    Next
                End If
            End If

        End If
    End Sub

End Class
