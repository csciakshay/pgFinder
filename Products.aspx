<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="Products.aspx.vb" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Heading -->
			<div id="heading" >
				<h1>Find your better PG</h1>
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
                        <asp:ListItem Value="Ankleshwar" Text ="Ankleshwar"></asp:ListItem>
                        <asp:ListItem Value="Bharuch" Text ="Bharuch"></asp:ListItem>
                        <asp:ListItem Value="Baroda" Text ="Baroda"></asp:ListItem>
                        <asp:ListItem Value="Ahmedabad" Text ="Ahmedabad"></asp:ListItem>
                        <asp:ListItem Value="Delhi" Text ="Delhi"></asp:ListItem>
                        <asp:ListItem Value="Bangalore" Text ="Bangalore"></asp:ListItem>
                        <asp:ListItem Value="Hyderabad" Text ="Hyderabad"></asp:ListItem>
                        <asp:ListItem Value="Chennai" Text ="Chennai"></asp:ListItem>
                        <asp:ListItem Value="Kolkata" Text ="Kolkata"></asp:ListItem>
                        <asp:ListItem Value="Surat" Text ="Surat"></asp:ListItem>
                        <asp:ListItem Value="Pune" Text ="Pune"></asp:ListItem>
                        <asp:ListItem Value="Jaipur" Text ="Jaipur"></asp:ListItem>
                        <asp:ListItem Value="Lucknow" Text ="Lucknow"></asp:ListItem>
                        <asp:ListItem Value="Kanpur" Text ="Kanpur"></asp:ListItem>
                        <asp:ListItem Value="Bhopal" Text ="Bhopal"></asp:ListItem>
                        <asp:ListItem Value="Agra" Text ="Agra"></asp:ListItem>
                        <asp:ListItem Value="Nashik" Text ="Nashik"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-3 col-12-medium">
                     <asp:DropDownList ID="DropDownList4" runat="server">
                     <asp:ListItem Value="" Text ="">- Select State -</asp:ListItem>
                        <asp:ListItem Value="Andra Pradesh" Text ="Andra Pradesh"></asp:ListItem>
                        <asp:ListItem Value="Arunachal Pradesh" Text ="Arunachal Pradesh"></asp:ListItem>
                        <asp:ListItem Value="Assam" Text ="Assam"></asp:ListItem>
                        <asp:ListItem Value="Bihar" Text ="Bihar"></asp:ListItem>
                        <asp:ListItem Value="Chhattisgarh" Text ="Chhattisgarh"></asp:ListItem>
                        <asp:ListItem Value="Goa" Text ="Goa"></asp:ListItem>
                        <asp:ListItem Value="Gujarat" Text ="Gujarat"></asp:ListItem>
                        <asp:ListItem Value="Haryana" Text ="Haryana"></asp:ListItem>
                        <asp:ListItem Value="Himachal Pradesh" Text ="Himachal Pradesh"></asp:ListItem>
                        <asp:ListItem Value="Karnataka" Text ="Karnataka"></asp:ListItem>
                        <asp:ListItem Value="Kerala" Text ="Kerala"></asp:ListItem>
                        <asp:ListItem Value="Madya Pradesh" Text ="Madya Pradesh"></asp:ListItem>
                        <asp:ListItem Value="Maharashtra" Text ="Maharashtra"></asp:ListItem>
                        <asp:ListItem Value="Manipur" Text ="Manipur"></asp:ListItem>
                        <asp:ListItem Value="Punjab" Text ="Punjab"></asp:ListItem>
                        <asp:ListItem Value="Rajasthan" Text ="Rajasthan"></asp:ListItem>
                        <asp:ListItem Value="Uttar Pradesh" Text ="Uttar Pradesh"></asp:ListItem>
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
                    <h3><b>Property Details</b></h3>
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
        <asp:Image ID="imageLabel" runat="server" 
            ImageUrl ='<%# Eval("images") %>' Width ="100px" Height="100px" />
        <br />
         <b>Type:</b>
         <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
        <br />
        <b> Title:</b> <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
         <br />
         <b>Description:</b>
        <asp:Label ID="descriptionLabel" runat="server" 
             Text='<%# Eval("description") %>' />
        <br />
        <b> Address:</b>
        <asp:Label ID="addressLabel" runat="server" 
            Text='<%# Eval("address") %>' />
        <br />
         <b>City:</b>
        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
        <br />
         <b>Size:</b>
        <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
        <br />
         <b>Price:</b>
        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
        <br />
        
         <b>Negotiable:</b>
        <asp:Label ID="negotiableLabel" runat="server" 
             Text='<%# Eval("negotiable") %>' />
        <br />
        <b> Added By:</b>
        <asp:Label ID="useridLabel" runat="server" 
            Text='<%# Eval("name") %>' />
        <br />
        <b> Property Added on:</b>
        <asp:Label ID="createDateLabel" runat="server" 
             Text='<%# Eval("createDate") %>' />
        <br />
         
        
        <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="button primary  small">View Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Contact Detail</asp:LinkButton>
        <%--<asp:LinkButton ID="LinkButton3" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Add Favorite</asp:LinkButton>--%>
         <br />
    </ItemTemplate>
    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                            SelectCommand="SELECT a.*,b.name, (SELECT        TOP (1) images
                               FROM            propertyImages
                               WHERE        (a.id = propertyid)) AS images FROM [PropertyMaster] a left join [UserMaster] b on a.userid=b.id WHERE ([propertysold] = @propertysold)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="N" Name="propertysold" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                     </div>
           <div class="row gtr-uniform">
              <div class="col-12">
                    <asp:Label ID="Label2" runat="server" Text=" Top 5 viewed PG Property" Font-Bold="True" ></asp:Label>                   
                    <asp:DataList ID="DataList3" runat="server" CellPadding="4" DataKeyField="id" 
                                                DataSourceID="SqlDataSource3" ForeColor="#333333" 
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
                            <asp:Image ID="imageLabel" runat="server" 
                                ImageUrl ='<%# Eval("images") %>' Width ="100px" Height="100px" />
                            <br />
                             <b>Type:</b>
                             <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            <br />
                             <b>Title:</b> <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                             <br />
                             <b>Description:</b>
                            <asp:Label ID="descriptionLabel" runat="server" 
                                 Text='<%# Eval("description") %>' />
                            <br />
                             <b>Address:</b>
                            <asp:Label ID="addressLabel" runat="server" 
                                Text='<%# Eval("address") %>' />
                            <br />
                             <b>City:</b>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                            <br />
                             <b>Size:</b>
                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                            <br />
                             <b>Price:</b>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            <br />
        
                             <b>Negotiable:</b>
                            <asp:Label ID="negotiableLabel" runat="server" 
                                 Text='<%# Eval("negotiable") %>' />
                            <br />
                             <b>Added By:</b>
                            <asp:Label ID="useridLabel" runat="server" 
                                Text='<%# Eval("name") %>' />
                            <br />
                             <b>Property Added on:</b>
                            <asp:Label ID="createDateLabel" runat="server" 
                                 Text='<%# Eval("createDate") %>' />
                            <br />
         
        
                            <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="button primary  small">View Detail</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Contact Detail</asp:LinkButton>
                            <%--<asp:LinkButton ID="LinkButton3" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Add Favorite</asp:LinkButton>--%>
                             <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                                                SelectCommand="">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="N" Name="propertysold" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                    </div>
                     </div>
                     <div class="row gtr-uniform">
                    <div class="col-12">
                                    <asp:Label ID="Label1" runat="server" Text=" Favourite PG Property" Font-Bold="True" Visible ="false" ></asp:Label>                   
                                    <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataKeyField="id" 
                                                                DataSourceID="SqlDataSource2" ForeColor="#333333" 
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
                                            <asp:Image ID="imageLabel" runat="server" 
                                                ImageUrl ='<%# Eval("images") %>' Width ="100px" Height="100px" />
                                            <br />
                                             <b>Type:</b>
                                             <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                                            <br />
                                             <b>Title:</b> <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                             <br />
                                             <b>Description:</b>
                                            <asp:Label ID="descriptionLabel" runat="server" 
                                                 Text='<%# Eval("description") %>' />
                                            <br />
                                             <b>Address:</b>
                                            <asp:Label ID="addressLabel" runat="server" 
                                                Text='<%# Eval("address") %>' />
                                            <br />
                                             <b>City:</b>
                                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                                            <br />
                                             <b>Size:</b>
                                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                                            <br />
                                             <b>Price:</b>
                                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                            <br />
        
                                             <b>Negotiable:</b>
                                            <asp:Label ID="negotiableLabel" runat="server" 
                                                 Text='<%# Eval("negotiable") %>' />
                                            <br />
                                             <b>Added By:</b>
                                            <asp:Label ID="useridLabel" runat="server" 
                                                Text='<%# Eval("name") %>' />
                                            <br />
                                             <b>Property Added on:</b>
                                            <asp:Label ID="createDateLabel" runat="server" 
                                                 Text='<%# Eval("createDate") %>' />
                                            <br />
         
        
                                            <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="button primary  small">View Detail</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Contact Detail</asp:LinkButton>
                                            <%--<asp:LinkButton ID="LinkButton3" href='<%# Eval("userid", "UserDtl.aspx?ID={0}") %>' runat="server" class="button small">Add Favorite</asp:LinkButton>--%>
                                             <br />
                                        </ItemTemplate>
                                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataList>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                                                                SelectCommand="">
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

