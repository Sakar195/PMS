<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserProject.aspx.cs" Inherits="PMS.ComplexForm.UserProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">User Projects</h4>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="<%=DropDownList1.ClientID %>" class="form-label fw-bold">Select User:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="USER_NAME" DataValueField="USER_ID"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource2" 
                        EmptyDataText="No projects found for this user."
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary"
                        RowStyle-CssClass="align-middle">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                            <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                            <asp:BoundField DataField="ROLE_NAME" HeaderText="Role" SortExpression="ROLE_NAME" />
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="PROJECT_START_DATE" DataFormatString="{0:MMM dd, yyyy}" HeaderText="Start Date" SortExpression="PROJECT_START_DATE" />
                            <asp:BoundField DataField="PROJECT_DUE_DATE" DataFormatString="{0:MMM dd, yyyy}" HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" />
                            <asp:TemplateField HeaderText="Status" SortExpression="STATUS">
                                <ItemTemplate>
                                    <span class='badge rounded-pill <%# GetStatusBadgeClass(Eval("STATUS").ToString()) %>'>
                                        <%# Eval("STATUS") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <div class="mt-3">
                    <div class="alert alert-info" id="noProjectsAlert" runat="server" visible='<%# GridView1.Rows.Count == 0 %>'>
                        <i class="bi bi-info-circle me-2"></i>
                        Select a user from the dropdown to view their assigned projects.
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand=" SELECT u.user_id, u.user_name, u.user_email, u.user_contact, ur.role_name, p.project_id, p.project_name, p.project_start_date, p.project_due_date, p.status 
                        FROM users u JOIN user_projects up ON u.user_id = up.u_id 
                        JOIN user_roles ur on ur.role_id = u.r_id
                        JOIN projects p ON up.p_id = p.project_id 
                        where u.user_id = :selectedUserId">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="selectedUserId" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>