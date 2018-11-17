<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="mycart.aspx.cs" MasterPageFile="~/usermaster.master" Inherits="food_ordering_system.user.mycart" %>
<asp:Content ID="c2" ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />    
    </asp:Content>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />
   
    <div>
    
       <h2 >MY CART</h2>
        
        <asp:ListBox ID="ListBox1" runat="server" Visible="false"></asp:ListBox> <br />
       <div class="label">
      <asp:Label ID="Label2" runat="server"  ></asp:Label><br />
        Total Amount:<asp:Label ID="Label1" runat="server" ></asp:Label>
           </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="cart" DataKeyNames="ProductNo"
             OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" AutoGenerateColumns="false" >          
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtqty" Width="50px" runat="server" Text='<%#Eval("Qty") %>'></asp:TextBox>                       
                    </EditItemTemplate>
                    
                    
                </asp:TemplateField>
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="true" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" ReadOnly="true" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Update Quantity" ControlStyle-CssClass="gridbutton" ShowCancelButton="false"/>
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Remove" ControlStyle-CssClass="gridbutton" />
                
            </Columns>
           </asp:GridView>
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Go to Menu" PostBackUrl="~/user/menu.aspx" />
        <asp:Button ID="Button2" runat="server" CssClass="donebutton" Text="Done" OnClick="Button2_Click" />
       
    </div>
    </asp:Content>