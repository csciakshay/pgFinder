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
        Dim foodtype As String = ""
        Dim pgtype As String = ""
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
        If CheckBox10.Checked Then
            foodtype = foodtype + "veg,"
        End If
        If CheckBox11.Checked Then
            foodtype = foodtype + "nonveg,"
        End If
        If CheckBox12.Checked Then
            foodtype = foodtype + "eggetarian,"
        End If
        If CheckBox13.Checked Then
            pgtype = pgtype + "bachelor,"
        End If
        If CheckBox14.Checked Then
            pgtype = pgtype + "family,"
        End If
        'Dim query As String = "insert into PropertyMaster values('" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "'," + Integer.Parse(TextBox6.Text) + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().Date.ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "')"
        ''" + getPropertyID() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + Integer.Parse(TextBox6.Text) + "','" + DropDownList1.SelectedValue.ToString + "','" + neg + "','TestUser','" + Now.Date().ToString + "','" + Session("imagepath").ToString + "','" + DropDownList2.SelectedValue.ToString + "'
        Dim cmd As New SqlCommand("insert into PropertyMaster(id,title,description,address,size,price,city,negotiable,userid,createDate,type,amenities,foodtype,pgtype,pgallowed,state,pincode) values(" + TextBox8.Text + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'," + price.ToString + ",'" + DropDownList1.SelectedValue.ToString + "','" + neg + "','" + Session("uid").ToString + "','" + Date.Now.ToString("MM-dd-yyyy") + "','" + DropDownList2.SelectedValue.ToString + "','" + aminities + "','" + foodtype + "','" + pgtype + "','" + TextBox9.Text + "','" + DropDownList3.SelectedValue + "','" + TextBox10.Text + "')", con)
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
                    Else

                        cmd1.CommandText = "insert into PropertyImages values(" + TextBox8.Text + ",'~\upload\noimage.png')"
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
            If Not Page.IsPostBack Then
                TextBox8.Text = getPropertyID()
                Dim cmd As New SqlCommand("select id from propertymaster where userid='" + Session("uid") + "'", con)
                Dim da As New SqlDataAdapter()
                da.SelectCommand = cmd
                Dim ds As New Data.DataSet
                da.Fill(ds)
                DropDownList4.DataTextField = ds.Tables(0).Columns("id").ToString()
                DropDownList4.DataValueField = ds.Tables(0).Columns("id").ToString()
                DropDownList4.DataSource = ds.Tables(0)
                DropDownList4.DataBind()
                DropDownList4.Items.Insert(0, New ListItem("Select Property Id", "0"))
            End If
            
        End If

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim aminities As String
        Dim foodtype As String
        Dim pgtype As String
        con.Open()
        Dim cmd As New SqlCommand("Select * from PropertyMaster where id=" + DropDownList4.SelectedValue + "", con)
        Dim adp As New SqlDataAdapter()
        adp.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        adp.Fill(dt)
        Dim cmd1 As New SqlCommand("Select * from PropertyImages where propertyid=" + DropDownList4.SelectedValue + "", con)
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
            TextBox9.Text = dt.Rows(0)("pgallowed").ToString
            TextBox10.Text = dt.Rows(0)("pincode").ToString
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
            DropDownList3.SelectedValue = dt.Rows(0)("state").ToString
            Image1.ImageUrl = dt1.Rows(0)("images").ToString
            Session("imagepath") = dt1.Rows(0)("images").ToString
            aminities = dt.Rows(0)("amenities").ToString
            foodtype = dt.Rows(0)("foodtype").ToString
            pgtype = dt.Rows(0)("pgtype").ToString

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
            Dim food As String() = foodtype.Split(New Char() {","c})
            Dim f As String
            For Each f In food
                If f.Contains("veg") Then
                    CheckBox10.Checked = True
                End If
                If f.Contains("nonveg") Then
                    CheckBox11.Checked = True
                End If
                If f.Contains("eggetarian") Then
                    CheckBox12.Checked = True
                End If
            Next
            Dim pg As String() = pgtype.Split(New Char() {","c})
            Dim p As String
            For Each p In pg
                If p.Contains("bachelor") Then
                    CheckBox13.Checked = True
                End If
                If p.Contains("family") Then
                    CheckBox14.Checked = True
                End If
                
            Next
        Else
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "alert", "Not Found")
        End If

        con.Close()

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Try
            con.Open()
            Dim neg, sold As String
            Dim price As Decimal
            Dim aminities As String = ""
            Dim foodtype As String = ""
            Dim pgtype As String = ""
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
            If CheckBox10.Checked Then
                foodtype = foodtype + "veg,"
            End If
            If CheckBox11.Checked Then
                foodtype = foodtype + "nonveg,"
            End If
            If CheckBox12.Checked Then
                foodtype = foodtype + "eggetarian,"
            End If
            If CheckBox13.Checked Then
                pgtype = pgtype + "bachelor,"
            End If
            If CheckBox14.Checked Then
                pgtype = pgtype + "family,"
            End If
            Dim cmd As New SqlCommand("update PropertyMaster set title= '" + TextBox1.Text + "', description= '" + TextBox2.Text + "', address='" + TextBox3.Text + "', size = '" + TextBox4.Text + "', price=" + price.ToString + ", city='" + DropDownList1.SelectedValue.ToString + "', negotiable='" + neg + "', type='" + DropDownList2.SelectedValue.ToString + "' , propertysold='" + sold + "',amenities='" + aminities + "',foodtype='" + foodtype + "',pgtype='" + pgtype + "',pgallowed='" + TextBox9.Text + "',state='" + DropDownList3.SelectedValue + "',pincode='" + TextBox10.Text + "' where id=" + DropDownList4.SelectedValue + "", con)
            If cmd.ExecuteNonQuery() Then
                MsgBox("Property update success")
            Else
                MsgBox("Property update fail")
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        Finally

            con.Close()

        End Try
        

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox8.Text = getPropertyID()

        TextBox9.Text = ""
        TextBox10.Text = ""
        CheckBox1.Checked = False
        CheckBox2.Checked = False
        CheckBox3.Checked = False
        CheckBox4.Checked = False
        CheckBox5.Checked = False
        CheckBox6.Checked = False

        CheckBox7.Checked = False
        CheckBox8.Checked = False
        CheckBox9.Checked = False
        CheckBox10.Checked = False
        CheckBox11.Checked = False
        CheckBox12.Checked = False
        CheckBox13.Checked = False
        CheckBox14.Checked = False
        DropDownList1.SelectedIndex = 0
        DropDownList2.SelectedIndex = 0
        DropDownList3.SelectedIndex = 0

    End Sub
End Class
