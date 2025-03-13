<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="TopPerformer.aspx.cs" Inherits="PMS.ComplexForm.TopPerformer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
       
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
       
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2"  EmptyDataText="No User found">
            </asp:GridView>
       
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT user_id, user_name, user_email, user_contact, role_name, tasks_completed, task_names
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
