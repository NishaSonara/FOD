<%@ Page Language="C#" Title="Delicious Pizza" AutoEventWireup="true" MasterPageFile="~/mymaster.master" CodeBehind="homefeedback.aspx.cs" Inherits="food_ordering_system.user.homefeedback" %>

<asp:Content ID="c2" ContentPlaceHolderID="head" runat="server">
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
    </asp:Content>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <br />
    <br />
    <br />
   <h2>Feedback</h2>
    <asp:GridView CssClass="feedbacktable" ID="GridView1" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Feedback">
                <ItemTemplate>
                    <asp:Label runat="server" Width="300px" Text='<%# Eval("f_name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        
            </Columns>
        <HeaderStyle BackColor="SkyBlue" />
            <RowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br /><br /><br />
    <div class="feed">
        Please take a moment to tell us what you think about our website,
         our products, our organization, or anything else that comes to mind.
         We welcome all of your comments and suggestions that will help us serve you better.<br /><br />
        UserName: <asp:TextBox ID="TextBox2" runat="server" CssClass="feedback"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ForeColor="Red"  ErrorMessage="enter username"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="feedback"  ControlToValidate="TextBox2" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red" ErrorMessage="Invalid username"></asp:CustomValidator> <br />
        <asp:TextBox ID="TextBox1"  runat="server" CssClass="feedback" TextMode="MultiLine" Rows="5" Width="300px"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="feedback" ForeColor="Red"  ErrorMessage="enter your feedback"></asp:RequiredFieldValidator><br />
        <asp:Button ID="Button1" runat="server" CssClass="submit" Text="Submit"  OnClick="Button1_Click"/>
    </div>
   
    </asp:Content>