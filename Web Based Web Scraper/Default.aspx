<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Based_Web_Scraper.Default" %>

<%@ Register Src="~/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Sidebar.ascx" TagPrefix="uc1" TagName="Sidebar" %>
<%@ Register Src="~/Navbar.ascx" TagPrefix="uc1" TagName="Navbar" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png"/>
  <link rel="icon" type="image/png" href="../assets/img/favicon.png"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Web Based Web Scraper
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
  <!-- CSS Files -->
  <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />

    <style>
       
       

  

    </style>


   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

     



         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        

        <div class="wrapper ">
    <div class="sidebar" data-color="danger" data-background-color="black" data-image="">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
        <a href="http://myportfoliosite.net" class="simple-text logo-normal">
          David Head
        </a>
      </div>
      <div class="sidebar-wrapper">
        

<ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="Default.aspx">
              <i class="material-icons">dashboard</i>
              <p>Image Scraper</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="Bookmarks.aspx" >
              <i class="material-icons">person</i>
              <p>Bookmarks</p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="./icons.html">
              <i class="material-icons">bubble_chart</i>
              <p>Ebay Completed Item Search</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./map.html">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./notifications.html">
              <i class="material-icons">notifications</i>
              <p>Notifications</p>
            </a>
          </li>
          <!-- <li class="nav-item active-pro ">
                <a class="nav-link" href="./upgrade.html">
                    <i class="material-icons">unarchive</i>
                    <p>Upgrade to PRO</p>
                </a>
            </li> -->
        </ul>







      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">Main Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <div class="navbar-form">
              <div class="input-group no-border">
              


              </div>
            </div>
            


<uc1:Navbar runat="server" id="Navbar" />



          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">


       

           





          <div class="container">
               <asp:TextBox ID="txtUrl" runat="server" Width="75%" CssClass="form-control" placeholder="Enter or paste URL To Scrape"></asp:TextBox>
              
               <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                

                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Dual Ring-1s-200px.gif" Width="75" />


            </ProgressTemplate>
        </asp:UpdateProgress>


<asp:LinkButton ID="btnScrape" runat="server" CssClass="btn btn-primary btn-xs" OnClick="btnScrape_Click" Width="200">Scrape for Images</asp:LinkButton>

             



              <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-info btn-xs" OnClick="btnClear_Click" Width="200">Clear</asp:LinkButton>



              



          </div>




<asp:Image ID="Image3" runat="server" />
         
         






        <div class="container-fluid">
          <div class="row">










          
         
         
            <div class="col-lg-12 col-md-12">
              <div class="card">
                <div class="card-header card-header-success">
                  <h4 class="card-title">Results</h4>
                  <h4 class="card-category">

                      <h4>
                           <asp:Literal ID="litTotalResults" runat="server"></asp:Literal>
                      </h4>
             

                  </h4>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning">
                     
                     
                    </thead>
                    <tbody>



                        
                        <asp:Button ID="btnGetSelected" runat="server" Text="Get selected records" OnClick="GetSelectedRecords" />
        

        <asp:GridView ID="GridViewImages" runat="server" CssClass="table" GridLines="None" AutoGenerateColumns="false" >

            <Columns>
                


                <asp:TemplateField>

                    <HeaderTemplate>

<asp:CheckBox runat="server" ID="HeaderCheckBox" ToolTip="Select All" />

</HeaderTemplate>

<ItemTemplate>

<asp:CheckBox runat="server" ID="chkRow" ToolTip="Select this file " />

</ItemTemplate>



                </asp:TemplateField>



                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                 <asp:BoundField DataField="srcString" HeaderText="Source" SortExpression="srcString" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                 <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />

                 


                <asp:TemplateField>

                    <ItemTemplate>

                        <asp:HyperLink ID="HyperLink1" ImageWidth="100" Target="_blank" runat="server" NavigateUrl='<%# Bind("srcString") %>'>


                            <asp:Image ID="Image1" Height="75" CssClass="img img-thumbnail" runat="server" ImageUrl='<%# Bind("srcString") %>' />


                        </asp:HyperLink>



                       
                    </ItemTemplate>

                </asp:TemplateField>

              


            </Columns>





        </asp:GridView>
           

    </ContentTemplate>


              

</asp:UpdatePanel>

 

        
 
                     
                <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bookmark Saver</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <asp:TextBox ID="txtCurrentURL" runat="server"></asp:TextBox>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
      
       

       





    </form>






     <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
     // md.initDashboardPageCharts();

       


    });
  </script>

   
</body>
</html>
