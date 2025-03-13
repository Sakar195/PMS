<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="UserDetails.aspx.cs" Inherits="PMS.BasicForm.UserDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" GridLines="None" HeaderStyle-CssClass="table-dark" HeaderStyle-ForeColor="White">
            <Columns>
             
                    
         
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             
                    
         
                <asp:BoundField DataField="USER_ID" HeaderText="ID" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                <asp:BoundField DataField="IS_ACTIVE" HeaderText="Active" SortExpression="IS_ACTIVE" />
                <asp:BoundField DataField="R_ID" HeaderText="Role ID" SortExpression="R_ID" />
                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select form-select-sm" DataSourceID="SqlDataSource3" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" Enabled="false" SelectedValue='<%# Bind("R_ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pagination justify-content-center" />

<HeaderStyle CssClass="table-dark" ForeColor="White"></HeaderStyle>

            <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" CssClass="m-4" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                <div class="col-md-6">
                    <label class="form-label" for="USER_IDTextBox">
                    USER_ID:</label>
                    <asp:TextBox ID="USER_IDTextBox" runat="server" class="form-control" Text='<%# Bind("USER_ID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" class="text-danger" ControlToValidate="USER_IDTextBox" ErrorMessage="This field is required" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="USER_IDTextBox" ErrorMessage="Only numeric values are allowed for USER_ID" ForeColor="Red" ValidationExpression="^\d+$" />
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="USER_NAMETextBox">
                    USER_NAME:</label>
                    <asp:TextBox ID="USER_NAMETextBox" runat="server" class="form-control" Text='<%# Bind("USER_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" class="text-danger" ControlToValidate="USER_NAMETextBox" ErrorMessage="This field is required" />
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="USER_EMAILTextBox">
                    USER_EMAIL:</label>
                    <asp:TextBox ID="USER_EMAILTextBox" runat="server" class="form-control" Text='<%# Bind("USER_EMAIL") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" class="text-danger" ControlToValidate="USER_EMAILTextBox" ErrorMessage="This field is required" />
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="USER_CONTACTTextBox">
                    USER_CONTACT:</label>
                    <asp:TextBox ID="USER_CONTACTTextBox" runat="server" class="form-control" Text='<%# Bind("USER_CONTACT") %>' />
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" class="text-danger" ControlToValidate="USER_CONTACTTextBox" ErrorMessage="This field is required" />
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="IS_ACTIVETextBox">
                    IS_ACTIVE:</label>
                    <asp:TextBox ID="IS_ACTIVETextBox" runat="server" class="form-control" Text='<%# Bind("IS_ACTIVE") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" class="text-danger" ControlToValidate="IS_ACTIVETextBox" ErrorMessage="This field is required" />
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="RoleDropDownList">
                    Role:</label>
                    <asp:DropDownList ID="RoleDropDownList" runat="server" class="form-select" DataSourceID="SqlDatasource3" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("R_ID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" class="text-danger" ControlToValidate="RoleDropDownList" ErrorMessage="This field is required" />
                </div>
                <div class="col-md-6">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary me-2" Text="Insert" />
                    &nbsp;
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-secondary" Text="Cancel" />
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-success" Text="Add New User" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;, &quot;IS_ACTIVE&quot;, &quot;R_ID&quot;) VALUES (:USER_ID, :USER_NAME, :USER_EMAIL, :USER_CONTACT, :IS_ACTIVE, :R_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;, &quot;IS_ACTIVE&quot;, &quot;R_ID&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_EMAIL&quot; = :USER_EMAIL, &quot;USER_CONTACT&quot; = :USER_CONTACT, &quot;IS_ACTIVE&quot; = :IS_ACTIVE, &quot;R_ID&quot; = :R_ID WHERE &quot;USER_ID&quot; = :USER_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="String" />
                <asp:Parameter Name="IS_ACTIVE" Type="String" />
                <asp:Parameter Name="R_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="String" />
                <asp:Parameter Name="IS_ACTIVE" Type="String" />
                <asp:Parameter Name="R_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USER_ROLES&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;USER_ROLES&quot; (&quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;) VALUES (:ROLE_ID, :ROLE_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;USER_ROLES&quot;" UpdateCommand="UPDATE &quot;USER_ROLES&quot; SET &quot;ROLE_NAME&quot; = :ROLE_NAME WHERE &quot;ROLE_ID&quot; = :ROLE_ID"></asp:SqlDataSource>
        </div>
</asp:Content>
