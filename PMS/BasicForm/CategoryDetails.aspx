<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CategoryDetails.aspx.cs" Inherits="PMS.BasicForm.CategoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />

    <div class="container mt-4">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Category Management</h4>
                <asp:LinkButton ID="NewCategoryButton" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewCategoryButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Category
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="CATEGORY_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-info" RowStyle-CssClass="align-middle"
                        EmptyDataText="No categories found">
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
                                            OnClientClick="return confirm('Are you sure you want to delete this category?');">
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
                            <asp:BoundField DataField="CATEGORY_ID" HeaderText="CATEGORY_ID" ReadOnly="True"
                                SortExpression="CATEGORY_ID" />
                            <asp:BoundField DataField="CATEGORY_NAME" HeaderText="CATEGORY_NAME"
                                SortExpression="CATEGORY_NAME" />
                            <asp:TemplateField HeaderText="DESCRIPTION" SortExpression="DESCRIPTION">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>'
                                        TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination justify-content-center" />
                        <HeaderStyle CssClass="table-info" ForeColor="Black" />
                        <PagerSettings Mode="NumericFirstLast" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <asp:Panel ID="InsertPanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Category</h5>
            </div>
            <div class="card-body">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="CATEGORY_ID" DataSourceID="SqlDataSource1"
                    DefaultMode="Insert" Width="100%" OnItemInserted="FormView1_ItemInserted">
                    <InsertItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="CATEGORY_IDTextBox" class="form-label">Category ID:</label>
                                    <asp:TextBox ID="CATEGORY_IDTextBox" runat="server" Text='<%# Bind("CATEGORY_ID") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvCategoryID" runat="server"
                                        ControlToValidate="CATEGORY_IDTextBox" ErrorMessage="Category ID is required"
                                        CssClass="text-danger" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ID="revCategoryID" runat="server"
                                        ControlToValidate="CATEGORY_IDTextBox" ErrorMessage="Category ID must be a number"
                                        CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d+$" />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="CATEGORY_NAMETextBox" class="form-label">Category Name:</label>
                                    <asp:TextBox ID="CATEGORY_NAMETextBox" runat="server"
                                        Text='<%# Bind("CATEGORY_NAME") %>' CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server"
                                        ControlToValidate="CATEGORY_NAMETextBox" ErrorMessage="Category name is required"
                                        CssClass="text-danger" Display="Dynamic" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="DESCRIPTIONTextBox" class="form-label">Description:</label>
                                    <asp:TextBox ID="DESCRIPTIONTextBox" runat="server"
                                        Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server"
                                        ControlToValidate="DESCRIPTIONTextBox" ErrorMessage="Description is required"
                                        CssClass="text-danger" Display="Dynamic" />
                                </div>
                            </div>
                            <div class="col-md-12 text-center mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" CssClass="btn btn-success me-2" Text="Insert" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" CssClass="btn btn-secondary" OnClick="InsertCancelButton_Click" Text="Cancel" />
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="text-center">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                                CommandName="New" CssClass="btn btn-primary" Text="New" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </asp:Panel>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"
            DisplayMode="BulletList" HeaderText="Please correct the following errors:" />

        <asp:Panel ID="AlertPanel" runat="server" CssClass="alert alert-success alert-dismissible fade show"
            role="alert" Visible="false">
            <asp:Literal ID="AlertMessage" runat="server"></asp:Literal>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT_CATEGORIES&quot; WHERE &quot;CATEGORY_ID&quot; = :CATEGORY_ID" InsertCommand="INSERT INTO &quot;PROJECT_CATEGORIES&quot; (&quot;CATEGORY_ID&quot;, &quot;CATEGORY_NAME&quot;, &quot;DESCRIPTION&quot;) VALUES (:CATEGORY_ID, :CATEGORY_NAME, :DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROJECT_CATEGORIES&quot;" UpdateCommand="UPDATE &quot;PROJECT_CATEGORIES&quot; SET &quot;CATEGORY_NAME&quot; = :CATEGORY_NAME, &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;CATEGORY_ID&quot; = :CATEGORY_ID">
            <DeleteParameters>
                <asp:Parameter Name="CATEGORY_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CATEGORY_ID" Type="Decimal" />
                <asp:Parameter Name="CATEGORY_NAME" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CATEGORY_NAME" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="CATEGORY_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
