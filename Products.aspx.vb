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
        If DropDownList4.SelectedIndex > 0 Then
            cityCondition = "and state like '" + DropDownList4.SelectedValue + "%' "
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
       
        SqlDataSource1.SelectCommand = "select a.*,b.name, (SELECT   TOP (1) images FROM propertyImages WHERE a.id = propertyid) AS images from PropertyMaster a left join UserMaster b on a.userid=b.id WHERE propertysold = 'N' " + cityCondition + typeCondition + priceCondition
        
        SqlDataSource1.DataBind()
        DataList1.DataBind()

        con.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            If Not Session("uid") Is Nothing Then
                Label1.Visible = True
                SqlDataSource2.SelectCommand = "select a.*,b.name, (SELECT   TOP (1) images FROM propertyImages WHERE a.id = propertyid) AS images from PropertyMaster a left join UserMaster b on a.userid=b.id WHERE propertysold = 'N' and a.id in (select pid from FavProperty where uid='" + Session("uid") + "') "

                SqlDataSource2.DataBind()
                DataList2.DataBind()
            Else
                Label1.Visible = False
            End If

            SqlDataSource3.SelectCommand = "select TOP (5) a.*,b.name, (SELECT   TOP (1) images FROM propertyImages WHERE a.id = propertyid) AS images from PropertyMaster a left join UserMaster b on a.userid=b.id WHERE propertysold = 'N' order by views desc "

            SqlDataSource3.DataBind()
            DataList3.DataBind()
        End If
        'pg.DataSource = SqlDataSource1
        'pg.AllowPaging = True
        'pg.PageSize = 3


        'DataList1.DataSource = pg
        'DataList1.DataBind()
    End Sub
End Class
