<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="PGReport.aspx.vb" Inherits="PGReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Heading -->
			<div id="heading" >
				<h1>PG Report</h1>
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
                        <asp:Button ID="Button2" runat="server" Text="Search"></asp:Button>
                        <asp:Button ID="Button1" runat="server" Text="Exoprt" OnClick = "ExportExcel"></asp:Button>
                      </div>
                      </div>
                    </div>
                        <div class="row gtr-uniform">
                            <div class="col-12 col-12-medium">
                            
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" PageSize="10" OnPageIndexChanging="OnPageIndexChanging" OnSorting="OnSorting">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title"/>
                                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"/>
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state"/>
                                        <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode"/>
                                        <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size"/>
                                        <asp:BoundField DataField="foodtype" HeaderText="Food Type" SortExpression="foodtype"/>
                                        <asp:BoundField DataField="pgtype" HeaderText="PG Type" SortExpression="pgtype"/>
                                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type"/>
                                        <asp:BoundField DataField="pgallowed" HeaderText="PG Allowed" SortExpression="pgallowed"/>
                                        <asp:BoundField DataField="name" HeaderText="Added By" SortExpression="name"/>
                                        <asp:BoundField DataField="price" HeaderText="Amount" SortExpression="price"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                           
                        </div>
                    </div>
                 </div>
            </section>
</asp:Content>

