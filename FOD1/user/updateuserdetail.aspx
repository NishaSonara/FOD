<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/usermaster.master" CodeBehind="updateuserdetail.aspx.cs" Inherits="food_ordering_system.user.updateuserdetail" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/updateinfocss.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
        <table class="updatetable">
            <tr>
                <td colspan="2" style="text-align:center"><h3><u>Update Your Details</u></h3></td>
            </tr>
           
            
            <tr>
                <td>Phone no:</td>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="textbox" runat="server" ></asp:TextBox><br/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="v1" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Phone no. is required"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="v1" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ErrorMessage="phone no. is already registered"  OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ValidationGroup="v1" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ErrorMessage="invalid phone no." OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </td>              
            </tr>
            <tr>
             <td>Address:</td>
                <td><asp:TextBox ID="TextBox3" CssClass="textbox" runat="server"></asp:TextBox><br/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="v1" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>Country:</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" CssClass="dropbtn" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                 </td>                
            </tr> 
            <tr>
                <td>State:</td>
                <td>
                    <asp:DropDownList ID="DropDownList3" CssClass="dropbtn" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                 </td>
                
            </tr> 
            
            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" CssClass="dropbtn" runat="server"></asp:DropDownList>
                </td>
                
            </tr>
              <tr>
                <td>Pincode:</td>
                <td><asp:TextBox ID="TextBox5" CssClass="textbox" runat="server"></asp:TextBox><br/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="v1" ControlToValidate="TextBox5" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="pincode is required"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ValidationGroup="v1" ControlToValidate="TextBox5" Display="Dynamic" ForeColor="Red" ErrorMessage="invalid pincode" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                 </td>
                
            </tr>
             
             <tr >
                <td colspan="2">
                    <asp:Button ID="Button1" CssClass="loginbutton" runat="server" Text="Update" ValidationGroup="v1" OnClick="Button1_Click" /></td>
                 </tr>
           <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="Label3" runat="server" ForeColor="Blue"></asp:Label>
                   </td>
                 </tr>
           
                
        </table>
        
            <div class="deletetable">
                <h3 style="text-align:center"><u>Delete account</u></h3>
                    
          <p>Once you delete your account, there is no going back. Please be certain.</p>
                        <p>
                            <asp:Button ID="Button2" CssClass="deletebutton" runat="server" Text="Delete My Account" OnClick="Button2_Click" /></p>
                        
  <div style="text-align:center">
            <asp:Panel ID="Panel1" runat="server" Visible="false" ForeColor="Red"  >ARE U SURE?
                <br />
            <asp:Button ID="Button4" CssClass="surebutton" runat="server" Text="YES" OnClick="Button4_Click" />
              
              <asp:Button ID="Button5" CssClass="surebutton" runat="server" Text="NO" OnClick="Button5_Click" />
                </asp:Panel>
         </div>
            </div>
</asp:Content>
   
