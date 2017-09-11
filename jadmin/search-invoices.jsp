<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
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
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        
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
                        <a href="home.jsp" class="logo-text"><span><%=title_main%></span></a>
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
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="#">Orders</a></li>
                        <li class="active">Search Orders</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Search Invoices</h4>
                                </div>
                                <div class="panel-body">
                                
                                <%
                            	if(request.getParameter("msg")!=null)	{
				
				if(request.getParameter("msg").equals("delete"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Deleted Successfully !!
                                    </div>	<br><%}
									
													}			
			
							%>
                                
                                   <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Invoice</th>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Mode</th>
                                                <th>Amount</th>
                                              
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Invoice</th>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Mode</th>
                                                <th>Amount</th>
                                              
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <%
										String status_check="",query="";
										if(request.getParameter("status")!=null)	{status_check=request.getParameter("status");	}
										
						int i=0;
			  			int flag_count=0;
						if(status_check.equals("1"))
						{
							query="select * from invoice_details where payment_status='YES'  order by modified_date desc";
						}
						if(status_check.equals("2"))
						{
							query="select * from invoice_details where payment_status='NO'  order by modified_date desc";
						}
						
						Statement st_invoice=con.createStatement();
						ResultSet rs_invoice=st_invoice.executeQuery(query);
						while(rs_invoice.next())
						{
						i=i+1;
							
				
%>
                                        
                                            <tr>
                                                <td><%=i%></td>
                                                <td>INV/TBR<%=rs_invoice.getString("ino")%></td>
                                                <td><%=rs_invoice.getString("fname")%>&nbsp;
												<%if(rs_invoice.getString("lname")!=null){%>
												<%=rs_invoice.getString("lname")%><%}%>
                                                </td>
                                                <td><%=rs_invoice.getString("created_date")%></td>
                                                <td><%if(rs_invoice.getString("payment_method").equals("COD"))
													 {
														 out.println("Cash on Delivery");
													 }if(rs_invoice.getString("payment_method").equals("PAY"))
													 {
														 out.println("Paypal");
													 }%></td>
                                                <td><%=rs_invoice.getString("currency")%>&nbsp;<%=String.format("%.2f", Double.parseDouble(rs_invoice.getString("amount")))%> </td>                                               
                                                <td><a href="invoice.jsp?id=<%=rs_invoice.getString("id")%>" title="View"><i class="fa fa-binoculars"></i></a>&nbsp;&nbsp;<a href="delete-submit.jsp?link_id=<%=status_check%>&id=<%=rs_invoice.getString("id")%>&status=deletei" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            <%
						
						}
						st_invoice.close();
						rs_invoice.close();
					
%>

                                        </tbody>
                                       </table>  
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
                </div><!-- Main Wrapper -->
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
        <script src="assets/plugins/jquery-mockjax-master/jquery.mockjax.js"></script>
        <script src="assets/plugins/moment/moment.js"></script>
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="assets/plugins/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>