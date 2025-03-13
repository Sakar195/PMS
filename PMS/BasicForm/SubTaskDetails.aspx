<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SubTaskDetails.aspx.cs" Inherits="PMS.BasicForm.SubTaskDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" Width="1201px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="SUBTASK_ID" HeaderText="SUBTASK_ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
                <asp:BoundField DataField="SUBTASK_TITLE" HeaderText="SUBTASK_TITLE" SortExpression="SUBTASK_TITLE" />
                <asp:BoundField DataField="SUBTASK_DESCRIPTION" HeaderText="SUBTASK_DESCRIPTION" SortExpression="SUBTASK_DESCRIPTION" />
                <asp:BoundField DataField="SUBTASK_STATUS" HeaderText="SUBTASK_STATUS" SortExpression="SUBTASK_STATUS" />
                <asp:BoundField DataField="DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="DUE_DATE" SortExpression="DUE_DATE" />
                <asp:BoundField DataField="TSK_ID" HeaderText="TSK_ID" SortExpression="TSK_ID" />
                <asp:TemplateField HeaderText="TASK_NAME">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASK_NAME" DataValueField="TASK_ID" Enabled="False" SelectedValue='<%# Bind("TSK_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                SUBTASK_ID:
                    <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' />
                <br />
                SUBTASK_TITLE:
                    <asp:TextBox ID="SUBTASK_TITLETextBox" runat="server" Text='<%# Bind("SUBTASK_TITLE") %>' />
                <br />
                SUBTASK_DESCRIPTION:
                    <asp:TextBox ID="SUBTASK_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("SUBTASK_DESCRIPTION") %>' />
                <br />
                SUBTASK_STATUS:
                    <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' />
                <br />
                DUE_DATE:
                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                <br />

                TASK NAME:
                    <asp:DropDownList ID="TaskDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TSK_ID") %>'>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" class="text-danger" ControlToValidate="TaskDropDownList" ErrorMessage="This field is required" />

                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
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
