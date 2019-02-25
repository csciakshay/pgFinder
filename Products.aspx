<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="Products.aspx.vb" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Heading -->
			<div id="heading" >
				<h1>Find your batter PG</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                    <div class="row gtr-uniform">
                   
                    <div class="col-3 col-12-medium">
                     <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="" Text ="">- Select Property Type-</asp:ListItem>
                        <asp:ListItem Value="Tenament" Text ="Tenament"></asp:ListItem>
                        <asp:ListItem Value="Flat" Text ="Flat"></asp:ListItem>
                        <asp:ListItem Value="Room" Text ="Room"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-3 col-12-medium">
                     <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="" Text ="">- Select City -</asp:ListItem>
                        <asp:ListItem Value="Ahmedabad" Text ="Ahmedabad"></asp:ListItem>
                        <asp:ListItem Value="Ankleshwar" Text ="Ankleshwar"></asp:ListItem>
                        <asp:ListItem Value="Bharuch" Text ="Bharuch"></asp:ListItem>
                        <asp:ListItem Value="Baroda" Text ="Baroda"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <div class="col-3 col-12-medium">
                     <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem Value="" Text ="">- Select Price Range -</asp:ListItem>
                        <asp:ListItem Value="1000~5000" Text ="1000~5000"></asp:ListItem>
                        <asp:ListItem Value="5001~10000" Text ="5001~10000"></asp:ListItem>
                        <asp:ListItem Value="10000 above" Text ="10000 above"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-3 col-12-medium">
                        <asp:Button ID="Button3" runat="server" Text="Search" class="button primary"></asp:Button>
                        
                    </div>
                   
                    </div>
                    <hr />
                    <h3>Property Details</h3>
                    <div class="row gtr-uniform">
                    <div class="col-12">
<asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="id" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" 
                            RepeatDirection="Horizontal" BorderColor="Blue" RepeatColumns="4" 
                            GridLines="Both">
    <AlternatingItemStyle BackColor="White" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <ItemStyle BackColor="#E3EAEB" />
    <ItemTemplate>
         <%--id:
        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
        <br />--%>
         type:
         <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
        <br />
         Title: <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
         <br />
         description:
        <asp:Label ID="descriptionLabel" runat="server" 
             Text='<%# Eval("description") %>' />
        <br />
         address:
        <asp:Label ID="addressLabel" runat="server" 
            Text='<%# Eval("address") %>' />
        <br />
         city:
        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
        <br />
         size:
        <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
        <br />
         price:
        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
        <br />
        
         negotiable:
        <asp:Label ID="negotiableLabel" runat="server" 
             Text='<%# Eval("negotiable") %>' />
        <br />
         Added By:
        <asp:Label ID="useridLabel" runat="server" 
            Text='<%# Eval("userid") %>' />
        <br />
         Property Added on:
        <asp:Label ID="createDateLabel" runat="server" 
             Text='<%# Eval("createDate") %>' />
        <br />
         
        <asp:Image ID="imageLabel" runat="server" 
            ImageUrl ='<%# Eval("image") %>' Width ="100px" Height="100px" />
        <br />
        <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="button primary  small">View Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Contact Detail</asp:LinkButton>
         <br />
    </ItemTemplate>
    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                            SelectCommand="SELECT * FROM [PropertyMaster] WHERE ([propertysold] = @propertysold)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="N" Name="propertysold" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                     </div>
                    </div>
                 </div>
             </section>
</asp:Content>

