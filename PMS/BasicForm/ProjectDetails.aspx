<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProjectDetails.aspx.cs" Inherits="PMS.BasicForm.ProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />
    <div class="container">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Project Management</h4>
                <asp:LinkButton ID="NewProjectButton" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewProjectButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Project
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1"
                        HeaderStyle-CssClass="table-primary" RowStyle-CssClass="align-middle"
                        EmptyDataText="No projects found" PageSize="10"
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
                                            OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="Name" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="PROJECT_DESCRIPTION" HeaderText="Description" SortExpression="PROJECT_DESCRIPTION" />

                            <asp:TemplateField HeaderText="Start_Date" SortExpression="PROJECT_START_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("PROJECT_START_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvDueDate" runat="server"
                                        ControlToValidate="StartDateTextBox" Display="Dynamic"
                                        ErrorMessage="Start date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>



                            <%-- <asp:BoundField DataField="PROJECT_START_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Start Date" HtmlEncode="False" SortExpression="PROJECT_START_DATE" />--%>

                            <asp:TemplateField HeaderText="Due_Date" SortExpression="PROJECT_DUE_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("PROJECT_DUE_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DueDateTextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                                        ControlToValidate="DueDateTextBox" Display="Dynamic"
                                        ErrorMessage="Due date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <%--                            <asp:BoundField DataField="PROJECT_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Due Date" HtmlEncode="False" SortExpression="PROJECT_DUE_DATE" />--%>
                            <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" />
                            <asp:BoundField DataField="CATEGORY_ID" HeaderText="Category ID" SortExpression="CATEGORY_ID" />
                            <%-- <asp:TemplateField HeaderText="Category Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_ID"
                                        SelectedValue='<%# Bind("CATEGORY_ID") %>' CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="Category Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_ID"
                                        SelectedValue='<%# Bind("CATEGORY_ID") %>' CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>
                        <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>





    <%--   new form--%>
    <asp:Panel ID="InsertPanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
    <div class="card-header bg-success text-white">
        <h5 class="mb-0">Add New Project</h5>
    </div>
    <div class="card-body">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1"
            DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="PROJECT_IDTextBox" class="form-label">Project ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="PROJECT_IDTextBox" ErrorMessage="Project ID is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <label for="PROJECT_NAMETextBox" class="form-label">Project Name:</label>
                            <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="PROJECT_NAMETextBox" ErrorMessage="Project Name is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <label for="PROJECT_START_DATETextBox" class="form-label">Start Date:</label>
                            <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>'
                                CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="PROJECT_START_DATETextBox" ErrorMessage="Start Date is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <label for="STATUSTextBox" class="form-label">Status:</label>
                            <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="STATUSTextBox" ErrorMessage="Status is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="PROJECT_DESCRIPTIONTextBox" class="form-label">Description:</label>
                            <asp:TextBox ID="PROJECT_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("PROJECT_DESCRIPTION") %>'
                                CssClass="form-control" TextMode="MultiLine" Rows="4" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="PROJECT_DESCRIPTIONTextBox" ErrorMessage="Description is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <label for="PROJECT_DUE_DATETextBox" class="form-label">Due Date:</label>
                            <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>'
                                CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="PROJECT_DUE_DATETextBox" ErrorMessage="Due Date is required"
                                CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <label for="CategoryDropDown" class="form-label">Category:</label>
                            <asp:DropDownList ID="CategoryDropDown" runat="server" DataSourceID="SqlDataSource2"
                                DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_ID"
                                SelectedValue='<%# Bind("CATEGORY_ID") %>' CssClass="form-select">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                ControlToValidate="CategoryDropDown" InitialValue=""
                                ErrorMessage="Category is required" CssClass="text-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="mt-3 d-flex justify-content-end">
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary me-2" OnClick="InsertCancelButton_Click" />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                        CommandName="Insert" Text="Save Project" CssClass="btn btn-success" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" CssClass="text-danger" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Panel>







    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROJECT_CATEGORIES&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DESCRIPTION&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;STATUS&quot;, &quot;CATEGORY_ID&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_DESCRIPTION, :PROJECT_START_DATE, :PROJECT_DUE_DATE, :STATUS, :CATEGORY_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DESCRIPTION&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;STATUS&quot;, &quot;CATEGORY_ID&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;PROJECT_DESCRIPTION&quot; = :PROJECT_DESCRIPTION, &quot;PROJECT_START_DATE&quot; = :PROJECT_START_DATE, &quot;PROJECT_DUE_DATE&quot; = :PROJECT_DUE_DATE, &quot;STATUS&quot; = :STATUS, &quot;CATEGORY_ID&quot; = :CATEGORY_ID WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
        <DeleteParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_DESCRIPTION" Type="String" />
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="STATUS" Type="String" />
            <asp:Parameter Name="CATEGORY_ID" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_DESCRIPTION" Type="String" />
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="STATUS" Type="String" />
            <asp:Parameter Name="CATEGORY_ID" Type="Decimal" />
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
