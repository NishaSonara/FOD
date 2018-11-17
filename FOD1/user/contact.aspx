<%@ Page Title="Delicious Pizza" Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" MasterPageFile="~/mymaster.master" Inherits="food_ordering_system.user.contact" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/aboutcss.css" />
</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <br />
    <h1>World's Leading Pizza Delievery Company</h1>
    <div class="customer">
        <h3 class="custhead">Customer Service</h3>
        <h4 style="color:darkblue">Do you want to tell us about your experience of our product and customer service?</h4>
        If you think we can improve,
             we will always listen and react
             to your comments. If you have experienced
             any problems with our service, we require 
            further information such as your name,
             address and phone number to complete our enquiries.
             We’d also love to hear from you
             if you think we did a great job!<br />
            <b>Email:</b>custservice@delicious.co.in       
    </div>
    <div class="ad">
        <h3 class="adhead">Advertising</h3>
        <h4 style="color:darkblue">Do you want to speak to us about advertising?</h4>
        If you have an advertising proposal for us, please email us all the details and we will respond to you accordingly.
      <br />  <b>Email:</b>marketing@delicious.co.in

    </div>
    <div class="ed">
        <h3 class="edhead">Educational Support</h3>
        <h4 style="color:darkblue">Are you a student in need of information for course work or a project?</h4>
        We recommend that you download the company information pack that's available in the Investor section of this site. Alternatively, please contact us with your questions.
        <br /><b>Email:</b>comments@delicious.co.in

    </div>
    
</asp:Content>
