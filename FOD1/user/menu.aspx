<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="usermaster.master.cs" Inherits="food_ordering_system.usermaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
</head>
   
        <body style="background-color:cornsilk">
    <form id="form1" runat="server">
   
    <br />
    <br />
    <br />
    Find Item:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="a" runat="server" ControlToValidate="TextBox1" ErrorMessage=""></asp:RequiredFieldValidator>
    <asp:Button ID="Button3" runat="server" CssClass="search" Text="Search" ValidationGroup="a" OnClick="Button3_Click" />
    <br />
    
   
   <h2>MENU</h2>
     
    <div class="filter">Filter By:<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem>Price</asp:ListItem>     
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
    

    
    <asp:ListBox ID="ListBox1" runat="server" Visible="false"></asp:ListBox>
   
     <asp:Button ID="Button1" runat="server" CssClass="button" Text="Go To My Cart" OnClick="Button1_Click" /><br />
    <div class="label">
   
    <asp:Label ID="Label1" runat="server"></asp:Label><br />
          <asp:Label ID="Label2" runat="server" Visible="false" ></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="gridview" OnRowDataBound="GridView1_RowDataBound"  AutoGenerateColumns="False" DataKeyNames="i_no"  OnRowCommand="GridView1_RowCommand"             >

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
                 <asp:TemplateField HeaderText="Discount">
                    <ItemTemplate>
                        <asp:Label runat="server" Width="80px"   Text='<%#Eval("i_disc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              
              
                
                <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="Button2" runat="server" Text="Add To Cart" CssClass="gridbutton" CommandName="cart" CommandArgument='<%# Eval("i_no") %>' />
                  </ItemTemplate>
              </asp:TemplateField>     

            </Columns>
             <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
        </asp:GridView>

   
<br />
</form>
</body>
</html>