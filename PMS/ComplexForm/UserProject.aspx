<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="UserProject.aspx.cs" Inherits="PMS.ComplexForm.UserProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="USER_NAME" DataValueField="USER_ID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource2" EmptyDataText="No projects found for this user.">
                <Columns>
                    <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                    <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                    <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                    <asp:BoundField DataField="USER_CONTACT" HeaderText="USER_CONTACT" SortExpression="USER_CONTACT" />
                    <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE_NAME" SortExpression="ROLE_NAME" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                    <asp:BoundField DataField="PROJECT_START_DATE"  DataFormatString="{0:yyyy-MM-dd}"   HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                    <asp:BoundField DataField="PROJECT_DUE_DATE"  DataFormatString="{0:yyyy-MM-dd}"  HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" SELECT u.user_id, u.user_name, u.user_email, u.user_contact, ur.role_name, p.project_id, p.project_name, p.project_start_date, p.project_due_date, p.status 
  FROM users u JOIN user_projects up ON u.user_id = up.u_id 
  JOIN user_roles ur on ur.role_id = u.r_id
  JOIN projects p ON up.p_id = p.project_id 
  where u.user_id = :selectedUserId">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="selectedUserId" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
