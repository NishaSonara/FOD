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
    <div>
        <h3>Update Product</h3>
         <table class="update">

            <tr>
                <td>Item No:</td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
         </td>      
            </tr>
                                         
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="TextBox2" CssClass="textbox" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="two"  ControlToValidate="TextBox2" Display="Dynamic" runat="server" ForeColor="red" ErrorMessage="Name field is required"></asp:RequiredFieldValidator>
                </td>
               
            </tr>
            <tr>
                <td>Details:</td>
                <td><asp:TextBox ID="TextBox3" CssClass="textbox" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="two"  ControlToValidate="TextBox3" Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="Details field is required"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>Price:</td>
                <td><asp:TextBox ID="TextBox4" CssClass="textbox" runat="server"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox4"  ValidationGroup="two"   Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="Price field is required"></asp:RequiredFieldValidator>                    
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox4"  ValidationGroup="two"   Display="Dynamic"  ForeColor="red" Type="Integer" MinimumValue="1" MaximumValue="1000" ErrorMessage="price must be between 1 to 1000"></asp:RangeValidator>
                </td>
                
            </tr>
            <tr>
                <td>Status:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>-select-</asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>NA</asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="-select-" ValidationGroup="two"  ControlToValidate="DropDownList1" Display="Dynamic" runat="server" ForeColor="red" ErrorMessage="status field is required"></asp:RequiredFieldValidator>
                </td>
                
                </tr>
             <tr>
                 <td>Discount:</td>
                 <td>
                     <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox><br />
                     
                     <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Double" MinimumValue="0.00" MaximumValue="99.00" Display="Dynamic" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="two"  ErrorMessage="Enter value between 0 to 99"></asp:RangeValidator>
                 </td>
             </tr>
             <tr>
                 <td colspan="2">
                     <asp:Button ID="Button1" runat="server" CssClass="addbutton" ValidationGroup="two" Text="Update" OnClick="Button1_Click" /></td>
             </tr>
                 </table>
        
       
       
    </div>
       </form>
            </body>
    
