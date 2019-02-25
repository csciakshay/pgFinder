Imports System.Data.SqlClient

Partial Class PropertyDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
        Dim id As String
        id = Request.QueryString("ID")
        con.Open()
        Dim CMD As New SqlCommand("select * from UserMaster where id='" + id + "'", con)
        Dim adp As New SqlDataAdapter()
        Dim dt As New Data.DataTable()
        adp.SelectCommand = CMD
        adp.Fill(dt)
        DetailsView1.DataSource = dt
        DetailsView1.DataBind()

        'Dim CMD1 As New SqlCommand("select images from PropertyImages where propertyid='" + id + "'", con)
        'Dim adp1 As New SqlDataAdapter()
        'Dim dt1 As New Data.DataTable()
        'adp1.SelectCommand = CMD1
        'adp1.Fill(dt1)
        'DataList1.DataSource = dt1
        'DataList1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Products.aspx")
    End Sub
End Class
