<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TaskDetails.aspx.cs" Inherits="PMS.BasicForm.TaskDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1" GridLines="None" HeaderStyle-CssClass="table-dark" HeaderStyle-ForeColor="White">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                <asp:BoundField DataField="TASK_STATUS" HeaderText="TASK_STATUS" SortExpression="TASK_STATUS" />
                <asp:BoundField DataField="TASK_START_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="TASK_START_DATE" SortExpression="TASK_START_DATE" />
                <asp:BoundField DataField="TASK_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="TASK_DUE_DATE" SortExpression="TASK_DUE_DATE" />
                <asp:BoundField DataField="ESTIMATED_HOURS" HeaderText="ESTIMATED_HOURS" SortExpression="ESTIMATED_HOURS" />
                <asp:BoundField DataField="PRIORITY_LEVEL" HeaderText="PRIORITY_LEVEL" SortExpression="PRIORITY_LEVEL" />
                <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" SortExpression="MILESTONE_ID" />
                <asp:TemplateField HeaderText="MILESTONE_NAME">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="MILESTONES_TITLE" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot; FROM &quot;MILESTONES&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="table-dark" ForeColor="White" />
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" CssClass="m-4" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                TASK_ID:
                    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />
                TASK_NAME:
                    <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />
                TASK_STATUS:
                    <asp:TextBox ID="TASK_STATUSTextBox" runat="server" Text='<%# Bind("TASK_STATUS") %>' />
                <br />
                TASK_START_DATE:
                    <asp:TextBox ID="TASK_START_DATETextBox" runat="server" Text='<%# Bind("TASK_START_DATE") %>' />
                <br />
                TASK_DUE_DATE:
                    <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server" Text='<%# Bind("TASK_DUE_DATE") %>' />
                <br />
                ESTIMATED_HOURS:
                    <asp:TextBox ID="ESTIMATED_HOURSTextBox" runat="server" Text='<%# Bind("ESTIMATED_HOURS") %>' />
                <br />
                PRIORITY_LEVEL:
                    <asp:TextBox ID="PRIORITY_LEVELTextBox" runat="server" Text='<%# Bind("PRIORITY_LEVEL") %>' />
                <br />


                MILESTONE_NAME:
                <asp:DropDownList ID="MilestoneDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="MILESTONES_TITLE" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'></asp:DropDownList>
                <%--MILESTONE_ID:
 <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                <br />--%>

                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot; FROM &quot;MILESTONES&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STATUS&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;ESTIMATED_HOURS&quot;, &quot;PRIORITY_LEVEL&quot;, &quot;MILESTONE_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :TASK_STATUS, :TASK_START_DATE, :TASK_DUE_DATE, :ESTIMATED_HOURS, :PRIORITY_LEVEL, :MILESTONE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STATUS&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;ESTIMATED_HOURS&quot;, &quot;PRIORITY_LEVEL&quot;, &quot;MILESTONE_ID&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;TASK_STATUS&quot; = :TASK_STATUS, &quot;TASK_START_DATE&quot; = :TASK_START_DATE, &quot;TASK_DUE_DATE&quot; = :TASK_DUE_DATE, &quot;ESTIMATED_HOURS&quot; = :ESTIMATED_HOURS, &quot;PRIORITY_LEVEL&quot; = :PRIORITY_LEVEL, &quot;MILESTONE_ID&quot; = :MILESTONE_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="ESTIMATED_HOURS" Type="Decimal" />
                <asp:Parameter Name="PRIORITY_LEVEL" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="ESTIMATED_HOURS" Type="Decimal" />
                <asp:Parameter Name="PRIORITY_LEVEL" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
