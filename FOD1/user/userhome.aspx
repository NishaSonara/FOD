<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="userhome.aspx.cs" Inherits="food_ordering_system.user.userhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delicious Pizza</title>
    <link  rel="stylesheet" type="text/css" href="/css/userhomecss.css" />
</head>
<body style="background-image:url('/image/background-wall.jpg'); background-attachment:fixed"  >
    <form id="form1" runat="server">               
    <div>
         <ul>                                                               
           
             <li><a href="../user/userhome.aspx">Home</a></li>
             
            <li><a href="../user/menu.aspx">Menu</a></li>
             <li><a href="../user/myorder.aspx">My Order</a></li>
             <li><a href="../user/changepassword.aspx">Change Password</a></li>

             <li><a href="../user/updateuserdetail.aspx">Account Setting</a></li>
              <li><a href="../user/feedback.aspx">Feedback</a></li>
             <li><a href="../user/logout.aspx">Logout</a></li>
        </ul>                     
       </div>

        <div>

            <h1>Welcome To Delicious Pizza</h1>
        </div>
                     
 <div class="slideshow-container">
<div class="mySlides fade">
  <asp:Image ImageUrl="~/image/1.jpg" runat="server"/>
</div>


<div class="mySlides fade">
  <asp:Image ImageUrl="~/image/3.jpg" runat="server"/> 
</div>
     


<div class="mySlides fade">
  <asp:Image ImageUrl="~/image/5.jpg" runat="server"/> 
</div>

<div class="mySlides fade">
  <asp:Image ImageUrl="~/image/6.jpg" runat="server"/> 
</div>

<div class="mySlides fade">
  <asp:Image ImageUrl="~/image/7.jpg" runat="server"/> 
</div>
</div>


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
</div>

<script type="text/javascript" src="/css/homescript.js">
</script>
        
        
        <div class="box">
            <br /><br /><br/><br />
            <div class="responsive">
                <div class="img">
            <a target="_blank" href="../image/item/papper-paneer.jpg">
            <asp:Image ID="Image1" ImageUrl="~/image/item/papper-paneer.jpg"  CssClass="aspimage" AlternateText="margherita" runat="server"/>
                </a>
                <div class="desc">Papper Paneer<br/>Price:200</div>        
            </div>
        </div>
            <div class="responsive">
                <div class="img">
            <a target="_blank" href="../image/item/Biscuit-Mini-Pizzas.jpg">
            <asp:Image ID="Image2" ImageUrl="~/image/item/Biscuit-Mini-Pizzas.jpg" CssClass="aspimage" AlternateText="double cheese margherita" runat="server"/>
                </a>
                <div class="desc">Buiscuit Mini Pizza<br />Price:150</div>        
            </div>
        </div>
            <br />
            
            <div class="responsivemiddle">
                <div class="img">
            <a target="_blank" href="../image/item/choco-lava-cake.jpg">
            <asp:Image ID="Image4" ImageUrl="~/image/item/choco-lava-cake.jpg" CssClass="aspimage" AlternateText="double cheese margherita" runat="server"/>
                </a>
                <div class="desc">Choco Lava Cake<br/>Price:70</div>        
            </div>
        </div>
            <div class="responsive">
                <div class="img">
            <a target="_blank" href="../image/item/stuffed-garlic-breadstick.jpg">
            <asp:Image ID="Image3" ImageUrl="~/image/item/stuffed-garlic-breadstick.jpg" CssClass="aspimage" AlternateText="double cheese margherita" runat="server"/>
                </a>
                <div class="desc">Stuffed Garlic Breadstick<br />Price:160</div>        
            </div>
        </div>
            <br />
            <div class="responsive">
                <div class="img">
            <a target="_blank" href="../image/item//taco-maxicana-veg.jpg">
            <asp:Image ID="Image5" ImageUrl="~/image/item/taco-maxicana-veg.jpg" CssClass="aspimage" AlternateText="double cheese margherita" runat="server"/>
                </a>
                <div class="desc">Taco Maxicana Veg<br />Price:140</div>        
            </div>
        </div>
        </div>



    </form>
</body>
</html>
