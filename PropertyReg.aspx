<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="PropertyReg.aspx.vb" Inherits="PropertyReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Heading -->
			<div id="heading" >
				<h1>Property Entry Form</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                    <div class="row gtr-uniform">
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                     <%-- <asp:TextBox ID="TextBox7" runat="server" placeholder="Property Id"></asp:TextBox>--%>
                       <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-4 col-12-medium">
                        <asp:Button ID="Button3" runat="server" Text="Search" class="primary"></asp:Button>
                        <asp:Button ID="Button4" runat="server" Text="Update" class="primary"></asp:Button>
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    </div>
                    <hr />
                    <h3>Property Details</h3>
                    <div class="row gtr-uniform">
                    <div class="col-4 col-12-xsmall">
                      Id  <asp:TextBox ID="TextBox8" runat="server" placeholder="Id" ReadOnly = "true"></asp:TextBox>
												
					</div>
                    <div class="col-4 col-12-xsmall">Property Type
                     <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="" Text ="">- Select Property Type-</asp:ListItem>
                        <asp:ListItem Value="Tenament" Text ="Tenament"></asp:ListItem>
                        <asp:ListItem Value="Flat" Text ="Flat"></asp:ListItem>
                        <asp:ListItem Value="Room" Text ="Room"></asp:ListItem>
                       
                        </asp:DropDownList>
                   
                    </div>

                    <div class="col-4 col-12-xsmall">
                      Title  <asp:TextBox ID="TextBox1" runat="server" placeholder="Titel Name"></asp:TextBox>
												
					</div>
					<div class="col-4 col-12-xsmall">
                        Description <asp:TextBox ID="TextBox2" runat="server" placeholder="Description"></asp:TextBox>												
					</div>
                    <div class="col-4 col-12-xsmall">
                        Additional Information <asp:TextBox ID="TextBox3" runat="server" placeholder="Additional Information"></asp:TextBox>
												
					</div>
					<div class="col-4 col-12-xsmall">
                        Address <asp:TextBox ID="TextBox4" runat="server" placeholder="Address"></asp:TextBox>												
					</div>
                    <div class="col-4 col-12-xsmall">	City
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>- Select City -</asp:ListItem>
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
                    <div class="col-4 col-12-xsmall">	State
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>- Select State -</asp:ListItem>
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
                    <div class="col-4 col-12-xsmall">
                      PinCode<asp:TextBox ID="TextBox10" runat="server" placeholder="Pin code"></asp:TextBox>
                      </div>
                    <div class="col-4 col-12-xsmall">
                     Size(squre feet)<asp:TextBox ID="TextBox5" runat="server" placeholder="Size of Property"></asp:TextBox>
                     </div>
                     <div class="col-4 col-12-xsmall">
                     Price<asp:TextBox ID="TextBox6" runat="server" placeholder="Price"></asp:TextBox>
                     </div>
                     <div class="col-4 col-12-xsmall">
                      Number of Members<asp:TextBox ID="TextBox9" runat="server" placeholder="No of Members"></asp:TextBox>
                      </div>
                     <div class="col-4 col-12-xsmall">
                          <asp:CheckBox ID="CheckBox1" runat="server" Text ="Price Negotiable"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox2" runat="server" Text ="Sold Out"></asp:CheckBox>
                     </div>
                     <div class="col-4 col-12-xsmall">Aminities: 
                          <asp:CheckBox ID="CheckBox3" runat="server" Text ="Lifts"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox4" runat="server" Text ="Park"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox5" runat="server" Text ="Visitor Parking"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox6" runat="server" Text ="Inter Com"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox7" runat="server" Text ="Water Storage"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox8" runat="server" Text ="Security"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox9" runat="server" Text ="Fire Aleram"></asp:CheckBox>
                     </div>
                     <div class="col-4 col-12-xsmall"> Prefere Food:
                          <asp:CheckBox ID="CheckBox10" runat="server" Text ="Veg"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox11" runat="server" Text ="NonVeg"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox12" runat="server" Text ="Eggetarian"></asp:CheckBox>
                      </div>
                      <div class="col-4 col-12-xsmall"> PG for:
                          <asp:CheckBox ID="CheckBox13" runat="server" Text ="Bachelor"></asp:CheckBox>
                           <asp:CheckBox ID="CheckBox14" runat="server" Text ="Family"></asp:CheckBox>
                      
                      </div>
                      <div class="col-4 col-12-xsmall">
                     Photoes <asp:FileUpload ID="FileUpload1" runat="server" accept="image/png image/jpeg image/gif" AllowMultiple="true"></asp:FileUpload>
                     <%--<asp:Button ID="Button2" runat="server" Text="Upload" class="primary"></asp:Button>--%>
                        <asp:Image ID="Image1" runat="server" Width="50" Height="50"></asp:Image>
                     </div>
                    <!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li>
                                                    <asp:Button ID="Button1" runat="server" Text="Submit" class="primary"></asp:Button>
                                                    
                                                    </li>
													<li><asp:Button ID="Button2" runat="server" Text="Reset" class="default" CausesValidation="false"></asp:Button></li>
												</ul>
											</div>

                    </div>
                    </div>
                 </div>
             </section>
</asp:Content>

