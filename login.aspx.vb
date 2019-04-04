Imports System.Data.SqlClient
Imports System.IO
Partial Class login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        con.Open()
        Dim cmd As New SqlCommand("select id,name,image,role,email from UserMaster where name='" + TextBox7.Text + "' and password='" + FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox1.Text, "md5") + "'", con)
        Dim da As New SqlDataAdapter
        da.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Session("uid") = dt.Rows(0)("id").ToString
            Session("uname") = dt.Rows(0)("name").ToString
            Session("uimage") = dt.Rows(0)("image").ToString
            Session("role") = dt.Rows(0)("role").ToString
            Session("email") = dt.Rows(0)("email").ToString
            Response.Redirect("Products.aspx")
        Else
            Response.Redirect("login.aspx")
        End If
    End Sub
End Class
