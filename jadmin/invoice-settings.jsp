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
                        <li><a href="#">Settings</a></li>
                        <li class="active">Settings</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                       Settings
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
                                            <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user m-r-xs"></i>Invoice Settings
                                            </a></li>
                                            <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-truck m-r-xs"></i>Tax Settings</a></li>                                           
                                        </ul>
                          
                                    
                                      <!--  <div class="progress progress-sm m-t-sm">
                                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>-->
                                       
                                            <div class="tab-content">
                                                <div class="tab-pane active fade in" id="tab1">
                                                 <form id="wizardForm" name="wizardForm" method="post" action="invoice-settings-submit.jsp">
                                                
                                        <div align="right"><br><button type="submit" class="btn btn-primary">Save</button></div>
                                                    <div class="row m-b-lg">
                                                        <div class="col-md-6">
                                                       
                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputName">Prefix for Invoice</label>
    									  <input type="text" class="form-control" name="invoice_prefix" value="<%=invoicePrefix%>" maxlength="4" placeholder="Invoice Prefix" >
                                                                </div>
                                                                 
                                                              
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Start Invoice No</label>
                                                                    <input type="text" class="form-control" name="start_invoice_no" value="<%=startInvoiceNo%>"  maxlength="19" placeholder="Start Invoice No" >
                                                                </div>
                                                                 
                                                                
                                                             </div>
                                                            
                                                           
                                                        </div>
                                                      	<div class="col-md-6">
                                                            <div class="row">       
                                                              <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Suffix for Invoice</label>
                                                                    <input type="text" class="form-control" name="invoice_suffix" value="<%=invoiceSuffix%>" maxlength="4" placeholder="Invoice Suffix" >
                                                                </div>                                       
                                                             
                                                  </div>  
                                                       
                                                        
                                               
                                                            </div>
                                                            <div class="col-md-12">
                                                            <div class="row">       
                                                              <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Paypal Email ID</label>
                                                                    <input type="text" class="form-control" name="paypal_email" value="<%=paypalEmail%>" maxlength="99" placeholder="Paypal Email ID" >
                                                                </div>                                       
                                                             
                                                  </div>  
                                                       
                                                        
                                               
                                                            </div>
                                                             <div class="col-md-12">
                                                        <div class="row">
                                                        <div class="form-group col-md-6">
                                                                    <label for="exampleInputName">Default message for Invoices</label>
    									  <textarea class="form-control" name="body1" rows="10"><%=body1%></textarea>
                                                                </div>
                                                                 
                                                             <!--   <div class="form-group  col-md-6">
                                                                    <label for="exampleInputName2">Default message for Quotes</label>
 																<textarea class="form-control" name="body2" rows="10"><%=body2%></textarea>
                                                              
                                                                 </div> -->
                                                        </div>
                                                        </div>
                                                    </div>
                                                </form>   
                                                </div>
                                                                                 
                                              
                                                  <div class="tab-pane fade in" id="tab2">
                                                    <div class="row m-b-lg"> 
                                                    
                                                    <h3>Tax Information</h3>    
                                                     <div class="col-md-12">
                                                      <form id="wizardForm1" name="wizardForm1" method="post" action="tax-settings-submit.jsp">
                                                      <input type="hidden" name="status" value="insert">
                                                     	<div class="row">
                                                        	  <div class="form-group  col-md-4">
                                                              <label for="exampleInputEmail">Tax Name</label>
                                                                    <input type="text" class="form-control" name="tax_name" value=""  maxlength="19" placeholder="Tax Name" >
                                                        	  </div>
                                                              <div class="form-group  col-md-4">
                                                              <label for="exampleInputEmail">Tax Percentage</label>
                                                                    <input type="text" class="form-control" name="tax_percent" value=""  maxlength="19" placeholder="Tax Percentage" >
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
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Tax</th>
                                                <th>Status</th>     
                                                <th>&nbsp;</th>                                          
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Tax</th>
                                                <th>Status</th> 
                                                <th>&nbsp;</th> 
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <%
						int i=0;
			  			int flag_count=0;
						String query="select * from tax_tab where userId='"+session.getAttribute("admin_id")+"' order by modifiedDateTime desc";
						Statement st_tax=con.createStatement();
						ResultSet rs_tax=st_tax.executeQuery(query);
						while(rs_tax.next())
						{
						i=i+1;
							
				
%>
						<form id="wizardForm2" name="wizardForm2" method="post" action="tax-settings-submit.jsp">
                                                      <input type="hidden" name="status" value="edit">
                                                     <input type="hidden" name="id" value="<%=rs_tax.getString("id")%>">
                                                     
                                        
                                            <tr>
                                                <td><%=i%></td>
                                                <td> <input type="text" class="form-control" style="width:200px;" name="tax_name" value="<%=rs_tax.getString("taxName")%>"  maxlength="19" placeholder="Tax Name" ></td>
                                                <td><input type="text" class="form-control" style="width:200px;" name="tax_percent" value="<%=rs_tax.getString("taxPercent")%>"  maxlength="19" placeholder="Tax Name" ></td>
                                                <td><%												
												if(rs_tax.getString("status").equals("YES"))			{ %>   YES <%        }
												if(rs_tax.getString("status").equals("NO"))				{ %>    NO <%        }
                                                  %>
                                                <select name="tax_status" class="form-control">
                                                
                                                <option value="<%=rs_tax.getString("status")%>" selected>--- Select ---</option>
                                                <option value="YES">YES</option>
                                                <option value="NO">NO</option>
                                                </select>
                                                
                                                </td>
                                               
                                                <td><button type="submit" class="btn btn-secondary">Edit</button>&nbsp;&nbsp;<a href="tax-settings-submit.jsp?status=delete&id=<%=rs_tax.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            </form>
                                            <%
						
						}
						st_tax.close();
						rs_tax.close();
						
						if(i==0)
						{
					
%>											
											 <tr>
                                                <td colspan="5" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
						<%
						}
						%>
                                        </tbody>
                                       </table>  
                                    </div>
                                                        </div>
                                                     </div>
                                                     
                                                   </div>
                                                        
                                                        
                                                                                                     
                                                     
                                                </div>            
                                                
                                               
                                                
                                                
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