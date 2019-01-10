Imports System.Data.SqlClient

Partial Class PropertyReg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        con.Open()
        Dim neg As String
        Dim price As Decimal
        price = TextBox6.Text
        If CheckBox1.Checked Then
            neg = "Y"
        Else
            neg = "N"
        End If
        'Dim query As String = "insert into PropertyMaster values('" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "'," + Integer.Parse(TextBox6.Text) + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().Date.ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "')"
        ''" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + Integer.Parse(TextBox6.Text) + "','" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "'
        Dim cmd As New SqlCommand("insert into PropertyMaster(id,title,description,address,size,price,city,negotiable,userid,createDate,image,type) values(" + TextBox8.Text + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'," + price.ToString + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','df','" + Now.Date() + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "')", con)
        cmd.ExecuteNonQuery()
        con.Close()

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If FileUpload1.HasFile Then
            FileUpload1.SaveAs(Server.MapPath("~/upload/") + FileUpload1.FileName)
            Session("imagepath") = Server.MapPath("~/upload/") + FileUpload1.FileName
        End If
    End Sub
    Protected Function getPropertyID() As Integer
        con.Open()
        Dim max As Integer
        Dim cmd As New SqlCommand("Select MAX(COALESCE(id,0)) from propertymaster", con)
        If IsDBNull(cmd.ExecuteScalar()) Then
            max = 0
        Else
            max = cmd.ExecuteScalar()
        End If

        con.Close()
        Return max + 1

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox8.Text = getPropertyID()
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        con.Open()
        Dim cmd As New SqlCommand("Select * from PropertyMaster where id=" + TextBox7.Text + "", con)
        Dim adp As New SqlDataAdapter()
        adp.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        adp.Fill(dt)
        If dt.Rows.Count > 0 Then

            TextBox1.Text = dt.Rows(0)("title").ToString
            TextBox2.Text = dt.Rows(0)("description").ToString
            TextBox3.Text = dt.Rows(0)("address").ToString
            TextBox4.Text = dt.Rows(0)("size").ToString
            TextBox5.Text = dt.Rows(0)("size").ToString
            TextBox6.Text = dt.Rows(0)("price").ToString
            TextBox8.Text = dt.Rows(0)("id").ToString
            If dt.Rows(0)("negotiable").Equals("Y") Then
                CheckBox1.Checked = True
            Else
                CheckBox1.Checked = False
            End If
            DropDownList1.SelectedValue = dt.Rows(0)("city").ToString
            DropDownList2.SelectedValue = dt.Rows(0)("type").ToString
            Image1.ImageUrl = dt.Rows(0)("image").ToString

        Else
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "alert", "Not Found")
        End If

        con.Close()

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click

    End Sub
End Class
