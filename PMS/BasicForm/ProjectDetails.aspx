<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/Site.Master"  CodeBehind="ProjectDetails.aspx.cs" Inherits="PMS.BasicForm.ProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">       
    <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                    <asp:BoundField DataField="PROJECT_DESCRIPTION" HeaderText="PROJECT_DESCRIPTION" SortExpression="PROJECT_DESCRIPTION" />
                    <asp:BoundField DataField="PROJECT_START_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="PROJECT_START_DATE" HtmlEncode="False" SortExpression="PROJECT_START_DATE" />
                    <asp:BoundField DataField="PROJECT_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="PROJECT_DUE_DATE" HtmlEncode="False" SortExpression="PROJECT_DUE_DATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:BoundField DataField="CATEGORY_ID" HeaderText="CATEGORY_ID" SortExpression="CATEGORY_ID" />
                    <asp:TemplateField HeaderText="CATEGORY_NAME">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_ID" Enabled="false" SelectedValue='<%# Bind("CATEGORY_ID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_ID" SelectedValue='<%# Eval("CATEGORY_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CATEGORY_NAME&quot;, &quot;CATEGORY_ID&quot; FROM &quot;PROJECT_CATEGORIES&quot;"></asp:SqlDataSource>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <p>
            &nbsp;</p>
        <p>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    PROJECT_ID:
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                        <br />
                        PROJECT_NAME:
                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' />
                        <br />
                        PROJECT_DESCRIPTION:
                    <asp:TextBox ID="PROJECT_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("PROJECT_DESCRIPTION") %>' />
                        <br />
                        PROJECT_START_DATE:
                    <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' />
                        <br />
                        PROJECT_DUE_DATE:
                    <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>' />
                        <br />
                        STATUS:
                    <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                        <br />
                      CATEGORY: 
 <asp:DropDownList ID ="CategoryDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_NAME" SelectedValue='<%# Bind("CATEGORY_ID") %>'></asp:DropDownList>
                       
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </p>
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
