<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
	
	String link_id="",name_text="",name_name="",display_page="";
	if(request.getParameter("link_id")!=null)	{	link_id=request.getParameter("link_id"); }
	
	if(link_id.equals("8"))			{					name_text="Home Page"; name_name="Home Page";display_page="/trainingday/";					}
	if(link_id.equals("9"))			{					name_text="Block - Home"; name_name="Block 1";display_page="/trainingday/";					}
	if(link_id.equals("7"))			{					name_text="About Us Page"; name_name="About Us Page";display_page="../about/";				}
	if(link_id.equals("10"))		{					name_text="Block - About Us"; name_name="Block 1";display_page="../about/";					}
	if(link_id.equals("5"))			{					name_text="Testimonials Page"; name_name="Testimonials Page";display_page="../about/";		}
	if(link_id.equals("6"))			{					name_text="Franchisee Page"; name_name="Franchisee Page";display_page="../franchising/";	}
	if(link_id.equals("2"))			{					name_text="Contact Address"; name_name="Contact Address";display_page="../contact/";		}
	if(link_id.equals("1"))			{					name_text="Contact Page"; name_name="Contact Page";display_page="../contact/";				}
	if(link_id.equals("3"))			{					name_text="Contact Map"; name_name="Contact Map";display_page="../contact/";				}
	
									
									
	
%>
<%@include file="content-data.jsp"%>
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
        <link href="assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>        
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
            <a href="<%=display_page%>" class="logo-text"><span><%=title_main%></span></a>
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
                        <li class="active"><%=name_text%></li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                      <h3><%=name_text%></h3> 
                    </div>
                </div>
               
                <div id="main-wrapper" class="container">
                    <div class="row">
                       
                    
                        <div class="col-md-12">
                         <%
                            	if(request.getParameter("msg")!=null)	{
				
				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}}			
							
					
					%>
                            <div class="panel panel-white">
                           
                                <div class="panel-body">
                                
                              
                                
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user m-r-xs"></i><%=name_text%></a></li>                                           
                                        </ul>
                          
                                    

                                     
                                            <div class="tab-content">
                                                <div class="tab-pane active fade in" id="tab1">
            <form id="wizardForm" name="wizardForm" method="post" action="content-info-submit.jsp">
            <input type="hidden" name="link_id" value="<%=link_id%>">
            <div align="right"><br><button type="submit" class="btn btn-primary">Save</button></div>
            <div class="row m-b-lg">
                <div class="col-md-12">                
                  
                    <%
					if((!link_id.equals("5"))&&(!link_id.equals("4"))){%>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="exampleInputEmail">Info</label>                                              
                            <textarea id="other_info" name="other_info"  class="summernote form-control" rows="10" placeholder="Enter the long description..."><%=other_info%></textarea>
                            <script>
                            $(document).ready(function() {
                            $('.summernote').summernote({
                            height: 300,
                            onKeyup: function(e) {
                            $("#other_info").html($(this).code());
                            }
                            });
                            });</script>
                        </div>  
                        </div> 
                        <%}
					if((link_id.equals("1"))||(link_id.equals("4"))||(link_id.equals("5"))||(link_id.equals("6"))||(link_id.equals("7"))||(link_id.equals("8"))||(link_id.equals("9"))||(link_id.equals("10")))
					{
					
					%>
                      <div class="row">
                      <br>
                        <div class="form-group col-md-6">
                            <label for="exampleInputName">Page Title</label>
                            <input type="text" class="form-control" required name="page_title" value="<%=page_title%>" maxlength="249" placeholder="Page Title" >
                        </div>      
                        <%
						if(!link_id.equals("9"))
						{
						%>           
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail">Keywords</label>
                            <input type="text" class="form-control" name="page_key" value="<%=page_key%>"  maxlength="249" placeholder="Meta Keywords" >
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputName">Description</label>
                            <input type="text" class="form-control" name="page_describe" value="<%=page_describe%>" maxlength="249" placeholder="Meta Description" >
                        </div>
                    <%
					}
					}
					%>
                    </div>               
                </div>
            </div>
            </form>   
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
        <script src="assets/plugins/summernote-master/summernote.min.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>        
        <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/js/pages/form-select2.js"></script>
        <script src="assets/js/pages/form-elements.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>