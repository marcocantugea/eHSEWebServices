Public Class view_classes

    Private _Session As HttpSessionState
    Private _transaction As String

    Public ReadOnly Property transaction As String
        Get
            Return _transaction
        End Get
    End Property

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

    Public Sub New()

    End Sub

    Public Sub New(Session As HttpSessionState)
        _Session = Session
    End Sub
    Public Function MakeTransaction() As String
        Dim enc_transaction_num As String
        'Genera un numero de transaccion automatico
        Dim rand As New Random()
        Dim transaction_number As String = "TransactionNum=" & rand.Next(0, 99).ToString
        _transaction = transaction_number
        'Encripta el numero de transaccion
        Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
        enc_transaction_num = encrypt.EncryptData(transaction_number)
        Return enc_transaction_num
    End Function

End Class
