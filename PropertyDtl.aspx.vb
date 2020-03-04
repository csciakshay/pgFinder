Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Xml
Imports System.IO

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

        Dim cmd3 As New SqlCommand("select * from UserMaster where id='" + dt.Rows(0)("userid") + "'", con)
        Dim adp2 As New SqlDataAdapter()
        Dim dt2 As New Data.DataTable()
        adp2.SelectCommand = cmd3
        adp2.Fill(dt2)


        Dim fullUrl As String = "Hey " + dt2.Rows(0)("name").ToString + " your property " + dt.Rows(0)("title").ToString + " is viewed by " + Session("uname") + " and mailid is " + Session("email") + ""
        Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient("smtp.gmail.com", 587)

        Dim message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage(Session("email"), dt2.Rows(0)("email").ToString, "PG Finder Property viewed", "")
        message.IsBodyHtml = True
        message.Body = fullUrl
        smtpClient.EnableSsl = True
        smtpClient.Send(message)
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

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Dim ci As CultureInfo = New CultureInfo("en-us")
        ' getting the total cost of the cart
        Dim cost As Decimal = CalculateTotalAmount()
        If cost = 0 Then
            Response.Redirect("~/Default.aspx")
        End If

        Try
            Session("Amount") = cost.ToString(ci)

            ' creating a record about the payment request
            Dim request_id As String = CreatePaymentRequest(pid, cost)
            If request_id <> Nothing Then
                Session("request_id") = request_id.ToString
            Else
                Return
            End If

        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.ibPayPal_Click(): " + ex.Message)
            Response.Redirect("~/Default.aspx")
        End Try

        Response.Redirect("~/PayPal.aspx")
    End Sub

    ''' <summary>
    ''' creating a record about the payment request
    ''' </summary>
    ''' <param name="cart_id">the cart identifier</param>
    ''' <param name="cost">the total cost of the cart</param>
    ''' <returns>the identifier of the request_id request</returns>
    Protected Function CreatePaymentRequest(ByVal cart_id As String, ByVal cost As Decimal) As Integer

        Dim xmlFile As String = Server.MapPath("~/App_Data/PaymentRequests.xml")
        Dim doc As New XmlDocument()
        Dim ci As CultureInfo = New CultureInfo("en-us")

        Dim reader As XmlTextReader

        If File.Exists(xmlFile) Then
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        Else
            KBSoft.Carts.CreateXml(xmlFile, "Requests")
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        End If

        doc.Load(reader)
        reader.Close()

        ' getting a unique request identifier
        Dim nodes As XmlNodeList = doc.GetElementsByTagName("Request")
        Dim request_id As Integer
        If nodes.Count <> 0 Then
            request_id = KBSoft.Carts.GetIdentity(nodes, "request_id")
        Else
            request_id = 0
        End If

        ' creating a new element containing information about the payment request
        Dim myrequest As XmlElement = doc.CreateElement("Request")
        myrequest.SetAttribute("request_id", request_id)
        myrequest.SetAttribute("cart_id", cart_id)
        myrequest.SetAttribute("price", cost.ToString(ci))
        myrequest.SetAttribute("request_date", DateTime.Now.ToString(ci))
        doc.DocumentElement.AppendChild(myrequest)

        Try
            doc.Save(xmlFile)
        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.CreatePaymentRequest(): " + ex.Message)
            Return Nothing
        End Try

        Return request_id
    End Function
    ''' <summary>    
    ''' getting the total cost of goods in the cart
    ''' </summary>
    ''' <returns>the total cost of goods in the cart</returns>
    Protected Function CalculateTotalAmount() As Decimal
        Dim total As Decimal = 10
        Dim ci As CultureInfo = New CultureInfo("en-us")
        Try
            'For Each row As GridViewRow In Me.gvCarts.Rows
            '    Dim price As Decimal = Decimal.Parse(row.Cells(1).Text, ci)
            '    Dim quantity As Integer = Decimal.Parse(row.Cells(2).Text, ci)
            '    total = total + (price * quantity)
            'Next
            Return total
        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.CalculateTotalAmount(): Input string was not in a correct format")
            Return 0
        End Try
    End Function
End Class
