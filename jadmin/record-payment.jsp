<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="invoice-settings-info.jsp"%>
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
         <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        
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
  		 <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
   <script type="text/javascript" src="ckfinder/ckfinder.js"></script>	
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
                        <li><a href="invoices.jsp">Invoices</a></li>
                        <li class="active">Record Payment</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                       Record Payment
                    </div>
                </div>
                
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                           
                                <div class="panel-body">
                                
                                 <%
                            	if(request.getParameter("msg")!=null)	{
				if(request.getParameter("msg").equals("0"))	{%>		
                
                 <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        Customer Email Id already Exists !!<br>
                                    </div>
                	<%}
				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
					if(request.getParameter("msg").equals("2"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
									if(request.getParameter("msg").equals("3"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Deleted Successfully !!
                                    </div>	<br><%}
													}			
							%>
                                
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-truck m-r-xs"></i>Record Payment</a></li>                                           
                                        </ul>
                          
                                   
                                       <%
									  
									   if(request.getParameter("id")!=null)
									   {
									   		recordId=request.getParameter("id");
									   %>
                                       <%@include file="payments.jsp"%>
                                            <div class="tab-content">
                                                <div class="tab-pane fade in" id="tab2">
                                                    <div class="row m-b-lg"> 
                                                     <script>
													function isNumberKey(evt)
														{
															var charCode = (evt.which) ? evt.which : event.keyCode;
															if (charCode != 46 && charCode > 31 
															&& (charCode < 48 || charCode > 57))
																return false;
														
															return true;
														}
													</script>
                                                    <h3><%=request.getParameter("id")%> (Amount Owing : <%=tot_calculate_3%>)</h3>    
                                                    <script src="record-payment.js"></script>
                                                     <div class="col-md-12">
                                                      <form id="wizardForm1" name="wizardForm1" method="post" action="record-payment-submit.jsp" onSubmit="return checkpayment()">
                                                      <input type="hidden" name="status" value="insert">
                                                       <input type="hidden" name="invoice_no" value="<%=request.getParameter("id")%>">
                                                      
                                                     	<div class="row">
                                                        	  <div class="form-group  col-md-4">
                                                              <label for="exampleInputEmail">Payment Date</label>
                                                                    <input type="text" class="form-control date-picker" name="payment_date" placeholder="Payment Date" maxlength="99" >
                        
                                                        	  </div>
                                                              <div class="form-group  col-md-4">
                                                              <label for="exampleInputEmail">Amount Paid</label>
                                                                    <input type="text" class="form-control" name="add_rate"  onKeyPress="return isNumberKey(event);" value=""  maxlength="9" placeholder="Amount Paid" >
                                                        	  </div>
                                                             
                                                              <div class="form-group  col-md-4">
                                                               <label for="exampleInputEmail">&nbsp;</label><br>
                                                              <button type="submit" class="btn btn-primary">Save</button>
                                                        	  </div>
                                                        </div>
                                                     </form>
                                                     </div>
                                                        <div class="col-md-12">
                                                        <div class="table-responsive">
                                    <table id="example" class="table table-bordered table-striped" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%
						int j=0;
						 double value_amount=0.00,tot_value_amount=0.00;
			  			String query_invoice_temp="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+request.getParameter("id")+"' and status='B' order by modifiedDateTime desc";
						Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
				value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
						
%>
                                        
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=rs_invoice_temp.getString("itemName")%></td>
                                                <td><%=rs_invoice_temp.getString("addRate")%></td>
                                               
                                                <td><a href="record-payment-submit.jsp?status=delete&id=<%=rs_invoice_temp.getString("sessionId")%>&idq=<%=rs_invoice_temp.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                           
                                            <%
							value_amount=0.0;				
						}
						st_invoice_temp.close();
						rs_invoice_temp.close();
						
						if(j==0)
						{
					
%>											<tr>
                                                <td colspan="6" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
											 
						<%
						}
						%>
                        				<tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>                                                  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                     
                                            <tr>
                                                <td>&nbsp;</td>  
                                                <th>Amount Paid </th>  
                                                <td><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=tot_value_amount%></td>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                           
                                           
                                        </tbody>
                                       </table>  
                                    </div>
                                                        </div>
                                                     </div>
                                                     
                                                   </div>
                                                        
                                                        
                                                                                                     
                                                     
                                                </div>            
                                                
                                               <%}%>
                                                
                                                
                                                 </div>
                                            
                                        
                                    </div>
                                </div>
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
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/js/pages/form-select2.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>