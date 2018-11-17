<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" MasterPageFile="~/mymaster.master" Inherits="food_ordering_system.user.forgetpassword" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/forgotpasscss.css" />
</asp:Content>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <br />
    <br />
    <br />
    <table class="forgotpasstable">
        <tr>
            <td colspan="2" style="text-align:center"><h3><u>Get Password</u></h3></td> 

        </tr>
                    
        <tr>
            <td>UserName:</td>
            <td>
                <asp:TextBox ID="TextBox3" CssClass="textbox" runat="server" ></asp:TextBox><br />
                <asp:RequiredFieldValidator  ID="RequiredFieldValidator3" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBox3" runat="server" ErrorMessage="please enter your username"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
         <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" ></asp:TextBox><br />
                <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBox1" runat="server" ErrorMessage="please enter your email"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
         <tr>
            <td colspan="2" style="text-align:center">
                <asp:Button ID="Button1" runat="server" CssClass="submitbutton"  Text="SUBMIT" OnClick="Button1_Click" />
             </td>
                    </tr>
         <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label1" ForeColor="Blue" runat="server"></asp:Label>
             </td>
            
            
        </tr>
         <tr>
            <td colspan="2" style="text-align:center">
                <asp:HyperLink ID="HyperLink1" CssClass="link" runat="server" NavigateUrl="~/user/login.aspx" >Login Now!</asp:HyperLink>
                
             </td>
            
           
        </tr>
    </table>
   </asp:Content>