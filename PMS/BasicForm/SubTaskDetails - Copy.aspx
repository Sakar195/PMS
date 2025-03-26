<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SubTaskDetails.aspx.cs" Inherits="PMS.BasicForm.SubTaskDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" />
    <div class="container mt-4">
        <div class="card shadow-sm mb-4">

            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Subtask Management</h4>
                <asp:LinkButton ID="NewSubtaskButton" runat="server" CssClass="btn btn-sm btn-light"
                    OnClick="NewSubtaskButton_Click" CausesValidation="false">
                    <i class="bi bi-plus-circle"></i> Add New Subtask
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary" RowStyle-CssClass="align-middle"
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
                                            OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
                            <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
                            <asp:BoundField DataField="SUBTASK_TITLE" HeaderText="Title" SortExpression="SUBTASK_TITLE" />
                            <asp:BoundField DataField="SUBTASK_DESCRIPTION" HeaderText="Description" SortExpression="SUBTASK_DESCRIPTION" />
                            <asp:BoundField DataField="SUBTASK_STATUS" HeaderText="Status" SortExpression="SUBTASK_STATUS" />

                            <%--   <asp:BoundField DataField="DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Due Date" SortExpression="DUE_DATE" />--%>


                            <asp:TemplateField HeaderText="Due Date" SortExpression="DUE_DATE">
                                <ItemTemplate>
                                    <span class="badge bg-info"><%# Eval("DUE_DATE", "{0:MMM dd, yyyy}") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DueDateTextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>'
                                        CssClass="form-control form-control-sm" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                                        ControlToValidate="DueDateTextBox" Display="Dynamic"
                                        ErrorMessage="Due date is required" CssClass="text-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="TSK_ID" HeaderText="Task ID" SortExpression="TSK_ID" />
                            <asp:TemplateField HeaderText="Task Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="TASK_NAME" DataValueField="TASK_ID"
                                        SelectedValue='<%# Bind("TSK_ID") %>' CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <asp:Panel ID="InsertPanel" runat="server" CssClass="card shadow-sm mb-4" Visible="false">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0">Add New Subtask</h5>
            </div>
            <div class="card-body">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1"
                    DefaultMode="Insert">
                    <InsertItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="SUBTASK_IDTextBox" class="form-label">Subtask ID:</label>
                                    <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="SUBTASK_IDTextBox" ErrorMessage="Subtask ID is required"
                                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="SUBTASK_IDTextBox" ErrorMessage="Subtask ID must be a number"
                                        CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                                </div>
                                <div class="form-group mb-3">
                                    <label for="SUBTASK_TITLETextBox" class="form-label">Subtask Title:</label>
                                    <asp:TextBox ID="SUBTASK_TITLETextBox" runat="server" Text='<%# Bind("SUBTASK_TITLE") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="SUBTASK_TITLETextBox" ErrorMessage="Subtask Title is required"
                                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="SUBTASK_STATUSTextBox" class="form-label">Subtask Status:</label>
                                    <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>'
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="SUBTASK_STATUSTextBox" ErrorMessage="Subtask Status is required"
                                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="DUE_DATETextBox" class="form-label">Due Date:</label>
                                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>'
                                        CssClass="form-control" TextMode="Date" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="DUE_DATETextBox" ErrorMessage="Due Date is required"
                                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="SUBTASK_DESCRIPTIONTextBox" class="form-label">Subtask Description:</label>
                                    <asp:TextBox ID="SUBTASK_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("SUBTASK_DESCRIPTION") %>'
                                        CssClass="form-control" TextMode="MultiLine" Rows="4" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="SUBTASK_DESCRIPTIONTextBox" ErrorMessage="Subtask Description is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="TaskDropDownList" class="form-label">Task Name:</label>
                                    
                                    
                                    <asp:DropDownList ID="TaskDropDownList" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="TASK_NAME" DataValueField="TASK_ID"
                                        SelectedValue='<%# Bind("TSK_ID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="TaskDropDownList" InitialValue=""
                                        ErrorMessage="Task Name is required" CssClass="text-danger"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                       
                                    
                                    <%--               <asp:TextBox ID="taskidtestbox" runat="server" Text='<%# Bind("TSK_ID") %>'
                                        CssClass="form-control" TextMode="MultiLine" Rows="4" />--%>


                                </div>
                            </div>
                        </div>
                        <div class="mt-3 d-flex justify-content-end">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary me-2" OnClick="InsertCancelButton_Click" />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" Text="Save Subtask" CssClass="btn btn-success" />
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                            HeaderText="Please correct the following errors:" CssClass="text-danger" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </asp:Panel>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID" InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASK_ID&quot;, &quot;SUBTASK_TITLE&quot;, &quot;SUBTASK_DESCRIPTION&quot;, &quot;SUBTASK_STATUS&quot;, &quot;DUE_DATE&quot;, &quot;TSK_ID&quot;) VALUES (:SUBTASK_ID, :SUBTASK_TITLE, :SUBTASK_DESCRIPTION, :SUBTASK_STATUS, :DUE_DATE, :TSK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SUBTASKS&quot;" UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;SUBTASK_TITLE&quot; = :SUBTASK_TITLE, &quot;SUBTASK_DESCRIPTION&quot; = :SUBTASK_DESCRIPTION, &quot;SUBTASK_STATUS&quot; = :SUBTASK_STATUS, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;TSK_ID&quot; = :TSK_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_TITLE" Type="String" />
                <asp:Parameter Name="SUBTASK_DESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TSK_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SUBTASK_TITLE" Type="String" />
                <asp:Parameter Name="SUBTASK_DESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TSK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
    </div>
</asp:Content>





