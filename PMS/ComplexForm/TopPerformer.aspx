<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="TopPerformer.aspx.cs" Inherits="PMS.ComplexForm.TopPerformer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Top Performers</h4>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="<%=DropDownList1.ClientID %>" class="form-label fw-bold">Select Project:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID"
                            CssClass="form-select">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                            SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;">
                        </asp:SqlDataSource>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
                        EmptyDataText="No Users found" 
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-primary"
                        RowStyle-CssClass="align-middle"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="User ID" />
                            <asp:BoundField DataField="USER_NAME" HeaderText="Name" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" />
                            <asp:BoundField DataField="ROLE_NAME" HeaderText="Role" />
                            <asp:TemplateField HeaderText="Tasks Completed">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <span class="badge bg-success rounded-pill fs-6"><%# Eval("TASKS_COMPLETED") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TASK_NAMES" HeaderText="Completed Tasks" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning">
                                <i class="bi bi-exclamation-triangle me-2"></i>
                                No top performers found for the selected project.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                
                <div class="mt-3 text-center">
                    <div class="alert alert-info" id="performerInfo" runat="server">
                        <i class="bi bi-trophy me-2"></i>
                        Top 3 performers based on number of completed tasks.
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT user_id, user_name, user_email, user_contact, role_name, tasks_completed, task_names
        FROM (
            SELECT u.user_id, 
                   u.user_name, 
                   u.user_email, 
                   u.user_contact, 
                   ur.role_name, 
                   COUNT(t.task_id) AS tasks_completed,
                   LISTAGG(t.task_name, ', ') WITHIN GROUP (ORDER BY t.task_name) AS task_names
            FROM users u 
            JOIN user_roles ur ON u.r_id = ur.role_id  
            JOIN user_project_task upt ON u.user_id = upt.u_id 
            JOIN tasks t ON upt.t_id = t.task_id 
            WHERE t.task_status = 'Completed' 
              AND upt.p_id = :selectedProjectID 
            GROUP BY u.user_id, u.user_name, u.user_email, u.user_contact, ur.role_name
            ORDER BY tasks_completed DESC
        ) 
        WHERE ROWNUM <= 3">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="selectedProjectID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>