Imports System.IO
Imports System.Data
Imports System.Text
Partial Class rTotales
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Dim selDate As Date
            selDate = Format(Now.Date.ToString("MM-dd-yyyy"))
            tDateDel.Text = selDate
            tDateA.Text = selDate
        End If
    End Sub
    Protected Sub loadXCrew()
        Dim dtsItems As New DataSet
        Dim dts, dts2 As DataSet

        Dim Sql As String = "SELECT ctgEmpleados.Rolls, Count(tblStopCard.ID) AS Total_SOC" & _
" FROM ctgEmpleados INNER JOIN tblStopCard ON ctgEmpleados.Nombre = tblStopCard.Nombre" & _
" WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
" GROUP BY ctgEmpleados.Rolls"

        '"SELECT * FROM qSOCTotales WHERE Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        dts = clsDB.QueryDataSet(Sql)
        clsDB.Close()

        gvResultados.DataSource = dts
        gvResultados.DataBind()


        Sql = "Select * from tblStopCard Where Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        dts2 = clsDB.QueryDataSet(Sql)
        clsDB.Close()
        Label7.Text = dts2.Tables(0).Rows.Count

    End Sub
    Protected Sub loadSafety()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT Sum(IIf([tblStopCard].[EPP]=True,1,0)) AS EPP, " & _
        "Sum(IIf([tblStopCard].[ch_Atrapamiento]=True,1,0)) AS Atrapamiento, " & _
        "Sum(IIf([tblStopCard].[Posicion_Gente]=True,1,0)) AS Posicion, " & _
        "Sum(IIf([tblStopCard].[ch_Planeacion]=True,1,0)) AS Planeación, " & _
        "Sum(IIf([tblStopCard].[ch_SnBarreras]=True,1,0)) AS Sin_Barreras, " & _
        "Sum(IIf([tblStopCard].[ch_AmbienteTox]=True,1,0)) AS Ambiente_Toxico, " & _
        "Sum(IIf([tblStopCard].[ch_TrabajoGrua]=True,1,0)) AS Trabajo_con_Grua, " & _
        "Sum(IIf([tblStopCard].[Otra]=True,1,0)) AS Otra," & _
        "Sum(IIf([tblStopCard].[ch_Resbalon]=True,1,0)) AS Resbalón_Caidas," & _
        "Sum(IIf([tblStopCard].[ch_NoPermiso]=True,1,0)) AS No_Permiso," & _
        "Sum(IIf([tblStopCard].[ch_Comms]=True,1,0)) AS Comunicación," & _
        "Sum(IIf([tblStopCard].[ch_CondMeteorologica]=True,1,0)) AS Condición_Meteorologica," & _
        "Sum(IIf([tblStopCard].[ch_AltaPresion]=True,1,0)) AS Alta_Presión," & _
        "Sum(IIf([tblStopCard].[ch_Quimicos]=True,1,0)) AS Químicos," & _
        "Sum(IIf([tblStopCard].[ch_Soldadura]=True,1,0)) AS Soldadura," & _
        " Sum(IIf([tblStopCard].[Observacion_Positiva]=True,1,0)) AS Observacion" & _
        " FROM tblStopCard" & _
        " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"

        dts = clsDB.QueryDataSet(sql)
        Dim safe, corrections, others As Integer
        safe = 0
        corrections = 0
        others = 0

        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Desc")
        Dim col24 As New Data.DataColumn("Qty")
        'Dim col33 As New Data.DataColumn("Others")
        
        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Dim rptRow As DataRow
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                If Not IsDBNull(row("Observacion")) Then
                    safe = row("Observacion")
                End If
                If Not IsDBNull(row("Otra")) Then
                    others = row("Otra")
                End If
                If Not IsDBNull(row("EPP")) Then
                    corrections = row("EPP")
                    corrections = corrections + row("Posicion")
                    corrections = corrections + row("Atrapamiento")
                    corrections = corrections + row("Planeación")
                    corrections = corrections + row("Sin_Barreras")
                    corrections = corrections + row("Ambiente_Toxico")
                    corrections = corrections + row("Trabajo_con_Grua")
                    corrections = corrections + row("Resbalón_Caidas")
                    corrections = corrections + row("No_Permiso")
                    others = others + row("Comunicación")
                    others = others + row("Condición_Meteorologica")
                    corrections = corrections + row("Alta_Presión")
                    corrections = corrections + row("Químicos")
                    corrections = corrections + row("Soldadura")
                End If

                rptRow = Lista.NewRow
                rptRow("Desc") = "Positive Observations"
                rptRow("Qty") = safe
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Desc") = "Corrections"
                rptRow("Qty") = corrections
                Lista.Rows.Add(rptRow)


                rptRow = Lista.NewRow
                rptRow("Desc") = "Others"
                rptRow("Qty") = others
                Lista.Rows.Add(rptRow)

            Next
            dtsItems.Tables.Add(Lista)

            gvResultados.DataSource = dtsItems
            gvResultados.DataBind()
        Else
            gvResultados.DataSource = Nothing
            gvResultados.DataBind()
        End If

        sql = "Select * from tblStopCard Where Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        dts2 = clsDB.QueryDataSet(sql)
        clsDB.Close()
        Label7.Text = dts2.Tables(0).Rows.Count
    End Sub
    Protected Sub LoadXDept()
        Dim dts, dts2 As DataSet
        Dim sql As String
        sql = "SELECT ctgDepartamentos.Desc, Count(tblStopCard.ID) AS CountOfID" & _
            " FROM ctgDepartamentos INNER JOIN (tblStopCard INNER JOIN ctgEmpleados ON tblStopCard.Nombre = ctgEmpleados.Nombre) ON ctgDepartamentos.ID = ctgEmpleados.Dpto_ID" & _
            " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#" & _
            " GROUP BY ctgDepartamentos.Desc"
        dts = clsDB.QueryDataSet(sql)
        gvResultados.DataSource = dts
        gvResultados.DataBind()



        sql = "Select * from tblStopCard Where Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        dts2 = clsDB.QueryDataSet(sql)
        clsDB.Close()
        Label7.Text = dts2.Tables(0).Rows.Count

        Label7.Text = dts2.Tables(0).Rows.Count




    End Sub
    Protected Sub loadxRisks()
        Dim dts, dts2 As DataSet
        Dim dtsItems As New DataSet
        Dim sql As String = "SELECT Sum(IIf([tblStopCard].[EPP]=True,1,0)) AS EPP, " & _
        "Sum(IIf([tblStopCard].[ch_Atrapamiento]=True,1,0)) AS Atrapamiento, " & _
        "Sum(IIf([tblStopCard].[Posicion_Gente]=True,1,0)) AS Posicion, " & _
        "Sum(IIf([tblStopCard].[ch_Planeacion]=True,1,0)) AS Planeación, " & _
        "Sum(IIf([tblStopCard].[ch_SnBarreras]=True,1,0)) AS Sin_Barreras, " & _
        "Sum(IIf([tblStopCard].[ch_AmbienteTox]=True,1,0)) AS Ambiente_Toxico, " & _
        "Sum(IIf([tblStopCard].[ch_TrabajoGrua]=True,1,0)) AS Trabajo_con_Grua, " & _
        "Sum(IIf([tblStopCard].[Otra]=True,1,0)) AS Otra," & _
        "Sum(IIf([tblStopCard].[ch_Resbalon]=True,1,0)) AS Resbalón_Caidas," & _
        "Sum(IIf([tblStopCard].[ch_NoPermiso]=True,1,0)) AS No_Permiso," & _
        "Sum(IIf([tblStopCard].[ch_Comms]=True,1,0)) AS Comunicación," & _
        "Sum(IIf([tblStopCard].[ch_CondMeteorologica]=True,1,0)) AS Condición_Meteorologica," & _
        "Sum(IIf([tblStopCard].[ch_AltaPresion]=True,1,0)) AS Alta_Presión," & _
        "Sum(IIf([tblStopCard].[ch_Quimicos]=True,1,0)) AS Químicos," & _
        "Sum(IIf([tblStopCard].[ch_Soldadura]=True,1,0)) AS Soldadura," & _
        " Sum(IIf([tblStopCard].[Observacion_Positiva]=True,1,0)) AS Observacion" & _
        " FROM tblStopCard" & _
        " WHERE tblStopCard.Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"

        dts = clsDB.QueryDataSet(sql)
        Dim safe, atrapamiento, others, epp, posicion, planeacion, sinbarrera, toxico, grua, caidas, permiso, comms, meteorologica, presion, quimicos, soldadura As Integer
        safe = 0
        epp = 0
        atrapamiento = 0
        others = 0
        posicion = 0
        planeacion = 0
        sinbarrera = 0
        toxico = 0
        grua = 0
        caidas = 0
        permiso = 0
        comms = 0
        meteorologica = 0
        presion = 0
        quimicos = 0
        soldadura = 0

        Dim Lista As New Data.DataTable("Items")
        Dim col23 As New Data.DataColumn("Safe Observation")
        Dim col24 As New Data.DataColumn("Qty")

        Lista.Columns.Add(col23)
        Lista.Columns.Add(col24)
        Dim rptRow As DataRow
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                If Not IsDBNull(row("Observacion")) Then
                    safe = row("Observacion")
                End If
                If Not IsDBNull(row("Otra")) Then
                    others = row("Otra")
                End If
                If Not IsDBNull(row("EPP")) Then
                    epp = row("EPP")
                    atrapamiento = row("Atrapamiento")
                    posicion = row("Posicion")
                    planeacion = row("Planeación")
                    sinbarrera = row("Sin_Barreras")
                    toxico = row("Ambiente_Toxico")
                    grua = row("Trabajo_con_Grua")
                    caidas = row("Resbalón_Caidas")
                    permiso = row("No_Permiso")
                    comms = row("Comunicación")
                    meteorologica = row("Condición_Meteorologica")
                    presion = row("Alta_Presión")
                    quimicos = row("Químicos")
                    soldadura = row("Soldadura")
                End If
                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "PPE / EPP"
                rptRow("Qty") = epp
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Pinch Points / Atrapamiento"
                rptRow("Qty") = atrapamiento
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Body Placement / Posición del Cuerpo"
                rptRow("Qty") = posicion
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Poor Planning / Pobre Planeacion"
                rptRow("Qty") = planeacion
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "No Barriers / Sin Barreras"
                rptRow("Qty") = sinbarrera
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Toxic Environment / Ambiente Toxico"
                rptRow("Qty") = toxico
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Crane Work / Trabajo con Grua"
                rptRow("Qty") = grua
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Slips/Falls / Resbalon/Caidas"
                rptRow("Qty") = caidas
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "PTW not in place / Sin PTD en Sitio"
                rptRow("Qty") = permiso
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Communication / Comunicación"
                rptRow("Qty") = comms
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Weather / Cond. Meteorologica"
                rptRow("Qty") = meteorologica
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "High Pressure / Alta Presion"
                rptRow("Qty") = presion
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Chemicals / Quimicos"
                rptRow("Qty") = quimicos
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Welding / Soldadura"
                rptRow("Qty") = soldadura
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Others"
                rptRow("Qty") = others
                Lista.Rows.Add(rptRow)

                rptRow = Lista.NewRow
                rptRow("Safe Observation") = "Safe / Positive Observation / Observación Positiva"
                rptRow("Qty") = safe
                Lista.Rows.Add(rptRow)

            Next
            dtsItems.Tables.Add(Lista)
            gvResultados.DataSource = dtsItems
            gvResultados.DataBind()
            Label7.Text = dts.Tables(0).Rows.Count
        Else
            gvResultados.DataSource = Nothing
            gvResultados.DataBind()
        End If

        sql = "Select * from tblStopCard Where Fecha Between #" & tDateDel.Text.Trim & "# AND #" & tDateA.Text.Trim & "#"
        dts2 = clsDB.QueryDataSet(sql)
        clsDB.Close()
        Label7.Text = dts2.Tables(0).Rows.Count
    End Sub
    Protected Sub btnExport1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport1.Click
        Label7.Text = ""
        loadSafety()
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Label7.Text = ""
        loadXCrew()
    End Sub

    Protected Sub btnExport2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport2.Click
        Label7.Text = ""
        LoadXDept()
    End Sub

    Protected Sub btnExport3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport3.Click
        Label7.Text = ""
        loadxRisks()
    End Sub
End Class
