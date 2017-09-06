<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="client-info.jsp"%>
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
                        <li><a href="#">Clients</a></li>
                        <li class="active">Manage Customers</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                     
                                            <h3>Manage Customers</h3>
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
                                        Customers Email Id already Exists !!<br>
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
                                        <ul class="nav nav-tabs">
                                            <li role="presentation" class="active">&nbsp;</li>
                                                                            
                                        </ul>
                          
                                    
                                      <!--  <div class="progress progress-sm m-t-sm">
                                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>-->
                                       
                                            <div class="tab-content">
                                                <div class="tab-pane active fade in" id="tab1">
                                                <script src="client.js"></script>
                                                 <form id="wizardForm" name="wizardForm" method="post" action="clients-submit.jsp" onSubmit="return checkclient()">
                                                 <%
												 if(status.equals("edit"))
												 {
												 %>
                                                 <input type="hidden" name="status" value="edit">
                                                 <input type="hidden" name="id" value="<%=id%>">
                                                 
                                                 
                                                 <%}else{%>
                                                 <input type="hidden" name="status" value="insert">
                                                  <%}%>
                                        <div align="right"><br>
                                        <%
										String page_show="";
                                        if(request.getParameter("page")!=null)	
                                        { 
                                        	page_show=request.getParameter("page");
											if(request.getParameter("page").equals("invoice"))	
											{
												%>
												<a href="invoices.jsp"><button type="button" class="btn btn-secondary">Go Back to Invoice</button></a><%
											}
											else if(request.getParameter("page").equals("quote"))	
											{
												%>
												<a href="quotes.jsp"><button type="button" class="btn btn-secondary">Go Back to Quote</button></a><%
											}
                                        
										}
                                         
                                         %>&nbsp;&nbsp;<button type="submit" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                        <a href="#tab3" data-toggle="tab"><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Search Customers</button></a>
                                        
                                        </div>
                                        
                                                    <input type="hidden" name="page" value="<%=page_show%>">
                                                 
                                                    <div class="row m-b-lg">
                                                        <div class="col-md-6">
                                                         <h3>Customers Information</h3> 
                                                            <div class="row">
                                                                <div class="form-group col-md-12">
                                                                    <label for="exampleInputName">Customer Name</label>
    									  <input type="text" class="form-control" required name="client_name" value="<%=clientName%>" maxlength="249" placeholder="Customer Name" >
                                                                </div>
                                                                 
                                                              
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Address 1</label>
                                                                    <input type="text" class="form-control" name="address_1" value="<%=address1%>"  maxlength="249" placeholder="Address 1" >
                                                                </div>
                                                                 <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Address 2</label>
                                                                    <input type="text" class="form-control" name="address_2" value="<%=address2%>" maxlength="249" placeholder="Address 2" >
                                                                </div>
                                                                 <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">City</label>
                                                                      <input type="text" class="form-control" name="city" value="<%=city%>" maxlength="249"  placeholder="City" >
                                                                </div>
                                                                 <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">State</label>
                                                                      <input type="text" class="form-control" name="state" value="<%=state%>" maxlength="249"  placeholder="State" >
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputEmail">Country</label>
                                                                      <input type="text" class="form-control" name="country" value="<%=country%>" maxlength="249"  placeholder="Country" >
                                                                </div>
                                                                
                                                                 <div class="form-group col-md-6">
                                                                    <label for="exampleInputPassword2">Postal Code</label>
                                                                   <input type="text" class="form-control" name="postalcode" value="<%=postalcode%>" maxlength="19"  placeholder="Postal Code" >
                                                                </div>
                                                                
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputPassword2">Phone</label>
                                                                   <input type="text" class="form-control" required name="phone"  value="<%=phone%>" maxlength="99"  placeholder="Phone" >
                                                                </div>
                                                                
                                                                 <div class="form-group col-md-6">
                                                                    <label for="exampleInputPassword2">Mobile</label>
                                                                   <input type="text" class="form-control" name="mobile"  value="<%=mobile%>" maxlength="99"  placeholder="Mobile" >
                                                                </div>
                                                                
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputPassword2">Fax</label>
                                                                   <input type="text" class="form-control" name="fax"  value="<%=fax%>" maxlength="99"  placeholder="Fax" >
                                                                </div>
                                                                
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleInputPassword2">Website</label>
                                                                   <input type="text" class="form-control" name="website" value="<%=website%>" maxlength="99" placeholder="Website" >
                                                                </div>
                                                                 <div class="form-group col-md-12">
                                                                    <label for="exampleInputPassword2">Email</label>
                                                                   <input type="email" class="form-control" required name="email"  value="<%=email%>" maxlength="99"  placeholder="Email" >
                                                                </div>
                                                                
                                                                
                                                            </div>
                                                            
                                                           
                                                        </div>
                                                      	<div class="col-md-6">
                                                            <div class="row">       
                                                             <h3>Contact Person Information</h3>                                        
                                                             <div class="form-group col-md-6">
                                                                    <label for="exampleInputName">First Name</label>
    									  <input type="text" class="form-control" name="fname" placeholder="Contact Person First Name" required value="<%=fname%>" maxlength="249"  >
                                                                </div>
                                                                 
                                                                <div class="form-group  col-md-6">
                                                                    <label for="exampleInputName2">Last Name</label>
 																<input type="text" class="form-control" name="lname"  placeholder="Contact Person Last Name"  value="<%=lname%>" maxlength="249" >
                                                                 </div>
                                                  </div>  
                                                        
                                                     <div class="row">       
                                                                                                     
                                                             <div class="form-group col-md-6">
                                                                    <label for="exampleInputName">Email</label>
    									  <input type="email" class="form-control" name="contactemail" required placeholder="Contact Person Email"  value="<%=contactEmail%>" maxlength="99" >
                                                                </div>
                                                                 
                                                                <div class="form-group  col-md-6">
                                                                    <label for="exampleInputName2">Phone</label>
 																<input type="text" class="form-control" name="contactphone" placeholder="Contact Person Phone"   value="<%=contactPhone%>" maxlength="99" >
                                                                 </div>
                                                  </div>  
                                                            </div>
                                                    </div>
                                                </form>   
                                                </div>
                                                                                 
                                              
                                                  <div class="tab-pane fade in" id="tab3">
                                                    <div class="row m-b-lg"> 
                                                    
                                                   
                                                     <div align="right"><br>
                                        <%
										
                                        if(request.getParameter("page")!=null)	{ page_show=request.getParameter("page");
										if(request.getParameter("page").equals("invoice"))	{%><a href="invoices.jsp"><button type="button" class="btn btn-secondary">Go Back to Invoice</button></a><%}
										else if(request.getParameter("page").equals("quote"))	
										{
											%>
											<a href="quotes.jsp"><button type="button" class="btn btn-secondary">Go Back to Quote</button></a><%
										}
                                    
                                        }
                                        
                                        %>
                                        <a href="#tab1" data-toggle="tab"><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Add Customer</button></a>
                                        
                                        </div>
                                                        <div class="col-md-12">
                                                        <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>                                            
                                                <th>Email</th>
                                                                                     
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <%
						int i=0;
			  			int flag_count=0;
						String query="select * from client_tab where userId='"+session.getAttribute("admin_id")+"' and clientCategory='1' order by modifiedDateTime desc";
						System.out.println(query);
						Statement st_client=con.createStatement();
						ResultSet rs_client=st_client.executeQuery(query);
						while(rs_client.next())
						{
						i=i+1;
							
				
%>
                                        
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=rs_client.getString("clientName")%></td>                                                
                                                <td>
												<%=rs_client.getString("email")%></td>
                                             
                                               
                                                <td><a href="clients.jsp?status=edit&id=<%=rs_client.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="clients-submit.jsp?status=delete&id=<%=rs_client.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            <%
						
						}
						st_client.close();
						rs_client.close();
						
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