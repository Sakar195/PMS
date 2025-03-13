<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MilestoneDetails.aspx.cs" Inherits="PMS.BasicForm.MilestoneDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                <asp:BoundField DataField="MILESTONES_TITLE" HeaderText="MILESTONES_TITLE" SortExpression="MILESTONES_TITLE" />
                <asp:BoundField DataField="MILESTONE_DESCRIPTION" HeaderText="MILESTONE_DESCRIPTION" SortExpression="MILESTONE_DESCRIPTION" />
                <asp:BoundField DataField="MILESTONE_DUE_DATE" DataFormatString="{0:yyyy-MM-dd}" HeaderText="DUE_DATE" HtmlEncode="False" SortExpression="MILESTONE_DUE_DATE" />
                <asp:BoundField DataField="P_ID" HeaderText="P_ID" SortExpression="P_ID" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:TemplateField HeaderText="PROJECT_NAME">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("P_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource2" Width="46px">
            <InsertItemTemplate>
                MILESTONE_ID:
                    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                <br />
                MILESTONES_TITLE:
                    <asp:TextBox ID="MILESTONES_TITLETextBox" runat="server" Text='<%# Bind("MILESTONES_TITLE") %>' />
                <br />
                MILESTONE_DESCRIPTION:
                    <asp:TextBox ID="MILESTONE_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("MILESTONE_DESCRIPTION") %>' />
                <br />
                MILESTONE_DUE_DATE:
                    <asp:TextBox ID="MILESTONE_DUE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE") %>' />
                <br />
                Project: 
                    <asp:DropDownList ID="ProjectDropDown" runat="server" DataSourceID="SqlDataSource4" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("P_ID") %>'></asp:DropDownList>

                <br />
                STATUS:
                    <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot;, &quot;MILESTONE_DESCRIPTION&quot;, &quot;MILESTONE_DUE_DATE&quot;, &quot;P_ID&quot;, &quot;STATUS&quot;) VALUES (:MILESTONE_ID, :MILESTONES_TITLE, :MILESTONE_DESCRIPTION, :MILESTONE_DUE_DATE, :P_ID, :STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONES_TITLE&quot;, &quot;MILESTONE_DESCRIPTION&quot;, &quot;MILESTONE_DUE_DATE&quot;, &quot;P_ID&quot;, &quot;STATUS&quot; FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONES_TITLE&quot; = :MILESTONES_TITLE, &quot;MILESTONE_DESCRIPTION&quot; = :MILESTONE_DESCRIPTION, &quot;MILESTONE_DUE_DATE&quot; = :MILESTONE_DUE_DATE, &quot;P_ID&quot; = :P_ID, &quot;STATUS&quot; = :STATUS WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONES_TITLE" Type="String" />
                <asp:Parameter Name="MILESTONE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="P_ID" Type="Decimal" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONES_TITLE" Type="String" />
                <asp:Parameter Name="MILESTONE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="P_ID" Type="Decimal" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>

</asp:Content>

