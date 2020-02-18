<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script type="text/javascript" src="bootstrap\jquery.js"></script>
    <script type="text/javascript" src="bootstrap\popper.min.js"></script>
    <link rel='stylesheet' type="text/css" href="bootstrap\css\bootstrap.min.css" />
    <script type="text/javascript" src="bootstrap\js\bootstrap.min.js"></script>
    <style>
        .split {
            height: 100%;
            width: 50%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
        }

        /* Control the left side */


        /* If you want the content centered horizontally and vertically */
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


        <div class="container-fluid">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">ADMIN</a>
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">

            <div class="col-4" style="background-color: whitesmoke;">
                <br />
                <div style="margin-left: 2%;">
                    FILTER BY<br />
                    <br />
                    ORGANISATION
            <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" style="margin-left:5%;">
                <asp:ListItem>--College--</asp:ListItem>
            </asp:DropDownList>
                    <br />
                    <br />
                    DEPARTMENT&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" style="margin-left:5%;">
                        <asp:ListItem>--Deparment--</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    YEAR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:DropDownList ID="DropDownList3" runat="server" style="margin-left:5%;">
                         <asp:ListItem>--Year--</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem></asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Apply" style="margin-left:10%;"/>
                    <br />
                    <br />
                    &nbsp;<br />
                    </div>
                </div> 
        </div>
        <asp:Table ID="Table1" runat="server" class="table table-responsive">
        </asp:Table>
    </form>
</body>
</html>
