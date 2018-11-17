<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/mymaster.Master" CodeBehind="admin_login.aspx.cs" Inherits="food_ordering_system.admin.adminlogin" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />
</asp:Content>
<asp:Content ID="c1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
   
        <table class="logintable" >
            <tr>
                <td colspan="2"><h2 class="admin"><u>ADMIN LOGIN</u></h2></td>        
            </tr>
            <tr>
                <td >Admin Name:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  
                </td>               
            </tr>
            <tr>
                <td><br /></td>
                <td>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="please enter admin name"></asp:RequiredFieldValidator></td>
            </tr>
            <tr >
                <td >Password:</td>
                <td >
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>         
                </td>
            </tr>
            <tr>
                <td></td>
                <td>     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="please enter password"></asp:RequiredFieldValidator></td>
            </tr>
            
            <tr>
                
            <td colspan="2">
               
                <asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
                </td></tr>    
            <tr >
                <td colspan="2">
                    <asp:Button ID="Button1" CssClass="loginbutton" runat="server" Text="LOGIN" OnClick="Button1_Click"  />
                </td>              
            </tr>
        </table>
       
   </asp:Content>
