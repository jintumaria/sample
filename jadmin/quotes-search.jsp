<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title><%=titleName%></title>
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
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <!-- Theme Styles -->
        
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        
        
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	

        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        
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
                        <a href="home.jsp" class="logo-text"><span><%=titleName%></span></a>
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
                        <li><a href="#">Quotes</a></li>
                        <li class="active">Search Quotes</li>
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
                        
                     </div>
                     <div class="panel-body">
                      <div id="rootwizard">
                       <div class="row m-b-lg">
                      
              <div class="col-md-12">
               <div class="panel panel-white">
                   <div class="panel-heading clearfix">
                       <h4 class="panel-title">Quotes</h4>
                   </div>
                   <div class="panel-body">
                     <div align="right">
                     <a href="quotes.jsp" ><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Add Quotes</button></a>
                     </div>
                   		<br><br>
                   		
                   		<br>
                   		 <div class="table-responsive">
                       <table  id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Quote No</th>
                                                <th>Name</th>
                                                <th>Total Amount</th>
                                                <th>Amount Owing</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Quote No</th>
                                                <th>Name</th>
                                                <th>Total Amount</th>
                                                <th>Amount Owing</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                        <tbody>
                                        <%
						int i=0;
						String query="select ino,clientName,id,quoteStatus from quote_tab where userId='"+session.getAttribute("admin_id")+"' order by modifiedDateTime desc";
						Statement st_invoice=con.createStatement();
						ResultSet rs_invoice=st_invoice.executeQuery(query);
						while(rs_invoice.next())
						{
						i=i+1;
							recordInvoice=rs_invoice.getString("ino");
				
%>
            <%@include file="payments.jsp"%>                            
                                            <tr>
                                                <td><%=i%></td>
                                                <td><a href="quote.jsp?quoteNo=<%=rs_invoice.getString("ino")%>"><%=rs_invoice.getString("ino")%></a></td>
                                                <td><%=rs_invoice.getString("clientName")%></td>
                                                 <td><%=tot_calculate_1%></td>
                                                <td><%=tot_calculate_3%></td>
                                                
                                                <td>
                                                <%
												
												if(rs_invoice.getString("quoteStatus").equals("ENABLED"))
												{
												%> 
											 <a href="invoices.jsp?quoteNo=<%=rs_invoice.getString("ino")%>" title="Convert to Invoice"><i class="fa fa-refresh"></i></a>&nbsp;&nbsp;                     
                                                             
                                            <a href="quotes.jsp?status=edit&id=<%=rs_invoice.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
                                            <a href="quote-submit.jsp?status=delete&id=<%=rs_invoice.getString("ino")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a>
                                            <%}%>
                                            </td>
                                            </tr>
                                            <%
						
						}
						st_invoice.close();
						rs_invoice.close();
						
						if(i==0)
						{
					
%>											
											 <tr>
                                                <td colspan="6" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
						<%
						}
						%>
                                        </tbody>
            	 	</table>
                 
                     </div></div></div>   
                 </div>
                     	
                      </div></div></div>
                 </div>
             </div>
                 
                    </div><!-- Row -->
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

         <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

         <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
         <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
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