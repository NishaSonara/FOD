<%@ Page Title="Delicious Pizza" Language="C#" MasterPageFile="~/mymaster.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="food_ordering_system.user.login" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/logincss.css" />
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <div>
       
        <table  class="logintable">
            <tr>
                <td colspan="2"><h3><u>CUSTOMER LOGIN FORM</u></h3>
        </td>     
            </tr>
            <tr>
                <td>Username:</td>
                <td><asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox><br />
        <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="username must not be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>Password:</td>
                <td>
        <asp:TextBox ID="TextBox2"  TextMode="Password" CssClass="textbox" runat="server"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="password must not be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
             <tr>
                <td colspan="2">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" /></td>
            </tr>

            <tr>
                <td  colspan="2">                 
                    <asp:Label ID="Label1" runat="server" forecolor="blue"></asp:Label>                 
                </td>
                
            </tr>
           
            <tr>
                <td colspan="2" >
                 <asp:Button ID="Button1" CssClass="loginbutton"  runat="server" Text="LOGIN" OnClick="Button1_Click" />
       
                </td>
                
            </tr>
            <tr >
                <td >&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" CssClass="link" runat="server"  NavigateUrl="~/user/registration.aspx">New User?</asp:HyperLink></td>
           <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:HyperLink ID="HyperLink1" CssClass="link" runat="server"  NavigateUrl="~/user/forgotpassword.aspx">Forgot Password?</asp:HyperLink></td>
                </tr>
          
        </table>
          
     </div>
</asp:Content>

        
        
           
        
 