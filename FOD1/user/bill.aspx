<%@ Page Language="C#" Title="Delicious Pizza" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="food_ordering_system.user.bill" %>
<asp:Content ID="c2" ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
    
    </asp:Content>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />
   
    
    <asp:Panel ID="panel1" runat="server">
       <h2>Order Summary</h2>
       
        
        <asp:GridView ID="GridView1" runat="server" CssClass="billgridview" DataKeyNames="ProductNo"
             ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" >
          
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label>
                    </ItemTemplate>
                    
                    
                </asp:TemplateField>
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="true" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" ReadOnly="true" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" />                
            </Columns>
           </asp:GridView>
       <div class="label">Total Amount:<asp:Label ID="Label1" runat="server" ></asp:Label></div>
            </asp:Panel> 
        <asp:Button ID="Button2" runat="server" CssClass="mymenu" Text="Go to Payment" OnClick="Button2_Click"/><br />
       <asp:LinkButton ID="LinkButton1" runat="server" CssClass="downlink" OnClick="LinkButton1_Click">Download Now</asp:LinkButton>
   
    </asp:Content>