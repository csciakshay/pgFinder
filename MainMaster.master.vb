﻿
Partial Class MainMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uimage") Is Nothing Then
            Image1.ImageUrl = "~/upload/noimage.png"
        Else
            Image1.ImageUrl = Session("uimage")


        End If
    End Sub
    Public Sub logout()
        MsgBox("logout call")
        Session.Abandon()
        Session.Clear()
        Response.Redirect("login.aspx")
    End Sub
End Class

