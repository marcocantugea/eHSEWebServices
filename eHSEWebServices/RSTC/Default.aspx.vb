Imports System.IO
Imports System.Data
Imports System.Text
Partial Class _Default
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click, btnPost.Click
        'sumaPorGrupo()
        Dim fecha As New Date(2013, 1, 15)
        txtCols.Text = getCardsbyDate(fecha, "A")
    End Sub
    Protected Sub sumaPorGrupo()
        Dim dtsItems As New DataSet
        Dim dts As DataSet

        'Dim Sql As String = "SELECT * FROM tblStopCard where Fecha=#" & dia & "# and U_P Is Null"
        Dim Sql As String = "Select Nombre as Name,Count(Nombre)As Total From tblStopCard Group By Nombre Order By Count(Nombre) DESC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        GridView1.DataSource = dts.Tables(0)
        GridView1.DataBind()


        Sql = "Select Dpto As Department,Count(Dpto)As Total From tblStopCard Group By Dpto Order By Count(Dpto) DESC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        GridView2.DataSource = dts.Tables(0)
        GridView2.DataBind()


        Sql = "Select CREW,Count(CREW)As Total From qryStopEmpleados Group By CREW Order By Count(CREW) DESC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        GridView3.DataSource = dts.Tables(0)
        GridView3.DataBind()


        Sql = "Select Week,Count(Week)As Total From tblStopCard Group By Week Order By Count(Week) DESC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        GridView4.DataSource = dts.Tables(0)
        GridView4.DataBind()


    End Sub

    ' Rows property to hold the Rows in the ViewState
    Protected Property Rows() As Integer
        Get
            If Not ViewState("Rows") Is Nothing Then
                Return CInt(Fix(ViewState("Rows")))
            Else
                Return 0
            End If
        End Get
        Set(ByVal value As Integer)
            ViewState("Rows") = value
        End Set
    End Property

    ' Columns property to hold the Columns in the ViewState
    Protected Property Columns() As Integer
        Get
            If Not ViewState("Columns") Is Nothing Then
                Return CInt(Fix(ViewState("Columns")))
            Else
                Return 0
            End If
        End Get
        Set(ByVal value As Integer)
            ViewState("Columns") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Run only once a postback has occured
        If Not Page.IsPostBack Then
            'Set the Rows and Columns property with the value
            'entered by the user in the respective textboxes
            Me.Rows = 5
            Me.Columns = 8
        End If
        
        TableCardsOthers()
        CreateDynamicDates()


    End Sub

    Protected Sub btnGenerate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnGenerate.Click
        TableCardsOthers()
        CreateDynamicDates()
    End Sub


    
    ' Check the ViewState flag to determine whether to
    ' rebuild your table again
    Protected Overrides Sub LoadViewState(ByVal earlierState As Object)
        MyBase.LoadViewState(earlierState)
        If Not ViewState("dynamictable") Is Nothing Then
            TableCardsOthers()
            CreateDynamicDates()
        End If

    End Sub



    Private Sub CreateDynamicDates()
        PlaceHolder1.Controls.Clear()

        ' Fetch the number of Rows and Columns for the table 
        ' using the properties
        Dim tblRows As Integer = Rows
        Dim tblCols As Integer = Columns

        Dim startup As Date = txtRows.Text
        Dim endp As Date = txtCols.Text 'New Date(2013, 2, 28)
        Dim CurrD As Date = startup

        ' Create a Table and set its properties 
        Dim tbl As Table = New Table()
        ' Add the table to the placeholder control
        PlaceHolder1.Controls.Add(tbl)
        ' Now iterate through the table and add your controls 
        Dim Crew As String
        Dim cards As Integer
        For i As Integer = 0 To 8
            Dim tr As TableRow = New TableRow()
            Crew = getCrewonTable(tbl.Rows.Count)

            While (CurrD <= endp)
                Dim tc As TableCell = New TableCell()
                Dim txtBox As TextBox = New TextBox()
                If tbl.Rows.Count = 0 Then
                    txtBox.Text = Format(CurrD.ToString("dd-MMM"))
                    txtBox.Width = 40
                    txtBox.CssClass = "estiloEtiquetasTitulos"
                    tc.Controls.Add(txtBox)
                    tr.Cells.Add(tc)
                    CurrD = CurrD.AddDays(1)
                Else
                    cards = getCardsbyDate(CurrD, Crew)
                    If cards = 0 Then
                        txtBox.BackColor = Drawing.Color.Red
                    End If
                    txtBox.Text = cards
                    txtBox.Width = 40
                    txtBox.CssClass = "estiloEti3"
                    tc.Controls.Add(txtBox)
                    tr.Cells.Add(tc)
                    CurrD = CurrD.AddDays(1)
                End If

            End While
            ' Add the TableRow to the Table
            tbl.Rows.Add(tr)
            CurrD = startup
        Next i

        ' This parameter helps determine in the LoadViewState event,
        ' whether to recreate the dynamic controls or not

        ViewState("dynamictable") = True
    End Sub
    Private Sub TableCardsOthers()
        PlaceHolder2.Controls.Clear()

        ' Fetch the number of Rows and Columns for the table 
        ' using the properties
        Dim tblRows As Integer = Rows
        Dim tblCols As Integer = Columns

        Dim startup As Date = txtRows.Text
        Dim endp As Date = txtCols.Text 'New Date(2013, 2, 28)
        Dim CurrD As Date = startup

        ' Create a Table and set its properties 
        Dim tbl As Table = New Table()
        ' Add the table to the placeholder control
        PlaceHolder2.Controls.Add(tbl)
        ' Now iterate through the table and add your controls 
        Dim cards As Integer
        For i As Integer = 0 To 1
            Dim tr As TableRow = New TableRow()
            While (CurrD <= endp)
                Dim tc As TableCell = New TableCell()
                Dim txtBox As TextBox = New TextBox()
                If tbl.Rows.Count = 0 Then
                    txtBox.Text = Format(CurrD.ToString("dd-MMM"))
                    txtBox.Width = 40
                    txtBox.CssClass = "estiloEtiquetasTitulos"
                    tc.Controls.Add(txtBox)
                    tr.Cells.Add(tc)
                    CurrD = CurrD.AddDays(1)
                Else
                    cards = getCardsbyDate(CurrD, "Is Null")
                    If cards = 0 Then
                        txtBox.BackColor = Drawing.Color.Red
                    End If
                    txtBox.Text = cards
                    txtBox.Width = 40
                    txtBox.CssClass = "estiloEti3"
                    tc.Controls.Add(txtBox)
                    tr.Cells.Add(tc)
                    CurrD = CurrD.AddDays(1)
                End If

            End While
            ' Add the TableRow to the Table
            tbl.Rows.Add(tr)
            CurrD = startup
        Next i

        ' This parameter helps determine in the LoadViewState event,
        ' whether to recreate the dynamic controls or not

        ViewState("dynamictable") = True
    End Sub
    Function getCardsbyDate(ByVal fecha As Date, ByVal CREW As String) As Integer
        Dim dtsItems As New DataSet
        Dim dts As DataSet
        Dim cantidad As Integer
        Dim Sql As String
        If CREW = "Is Null" Then
            Sql = "SELECT Count(Nombre) as total FROM qryStopEmpleados where Fecha=#" & fecha & "# and crew Is Null"
        Else
            Sql = "SELECT Count(Nombre) as total FROM qryStopEmpleados where Fecha=#" & fecha & "# and crew='" & CREW & "'"
        End If
        'Dim Sql As String = "Select Nombre as Name,Count(Nombre)As Total From tblStopCard Group By Nombre Order By Count(Nombre) DESC"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                cantidad = row("total")
                Return cantidad
            Next
        Else
            Return 0
        End If
        'GridView1.DataSource = dts
        'GridView1.DataBind()
    End Function
    Function getCrewonTable(ByVal renglon As Integer) As String
        Select Case renglon
            Case 1
                Return "A"
            Case 2
                Return "B"
            Case 3
                Return "C"
            Case 4
                Return "D"
            Case 5
                Return "E"
            Case 6
                Return "F"
            Case 7
                Return "G"
            Case 8
                Return "H"
        End Select
    End Function
End Class
