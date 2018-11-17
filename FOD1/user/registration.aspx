
<%@ Page Language="C#" AutoEventWireup="true" Title="Delicious Pizza" CodeBehind="registration.aspx.cs" MasterPageFile="~/mymaster.master" Inherits="food_ordering_system.user.registration" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
     <link  rel="stylesheet" type="text/css" href="/css/registrationcss.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br /> 
    <asp:ScriptManager ID="SM1" runat="server">

        </asp:ScriptManager>
    <table class="regtable">
        <tr >
            <td class="auto-style14" colspan="2">
               <h3><u> CUSTOMER REGISTARTION FORM </u></h3>
             </td>
       
        </tr>
                <tr>
            <td class="auto-style5">UserName:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ForeColor="Red" ControlToValidate="TextBox1" Display="Dynamic" runat="server" ErrorMessage="username is required"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" ErrorMessage="username already exists" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                
            </td>            
        </tr>
        <tr>
            <td class="auto-style5">FirstName:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox11"  CssClass="textbox"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12"  ForeColor="Red" ControlToValidate="TextBox11" Display="Dynamic" runat="server" ErrorMessage="firstname is required"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox11" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="enter valid name"></asp:RegularExpressionValidator>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style5">LastName:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox12"  CssClass="textbox"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13"   ForeColor="Red" ControlToValidate="TextBox12" Display="Dynamic" runat="server" ErrorMessage="lastname is required"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox12" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="enter valid name"></asp:RegularExpressionValidator>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style4">Phone no:</td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox2"   CssClass="textbox" TextMode="Phone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" runat="server" ErrorMessage="phone no is required"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator4" ForeColor="Red"  Display="Dynamic" ControlToValidate="TextBox2" runat="server" ErrorMessage="This is number is already registered" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator5" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Phone number is not valid" OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
              
            </td>
            
        </tr>
        <tr>
            <td class="auto-style10">gender:</td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" Width="85px">
                    <asp:ListItem>Male</asp:ListItem><asp:ListItem>Female</asp:ListItem>
                    
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10"   Display="Dynamic" ForeColor="Red" ControlToValidate="RadioButtonList1" runat="server" ErrorMessage="select the gender"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
         <tr>
            <td class="auto-style7">Date Of Birth:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TextBox8"  CssClass="textbox"  TextMode="Date" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox8" ErrorMessage="enter your birthdate"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox8" ValidationExpression="(((0|1)[1-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="please enter the birthdate in dd/mm/yyyy formate"></asp:RegularExpressionValidator>
             </td>
           
        </tr>
        <tr>
            <td class="auto-style5">Address:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox3" TextMode="MultiLine"  CssClass="textbox"  Rows="2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBox3" runat="server" ErrorMessage="address detail is required"></asp:RequiredFieldValidator>                
                  
            </td>
           
        </tr>
        <tr>
            <td class="auto-style4">Country:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList1" CssClass="dropbtn" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14"   ForeColor="Red" Display="Dynamic" InitialValue="-select-" ControlToValidate="DropDownList1"  runat="server" ErrorMessage="country is required"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style7">State:</td>
            <td class="auto-style8">
                <asp:DropDownList ID="DropDownList2" CssClass="dropbtn" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="Red" InitialValue="-select-" ControlToValidate="DropDownList2" runat="server" ErrorMessage="state is required"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style4">City:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList3" CssClass="dropbtn" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" Display="Dynamic" InitialValue="-select-" ControlToValidate="DropDownList3"  runat="server" ErrorMessage="city is required"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style5">Pincode:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox6"  CssClass="textbox"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox6" ErrorMessage="pincode is required"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator6" ForeColor="Red" ControlToValidate="TextBox6" Display="Dynamic" runat="server" ErrorMessage="Invalid Pincode" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style12">Password:</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox9"   CssClass="textbox" TextMode="password" runat="server" AutoPostBack="false"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox9" ID="RequiredFieldValidator2" runat="server" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" Display="Dynamic"   ControlToValidate="TextBox9" runat="server" ForeColor="Red" ErrorMessage="password must be greater than 8" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style4">Confirm Password:</td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox10"  CssClass="textbox"  TextMode="password" runat="server" AutoPostBack="false"></asp:TextBox>
                <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="TextBox10" ID="RequiredFieldValidator3" runat="server" Display="Dynamic"  ErrorMessage="confirm password is required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ForeColor="Red"  ControlToValidate="TextBox10" ControlToCompare="TextBox9" Display="Dynamic" Operator="Equal" runat="server" ErrorMessage="password not matched"></asp:CompareValidator>
            </td>
           
        </tr>
        
        <tr>
            <td class="auto-style4">Email:</td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox7"  CssClass="textbox"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9"  Display="Dynamic" ControlToValidate="TextBox7" ForeColor="Red" runat="server" ErrorMessage="please enter your email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"   Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="TextBox7" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ErrorMessage="please enter the email in valid formate"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator3" ForeColor="Red"  runat="server" ErrorMessage="email is already exist" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
            </td>
           
        </tr>
        <tr>
            <td>Enter Below Code:</td>
            <td><asp:TextBox ID="txtCaptcha" runat="server" Width="200px"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtCaptcha" ForeColor="Red"  ErrorMessage="Invalid Code" Display="Dynamic" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtCaptcha" ForeColor="Red"  ErrorMessage="Please enter code" Display="Dynamic" runat="server" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td></td>
            <td>            <asp:UpdatePanel ID="UP1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td style="height: 50px; width:100px;">
                                        <asp:Image ID="imgCaptcha" runat="server" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click"/>
                                    </td>
                                </tr>
                                
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </td>

        </tr>
         <tr>
            <td colspan="2">
                <asp:Button ID="Button1" CssClass="button" runat="server" Text="Register Now" OnClick="Button1_Click" />
             </td>
       
        </tr>
         <tr>
            <td class="auto-style1" colspan="2" >
                <asp:Panel ID="Panel1" runat="server" Visible="false">
                <asp:Label ID="Label1" ForeColor="blue" runat="server"></asp:Label></asp:Panel></td>
              
             </tr>
                  <tr><td colspan="2">
             <asp:Panel ID="Panel2" runat="server" Visible="false">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="~/user/login.aspx">Login Now!</asp:HyperLink>
                    </asp:Panel></td>
        
            
       
        </tr>
    </table>
   

</asp:Content>