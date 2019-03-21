<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="UserReg.aspx.vb" Inherits="UserReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <!-- Heading -->
			<div id="heading" >
				<h1>User Registration Form</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                    <div class="row gtr-uniform">
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                      <asp:TextBox ID="TextBox7" runat="server" placeholder="User Id" Visible="False"></asp:TextBox>
                       
                    </div>
                    <div class="col-4 col-12-medium">
                        
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    </div>
                    <hr />
                    <h3>User Details</h3>
                    <div class="row gtr-uniform">
                    <div class="col-4 col-12-xsmall">
                        <asp:TextBox ID="TextBox8" runat="server" placeholder="Id" ReadOnly = "true"></asp:TextBox>
												
					</div>
                    <div class="col-4 col-12-xsmall">
                      <asp:TextBox ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                   
                    </div>

                    <div class="col-4 col-12-xsmall">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Address"></asp:TextBox>
												
					</div>
					<div class="col-4 col-12-xsmall">
                     <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>- Select City -</asp:ListItem>
                        <asp:ListItem Value="Ankleshwar" Text ="Ankleshwar"></asp:ListItem>
                        <asp:ListItem Value="Bharuch" Text ="Bharuch"></asp:ListItem>
                        <asp:ListItem Value="Baroda" Text ="Baroda"></asp:ListItem>
                        <asp:ListItem Value="Ahmedabad" Text ="Ahmedabad"></asp:ListItem>
                        </asp:DropDownList>
                    								
					</div>
                    <div class="col-4 col-12-xsmall">
                     <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>- Select State -</asp:ListItem>
                        <asp:ListItem Value="Gujarat" Text ="Gujarat"></asp:ListItem>
                        <asp:ListItem Value="Maharastra" Text ="Maharastra"></asp:ListItem>
                        <asp:ListItem Value="Rajesthan" Text ="Rajesthan"></asp:ListItem>
                        <asp:ListItem Value="Hariyana" Text ="Hariyana"></asp:ListItem>
                        </asp:DropDownList>
                        
												
					</div>
					<div class="col-4 col-12-xsmall">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Pincode"></asp:TextBox>							
					</div>
                    <div class="col-4 col-12-xsmall">	
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>	
                    </div>
                    <div class="col-4 col-12-xsmall">
                     <asp:TextBox ID="TextBox5" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="col-4 col-12-xsmall">
                     <asp:TextBox ID="TextBox6" runat="server" placeholder="Conform Password" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="col-4 col-12-xsmall">
                         <asp:TextBox ID="TextBox9" runat="server" placeholder="Contact Number"></asp:TextBox>
                     </div>
                     <div class="col-12">
                     Photoes <asp:FileUpload ID="FileUpload1" runat="server" accept="image/png image/jpeg image/gif"></asp:FileUpload>
                     <asp:Button ID="Button2" runat="server" Text="Upload" class="primary"></asp:Button>
                        <asp:Image ID="Image1" runat="server"></asp:Image>
                     </div>
                    <!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li>
                                                    <asp:Button ID="Button1" runat="server" Text="Submit" class="primary"></asp:Button>
                                                    
                                                    </li>
                                                    <li>
                                                        <asp:Button ID="Button3" runat="server" Text="Update" class="primary"></asp:Button>
                        
                                                    </li>
													<li><input type="reset" value="Reset" /></li>
												</ul>
											</div>

                    </div>
                    </div>
                 </div>
             </section>
</asp:Content>

