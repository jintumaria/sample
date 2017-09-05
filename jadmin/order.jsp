<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
	
	String status="",link_id="",id="";
	if(request.getParameter("status")!=null)	{	status=request.getParameter("status"); 	 }
    if(request.getParameter("id")!=null)	{	id=request.getParameter("id"); }
  
%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->       
        <title><%=title_admin%></title>
        <link rel="SHORTCUT ICON" href="assets/images/admin.png"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta charset="UTF-8">
        <meta name="description" content="Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        <!-- Styles -->
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href="assets/plugins/pace-master/themes/blue/pace-theme-flash.css" rel="stylesheet"/>
        <link href="assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet"/>
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/line-icons/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/waves/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/3d-bold-navigation/css/style.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>
        
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">        
        <main class="page-content content-wrap">
            <div class="navbar">
                <div class="navbar-inner container">
                    <div class="sidebar-pusher">
                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic push-sidebar">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>
                   <div class="logo-box">
                        <a href="../index.jsp" class="logo-text"><span><%=title_main%></span></a>
                    </div><!-- Logo Box -->
                    <div class="search-button">
                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic show-search"><i class="fa fa-search"></i></a>
                    </div>
                    <%@include file="admin-outer-menu.jsp"%>                   
                </div>
            </div><!-- Navbar -->
             <%@include file="admin-menu.jsp"%>
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="#">Orders</a></li>
                        <li class="active">View Order</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Invoice</h3>
                    </div>
                </div>
                 <%
		   if(request.getParameter("id")!=null)
			{
			
			String query_invoice="select * from invoice_details where id='"+request.getParameter("id")+"'";
			Statement st_invoice=con.createStatement();
			ResultSet rs_invoice=st_invoice.executeQuery(query_invoice);
			if(rs_invoice.next())
			{
			%>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="invoice col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h1 class="m-b-md"><img src="img/logo-big.png"></h1>
                                           
                                        </div>
                                        <div class="col-md-8 text-right">
                                            <h1>OR/AB <%=rs_invoice.getString("ino")%></h1>
                                            <button type="button" class="btn btn-default"><i class="fa fa-print"></i> Print</button>
                                        </div>
                                        <div class="col-md-12">
                                            <hr>
                                            <p>
                                                <strong>Order to</strong><br>
                                                <%=rs_invoice.getString("fname")%>&nbsp;
												<%if(rs_invoice.getString("lname")!=null){%>
												<%=rs_invoice.getString("lname")%><%}%><br>
                                                <%=rs_invoice.getString("address_01")%><br>
                                                <%=rs_invoice.getString("city")%> , <%=rs_invoice.getString("state")%> , <%=rs_invoice.getString("country")%> - <%=rs_invoice.getString("pin")%>
                                            </p>
                                        </div>
                                        <div class="col-md-12">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Product</th>
                                                        <th>Title</th>
                                                        <!--
                                                        <th>Color/Size</th>-->
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                
                                                 <%
  		int count_i=1;
		double value_amount=0.00,tot_value_amount=0.00;
		String query1="",product_name="",product_rate="",product_image="";
		String query_cart="select * from add_cart where session_id='"+rs_invoice.getString("ino")+"' ";
		Statement st_cart=con.createStatement();
		ResultSet rs_cart=st_cart.executeQuery(query_cart);
		while(rs_cart.next())
		{
		
		 
			
								query1="select * from product_tab where product_id='"+rs_cart.getString("product_id")+"'";
								Statement st_product1=con.createStatement();
								ResultSet rs_product1=st_product1.executeQuery(query1);
								if(rs_product1.next())
								{
								product_name=rs_product1.getString("heading");	
								product_rate=rs_product1.getString("readmore1");		
								
								
								if(rs_product1.getString("photo_status_1").equals("YES"))
								{
									product_image=rs_product1.getString("file_1");
								}else{
									
									product_image="images/no-image.jpg";
								}

								}
								rs_product1.close();
								st_product1.close();
								value_amount=value_amount+(Double.parseDouble(rs_cart.getString("add_qty"))*(Double.parseDouble(product_rate)));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_cart.getString("add_qty"))*(Double.parseDouble(product_rate)));
		%>
                            <tr>
                            	<td><%=count_i%></td>
                                <td class="table-shopping-cart-img">
                                    <a href="#">
                                        <img src="<%=product_image%>" width="100" height="100" alt="<%=product_name%>" title="<%=product_name%>" />
                                    </a>
                                </td>
                                <td><a href="#"><%=product_name%></a>
                                </td>
                              <!--  <td>Green</td> -->
                                <td><%=d_currency%> <%=product_rate%></td>
                                <td align="center"><%=rs_cart.getString("add_qty")%></td>
                                <td><%=d_currency%> &nbsp;<%=String.format("%.2f", value_amount)%></td>
                                
                            </tr>
                             <%
		 value_amount=0;
		 count_i=count_i+1;
}
rs_cart.close();
st_cart.close();
%>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-8">
                                            <h3>Thank you !</h3>
                                            <p>&nbsp;</p>
                                            <!--<img src="assets/images/signature.png" height="150" class="m-t-lg" alt="">-->
                                        </div>
                                         <div class="col-md-8">
                                            <hr>
                                            <p>
                                                <strong>Shipping Address</strong><br>
                                                <%=rs_invoice.getString("fname1")%>&nbsp;
												<%if(rs_invoice.getString("lname1")!=null){%>
												<%=rs_invoice.getString("lname1")%><%}%><br>
                                                <%=rs_invoice.getString("address_02")%><br>
                                                <%=rs_invoice.getString("city1")%> , <%=rs_invoice.getString("state1")%> - <%=rs_invoice.getString("country1")%> - <%=rs_invoice.getString("pin1")%>
                                            </p>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="text-right">
                                                <h4 class="no-m m-t-sm">Subtotal</h4>
                                                <h2 class="no-m"><%=d_currency%> <%=String.format("%.2f", tot_value_amount)%></h2>
                                                <hr>
                                                <h4 class="no-m m-t-sm">Shipping</h4>
                                                <h2 class="no-m"><%=d_currency%> 0</h2>
                                                <hr>
                                                <h4 class="no-m m-t-md text-success">Total</h4>
                                                <h1 class="no-m text-success"><%=d_currency%> <%=String.format("%.2f", tot_value_amount)%></h1>
                                                <hr>
                                               <!--<button class="btn btn-primary">Submit your invoice</button>-->
                                            </div>
                                        </div>
                                    </div><!--row-->
                                </div>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
                  <%
		}
		rs_invoice.close();
		st_invoice.close();
		}%>
                <%@include file="admin-footer.jsp"%>
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
        <%@include file="admin-footer-nav.jsp"%>
	

        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.1.3.min.js"></script>
        <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="assets/plugins/pace-master/pace.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/switchery/switchery.min.js"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
        <script src="assets/plugins/classie/classie.js"></script>
        <script src="assets/plugins/waves/waves.min.js"></script>
        <script src="assets/plugins/3d-bold-navigation/js/main.js"></script>
        <script src="assets/js/modern.min.js"></script>
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("admin-sessionexpire.jsp");
}
%>