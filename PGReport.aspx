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
                            <div class="col-12 col-12-medium">
                            <asp:Button ID="Button1" runat="server" Text="Exoprt" OnClick = "ExportExcel"></asp:Button>
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

