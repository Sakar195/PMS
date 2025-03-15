<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProjectMilestone.aspx.cs" Inherits="PMS.ComplexForm.ProjectMilestone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Project Milestones</h4>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="<%=DropDownList1.ClientID %>" class="form-label fw-bold">Select Project:</label>
                        <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
                        </asp:DropDownList>

                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource2" EmptyDataText="No milestones found for this project."
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary"
                        RowStyle-CssClass="align-middle">
                        <Columns>
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="PROJECT_START_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                            <asp:BoundField DataField="PROJECT_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:BoundField DataField="MILESTONES_TITLE" HeaderText="MILESTONES_TITLE" SortExpression="MILESTONES_TITLE" />
                            <asp:BoundField DataField="MILESTONE_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="MILESTONE_DUE_DATE" SortExpression="MILESTONE_DUE_DATE" />
                            <asp:BoundField DataField="STATUS1" HeaderText="STATUS1" SortExpression="STATUS1" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning">
                                <i class="bi bi-exclamation-triangle me-2"></i>
                                No milestones found for this project.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <div class="mt-3 text-center">
                    <div class="alert alert-info" id="performerInfo" runat="server">
                        <i class="bi bi-trophy me-2"></i>
                        Select a project from the dropdown to view their milestones.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.project_id, p.project_name, p.project_start_date, p.project_due_date, p.status, m.milestone_id, m.milestones_title, m.milestone_due_date, m.status FROM projects p JOIN milestones m ON p.project_id = m.p_id where p.project_id = :selectedProjectId">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="selectedProjectId" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
