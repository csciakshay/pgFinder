Imports System.Data.SqlClient
Imports System.IO

Partial Class PropertyReg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        con.Open()
        Dim neg As String
        Dim price As Decimal
        Dim aminities As String = ""
        price = TextBox6.Text
        If CheckBox1.Checked Then
            neg = "Y"
        Else
            neg = "N"
        End If
        If CheckBox3.Checked Then
            aminities = aminities + "Lifts,"
        End If
        If CheckBox4.Checked Then
            aminities = aminities + "Parks,"
        End If
        If CheckBox5.Checked Then
            aminities = aminities + "VP,"
        End If
        If CheckBox6.Checked Then
            aminities = aminities + "IN,"
        End If
        If CheckBox7.Checked Then
            aminities = aminities + "WS,"
        End If
        If CheckBox8.Checked Then
            aminities = aminities + "Security,"
        End If
        If CheckBox9.Checked Then
            aminities = aminities + "FA,"
        End If
        'Dim query As String = "insert into PropertyMaster values('" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "'," + Integer.Parse(TextBox6.Text) + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().Date.ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "')"
        ''" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + Integer.Parse(TextBox6.Text) + "','" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "'
        Dim cmd As New SqlCommand("insert into PropertyMaster(id,title,description,address,size,price,city,negotiable,userid,createDate,type,amenities) values(" + TextBox8.Text + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'," + price.ToString + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','" + Session("uid").ToString + "','" + Date.Now.ToString("MM-dd-yyyy") + "','" + DropDownList2.SelectedValue.ToString + "','" + aminities + "')", con)
        If cmd.ExecuteNonQuery() Then
            Dim cmd1 As New SqlCommand()

            Try
                ' Get the HttpFileCollection
                Dim hfc As HttpFileCollection = Request.Files
                For i As Integer = 0 To hfc.Count - 1
                    Dim hpf As HttpPostedFile = hfc(i)
                    If hpf.ContentLength > 0 Then
                        hpf.SaveAs(Server.MapPath("upload") & "\" & Path.GetFileName(hpf.FileName))
                        cmd1.CommandText = "insert into PropertyImages values(" + TextBox8.Text + ",'~\upload\" & Path.GetFileName(hpf.FileName) + "')"
                        cmd1.Connection = con
                        cmd1.ExecuteNonQuery()
                    End If
                Next i
            Catch ex As Exception
                ' Handle your exception here
                MsgBox(ex.Message)
            End Try
            MsgBox("Property Register")
        Else
            MsgBox("Property not register")
        End If
        
        con.Close()

    End Sub

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
    '    'MsgBox(Request.Files)
    '    Try
    '        ' Get the HttpFileCollection
    '        Dim hfc As HttpFileCollection = Request.Files
    '        For i As Integer = 0 To hfc.Count - 1
    '            Dim hpf As HttpPostedFile = hfc(i)
    '            If hpf.ContentLength > 0 Then
    '                hpf.SaveAs(Server.MapPath("upload") & "\" & Path.GetFileName(hpf.FileName))
    '            End If
    '        Next i
    '    Catch ex As Exception
    '        ' Handle your exception here
    '        MsgBox(ex.Message)
    '    End Try
    'End Sub
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
        If Not Session("uid") IsNot Nothing Then
            Response.Redirect("login.aspx")
        Else
            TextBox8.Text = getPropertyID()
        End If

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim aminities As String
        con.Open()
        Dim cmd As New SqlCommand("Select * from PropertyMaster where id=" + TextBox7.Text + "", con)
        Dim adp As New SqlDataAdapter()
        adp.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        adp.Fill(dt)
        Dim cmd1 As New SqlCommand("Select * from PropertyImages where propertyid=" + TextBox7.Text + "", con)
        Dim adp1 As New SqlDataAdapter()
        adp1.SelectCommand = cmd1
        Dim dt1 As New Data.DataTable()
        adp1.Fill(dt1)
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
            If dt.Rows(0)("propertysold").Equals("Y") Then
                CheckBox2.Checked = True
            Else
                CheckBox2.Checked = False
            End If
            DropDownList1.SelectedValue = dt.Rows(0)("city").ToString
            DropDownList2.SelectedValue = dt.Rows(0)("type").ToString
            Image1.ImageUrl = dt1.Rows(0)("images").ToString
            Session("imagepath") = dt1.Rows(0)("images").ToString
            aminities = dt.Rows(0)("amenities").ToString
            Dim words As String() = aminities.Split(New Char() {","c})

            ' Use For Each loop over words and display them

            Dim word As String
            For Each word In words
                If word.Contains("Lifts") Then
                    CheckBox3.Checked = True
                End If
                If word.Contains("Parks") Then
                    CheckBox4.Checked = True
                End If
                If word.Contains("VP") Then
                    CheckBox5.Checked = True
                End If
                If word.Contains("IN") Then
                    CheckBox6.Checked = True
                End If
                If word.Contains("WS") Then
                    CheckBox7.Checked = True
                End If
                If word.Contains("Security") Then
                    CheckBox8.Checked = True
                End If
                If word.Contains("FA") Then
                    CheckBox9.Checked = True
                End If
                Console.WriteLine(word)
            Next
        Else
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "alert", "Not Found")
        End If

        con.Close()

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        con.Open()
        Dim neg, sold As String
        Dim price As Decimal
        price = TextBox6.Text
        If CheckBox1.Checked Then
            neg = "Y"
        Else
            neg = "N"
        End If
        If CheckBox2.Checked Then
            sold = "Y"
        Else
            sold = "N"
        End If
        Dim cmd As New SqlCommand("update PropertyMaster set title= '" + TextBox1.Text + "', description= '" + TextBox2.Text + "', address='" + TextBox3.Text + "', size = '" + TextBox4.Text + "', price=" + price.ToString + ", city='" + DropDownList1.SelectedValue.ToString + "', negotiable='" + neg + "', image='" + Session("imagepath").ToString + "', type='" + DropDownList2.SelectedValue.ToString + "' , propertysold='" + sold + "' where id=" + TextBox7.Text + "", con)
        cmd.ExecuteNonQuery()

        con.Close()

    End Sub
End Class
