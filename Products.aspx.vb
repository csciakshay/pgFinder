Imports System.Data.SqlClient
Partial Class Products
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    Dim pg As PagedDataSource = New PagedDataSource()
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        con.Open()
        'Dim cmd As New SqlCommand("select * from PropertyMaster where type='" + DropDownList2.SelectedValue + "'", con)
        'Dim adp As New SqlDataAdapter()
        'adp.SelectCommand = cmd
        'Dim dt As New Data.DataTable()
        'adp.Fill(dt)
        'DataList1.DataSource = dt
        'DataList1.DataBind()
        Dim typeCondition, cityCondition, priceCondition As String
        typeCondition = ""
        cityCondition = ""
        priceCondition = ""

        If DropDownList2.SelectedIndex > 0 Then
            typeCondition = "and type like '" + DropDownList2.SelectedValue + "%' "
        End If
        If DropDownList1.SelectedIndex > 0 Then
            cityCondition = "and city like '" + DropDownList1.SelectedValue + "%' "
        End If
        If DropDownList3.SelectedIndex > 0 Then
            If DropDownList3.SelectedValue = "1000~5000" Then
                priceCondition = "and price between 1000 and 5000 "
            End If
            If DropDownList3.SelectedValue = "5001~10000" Then
                priceCondition = "and price between 5001 and 10000 "
            End If
            If DropDownList3.SelectedValue = "10000 above" Then
                priceCondition = "and price between 10000 and 9999999 "
            End If
        End If
       
        SqlDataSource1.SelectCommand = "select * from PropertyMaster WHERE propertysold = 'N' " + cityCondition + typeCondition + priceCondition

        SqlDataSource1.DataBind()
        DataList1.DataBind()

        con.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'pg.DataSource = SqlDataSource1
        'pg.AllowPaging = True
        'pg.PageSize = 3


        'DataList1.DataSource = pg
        'DataList1.DataBind()
    End Sub
End Class
