Imports System.Data.SqlClient

Partial Class PropertyDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim id As String
        id = Request.QueryString("ID")
        con.Open()
        Dim CMD As New SqlCommand("select * from PropertyMaster where id='" + id + "'", con)
        Dim adp As New SqlDataAdapter()
        Dim dt As New Data.DataTable()
        adp.SelectCommand = CMD
        adp.Fill(dt)
        DetailsView1.DataSource = dt
        DetailsView1.DataBind()
    End Sub
End Class
