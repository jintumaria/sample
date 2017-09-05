<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
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
        <meta name="description" content="Admin Dashboard" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="FSH Design" />
        
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
                <div class="profile-cover">
                    <div class="container">
                        <div class="col-md-12 profile-info">
                            <div class="profile-info-value">
                                <h3>0</h3>
                                <p>Customers</p>
                            </div>
                            <div class="profile-info-value">
                                <h3>0</h3>
                                <p>Invoices</p>
                            </div>
                            <!--<div class="profile-info-value">
                                <h3>0</h3>
                                <p>Product Images</p>
                            </div>-->
                        </div>
                    </div>
                </div>
                 <%
								String query_admin_show="select * from admin_tab where admin_id= '"+session.getAttribute("admin_id")+"'";
								Statement st_admin_show=con.createStatement();
								ResultSet rs_admin_show=st_admin_show.executeQuery(query_admin_show);
								if(rs_admin_show.next())  
								{
								%>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-3 user-profile">
                            <div class="profile-image-container">
                            <%
							if(rs_admin_show.getString("file_status_1").equals("YES"))
							{
							%>
                              <a href="upload-logo.jsp">  <img alt="Change Logo" src="<%=rs_admin_show.getString("file_1")%>"></a>
                            <%}else{%>
                             <a href="upload-logo.jsp">  <img alt="Change Logo"  src="assets/images/admin.png"></a>
                            <%}%>
                            </div>
                            <h3 class="text-center"><%=title_main%></h3>
                            <p class="text-center"><%=rs_admin_show.getString("admin_name")%></p>
                            <hr>
                            <ul class="list-unstyled text-center">
                                <li><p><i class="fa fa-map-marker m-r-xs"></i>
                                <% if(rs_admin_show.getString("address_1").length()>0) {	%> <%=rs_admin_show.getString("address_1")%> <%}%>
								<% if(rs_admin_show.getString("address_2").length()>0) {	%> ,  <%=rs_admin_show.getString("address_2")%> <%}%>
								<% if(rs_admin_show.getString("city").length()>0) {	%> , <%=rs_admin_show.getString("city")%> <%}%>
								<% if(rs_admin_show.getString("state").length()>0) {	%> , <%=rs_admin_show.getString("state")%> <%}%>
								<% if(rs_admin_show.getString("country").length()>0) {	%> , <%=rs_admin_show.getString("country")%> <%}%>
								<% if(rs_admin_show.getString("postalcode").length()>0) {	%> - <%=rs_admin_show.getString("postalcode")%> <%}%>
								
                                </p></li>
                                <li><p><i class="fa fa-envelope m-r-xs"></i><a href="#"><%=rs_admin_show.getString("admin_email")%></a></p></li>
                                <li><p><i class="fa fa-link m-r-xs"></i><a href="#"><%=rs_admin_show.getString("website")%></a></p></li>
                            </ul>
                            <hr>
                           <!-- <button class="btn btn-primary btn-block"><i class="fa fa-plus m-r-xs"></i>Follow</button>-->
                        </div>                      
                          
                         
                          <%
						  String msg="";
						  if(request.getParameter("msg")!=null)	{	msg= request.getParameter("msg");	}
						  if(msg.equals("1"))
						  {
						  
						  %>
                             <div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                               Logo Updated !!
                            </div>
						 <%
                         }
                         %>   
                         <div class="col-md-9"> 
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Upload Logo</h4>
                                </div>
                                <div class="panel-body">
                               
                                    <form method="post" action="upload-logo-submit.jsp" enctype="multipart/form-data"  name="form_upload"> 
                    				<label> Ideal Canvas Size ( 130 X 120 px )<br> Ideal Picture Size ( 90 X 80 px )<br>Preferred Image Format ( .png )</label> <br><br>
                                          <div class="form-group">
                                           <input name="F1" type="file">
                                        </div>
                                          <button type="submit" class="btn btn-primary">Submit</button>
                                   </form>
                                </div>
                           </div>
                         </div>
                        
                        
                        
                        
                </div>
                </div>
                 <%
				}
				rs_admin_show.close();
				st_admin_show.close();
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
        <script src="assets/js/pages/profile.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>