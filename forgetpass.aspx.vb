﻿Imports System.Data.SqlClient
Imports System.IO
Partial Class forgetpass
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim cmd As New SqlCommand("select id,name,email from UserMaster where email='" + TextBox1.Text + "' and name='" + TextBox2.Text + "'", con)
        Dim da As New SqlDataAdapter
        da.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Dim fullUrl As String = "Hey " + dt.Rows(0)("name").ToString + " your new password is : password"
            Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient("smtp.gmail.com", 587)

            Dim message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage("akshay.darji@gmail.com", TextBox1.Text, "PG Finder Activation", "")
            message.IsBodyHtml = True
            message.Body = fullUrl
            smtpClient.EnableSsl = True
            smtpClient.Send(message)
            Dim cmd2 As New SqlCommand("update usermaster set password='" + FormsAuthentication.HashPasswordForStoringInConfigFile("password", "md5") + "'", con)
            cmd2.ExecuteNonQuery()

            MsgBox("Reset link sent on " + TextBox1.Text)
            Response.Redirect("login.aspx")
        Else
            MsgBox("Email " + TextBox1.Text + " not registered")

        End If

    End Sub
End Class
