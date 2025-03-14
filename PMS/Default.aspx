<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PMS._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="section-title">Project Management Dashboard
    </h2>

    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card bg-primary text-white h-60">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Active Projects
                    </h5>
                    <h2 class="display-1 mb-0 fw-bold py-3 text-center">
                        <asp:Literal ID="litActiveProjects" runat="server"></asp:Literal>
                    </h2>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-success text-white h-60">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Completed Tasks
                    </h5>
                    <h2 class="display-1 mb-0 fw-bold py-3 text-center">
                        <asp:Literal ID="litCompletedTasks" runat="server"></asp:Literal>
                    </h2>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-warning text-dark h-60">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Pending Tasks
                    </h5>
                    <h2 class="display-1 mb-0 fw-bold py-3 text-center">
                        <asp:Literal ID="litPendingTasks" runat="server"></asp:Literal>
                    </h2>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-info text-white h-60">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Team Members
                    </h5>
                    <h2 class="display-1 mb-0 fw-bold py-3 text-center">
                        <asp:Literal ID="litTeamMembers" runat="server"></asp:Literal>
                    </h2>

                </div>
            </div>
        </div>
    </div>
    <!-- Charts Row -->
    <div class="row mb-4">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-info text-white">
                <h5 class="mb-0">Task Status Distribution</h5>
            </div>
            <div class="card-body">
                <asp:Chart ID="ChartTaskStatusDistribution" runat="server" DataSourceID="SqlDataSourceTaskStatusDistribution"
                    Width="800px" Height="300px" Palette="EarthTones" CssClass="chart-container">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Pie"
                            XValueMember="Task_Status"
                            YValueMembers="Count" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <Area3DStyle Enable3D="true" Inclination="45" Rotation="45" />
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" />
                    </Legends>
                </asp:Chart>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Milestone Status Distribution</h5>
            </div>
            <div class="card-body">
                <asp:Chart ID="ChartMilestoneStatusDistribution" runat="server" DataSourceID="SqlDataSourceMilestoneStatusDistribution"
                    Width="800px" Height="300px" Palette="SeaGreen" CssClass="chart-container">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Pie"
                            XValueMember="Status"
                            YValueMembers="Count" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <Area3DStyle Enable3D="true" Inclination="45" Rotation="45" />
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" />
                    </Legends>
                </asp:Chart>
            </div>
        </div>
    </div>
</div>




    <div class="row mb-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Project Status Distribution
                    </h5>
                </div>
                <div class="card-body">
                    <asp:Chart ID="ChartProjectStatus" runat="server" DataSourceID="SqlDataSourceProjectStatus"
                        Width="800px" Height="300px" Palette="BrightPastel" CssClass="chart-container">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie"
                                XValueMember="Status"
                                YValueMembers="Count" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="true" Inclination="30" Rotation="30" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" />
                        </Legends>
                    </asp:Chart>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Task Status by Project
                    </h5>
                </div>
                <div class="card-body">
                    <asp:Chart ID="ChartTaskStatus" runat="server" DataSourceID="SqlDataSourceTaskStatus"
                        Width="800px" Height="300px" CssClass="chart-container">
                        <Series>
                            <asp:Series Name="Completed" ChartType="Column"
                                XValueMember="Project_Name"
                                YValueMembers="CompletedTasks"
                                Color="Green" />
                            <asp:Series Name="Pending" ChartType="Column"
                                XValueMember="Project_Name"
                                YValueMembers="PendingTasks"
                                Color="Red" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="true" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" />
                        </Legends>
                    </asp:Chart>
                </div>
            </div>
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Upcoming Milestones by Week
                    </h5>
                </div>
                <div class="card-body">
                    <asp:Chart ID="ChartMilestoneDue" runat="server" DataSourceID="SqlDataSourceMilestoneDue"
                        Width="800px" Height="300px" CssClass="chart-container">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Column" XValueMember="Week"
                                YValueMembers="Count" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="true" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Recent Projects
                    </h5>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover mb-0" BorderWidth="0px" GridLines="None"
                        DataSourceID="SqlDataSourceProjects" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Project_Name" HeaderText="Project" />
                            <asp:BoundField DataField="Project_Due_Date" HeaderText="Due Date"
                                DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge bg-<%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-container bg-light" HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                            LastPageText="Last" />
                        <HeaderStyle CssClass="table-light text-dark" />
                        <EmptyDataTemplate>
                            <div class="alert alert-info m-3">
                                No projects found.
                           
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Upcoming Milestones
                    </h5>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover mb-0" BorderWidth="0px" GridLines="None"
                        DataSourceID="SqlDataSourceMilestones" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView2_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Milestones_Title" HeaderText="Milestone" />
                            <asp:BoundField DataField="Project_Name" HeaderText="Project" />
                            <asp:BoundField DataField="Milestone_Due_Date" HeaderText="Due Date"
                                DataFormatString="{0:yyyy-MM-dd}" />
                        </Columns>
                        <PagerStyle CssClass="pagination-container bg-light" HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                            LastPageText="Last" />
                        <HeaderStyle CssClass="table-light text-dark" />
                        <EmptyDataTemplate>
                            <div class="alert alert-info m-3">
                                No upcoming milestones.
                           
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Recent Tasks
                    </h5>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover mb-0" BorderWidth="0px" GridLines="None"
                        DataSourceID="SqlDataSourceTasks" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView3_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Task_Name" HeaderText="Task" />
                            <asp:BoundField DataField="Project_Name" HeaderText="Project" />
                            <asp:BoundField DataField="Task_Due_Date" HeaderText="Due Date"
                                DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge bg-<%# GetTaskStatusBadgeClass(Eval("Task_Status").ToString()) %>'>
                                        <%# Eval("Task_Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-container bg-light" HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                            LastPageText="Last" />
                        <HeaderStyle CssClass="table-light text-dark" />
                        <EmptyDataTemplate>
                            <div class="alert alert-info m-3">
                                No recent tasks.
                           
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSourceTaskStatusDistribution" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT Task_Status, COUNT(*) AS Count FROM Tasks GROUP BY Task_Status">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceMilestoneStatusDistribution" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT Status, COUNT(*) AS Count FROM Milestones GROUP BY Status">
</asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlDataSourceProjectStatus" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT status, COUNT(*) as count FROM projects GROUP BY status"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTaskStatus" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT p.Project_Name,
                          SUM(CASE WHEN t.Task_Status = 'Completed' THEN 1 ELSE 0 END) as CompletedTasks,
                          SUM(CASE WHEN t.Task_Status IN ('Not Started', 'In Progress', 'On Hold') THEN 1 
                               ELSE 0 END) as PendingTasks
                   FROM (
                       SELECT DISTINCT p_id, t_id
                       FROM User_Project_Task 
                   ) dt
                   JOIN Tasks t ON dt.t_id = t.task_id
                   JOIN Projects p ON dt.p_id = p.project_id
                   GROUP BY p.Project_Name"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMilestoneDue" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"      
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT TO_CHAR(m.Milestone_Due_Date, 'IYYY IW') as Week,
                  COUNT(*) as Count
                  FROM Milestones m
                  WHERE m.Milestone_Due_Date >= TO_DATE('2024-01-01', 'YYYY-MM-DD') 
                  GROUP BY TO_CHAR(m.Milestone_Due_Date, 'IYYY IW')
                  ORDER BY week">        
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT project_id, Project_Name, Project_Due_Date, Status FROM Projects ORDER BY Project_Start_Date DESC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMilestones" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT m.milestone_id, m.Milestones_Title, m.Milestone_Due_Date, p.Project_Name
                       FROM Milestones m, Projects p 
                       WHERE m.p_id = p.project_id 
                       ORDER BY m.Milestone_Due_Date ASC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTasks" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT t.task_id, t.Task_Name, t.Task_Status, t.Task_Due_Date, p.Project_Name
                       FROM Tasks t, Projects p, User_Project_Task upt  
                       WHERE t.task_id = upt.t_id AND p.project_id = upt.p_id
                       ORDER BY t.Task_Start_Date DESC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceActiveProjects" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT project_id FROM Projects WHERE Status = 'In Progress'"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceCompletedTasks" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT task_id FROM Tasks WHERE Task_Status = 'Completed'"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourcePendingTasks" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT task_id FROM Tasks WHERE Task_Status IN ('Not Started', 'In Progress', 'On Hold')"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTeamMembers" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT user_id FROM Users"></asp:SqlDataSource>
</asp:Content>

