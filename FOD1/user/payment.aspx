
    <link  rel="stylesheet" type="text/css" href="/css/cartcss.css" />
   

    </asp:Content>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <br />
        <br />
        <br />
    <h2>Payment Method</h2>
        <table class="payment">
           
            <tr>
               
                <td colspan="2" >
                    Total amount:<asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style3">Payment Type:</td>
                <td class="auto-style5">

                    <asp:RadioButtonList ID="RadioButtonList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem>Cash by delievery</asp:ListItem>
                        <asp:ListItem>Online transaction</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server"  ControlToValidate="RadioButtonList1" ErrorMessage="please select payment mode"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>Delivery Address:</td>
               <td> <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ForeColor="Red" ControlToValidate="TextBox4" ErrorMessage="enter delievery address"></asp:RequiredFieldValidator>
               </td>
            </tr>
            
            <asp:Panel ID="Panel1" runat="server" Visible="false">
               
            <tr>
                <td class="auto-style3">Card Number:</td>
                <td class="auto-style1">
                    <asp:TextBox  ID="TextBox1" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Enter valid number" runat="server" Display="Dynamic" ControlToValidate="TextBox1" ForeColor="Red" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic"  ForeColor="Red" ValidationExpression="\b(?:4[0-9]{12}(?:[0-9]{3})?|(?:5[1-5][0-9]{2}|2720|27[01][0-9]|2[3-6][0-9]{2}|22[3-9][0-9]|222[1-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35[0-9]{3})[0-9]{11})\b" ErrorMessage="enter valid number" ></asp:RegularExpressionValidator>
                </td>

            </tr>
                <tr>
                    <td>Expiration Date:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>                        
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                       
                        </td>
                    
                </tr>
                 <tr>
                     <td>CVV:</td>
                     <td>
                         <asp:TextBox ID="TextBox2" CssClass="textbox" runat="server"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" Display="Dynamic"  ForeColor="Red" runat="server"  ErrorMessage="enter valid cvv"></asp:RequiredFieldValidator>
                         <asp:RangeValidator ID="RangeValidator1" ControlToValidate="TextBox2" Display="Dynamic"  ForeColor="Red" Type="Integer" runat="server"  ErrorMessage="enter valid cvv" MinimumValue="001" MaximumValue="999" ></asp:RangeValidator>
                   
                     </td>
                 </tr>
                <tr>
                    <td>Name on card:</td>
                    <td><asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox3" Display="Dynamic"  ForeColor="Red" runat="server"  ErrorMessage="enter valid name"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic"  ForeColor="Red" ValidationExpression="^[a-z A-Z]+$" ErrorMessage="enter valid name" ></asp:RegularExpressionValidator>
              </td>  </tr>                            
              </asp:Panel>
            <tr><td colspan="2">
                <asp:Button ID="Button1" Visible="false" runat="server" CssClass="pay" Text="Place My Order" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    
    
  </asp:Content>