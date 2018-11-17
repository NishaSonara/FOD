<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true"  MasterPageFile="~/admin_master.Master" CodeBehind="admin_item.aspx.cs" Inherits="food_ordering_system.admin.adminitem" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>
<asp:Content ID="c1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <br />
    <br />
        <h3>PRODUCT</h3>
    <div class="divlink">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="link" PostBackUrl="~/admin/admin_additem.aspx" OnClick="LinkButton1_Click">Add Item</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="link" OnClick="LinkButton2_Click">Update Item</asp:LinkButton>
    &nbsp;  
    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="link" OnClick="LinkButton3_Click">Delete Item</asp:LinkButton>
        <br /><br /><asp:Label ID="Label1" runat="server"  ForeColor="green"></asp:Label><br />
        <asp:Label ID="Label2" runat="server"  ></asp:Label>
        </div>
    
    <div class="filter">Filter By:<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem>Price</asp:ListItem>
        <asp:ListItem>Status</asp:ListItem>
        <asp:ListItem>Discount</asp:ListItem>
         </asp:RadioButtonList>
       
         <asp:LinkButton ID="LinkButton4" CssClass="link" runat="server" OnClick="LinkButton4_Click">Clear Filter</asp:LinkButton>
        </div>
    <asp:Panel ID="Panel3" runat="server" CssClass="panel" Visible="false">
    Price:<asp:DropDownList ID="DropDownList1" CssClass="dropbtn" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="0">Min</asp:ListItem>        
        <asp:ListItem>100</asp:ListItem>               
        <asp:ListItem>300</asp:ListItem>
        <asp:ListItem>500</asp:ListItem>
    </asp:DropDownList>
    &nbsp;To <asp:DropDownList  ID="DropDownList2" CssClass="dropbtn" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
        </asp:Panel>
        <br />
    <asp:Panel ID="Panel4" runat="server" Visible="false" CssClass="panel">
        Status:<asp:DropDownList ID="DropDownList3" CssClass="dropbtn" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">           
            <asp:ListItem>A</asp:ListItem>
            <asp:ListItem>NA</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
    <asp:Panel ID="Panel5" runat="server" Visible="false" CssClass="panel">
        Discount:<asp:DropDownList ID="DropDownList4" CssClass="dropbtn" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
            <asp:ListItem>Up to 10%</asp:ListItem>
            <asp:ListItem>10 to 30%</asp:ListItem>
            <asp:ListItem>30 to 50%</asp:ListItem>
            <asp:ListItem>More than 50%</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>

    <div class="sort">
       Sort By:<asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
            <asp:ListItem>No.</asp:ListItem>
            <asp:ListItem>Name</asp:ListItem>
            <asp:ListItem>Price(low to high)</asp:ListItem>
            <asp:ListItem>Price(high to low)</asp:ListItem>
            <asp:ListItem>Discount(low to high)</asp:ListItem>
            <asp:ListItem>Discount(high to low)</asp:ListItem>
                </asp:RadioButtonList>
        <asp:LinkButton ID="LinkButton5" CssClass="link" runat="server" OnClick="LinkButton5_Click">Clear Sort</asp:LinkButton>

    </div>
    

        <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="false"  OnRowDataBound="GridView1_RowDataBound"   DataKeyNames="i_no">
            <Columns>
                <asp:BoundField DataField="i_no" HeaderText="Item no." />
                <asp:TemplateField HeaderText="Image" ControlStyle-Width="200px" ControlStyle-Height="150px" >
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="150px"   Text='<%#Eval("i_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                
                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="200px"   Text='<%#Eval("i_details") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Price(Rs.)">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="80px"   Text='<%#Eval("i_price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="60px"   Text='<%#Eval("i_status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Discount(%)">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="80px"   Text='<%#Eval("i_disc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                </Columns>
            <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
        </asp:GridView>
       
        
        <br />
        <asp:Panel ID="Panel1" CssClass="panelitem" runat="server" Visible="false">
            <h3>Delete Product</h3> 
            <table class="itemtable">
                <tr>
                    <td>
                        Item No:
                    </td>
                    <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="one" ControlToValidate="TextBox1" ForeColor="Red"  runat="server" ErrorMessage="Item no. is required"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ValidationGroup="one" ControlToValidate="TextBox1"  ForeColor="Red" ErrorMessage="Item No. does not exist" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="one" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Data type must be int"></asp:CompareValidator><br/>
            </td>
                </tr>
                <tr > 
                    <td colspan="2"><asp:Button ID="Button4" CssClass="button" runat="server" Text="Delete" OnClick="Button4_Click" ValidationGroup="one" /><br/></td>
                </tr>
            </table>
        </asp:Panel>

       <asp:Panel ID="Panel2" runat="server" Visible="false" >
            <h3>Update Product</h3> 
           <table class="itemtable" >
               <tr>
                   <td>Item No:</td>
                   <td><asp:TextBox ID="TextBox2" runat="server"  ></asp:TextBox></td>
               </tr>
               
               <tr>
                   <td><br /></td>
                   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="two" ControlToValidate="TextBox2" ForeColor="Red"  runat="server" ErrorMessage="Item no. is required"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ValidationGroup="two" ControlToValidate="TextBox2"  ForeColor="Red" ErrorMessage="Item No. does not exist" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox2" ValidationGroup="two" ForeColor="Red" Display="Dynamic" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Data type must be int"></asp:CompareValidator><br/><br/>
            </td>
               </tr>
               <tr>
                   <td colspan="2"><asp:Button ID="Button5" runat="server" CssClass="button" Text="submit" OnClick="Button5_Click" ValidationGroup="two"/></td>
               </tr>
           </table>                                          
        </asp:Panel>
       
   </asp:Content>