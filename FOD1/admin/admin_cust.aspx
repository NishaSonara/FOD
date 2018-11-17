<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/admin_master.Master" CodeBehind="admin_cust.aspx.cs" Inherits="food_ordering_system.admin.admin_cust" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>
 <asp:Content ID="c1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
     
     <br />
     <br />
     
     <h3>Customer Account</h3>
     <asp:Label ID="Label1" runat="server" CssClass="label"></asp:Label>
     <br />
        <asp:GridView ID="GridView1" CssClass="custgridview" runat="server"   AutoGenerateColumns="false" >
             <Columns>
                 <asp:BoundField DataField="c_id" HeaderText="CustomerID" />
                <asp:BoundField DataField="c_uname" HeaderText="UserName"/>
                <asp:BoundField DataField="c_fname" HeaderText="FirstName" />
                <asp:BoundField DataField="c_lname" HeaderText="LastName" />
                <asp:BoundField DataField="c_phone_no" HeaderText="PhoneNo" />
                <asp:BoundField DataField="c_gender" HeaderText="Gender" />                 
                
                 <asp:BoundField DataField="c_address" HeaderText="Address" />
                <asp:BoundField DataField="c_city" HeaderText="City" />
                <asp:BoundField DataField="c_state" HeaderText="State" />
                <asp:BoundField DataField="c_country" HeaderText="Country" />
                <asp:BoundField DataField="c_pincode" HeaderText="Pincode" />
                  <asp:BoundField DataField="c_dob" HeaderText="DOB" DataFormatString="{0:d}" />
                <asp:BoundField DataField="c_email" HeaderText="Email" />                           
            </Columns>
            
              <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke"  Height="30px" Width="50px"  />
        </asp:GridView>
     </asp:Content>   
    
  