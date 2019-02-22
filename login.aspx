<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="heading" >
				<h1>User Login</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                    <div class="row gtr-uniform">
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                      <asp:TextBox ID="TextBox7" runat="server" placeholder="User Name"></asp:TextBox>
                       
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                      <asp:TextBox ID="TextBox1" runat="server" placeholder="Password" TextMode ="Password"></asp:TextBox>
                       
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgetpass.aspx">Forget password?</asp:HyperLink>
                    </div>
                    <div class="col-4 col-12-medium">
                        
                    </div>
                    <div class="col-4 col-12-medium">
                        <asp:Button ID="Button3" runat="server" Text="Login" class="primary"></asp:Button>
                        <asp:Button ID="Button4" runat="server" Text="Reset" class="primary"></asp:Button>
                    </div>
                    <div class="col-4 col-12-medium">
                        
                    </div>
                    </div>
                      </div>
                      </div>
             </section>
</asp:Content>

