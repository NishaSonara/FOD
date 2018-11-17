<%@ Page Language="C#" AutoEventWireup="true" Title="Delicious Pizza" CodeBehind="admin_feedback.aspx.cs" MasterPageFile="~/admin_master.Master" Inherits="food_ordering_system.admin.admin_feedback" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>
<asp:Content ID="c1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h3>Customer Feedback</h3>
    <asp:GridView ID="GridView1" CssClass="feedback" runat="server"  AutoGenerateColumns="false"  >
        <Columns>
                <asp:BoundField DataField="f_id" HeaderText="No."/>
            <asp:TemplateField HeaderText="Feedback">
                <ItemTemplate>
                    <asp:Label runat="server" Width="300px" Text='<%# Eval("f_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               
                <asp:BoundField DataField="c_id" HeaderText="CustomerId" />
            </Columns>
          <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    </asp:Content>