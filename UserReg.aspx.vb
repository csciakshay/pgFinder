Imports System.Data.SqlClient
Partial Class UserReg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        con.Open()
        Dim cmd As New SqlCommand("insert into usermaster values('" + TextBox8.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + TextBox4.Text + "','" + TextBox3.Text + "','" + FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox5.Text, "md5") + "','" + Session("userimagepath").ToString + "','" + TextBox9.Text + "')", con)
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Protected Function getUserID() As Integer
        con.Open()
        Dim max As Integer
        Dim cmd As New SqlCommand("Select MAX(COALESCE(id,0)) from usermaster", con)
        If IsDBNull(cmd.ExecuteScalar()) Then
            max = 0
        Else
            max = cmd.ExecuteScalar()
        End If

        con.Close()
        Return max + 1

    End Function

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If FileUpload1.HasFile Then
            FileUpload1.SaveAs(Server.MapPath("~/upload/") + FileUpload1.FileName)
            Session("userimagepath") = "~/upload/" + FileUpload1.FileName
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox8.Text = getUserID()
    End Sub
End Class
