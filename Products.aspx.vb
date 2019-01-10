Imports System.Data.SqlClient
Partial Class Products
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        con.Open()
        'Dim cmd As New SqlCommand("select * from PropertyMaster where type='" + DropDownList2.SelectedValue + "'", con)
        'Dim adp As New SqlDataAdapter()
        'adp.SelectCommand = cmd
        'Dim dt As New Data.DataTable()
        'adp.Fill(dt)
        'DataList1.DataSource = dt
        'DataList1.DataBind()
        If DropDownList2.SelectedIndex > 0 Then
            SqlDataSource1.SelectCommand = "select * from PropertyMaster where type='" + DropDownList2.SelectedValue + "'"
        Else
            SqlDataSource1.SelectCommand = "select * from PropertyMaster"
        End If


        SqlDataSource1.DataBind()
        DataList1.DataBind()
        con.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      
    End Sub
End Class
