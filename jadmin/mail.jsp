<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="invoice-info.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
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
        <meta name="author" content="FSHDesign" />
        
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
                      <%@include file="outer-menu.jsp"%>
                </div>
            </div><!-- Navbar -->
            <%@include file="menu.jsp"%>
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="invoices.jsp">Invoices</a></li>
                       
                    </ol>
                </div>
                <%
				String ino="";
				if(request.getParameter("invoice_no")!=null)	{ ino=request.getParameter("invoice_no");	}
				
									
					String invoice_to="";
					String invoice_query="select * from  invoice_tab where ino='"+ino+"'";
					Statement st_invoice_view=con.createStatement();
					ResultSet rs_invoice_view=st_invoice_view.executeQuery(invoice_query);
					if(rs_invoice_view.next())
					{
					invoice_to=rs_invoice_view.getString("customer_name");
					record_invoice=ino;
				%>
                
                <div class="page-title">
                    <div class="container">
                        <h3>Invoice - <%=ino%></h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="invoice col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h1 class="m-b-md"><img src="<%=session.getAttribute("logo_path")%>"></h1>
                                            
                                 <address>
                                 <%=rs_invoice_view.getString("location")%>
							 </address>	
                                            
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <h1>INVOICE</h1>
                                            <a href="email-submit.jsp?invoice_no=<%=ino%>&status=sendemail"><button type="button" class="btn btn-default"><i class="fa fa-empire"></i> Email</button></a>
                                        </div>
                                        <div class="col-md-12">
                                            <hr>
                                           <div class="col-md-6"> 
                                        
                                                <strong>Invoice to</strong><br>
                                                <%=invoice_to%>,<br /><%=rs_invoice_view.getString("location1")%>
                                            </p>
                                            </div>
                                            
                                           <div class="col-md-2">
                                           <p>
                                           <strong>Issue Date</strong><br>
                                           <%=rs_invoice_view.getString("issue_date")%></p>
                                           </div>
                                           <div class="col-md-2">
                                           <p>
                                           <strong>Due Date</strong><br>
                                           <%=rs_invoice_view.getString("due_date")%></p>
                                           </div>
                                           <div class="col-md-2">
                                           <p>
                                           <strong>Ref / No</strong><br>
                                           <%=rs_invoice_view.getString("ref_no")%>
                                           </p>
                                           </div>
                                        </div>
                                        <div class="col-md-12">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Item</th>
                                                        <th>Description</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                  <%
						int j=0;
						 double value_amount=0.00,tot_value_amount=0.00;
			  			String query_invoice_temp="select * from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+ino+"' and status='A' order by modified_date desc";
						Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
				value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
						
%>
                                                    <tr>
                                                        <td><%=j%></td>
                                                        <td><%=rs_invoice_temp.getString("item_name")%></td>
                                                        <td><%=rs_invoice_temp.getString("add_qty")%></td>
                                                        <td><%=rs_invoice_view.getString("currency")%>&nbsp;<%=rs_invoice_temp.getString("add_rate")%></td>
                                                        <td><%=rs_invoice_view.getString("currency")%>&nbsp;<%=value_amount%></td>
                                                    </tr>
                                                    <%
							value_amount=0.0;				
						}
						st_invoice_temp.close();
						rs_invoice_temp.close();
						
						if(j==0)
						{
					
%>											<tr>
                                                <td colspan="5" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
											 
						<%
						}
						%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-8">
                                          
                                            <p> <%=body1%></p>
                                            <h3>Thank you !</h3>
                                        </div>
                                        <%@include file="payments.jsp"%>
                                        <div class="col-md-4">
                                            <div class="text-right">
                                                <h4 class="no-m m-t-sm">Total Amount</h4>
                                                <h2 class="no-m"><%=rs_invoice_view.getString("currency")%>&nbsp;<%=tot_calculate_1%></h2>
                                                <hr>
                                                <h4 class="no-m m-t-sm">Amount Received</h4>
                                                <h2 class="no-m"><%=rs_invoice_view.getString("currency")%>&nbsp;<%=tot_calculate_2%></h2>
                                                <hr>
                                                <h4 class="no-m m-t-md text-success">Balance Amount</h4>
                                                <h1 class="no-m text-success"><%=rs_invoice_view.getString("currency")%>&nbsp;<%=tot_calculate_3%></h1>
                                                <hr>
                                              <!--  <button class="btn btn-primary">Submit your invoice</button> -->
                                            </div>
                                        </div>
                                    </div><!--row-->
                                </div>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
                <%}
					rs_invoice_view.close();
					st_invoice_view.close();
				%>
                 <%@include file="footer.jsp"%>
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
        <%@include file="footer-nav.jsp"%>
	

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
	response.sendRedirect("sessionexpire.jsp");
}
%>