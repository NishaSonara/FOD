<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/admin_master.Master" CodeBehind="admin_additem.aspx.cs" Inherits="food_ordering_system.admin.additem" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h3>Add Product</h3>
        <table class="table">
            
            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>  <br/>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="FileUpload1" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="please upload only image!"></asp:CustomValidator>
                    
                </td>

            </tr>
            
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="TextBox2" runat="server"  CssClass="textbox"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2" Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="Name field is required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[a-z A-Z]+" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ErrorMessage="Data type must be string "></asp:RegularExpressionValidator>
                    
                </td>
               
            </tr>
            <tr>
                <td>Details:</td>
                <td><asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"  CssClass="textbox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox3" Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="Details field is required"></asp:RequiredFieldValidator><br />
                    
                    
                </td>
                
            </tr>
            <tr>
                <td>Price:</td>
                <td><asp:TextBox ID="TextBox4" runat="server"  CssClass="textbox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox4" Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="Price field is required"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox4" ForeColor="Red" Display="Dynamic" MinimumValue="0" MaximumValue="1000" Type="Double" ErrorMessage="must be between 0 to 1000"></asp:RangeValidator>
                    
                </td>
                
            </tr>
            <tr>
                <td>Status:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropbtn">
                        <asp:ListItem>-select-</asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>NA</asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="-select-" ControlToValidate="DropDownList1" Display="Dynamic" runat="server"  ForeColor="red" ErrorMessage="status field is required"></asp:RequiredFieldValidator>
                </td>                
            </tr>

            <tr>
                <td>Discount:</td>
               
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="textbox"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter Discount"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox5" MinimumValue="0.00" Type="Double" MaximumValue="99.00" ErrorMessage="must be between 0 to 99"></asp:RangeValidator>
                </td>
            </tr>

            <tr>
                <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Add" CssClass="addbutton" OnClick="Button1_Click" /></td>
            </tr>
        </table>
       
    </asp:Content>
    
