<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="PropertyDtl.aspx.vb" Inherits="PropertyDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Heading -->
			<div id="heading" >
				<h1>FInd your batter PG</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                     <h3>Property Details</h3>
                    <div class="row gtr-uniform">
                     <div class="col-10 col-12-medium">
                        
                    </div>
                     <div class="col-2 col-12-medium">
                        <asp:Button ID="Button1" runat="server" Text="Back" class="primary"></asp:Button>
                    </div>
                     <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                     <asp:Label ID="Label1" runat="server" Text="Property images:"></asp:Label>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                             ForeColor="#333333" BorderColor="Aqua" 
                            BorderWidth="1px" GridLines="Vertical" RepeatColumns="4" 
                            RepeatDirection="Horizontal">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                          
                            <asp:Image ID="imagesLabel" runat="server" ImageUrl ='<%# Eval("images") %>' Width="100" Height="100" />
                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            SelectCommand="SELECT * FROM [PropertyImages]"></asp:SqlDataSource>--%>
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                    <asp:Label ID="Label2" runat="server" Text="Property Details:"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" Width="492px" Height="50px" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" AutoGenerateRows="False">
                            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <Fields>
                            <asp:ImageField DataImageUrlField="image" HeaderText="Photo">
                                <ControlStyle Height="100px" Width="100px" />
                                </asp:ImageField>
                                <asp:BoundField DataField="type" HeaderText="Property Type" />
                                <asp:BoundField DataField="userid" HeaderText="Added By" />
                                <asp:BoundField DataField="createDate" HeaderText="Added Date" />
                                <asp:BoundField DataField="title" HeaderText="Title" />
                                <asp:BoundField DataField="description" HeaderText="Description" />
                                <asp:BoundField DataField="address" HeaderText="Address" />
                                <asp:BoundField DataField="city" HeaderText="city"></asp:BoundField>
                                <asp:BoundField DataField="size" HeaderText="Size" />
                                <asp:BoundField DataField="price" HeaderText="Price" />
                                <asp:BoundField DataField="negotiable" HeaderText="Price Negotiat" />
                                <asp:BoundField DataField="views" HeaderText="Property Views" />
                            </Fields>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                        </asp:DetailsView>
                    </div>
                   <div class="col-2 col-12-medium">
                        
                    </div>
                     </div>
                    </div>
                 </div>
             </section>

</asp:Content>

