<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            width: 282px;
        }
        .auto-style3 {
            width: 881px;
            height: 133px;
            position: absolute;
            top: 160px;
            left: 162px;
            z-index: 1;
        }
        .auto-style4 {
            width: 177px;
        }
        .auto-style5 {
            height: 71px;
            position: absolute;
            top: 343px;
            left: 107px;
            width: 100%;
            z-index: 1;
        }
        .auto-style6 {
            width: 282px;
            height: 23px;
        }
        .auto-style7 {
            width: 177px;
            height: 23px;
        }
        .auto-style8 {
            width: 172px;
        }
        .auto-style9 {
            width: 172px;
            height: 23px;
        }
        .auto-style10 {
            width: 206px;
            height: 50px;
            position: absolute;
            top: 81px;
            left: 137px;
            z-index: 1;
        }
        .auto-style11 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <table class="auto-style11">
            <tr>
                <td class="auto-style1" colspan="2" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="Invoice"></asp:Label>
                </td>
                <td class="auto-style1" colspan="2" style="text-align: center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Invoice Number:<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="None" CaptionAlign="Left" CssClass="auto-style10" DataSourceID="SqlDataSource2" GridLines="None" Height="50px">
                        <CommandRowStyle HorizontalAlign="Left" />
                        <Fields>
                            <asp:BoundField DataField="FirstName" HeaderText="Customer Name :" SortExpression="FirstName" />
                            <asp:BoundField DataField="address" HeaderText="Shipping Address :" SortExpression="address" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CssClass="auto-style3">
            <Columns>
                <asp:TemplateField HeaderText="S.No.">
                    <ItemTemplate>
                        <span>
                            <%#Container.DataItemIndex + 1 %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                <asp:BoundField DataField="product_price" HeaderText="Product Price" SortExpression="product_price" />
                <asp:BoundField DataField="product_quantity" HeaderText="Product Quantity" SortExpression="product_quantity" />
                <asp:BoundField DataField="sub" HeaderText="Sub Total" SortExpression="sub" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdsrConnectionString %>" SelectCommand="SELECT [product_name], [product_price], [product_quantity],convert(money,[product_price])*convert(int,[product_quantity]) as sub FROM [cart] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="uname" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="auto-style5">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style6" style="text-align: left">
                    Total billed amount: <b style="color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">₹</b><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bdsrConnectionString %>" SelectCommand="SELECT [FirstName], [address] FROM [users] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="uname" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
