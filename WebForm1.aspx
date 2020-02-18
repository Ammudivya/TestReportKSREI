<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script type="text/javascript" src="bootstrap\jquery.js"></script>
    <script type="text/javascript" src="bootstrap\popper.min.js"></script>
    <link rel='stylesheet' type="text/css" href="bootstrap\css\bootstrap.min.css" />
    <script type="text/javascript" src="bootstrap\js\bootstrap.min.js"></script>
    <style>
        table{
            padding:10%;
            margin-right: 404px;
        }
    </style>
</head>
<body>
    <script>
        function nav() {
            window.location.href = "WebForm2.aspx";
        }
    </script>
        <form id="form1" runat="server">
    
        <div>
           <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ADMIN Test Report</a></div>
      <div style="margin-left:70%;">
         

    <ul class="nav navbar-nav">
      
        
          <li></li>
          
        </ul>           
         
            </div>
  
      
      <%--<li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Filter by
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Company</a></li>
          <li><a href="#">College</a></li>
          <li><a href="#">Department</a></li>
          <li><a href="#">Year</a></li>
        </ul>
      </li>
      
    </ul>--%>
         </div>

</nav>

        </div>
           <button  style=" margin-left:65%;" type="button" onclick="nav()" class="btn btn-default">
          <span class="glyphicon glyphicon-sort"></span>Filter
        </button>
            <br />
            <br />

       <div style="padding:1%;">
           <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="152px" Width="1374px">
               <Columns>
                   <asp:BoundField DataField="test_name" HeaderText="TEST NAME" SortExpression="test_name" />
                   <asp:BoundField DataField="test_type" HeaderText="TEST TYPE" SortExpression="test_type" />
                   <asp:BoundField DataField="test_category" HeaderText="TEST CATEGORY" SortExpression="test_category" />
                   <asp:BoundField DataField="test_start_duration" HeaderText="DATE OF TEST" SortExpression="test_start_duration" />
                   <asp:BoundField DataField="conducted_to_college" HeaderText="COLLEGE" SortExpression="conducted_to_college" />
                   <asp:BoundField DataField="conducted_to_department" HeaderText="DEPARTMENT" SortExpression="conducted_to_department" />
                   <asp:BoundField DataField="conducted_to_year" HeaderText="YEAR" SortExpression="conducted_to_year" />
                   <asp:BoundField DataField="conducted_by" HeaderText="INCHARGE" SortExpression="conducted_by" />
                   <asp:BoundField DataField="test_score" HeaderText="SCORE (%)" SortExpression="test_score" />
               </Columns>
               <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
               <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
               <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F7F7F7" />
               <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
               <SortedDescendingCellStyle BackColor="#E5E5E5" />
               <SortedDescendingHeaderStyle BackColor="#242121" />
           </asp:GridView>
     
          </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KSREITestPortalConnectionString6 %>" SelectCommand="SELECT [test_type], [test_start_duration], [conducted_by], [conducted_to_college], [conducted_to_department], [conducted_to_year], [test_score], [test_name], [test_category] FROM [TestDetails]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

        </form>
       
    
</body>
</html>
            
            