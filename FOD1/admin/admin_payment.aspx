<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/admin_master.Master" CodeBehind="admin_payment.aspx.cs" Inherits="food_ordering_system.admin.WebForm1" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>

<asp:Content ID="c1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <br />
    <h3>User Payment</h3>
    <asp:Label ID="Label1" runat="server" CssClass="label"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" CssClass="label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="ordergridview" AutoGenerateColumns="false">
         <Columns>
                <asp:BoundField DataField="p_id" HeaderText="PaymentID"/>
                <asp:BoundField DataField="p_mode" HeaderText="Mode" />
                <asp:BoundField DataField="p_status" HeaderText="Status" />
                <asp:BoundField DataField="total_amount" HeaderText="Total Amount" />
                <asp:BoundField DataField="o_id" HeaderText="OrderID" />
             <asp:BoundField DataField="p_date" HeaderText="paymentDate" DataFormatString="{0:d}"  />
            </Columns>
          <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
</asp:Content>