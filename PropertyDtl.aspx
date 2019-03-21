<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="PropertyDtl.aspx.vb" Inherits="PropertyDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
<script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"
           type="text/javascript"></script>
           <meta property="og:url"           content="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?ID=6" />
  <meta property="og:type"          content="website" />
  <meta property="og:title"         content="PG Finder" />
  <meta property="og:description"   content="Find your batter PG!" />
  <meta property="og:image"         content="~/upload/noimage.png" />
  
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
                    <asp:Label ID="Label2" runat="server" Text="Property Details:" Font-Bold="True"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" Width="492px" Height="50px" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" AutoGenerateRows="False">
                            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <Fields>
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
                         <div id="fb-root"></div>
                        <asp:Label ID="Label3" runat="server" Text="Share to others: "></asp:Label>
                         <script language="javascript" type="text/javascript">
                             var pid = window.location.search;
                             pid = pid.replace("?", '');
                             alert(pid);
                             $(".twitter-share-button").attr("data-url", "http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?"+pid+");
                             $(".fb-share-button").attr("data-href", "http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?"+pid+");
                         </script>
                          <script>  
                              (function (d, s, id) {
                                  var js, fjs = d.getElementsByTagName(s)[0];
                                  if (d.getElementById(id)) return;
                                  js = d.createElement(s); js.id = id;
                                  js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
                                  fjs.parentNode.insertBefore(js, fjs);
                              } (document, 'script', 'facebook-jssdk'));
                              
                              
                              </script>

                              <!-- Your share button code -->
                              <div class="fb-share-button" 
                                data-href="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?ID=6" 
                                data-layout="button_count">
                              </div> 
                              <%--Twitter share--%>
                        <a href="https://twitter.com/share" class="twitter-share-button"  data-text="Best sutable PG option for you is: " data-size="large" data-count="none">Tweet</a>

                        <script>    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
                        <script>
                            window.onload = function () {
                                twttr.events.bind('tweet', function (event) {
                                    alert("Thanks for sharing on twitter");
                                });

                                twttr.events.bind('click', function (event) {
                                    alert("You are going to share in twitter");
                                });
                            }
                            </script>
                            <%--Linked In Share--%>
                         <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
                        <script type="IN/Share" data-onsuccess="lnksuccess" data-onerror="error" data-url="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx"></script>
                         <script>
                             function lnksuccess(url) {
                                 alert("url = " + url + "  shared successfully");
                             }
                             function lnkerror(url) {
                                 alert("something goes wrong in url sharing");
                             }
                        </script>
                    </div>
                   <div class="col-2 col-12-medium">
                       
                    </div>
                     </div>
                    </div>
                 </div>
             </section>

</asp:Content>

