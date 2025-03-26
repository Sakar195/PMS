<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PMS._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%-- CSS Enhancements --%>
    <style>
        .chart-container {
            position: relative;
            width: 100%;
        }

        .chart-responsive {
            display: block;
            max-width: 100%;
            height: auto !important;
        }

        .card {
            margin-bottom: 1.5rem;
            border: none;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .card-header {
            border-bottom: 1px solid rgba(0,0,0,.125);
            font-weight: 600;
            background-color: #f8f9fa;
            padding: 0.75rem 1.25rem;
        }

            .card-header .text-primary {
                color: #0d6efd !important;
            }

        .kpi-value {
            font-size: 3rem;
            line-height: 1.1;
        }

        .card.h-100 {
            display: flex;
            flex-direction: column;
        }

            .card.h-100 .card-body {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

        .card-body.center-chart-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        .card-body .chart-container-centered {
            max-width: 700px;
            width: 100%;
        }

        .card-body .chart-container-scrollable {
            overflow-x: auto;
            width: 100%;
        }
    </style>

    <h2 class="section-title mb-4">Project Management Dashboard</h2>

    <!-- KPI Cards Row -->
    <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 bg-primary text-white shadow-sm">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title mb-3">Active Projects</h5>
                    <div class="mt-auto text-center">
                        <span class="kpi-value fw-bold">
                            <asp:Literal ID="litActiveProjects" runat="server">0</asp:Literal>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 bg-success text-white shadow-sm">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title mb-3">Completed Tasks</h5>
                    <div class="mt-auto text-center">
                        <span class="kpi-value fw-bold">
                            <asp:Literal ID="litCompletedTasks" runat="server">0</asp:Literal>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 bg-warning text-dark shadow-sm">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title mb-3">Pending Tasks</h5>
                    <div class="mt-auto text-center">
                        <span class="kpi-value fw-bold">
                            <asp:Literal ID="litPendingTasks" runat="server">0</asp:Literal>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 bg-info text-white shadow-sm">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title mb-3">Team Members</h5>
                    <div class="mt-auto text-center">
                        <span class="kpi-value fw-bold">
                            <asp:Literal ID="litTeamMembers" runat="server">0</asp:Literal>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Milestone Chart Row (Now Full Width) -->
    <div class="row mb-4">
        <%-- ChartTaskStatus column REMOVED --%>

        <%-- ChartMilestoneDue now takes full width --%>
        <div class="col-lg-12 mb-4">
            <%-- Changed from col-lg-6 to col-lg-12 --%>
            <div class="card h-100">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Upcoming Milestones (Next 12 Weeks)</h6>
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <%-- Optionally increase Width slightly, but responsive class helps --%>
                        <asp:Chart ID="ChartMilestoneDue" runat="server" DataSourceID="SqlDataSourceMilestoneDue" Width="900px" Height="450px" CssClass="chart-responsive" AntiAliasing="All" TextAntiAliasingQuality="High" Palette="None" PaletteCustomColors="#5bc0de">
                            <Series>
                                <asp:Series Name="Series1" ChartType="Column" XValueMember="WeekStartDate" YValueMembers="Count" Color="#5bc0de" ToolTip="Week Starting: #VALX{MMM dd, yyyy}%0AMilestones Due: #VALY" />
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <AxisX Title="Week Starting" TitleFont="Arial, 11pt" Interval="1" IsLabelAutoFit="true" LabelAutoFitStyle="WordWrap">
                                        <LabelStyle Format="MMM dd" Font="Arial, 10pt" />
                                        <MajorGrid LineColor="Gainsboro" LineDashStyle="Dot" Enabled="false" />
                                    </AxisX>
                                    <AxisY Title="Milestone Count" TitleFont="Arial, 11pt">
                                        <LabelStyle Font="Arial, 10pt" />
                                        <MajorGrid LineColor="Gainsboro" LineDashStyle="Dot" />
                                    </AxisY>
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Status Distribution Charts Row (Remains the Same) -->
    <div class="row mb-4">
        <div class="col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Task Status Distribution</h6>
                </div>
                <div class="card-body center-chart-content">
                    <div class="chart-container-centered">
                        <asp:Chart ID="ChartTaskStatusDistribution" runat="server" DataSourceID="SqlDataSourceTaskStatusDistribution" Width="700px" Height="450px" CssClass="chart-responsive" Palette="Pastel" AntiAliasing="All" TextAntiAliasingQuality="High">
                            <Series>
                                <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="Task_Status" YValueMembers="Count" ToolTip="#VALX: #VALY (#PERCENT{P0})" Label="#VALX (#PERCENT{P0})" LegendToolTip="#VALX: #VALY" LabelForeColor="Black" Font="Arial, 10pt" CustomProperties="PieLabelStyle=Outside, PieLineColor=Gray" />
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Docking="Right" Alignment="Center" BackColor="Transparent" Font="Arial, 10pt" />
                            </Legends>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Milestone Status Distribution</h6>
                </div>
                <div class="card-body center-chart-content">
                    <div class="chart-container-centered">
                        <asp:Chart ID="ChartMilestoneStatusDistribution" runat="server" DataSourceID="SqlDataSourceMilestoneStatusDistribution" Width="700px" Height="450px" CssClass="chart-responsive" Palette="SeaGreen" AntiAliasing="All" TextAntiAliasingQuality="High">
                            <Series>
                                <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="Status" YValueMembers="Count" ToolTip="#VALX: #VALY (#PERCENT{P0})" Label="#VALX (#PERCENT{P0})" LegendToolTip="#VALX: #VALY" LabelForeColor="Black" Font="Arial, 10pt" CustomProperties="PieLabelStyle=Outside, PieLineColor=Gray" />
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Docking="Right" Alignment="Center" BackColor="Transparent" Font="Arial, 10pt" />
                            </Legends>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Project Status Row (Remains the Same) -->
    <div class="row mb-4">
        <div class="col-md-12 mb-4">
            <div class="card h-100">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Project Status Distribution</h6>
                </div>
                <div class="card-body center-chart-content">
                    <div class="chart-container-centered">
                        <asp:Chart ID="ChartProjectStatus" runat="server" DataSourceID="SqlDataSourceProjectStatus" Width="700px" Height="450px" CssClass="chart-responsive" Palette="BrightPastel" AntiAliasing="All" TextAntiAliasingQuality="High">
                            <Series>
                                <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="Status" YValueMembers="Count" ToolTip="#VALX: #VALY (#PERCENT{P0})" Label="#VALX (#PERCENT{P0})" LegendToolTip="#VALX: #VALY" LabelForeColor="Black" Font="Arial, 10pt" CustomProperties="PieLabelStyle=Outside, PieLineColor=Gray" />
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Docking="Right" Alignment="Center" BackColor="Transparent" Font="Arial, 10pt" />
                            </Legends>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Project Timeline Row (Remains the Same) -->
    <div class="row mb-5">
        <div class="col-12">
            <div class="card">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Project Timeline Overview (Active Projects)</h6>
                </div>
                <div class="card-body p-4">
                    <div class="chart-container-scrollable">
                        <asp:Chart ID="ChartProjectTimeline" runat="server" DataSourceID="SqlDataSourceProjectTimeline" Width="1400px" Height="700px" CssClass="chart-responsive" AntiAliasing="All" TextAntiAliasingQuality="High">
                            <Series>
                                <asp:Series Name="Project Timeline" ChartType="RangeBar" XValueMember="Project_Name" YValueMembers="StartDate,EndDate" Color="#0d6efd" BorderColor="#0a58ca" BorderWidth="1" ToolTip="Project: #VALX%0AStart: #VALY1{MMM dd, yyyy}%0AEnd: #VALY2{MMM dd, yyyy}"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <AxisX Title="Project" TitleFont="Arial, 11pt" IsLabelAutoFit="true" LabelAutoFitStyle="WordWrap" Interval="1">
                                        <LabelStyle Font="Arial, 10pt" />
                                        <MajorGrid LineColor="Gainsboro" LineDashStyle="Dot" Enabled="true" />
                                    </AxisX>
                                    <AxisY Title="Timeline" TitleFont="Arial, 11pt" IsLabelAutoFit="true">
                                        <LabelStyle Font="Arial, 10pt" Format="MMM yyyy" />
                                        <MajorGrid LineColor="Gainsboro" LineDashStyle="Dot" Enabled="true" />
                                    </AxisY>
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Data Sources --%>
    <asp:SqlDataSource ID="SqlDataSourceTaskStatusDistribution" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Task_Status, COUNT(*) AS Count FROM Tasks GROUP BY Task_Status"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMilestoneStatusDistribution" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Status, COUNT(*) AS Count FROM Milestones GROUP BY Status"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceProjectStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT status, COUNT(*) as count FROM projects GROUP BY status"></asp:SqlDataSource>

    <%-- SqlDataSourceTaskStatus REMOVED --%>

    <asp:SqlDataSource ID="SqlDataSourceMilestoneDue" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TO_CHAR(TRUNC(m.Milestone_Due_Date, 'IW'), 'YYYY-MM-DD') as WeekStartDate, COUNT(*) as Count FROM Milestones m WHERE m.Status != 'Completed' AND m.Milestone_Due_Date >= TRUNC(SYSDATE, 'IW') AND m.Milestone_Due_Date < TRUNC(SYSDATE, 'IW') + (12 * 7) GROUP BY TRUNC(m.Milestone_Due_Date, 'IW') ORDER BY TRUNC(m.Milestone_Due_Date, 'IW')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT project_id, Project_Name, Project_Due_Date, Status FROM Projects ORDER BY Project_Start_Date DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMilestones" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT m.milestone_id, m.Milestones_Title, m.Milestone_Due_Date, p.Project_Name FROM Milestones m JOIN Projects p ON m.p_id = p.project_id ORDER BY m.Milestone_Due_Date ASC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTasks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT t.task_id, t.Task_Name, t.Task_Status, t.Task_Due_Date, p.Project_Name FROM Tasks t JOIN User_Project_Task upt ON t.task_id = upt.t_id JOIN Projects p ON upt.p_id = p.project_id ORDER BY t.Task_Start_Date DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceActiveProjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT project_id FROM Projects WHERE Status = 'In Progress'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCompletedTasks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT task_id FROM Tasks WHERE Task_Status = 'Completed'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePendingTasks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT task_id FROM Tasks WHERE Task_Status NOT IN ('Completed', 'Cancelled')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTeamMembers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT user_id FROM Users"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceProjectTimeline" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Project_Name, Project_Start_Date as StartDate, Project_Due_Date as EndDate FROM Projects WHERE Status != 'Completed' ORDER BY Project_Start_Date"></asp:SqlDataSource>

</asp:Content>
