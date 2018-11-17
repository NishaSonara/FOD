<%@ Page Language="C#" AutoEventWireup="true" Title="Delicious Pizza" MasterPageFile="~/usermaster.master" CodeBehind="final.aspx.cs" Inherits="food_ordering_system.user.final" %>

<asp:Content ID="c2" ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
    <script type = "text/javascript" >

</script>
  </asp:Content>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br /><div class="final">
     Thanks For Choosing Delicious Pizza.<br /><br />
    Your order will be delievered within 30 minutes!<br /><br />      
        Help us to improve our website, our products, our organization by giving feedback.
        you can give <asp:LinkButton ID="LinkButton1" PostBackUrl="~/user/feedback.aspx" CssClass="link" runat="server">Feedback here</asp:LinkButton><br /><br />
        You can also track your <asp:LinkButton PostBackUrl="~/user/myorder.aspx" CssClass="link" runat="server">order status here</asp:LinkButton><br /><br />
        Please visit us often!
          </div>
   
   </asp:Content>