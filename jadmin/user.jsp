<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="employees-data.jsp"%>
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
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        
        <link href="assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>        
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
         <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
     
        
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
                        <li><a href="#">User</a></li>
                        
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Add User</h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
					
					 <%@include file="alerts.jsp"%>
                    <div class="row">						
                        <div class="col-md-12">
                            <div class="panel panel-white">                                
                                <div class="panel-body">
                                
                                	<div id="rootwizard">
                                   <ul class="nav nav-tabs">
                                       <li role="presentation" class="active">&nbsp;</li>
                                   </ul>
                                      <div class="tab-content">
                                      <div class="tab-pane active fade in" id="tab1">
                                      <form id="wizardForm" name="wizardForm"  method="post" action="user-submit.jsp">
                                          <%
                                          if(request.getParameter("status")!=null)
                                        	  status=request.getParameter("status");
                                          
                                          %>
                                             <input type="hidden" name="status" value="<%=status%>">
                                                 
                                          <div class="row m-b-lg">
                                          
                                          <div class="form-group col-md-12">
                                         
                                            <div class="row">       
                                             <div class="col-md-8">
                                 			          <label>Name</label>
                                                      <input type="text" class="form-control" tabindex="14"  required  value=""  maxlength="249" name="name"  placeholder="Name"  required>                
                                            </div>
                                            </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                         
                                            <div class="row">    
                                            <div class="col-md-5">
                                 				
                                                      <label>Email Id</label>
                                                      <input type="email" class="form-control" tabindex="14"  required  value=""  maxlength="249" name="email"  placeholder="Email Id"  required>                
                                               
                                            </div>      
                                            <div class="form-group col-md-3">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" tabindex="14"  required  value=""  maxlength="99" name="phone"  placeholder="Phone"  required>                
                                            </div>
                           					
                                                  </div></div></div>
                                                  
                                            <div align="right"><br>
                                       		<button type="submit" tabindex="30" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                       	  </div>
                                       </form>
                                        </div></div>
								</div>
                                 <div class="col-md-12">
                                    <div class="table-responsive">
                                   
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>&nbsp;</th>                                            
                                                <th>Info</th>                                            
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>&nbsp;</th>                                            
                                                <th>Info</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                       
                                        </tbody>
                                       </table>  
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
        <script src="assets/plugins/jquery-mockjax-master/jquery.mockjax.js"></script>
        <script src="assets/plugins/moment/moment.js"></script>
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="assets/plugins/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>
        
         <script src="assets/js/pages/form-elements.js"></script>
        <script src="assets/plugins/summernote-master/summernote.min.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>