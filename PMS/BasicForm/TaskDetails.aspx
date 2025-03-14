<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TaskDetails.aspx.cs" Inherits="PMS.BasicForm.TaskDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />
    <div class="container mt-4">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Task Management</h4>
                <asp:LinkButton ID="btnNewTask" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewTaskButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Task
                </asp:LinkButton>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary" RowStyle-CssClass="align-middle"
                        DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1" GridLines="None"
                        OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group">
                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit"
                                            CssClass="btn btn-sm btn-outline-primary" CausesValidation="false">
                                            <i class="bi bi-pencil-fill"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                                            CssClass="btn btn-sm btn-outline-danger" CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to delete this task?');">
                                            <i class="bi bi-trash-fill"></i>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="btn-group">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update"
                                            CssClass="btn btn-sm btn-success" CausesValidation="true">
                                            <i class="bi bi-check-lg"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel"
                                            CssClass="btn btn-sm btn-secondary" CausesValidation="false">
                                            <i class="bi bi-x-lg"></i>
                                        </asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                            <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                            <asp:BoundField DataField="TASK_STATUS" HeaderText="TASK_STATUS" SortExpression="TASK_STATUS" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="TASK_START_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("TASK_START_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="StartDateTextBox" runat="server"
                                        Text='<%# Bind("TASK_START_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                                        ControlToValidate="StartDateTextBox" Display="Dynamic"
                                        ErrorMessage="Start date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="TASK_DUE_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("TASK_DUE_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DueDateTextBox" runat="server"
                                        Text='<%# Bind("TASK_DUE_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvDueDate" runat="server"
                                        ControlToValidate="DueDateTextBox" Display="Dynamic"
                                        ErrorMessage="Due date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ESTIMATED_HOURS" HeaderText="ESTIMATED_HOURS"
                                SortExpression="ESTIMATED_HOURS" />
                            <asp:BoundField DataField="PRIORITY_LEVEL" HeaderText="PRIORITY_LEVEL"
                                SortExpression="PRIORITY_LEVEL" />
                            <asp:TemplateField HeaderText="MILESTONE_NAME">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server"
                                        DataSourceID="SqlDataSource2" DataTextField="MILESTONES_TITLE"
                                        DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="table-info" ForeColor="Black" />
                    </asp:GridView>
                </div>
            </div>
            <asp:Panel ID="InsertPanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Task</h5>
                </div>
                <div class="card-body">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID"
                        DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label for="TASK_IDTextBox" class="form-label">Task ID:</label>
                                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>'
                                            CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="rfvTaskID" runat="server"
                                            ControlToValidate="TASK_IDTextBox" Display="Dynamic"
                                            ErrorMessage="Task ID is required" CssClass="text-danger" />
                                        <asp:RegularExpressionValidator ID="revTaskID" runat="server"
                                            ControlToValidate="TASK_IDTextBox" ErrorMessage="Task ID must be a number"
                                            CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d+$" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="TASK_NAMETextBox" class="form-label">Task Name:</label>
                                        <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>'
                                            CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="rfvTaskName" runat="server"
                                            ControlToValidate="TASK_NAMETextBox" Display="Dynamic"
                                            ErrorMessage="Task name is required" CssClass="text-danger" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="TASK_STATUSDropDown" class="form-label">Task Status:</label>
                                        <asp:DropDownList ID="TASK_STATUSDropDown" runat="server" Text='<%# Bind("TASK_STATUS") %>'
                                            CssClass="form-select">
                                            <asp:ListItem Text="Not Started" Value="Not Started" />
                                            <asp:ListItem Text="In Progress" Value="In Progress" />
                                            <asp:ListItem Text="Completed" Value="Completed" />
                                            <asp:ListItem Text="On Hold" Value="On Hold" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="TASK_START_DATETextBox" class="form-label">Start Date:</label>
                                        <asp:TextBox ID="TASK_START_DATETextBox" runat="server"
                                            Text='<%# Bind("TASK_START_DATE", "{0:yyyy-MM-dd}") %>'
                                            CssClass="form-control" TextMode="Date" />
                                        <asp:RequiredFieldValidator ID="rfvTaskStartDate" runat="server"
                                            ControlToValidate="TASK_START_DATETextBox" Display="Dynamic"
                                            ErrorMessage="Start date is required" CssClass="text-danger" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label for="TASK_DUE_DATETextBox" class="form-label">Due Date:</label>
                                        <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server"
                                            Text='<%# Bind("TASK_DUE_DATE", "{0:yyyy-MM-dd}") %>'
                                            CssClass="form-control" TextMode="Date" />
                                        <asp:RequiredFieldValidator ID="rfvTaskDueDate" runat="server"
                                            ControlToValidate="TASK_DUE_DATETextBox" Display="Dynamic"
                                            ErrorMessage="Due date is required" CssClass="text-danger" />
                                        <asp:CompareValidator ID="cvDateComparison" runat="server"
                                            ControlToCompare="TASK_START_DATETextBox" ControlToValidate="TASK_DUE_DATETextBox"
                                            Operator="GreaterThanEqual" Type="Date"
                                            ErrorMessage="Due date must be after or equal to start date"
                                            CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="ESTIMATED_HOURSTextBox" class="form-label">Estimated Hours:</label>
                                        <asp:TextBox ID="ESTIMATED_HOURSTextBox" runat="server"
                                            Text='<%# Bind("ESTIMATED_HOURS") %>' CssClass="form-control" TextMode="Number" step="0.5" />
                                        <asp:RequiredFieldValidator ID="rfvEstimatedHours" runat="server"
                                            ControlToValidate="ESTIMATED_HOURSTextBox" Display="Dynamic"
                                            ErrorMessage="Estimated hours is required" CssClass="text-danger" />
                                        <asp:RangeValidator ID="rvEstimatedHours" runat="server"
                                            ControlToValidate="ESTIMATED_HOURSTextBox" Type="Double"
                                            MinimumValue="0.1" MaximumValue="1000" Display="Dynamic"
                                            ErrorMessage="Hours must be between 0.1 and 1000" CssClass="text-danger" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="PRIORITY_LEVELDropDown" class="form-label">Priority Level:</label>
                                        <asp:DropDownList ID="PRIORITY_LEVELDropDown" runat="server"
                                            Text='<%# Bind("PRIORITY_LEVEL") %>' CssClass="form-select">
                                            <asp:ListItem Text="1 - Low" Value="1" />
                                            <asp:ListItem Text="2 - Medium" Value="2" />
                                            <asp:ListItem Text="3 - High" Value="3" />
                                            <asp:ListItem Text="4 - Critical" Value="4" />
                                            <asp:ListItem Text="5 - Urgent" Value="5" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="MilestoneDropDown" class="form-label">Milestone:</label>
                                        <asp:DropDownList ID="MilestoneDropDown" runat="server"
                                            DataSourceID="SqlDataSource2" DataTextField="MILESTONES_TITLE"
                                            DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'
                                            CssClass="form-select">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvMilestone" runat="server"
                                            ControlToValidate="MilestoneDropDown" Display="Dynamic"
                                            ErrorMessage="Milestone is required" CssClass="text-danger"
                                            InitialValue="" />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3 d-flex justify-content-end">
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    OnClick="InsertCancelButton_Click" CommandName="Cancel" CssClass="btn btn-secondary me-2">
                                    <i class="bi bi-x-lg"></i> Cancel
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" CssClass="btn btn-success">
                                    <i class="bi bi-save"></i> Save Task
                                </asp:LinkButton>
                            </div>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                HeaderText="Please correct the following errors:"
                                CssClass="alert alert-danger mt-3" />
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </asp:Panel>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot; FROM &quot;MILESTONES&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID"
            InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STATUS&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;ESTIMATED_HOURS&quot;, &quot;PRIORITY_LEVEL&quot;, &quot;MILESTONE_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :TASK_STATUS, :TASK_START_DATE, :TASK_DUE_DATE, :ESTIMATED_HOURS, :PRIORITY_LEVEL, :MILESTONE_ID)"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STATUS&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;ESTIMATED_HOURS&quot;, &quot;PRIORITY_LEVEL&quot;, &quot;MILESTONE_ID&quot; FROM &quot;TASKS&quot;"
            UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;TASK_STATUS&quot; = :TASK_STATUS, &quot;TASK_START_DATE&quot; = :TASK_START_DATE, &quot;TASK_DUE_DATE&quot; = :TASK_DUE_DATE, &quot;ESTIMATED_HOURS&quot; = :ESTIMATED_HOURS, &quot;PRIORITY_LEVEL&quot; = :PRIORITY_LEVEL, &quot;MILESTONE_ID&quot; = :MILESTONE_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="ESTIMATED_HOURS" Type="Decimal" />
                <asp:Parameter Name="PRIORITY_LEVEL" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="ESTIMATED_HOURS" Type="Decimal" />
                <asp:Parameter Name="PRIORITY_LEVEL" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
