<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/usermaster.master" CodeBehind="feedback.aspx.cs" Inherits="food_ordering_system.user.feedback" %>
<asp:Content ID="c2" ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
    </asp:Content>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <br />
        <br />
        <br />
    <h2>Feedback Form</h2>
    <div class="feed">

        Please take a moment to tell us what you think about our website,
         our products, our organization, or anything else that comes to mind.
         We welcome all of your comments and suggestions that will help us serve you better.<br />
   
        <asp:TextBox ID="TextBox1"  runat="server" TextMode="MultiLine" Rows="5" Width="300px"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ForeColor="Red"  ErrorMessage="Please enter feedback"></asp:RequiredFieldValidator><br />
        
        <asp:Button ID="Button1" runat="server" CssClass="feedbackbutton" Text="Submit"  OnClick="Button1_Click"/>
    </div>
   
    </asp:Content>
