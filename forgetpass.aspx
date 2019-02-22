<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="forgetpass.aspx.vb" Inherits="forgetpass" %>

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
                    <asp:Label ID="Label2" runat="server" Text="User Name"></asp:Label>
                      <asp:TextBox ID="TextBox2" runat="server" placeholder="User Name"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                      <asp:TextBox ID="TextBox1" runat="server" placeholder="Email Id"></asp:TextBox>
                       
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    <div class="col-8 col-12-medium">
                    <asp:Button ID="Button1" runat="server" Text="Submit" class="primary"></asp:Button>
                       
                    </div>
                    <div class="col-2 col-12-medium">
                        
                    </div>
                    </div>
                      </div>
                      </div>
             </section>
</asp:Content>

