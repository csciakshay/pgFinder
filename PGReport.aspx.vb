Imports System.Data.SqlClient
Imports System.Data
Imports ClosedXML.Excel
Imports System.IO
Imports System.Drawing

Partial Class PGReport
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Property SortDirection As String
        Get
            Return IIf(ViewState("SortDirection") IsNot Nothing, Convert.ToString(ViewState("SortDirection")), "ASC")
        End Get
        Set(ByVal value As String)
            ViewState("SortDirection") = value
        End Set
    End Property
    Private Sub BindGrid(Optional ByVal sortExpression As String = Nothing)

        Using cmd As New SqlCommand("SELECT a.id,a.title,a.description,a.address,a.city,a.state,a.pincode,a.size,a.price,a.type,a.foodtype,a.pgtype,a.pgallowed,b.name FROM [propertyMaster] a left join usermaster b on a.userid=b.id WHERE ([propertysold] = 'N')", con)
            Using sda As New SqlDataAdapter()
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    If (Not (sortExpression) Is Nothing) Then
                        Dim dv As DataView = dt.AsDataView
                        Me.SortDirection = IIf(Me.SortDirection = "ASC", "DESC", "ASC")
                        dv.Sort = sortExpression & " " & Me.SortDirection
                        GridView1.DataSource = dv
                    Else
                        GridView1.DataSource = dt
                    End If
                    GridView1.DataSource = dt
                    GridView1.DataBind()
                End Using
            End Using
        End Using

    End Sub
    Protected Sub OnSorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
        Me.BindGrid(e.SortExpression)
    End Sub
    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub
    Protected Sub ExportExcel(ByVal sender As Object, ByVal e As EventArgs)

        Using cmd As New SqlCommand("SELECT a.id,a.title,a.description,a.address,a.city,a.state,a.pincode,a.size,a.price,a.type,a.foodtype,a.pgtype,a.pgallowed,b.name FROM [propertyMaster] a left join usermaster b on a.userid=b.id WHERE ([propertysold] = 'N')")
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Using wb As New XLWorkbook()
                        wb.Worksheets.Add(dt, "Properties")

                        Response.Clear()
                        Response.Buffer = True
                        Response.Charset = ""
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                        Response.AddHeader("content-disposition", "attachment;filename=Properties.xlsx")
                        Using MyMemoryStream As New MemoryStream()
                            wb.SaveAs(MyMemoryStream)
                            MyMemoryStream.WriteTo(Response.OutputStream)
                            Response.Flush()
                            Response.End()
                        End Using
                    End Using
                End Using
            End Using
        End Using

    End Sub
End Class
