<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MilestoneDetails.aspx.cs" Inherits="PMS.BasicForm.MilestoneDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />

    <div>
        
         


       <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">--%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot;, &quot;MILESTONE_DESCRIPTION&quot;, &quot;MILESTONE_DUE_DATE&quot;, &quot;P_ID&quot;, &quot;STATUS&quot;) VALUES (:MILESTONE_ID, :MILESTONES_TITLE, :MILESTONE_DESCRIPTION, :MILESTONE_DUE_DATE, :P_ID, :STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot;, &quot;MILESTONE_DESCRIPTION&quot;, &quot;MILESTONE_DUE_DATE&quot;, &quot;P_ID&quot;, &quot;STATUS&quot; FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONES_TITLE&quot; = :MILESTONES_TITLE, &quot;MILESTONE_DESCRIPTION&quot; = :MILESTONE_DESCRIPTION, &quot;MILESTONE_DUE_DATE&quot; = :MILESTONE_DUE_DATE, &quot;P_ID&quot; = :P_ID, &quot;STATUS&quot; = :STATUS WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONES_TITLE" Type="String" />
                <asp:Parameter Name="MILESTONE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="P_ID" Type="Decimal" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONES_TITLE" Type="String" />
                <asp:Parameter Name="MILESTONE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="P_ID" Type="Decimal" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>

    <div class="container mt-0">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Milestone Management</h4>
                <asp:LinkButton ID="NewMilestoneButton" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewMilestoneButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Milestone
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource2"
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary" RowStyle-CssClass="align-middle"
                        EmptyDataText="No milestones found" PageSize="10" OnRowDataBound="GridView2_RowDataBound">
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
                                            OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
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
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:TemplateField HeaderText="Title" SortExpression="MILESTONES_TITLE">
                                <ItemTemplate>
                                    <%# Eval("MILESTONES_TITLE") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("MILESTONES_TITLE") %>'
                                        CssClass="form-control form-control-sm" />
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                                        ControlToValidate="TitleTextBox" Display="Dynamic"
                                        ErrorMessage="Title is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="MILESTONE_DESCRIPTION">
                                <ItemTemplate>
                                    <%# Eval("MILESTONE_DESCRIPTION") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("MILESTONE_DESCRIPTION") %>'
                                        CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="MILESTONE_DUE_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("MILESTONE_DUE_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DueDateTextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvDueDate" runat="server"
                                        ControlToValidate="DueDateTextBox" Display="Dynamic"
                                        ErrorMessage="Due date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Project" SortExpression="P_ID">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("P_ID") %>'
                                        CssClass="form-select form-select-sm" Enabled="false">
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ProjectDropDown" runat="server" DataSourceID="SqlDataSource4"
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("P_ID") %>'
                                        CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvProject" runat="server"
                                        ControlToValidate="ProjectDropDown" Display="Dynamic"
                                        ErrorMessage="Project is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--       <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" />--%>
                            <asp:TemplateField HeaderText="Status" SortExpression="STATUS">


                                <ItemTemplate>
                                    <span class='badge <%# GetStatusBadgeClass(Eval("STATUS").ToString()) %>'>
                                        <%# Eval("STATUS") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="StatusDropDown" runat="server" SelectedValue='<%# Bind("STATUS") %>'
                                        CssClass="form-select form-select-sm">
                                        <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        <asp:ListItem Text="On Hold" Value="On Hold"></asp:ListItem>
                                        <asp:ListItem Text="Delayed" Value="Delayed"></asp:ListItem>
                                        <asp:ListItem Text="Planned" Value="Planned"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Form for inserting new milestone -->
        <asp:Panel ID="InsertPanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0">Add New Milestone</h5>
            </div>
            <div class="card-body">
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource2"
                    DefaultMode="Insert" Width="100%" OnItemInserted="FormView1_ItemInserted">
                    <InsertItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="MILESTONE_IDTextBox" class="form-label">Milestone ID:</label>
                                    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvMilestoneID" runat="server"
                                        ControlToValidate="MILESTONE_IDTextBox" Display="Dynamic"
                                        ErrorMessage="Milestone ID is required" CssClass="text-danger" />
                                    <asp:RegularExpressionValidator ID="revMilestoneID" runat="server"
                                        ControlToValidate="MILESTONE_IDTextBox" Display="Dynamic"
                                        ErrorMessage="ID must be a number" ValidationExpression="^\d+$"
                                        CssClass="text-danger" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="MILESTONES_TITLETextBox" class="form-label">Title:</label>
                                    <asp:TextBox ID="MILESTONES_TITLETextBox" runat="server" Text='<%# Bind("MILESTONES_TITLE") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                                        ControlToValidate="MILESTONES_TITLETextBox" Display="Dynamic"
                                        ErrorMessage="Title is required" CssClass="text-danger" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="MILESTONE_DUE_DATETextBox" class="form-label">Due Date:</label>
                                    <asp:TextBox ID="MILESTONE_DUE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE") %>'
                                        CssClass="form-control" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvDueDate" runat="server"
                                        ControlToValidate="MILESTONE_DUE_DATETextBox" Display="Dynamic"
                                        ErrorMessage="Due date is required" CssClass="text-danger" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="ProjectDropDown" class="form-label">Project:</label>
                                    <asp:DropDownList ID="ProjectDropDown" runat="server" DataSourceID="SqlDataSource4"
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("P_ID") %>'
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvProject" runat="server"
                                        ControlToValidate="ProjectDropDown" Display="Dynamic"
                                        ErrorMessage="Project is required" CssClass="text-danger" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="STATUSTextBox" class="form-label">Status:</label>
                                    <asp:DropDownList ID="STATUSDropDown" runat="server" SelectedValue='<%# Bind("STATUS") %>'
                                        CssClass="form-select">
                                        <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                        <asp:ListItem Text="Planned" Value="Planned"></asp:ListItem>
                                        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        <asp:ListItem Text="On Hold" Value="On Hold"></asp:ListItem>
                                        <asp:ListItem Text="Delayed" Value="Delayed"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group mb-3">
                                    <label for="MILESTONE_DESCRIPTIONTextBox" class="form-label">Description:</label>
                                    <asp:TextBox ID="MILESTONE_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("MILESTONE_DESCRIPTION") %>'
                                        CssClass="form-control" TextMode="MultiLine" Rows="4" />
                                </div>
                            </div>
                        </div>

                        <div class="mt-3 d-flex justify-content-end">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary me-2"  OnClick="InsertCancelButton_Click"/>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" Text="Save Milestone" CssClass="btn btn-success" />
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </asp:Panel>

        <!-- Validation Summary -->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"
            DisplayMode="BulletList" HeaderText="Please correct the following errors:" />
    </div>

</asp:Content>

