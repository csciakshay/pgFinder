<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="UserDtl.aspx.vb" Inherits="PropertyDtl" %>

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
                     <h3>User Details</h3>
                    <div class="row gtr-uniform">
                      <div class="col-10 col-12-medium">
                        
                    </div>
                     <div class="col-2 col-12-medium">
                        <asp:Button ID="Button1" runat="server" Text="Back" class="primary"></asp:Button>
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                    <asp:Label ID="Label2" runat="server" Text="User Details:"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" Width="492px" Height="50px" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" AutoGenerateRows="False">
                            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <Fields>
                               <asp:ImageField DataImageUrlField="image" HeaderText="Photo">
                                </asp:ImageField>
                                <asp:BoundField DataField="id" HeaderText="Added By" />
                                <asp:BoundField DataField="name" HeaderText="Name" />
                                <asp:BoundField DataField="address" HeaderText="Address" />
                                <asp:BoundField DataField="city" HeaderText="city"></asp:BoundField>
                                <asp:BoundField DataField="state" HeaderText="State" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="contact" HeaderText="Contact" />
                                
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

