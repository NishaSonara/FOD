<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" MasterPageFile="~/usermaster.master" Inherits="food_ordering_system.user.changepassword" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/updateinfocss.css" type="text/css" />
</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <br />
    <br />
        <table class="passtable">
            <tr>
                <td colspan="2" style="text-align:center"><h3><u>Change Password</u></h3></td>
                               
            </tr>
            <tr>
                <td>Current Password:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox></td>
                 
            </tr>
            <tr>
                <td></td>
                <td><asp:RequiredFieldValidator ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" ID="CustomValidator1" runat="server" ErrorMessage="invalid password" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>                    
           </td>
            </tr>
                
            <tr>
                <td>New Password:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox2" runat="server" ErrorMessage="please enter password"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" Display="Dynamic" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="password must be greater than 8" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" Display="Dynamic" ForeColor="Red" ControlToCompare="TextBox1" Operator="NotEqual" ControlToValidate="TextBox2" ErrorMessage="new password must be different"></asp:CompareValidator>
                </td>                
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
            <tr>
                <td></td>
                <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox3" runat="server" ErrorMessage="please re-enter password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox3" ControlToCompare="TextBox2" Operator="Equal" ErrorMessage="password not matched"></asp:CompareValidator>
                </td>                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button  ID="Button1" runat="server" Text="change password" CssClass="deletebutton" OnClick="Button1_Click" />
                </td>
                </tr>
            <tr>
                <td colspan="2">
                     
                        <asp:HyperLink ID="HyperLink1" CssClass="link" Visible="false" NavigateUrl="~/user/forgotpassword.aspx" runat="server">Forgot Password?</asp:HyperLink></td>  
            </tr>
            <tr>
                <td  colspan="2"  style="text-align:center">
                    
                    <asp:Label ID="Label1" ForeColor="Blue" runat="server"></asp:Label>
                    
                </td>
               
            </tr>
        </table>
    
   </asp:Content>