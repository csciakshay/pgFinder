<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="PropertyGraphs.aspx.vb" Inherits="PropertyGraphs" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Heading -->
			<div id="heading" >
				<h1>PG Graphs</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                        <div class="row gtr-uniform">
                            <div class="col-6 col-12-medium">
                                <asp:Chart ID="Chart1" runat=server DataSourceID="SqlDataSource1" Width="418px"><Series>
                                    <asp:Series Name="Series1" XValueMember="city" YValueMembers="total" 
                                        Legend="Legend1" IsValueShownAsLabel="True"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="Legend1" Title="City">
                                        </asp:Legend>
                                    </Legends>
                                    <Titles>
                                        <asp:Title Font="Microsoft Sans Serif, 8pt, style=Bold" Name="Title1" 
                                            Text="City wise PGs">
                                        </asp:Title>
                                    </Titles>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="select city,count(*) as total from propertyMaster where propertysold='N' group by city">
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-6 col-12-medium">
                             <asp:Chart ID="Chart2" runat=server DataSourceID="SqlDataSource2"><Series>
                                    <asp:Series Name="Series1" XValueMember="state" YValueMembers="total" 
                                        IsValueShownAsLabel="True"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas>
                                    <Titles>
                                        <asp:Title Font="Microsoft Sans Serif, 8pt, style=Bold" Name="Title1" 
                                            Text="State wise PGs">
                                        </asp:Title>
                                    </Titles>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="select state,count(*) as total from propertyMaster where propertysold='N' group by state">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="row gtr-uniform">
                            <div class="col-6 col-12-medium">
                            <asp:Chart ID="Chart3" runat=server DataSourceID="SqlDataSource3"><Series>
                                    <asp:Series Name="Series1" XValueMember="name" YValueMembers="total" 
                                        ChartType="Pie" Legend="Legend1" IsValueShownAsLabel="True"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1">
                                    <Area3DStyle Enable3D="True" />
                                    </asp:ChartArea></ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="Legend1" Title="Registered Name">
                                        </asp:Legend>
                                </Legends>
                                    <Titles>
                                        <asp:Title Font="Microsoft Sans Serif, 8pt, style=Bold" Name="Title1" 
                                            Text="Properties by registration">
                                        </asp:Title>
                                    </Titles>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="select b.name,count(*) as total from propertyMaster a left join usermaster b on a.userid=b.id where propertysold='N' group by b.name">
                                </asp:SqlDataSource>
                            </div>
                             <div class="col-6 col-12-medium">
                             <asp:Chart ID="Chart4" runat=server DataSourceID="SqlDataSource4"><Series>
                                    <asp:Series Name="Series1" XValueMember="type" YValueMembers="total" 
                                        ChartType="Pie" Legend="Legend1" IsValueShownAsLabel="True"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1">
                                    <Area3DStyle Enable3D="True" />
                                    </asp:ChartArea></ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="Legend1" Title="Properties Types">
                                        </asp:Legend>
                                </Legends>
                                    <Titles>
                                        <asp:Title Font="Microsoft Sans Serif, 8pt, style=Bold" Name="Title1" 
                                            Text="PG Type wise">
                                        </asp:Title>
                                    </Titles>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="select type,count(*) as total from propertyMaster where propertysold='N' group by type">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
</asp:Content>

