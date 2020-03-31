Namespace com.utilities
    Public Class PINGenerator

        Public Function GeneratePIN4digit() As String
            Dim randomnum As String = GetRandomNumber(3)

            Return randomnum
        End Function

        Private Function GetRandomNumber(s_intDigits As Integer) As String
            Dim l_strOutput As String
            Dim l_intDigit As Integer
            Dim i As Integer

            'init
            Randomize()
            GetRandomNumber = "0"

            For i = 0 To s_intDigits
                'get random digit 0-9
                l_intDigit = Int(10 * Rnd())

                l_strOutput = l_strOutput & CStr(l_intDigit)
            Next i

            GetRandomNumber = l_strOutput
        End Function


    End Class
End Namespace