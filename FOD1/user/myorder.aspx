<%@ Page Language="C#" MasterPageFile="~/usermaster.master" Title="Delicious Pizza" AutoEventWireup="true" CodeBehind="myorder.aspx.cs" Inherits="food_ordering_system.user.myorder" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/cartcss.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
    <h2>My Order</h2>
    <br />
    <asp:Label ID="Label1" runat="server" Visible="false" CssClass="label"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="myorder">
        <Columns>
            <asp:BoundField DataField="o_date" HeaderText="Date"  />
            <asp:BoundField DataField="o_qty" HeaderText="Total Qty"/>
            <asp:BoundField DataField="o_status" HeaderText="Status" />            
        </Columns>
        <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
</asp:Content>