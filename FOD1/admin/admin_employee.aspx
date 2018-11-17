<%@ Page Language="C#"  AutoEventWireup="true" Title="Delicious Pizza" MasterPageFile="~/admin_master.Master" CodeBehind="admin_employee.aspx.cs" Inherits="food_ordering_system.admin.admin_employee" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <link  rel="stylesheet" type="text/css" href="/css/adminitemcss.css" />     
</asp:Content>

<asp:Content ID="c1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <h3>Employee Account</h3>     
        <asp:GridView ID="GridView1" runat="server" CssClass="custgridview" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" >
               <Columns>
                 <asp:BoundField DataField="e_id" HeaderText="EmployeeID" />                
                <asp:BoundField DataField="e_fname" HeaderText="FirstName" />
                <asp:BoundField DataField="e_lname" HeaderText="LastName" />
                <asp:BoundField DataField="e_phone_no" HeaderText="PhoneNo" />
                <asp:BoundField DataField="e_gender" HeaderText="Gender" />    
                  
                <asp:BoundField DataField="e_address" HeaderText="Address" />
                <asp:BoundField DataField="e_city" HeaderText="City" />
                <asp:BoundField DataField="e_state" HeaderText="State" />
                <asp:BoundField DataField="e_country" HeaderText="Country" />
                <asp:BoundField DataField="e_pincode" HeaderText="Pincode" />
                <asp:BoundField DataField="e_dob" HeaderText="DOB" DataFormatString="{0:d}" />
                   <asp:BoundField DataField="e_doj" HeaderText="DOJ"  DataFormatString="{0:d}"/>
                <asp:BoundField DataField="e_email" HeaderText="Email" />                           
                    <asp:BoundField DataField="e_salary" HeaderText="Salary" />   
            </Columns>
          
             <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke"  Height="30px" />
        </asp:GridView>
    </asp:Content>