Imports System.Data.SqlClient

Partial Class PropertyDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    Dim pid As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If

        pid = Request.QueryString("ID")
        con.Open()
        Dim CMD As New SqlCommand("select * from PropertyMaster where id='" + pid + "'", con)
        Dim adp As New SqlDataAdapter()
        Dim dt As New Data.DataTable()
        adp.SelectCommand = CMD
        adp.Fill(dt)
        DetailsView1.DataSource = dt
        DetailsView1.DataBind()

        Dim CMD1 As New SqlCommand("select images from PropertyImages where propertyid='" + pid + "'", con)
        Dim adp1 As New SqlDataAdapter()
        Dim dt1 As New Data.DataTable()
        adp1.SelectCommand = CMD1
        adp1.Fill(dt1)
        DataList1.DataSource = dt1
        DataList1.DataBind()

        Dim cmd2 As New SqlCommand("update PropertyMaster set views=" + getNoOfViews().ToString + " where id='" + pid + "'", con)
        cmd2.ExecuteNonQuery()
        con.Close()

    End Sub
    Protected Function getNoOfViews() As Integer
        'con.Open()
        Dim max As Integer
        Dim cmd As New SqlCommand("Select COALESCE(views,0) from propertymaster where id='" + pid + "'", con)
        If IsDBNull(cmd.ExecuteScalar()) Then
            max = 0
        Else
            max = cmd.ExecuteScalar()
        End If

        ' con.Close()
        Return max + 1

    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Products.aspx")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try
            con.Open()

            Dim cmd As New SqlCommand("insert into FavProperty values('" + pid + "','" + Session("uid") + "')", con)
            If cmd.ExecuteNonQuery Then
                MsgBox("Property added as favourite")
            Else
                MsgBox("Add fail")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            con.Close()
        End Try
    End Sub
End Class
