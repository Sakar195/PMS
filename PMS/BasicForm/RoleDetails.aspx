<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="RoleDetails.aspx.cs" Inherits="PMS.BasicForm.RoleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Add Bootstrap Icons CSS reference if not already in your master page -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />

    <div class="container mt-4">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Role Management</h4>
                <asp:LinkButton ID="NewRoleButton" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewRoleButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Role
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary" RowStyle-CssClass="align-middle"
                        EmptyDataText="No roles found" PageSize="10">
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
                                            OnClientClick="return confirm('Are you sure you want to delete this role?');">
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
                            <asp:BoundField DataField="ROLE_ID" HeaderText="Role ID" ReadOnly="True" SortExpression="ROLE_ID" />
                            <asp:TemplateField HeaderText="Role Name" SortExpression="ROLE_NAME">
                                <ItemTemplate>
                                    <%# Eval("ROLE_NAME") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="RoleNameTextBox" runat="server" Text='<%# Bind("ROLE_NAME") %>'
                                        CssClass="form-control form-control-sm" />
                                    <asp:RequiredFieldValidator ID="rfvRoleName" runat="server"
                                        ControlToValidate="RoleNameTextBox" Display="Dynamic"
                                        ErrorMessage="Role name is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="DESCRIPTION">
                                <ItemTemplate>
                                    <%# Eval("DESCRIPTION") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>'
                                        CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Form Panel for adding new role -->
        <asp:Panel ID="NewRolePanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0">Add New Role</h5>
            </div>
            <div class="card-body">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1"
                    DefaultMode="Insert" Width="100%" OnItemInserted="FormView1_ItemInserted">
                    <InsertItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="ROLE_IDTextBox" class="form-label">Role ID:</label>
                                    <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvRoleID" runat="server"
                                        ControlToValidate="ROLE_IDTextBox" Display="Dynamic"
                                        ErrorMessage="Role ID is required" CssClass="text-danger" />
                                    <asp:RegularExpressionValidator ID="revRoleID" runat="server"
                                        ControlToValidate="ROLE_IDTextBox" Display="Dynamic"
                                        ErrorMessage="ID must be a number" ValidationExpression="^\d+$"
                                        CssClass="text-danger" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="ROLE_NAMETextBox" class="form-label">Role Name:</label>
                                    <asp:TextBox ID="ROLE_NAMETextBox" runat="server" Text='<%# Bind("ROLE_NAME") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvRoleName" runat="server"
                                        ControlToValidate="ROLE_NAMETextBox" Display="Dynamic"
                                        ErrorMessage="Role name is required" CssClass="text-danger" />
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group mb-3">
                                    <label for="DESCRIPTIONTextBox" class="form-label">Description:</label>
                                    <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>'
                                        CssClass="form-control" TextMode="MultiLine" Rows="3" />
                                </div>
                            </div>
                        </div>

                        <div class="mt-3 d-flex justify-content-end">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" OnClick="CancelButton_Click"
                                CssClass="btn btn-secondary me-2">
                                <i class="bi bi-x-circle"></i> Cancel
                            </asp:LinkButton>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" CssClass="btn btn-success">
                                <i class="bi bi-save"></i> Save Role
                            </asp:LinkButton>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </asp:Panel>

        <!-- Validation Summary -->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"
            DisplayMode="BulletList" HeaderText="Please correct the following errors:" />

        <!-- Alert for success/error messages -->
        <asp:Panel ID="AlertPanel" runat="server" CssClass="alert alert-success alert-dismissible fade show"
            role="alert" Visible="false">
            <asp:Literal ID="AlertMessage" runat="server"></asp:Literal>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </asp:Panel>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM &quot;USER_ROLES&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID"
            InsertCommand="INSERT INTO &quot;USER_ROLES&quot; (&quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;, &quot;DESCRIPTION&quot;) VALUES (:ROLE_ID, :ROLE_NAME, :DESCRIPTION)"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;USER_ROLES&quot;"
            UpdateCommand="UPDATE &quot;USER_ROLES&quot; SET &quot;ROLE_NAME&quot; = :ROLE_NAME, &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROLE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="ROLE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
