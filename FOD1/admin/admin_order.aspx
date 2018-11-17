<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" EnableEventValidation="true" MasterPageFile="~/admin_master.Master" CodeBehind="admin_order.aspx.cs" Inherits="food_ordering_system.admin.admin_payment" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>

<asp:Content ID="c1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h3>User Order</h3>
   
    <asp:Label ID="Label1" runat="server" CssClass="label" ></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" CssClass="label"></asp:Label>
    <br />
        <asp:GridView ID="GridView1" CssClass="ordergridview" runat="server"  AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  >
            <Columns>
                <asp:BoundField DataField="o_id" HeaderText="OrderID" ReadOnly="true"/>
                <asp:BoundField DataField="o_qty" HeaderText="Qty" ReadOnly="true" ControlStyle-Width="40px" />
                <asp:TemplateField HeaderText="Status" ControlStyle-Width="130px">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("o_status") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="true">
                            <asp:ListItem>Order Accepted</asp:ListItem>
                            <asp:ListItem>Baking</asp:ListItem>
                            <asp:ListItem>On the way</asp:ListItem>
                            <asp:ListItem>Delievered </asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="c_id" HeaderText="CustomerID" ReadOnly="true" />
                <asp:BoundField DataField="o_date" HeaderText="OrderDate"  ReadOnly="true" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button"  EditText="Update Status" ShowCancelButton="false"  ControlStyle-CssClass="gridbutton"  />
                
            </Columns>
              <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
        </asp:GridView>
   
    
</asp:Content>