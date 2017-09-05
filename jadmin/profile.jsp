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
        <title><%=titleName%></title>
        <link rel="SHORTCUT ICON" href="assets/images/admin.png"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta charset="UTF-8">
        <meta name="description" content="<%=titleName%>" />
        <meta name="keywords" content="<%=titleName%>" />
        <meta name="author" content="<%=titleAuthor%>" />
        
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
           
                    <%@include file="outer-menu.jsp"%>
                    
                    <%@include file="menu.jsp"%>
            
            <div class="page-inner">
            <!-- style=" background: url('assets/documents/<%=adminId %>_COVER.jpg');background-size: cover;width: 100%;height: 300px;position: relative;" -->
                <div class="profile-cover" style=" background: url('assets/documents/<%=adminId %>_COVER.jpg');background-size: cover;width: 100%;height: 300px;position: relative;">
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
								Statement stAdmin=con.createStatement();
								ResultSet rsAdmin=stAdmin.executeQuery("select * from admin_tab where id= '"+session.getAttribute("admin_id")+"'");
								if(rsAdmin.next())  
								{
								%>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-3 user-profile">
                         <div class="profile-image-container" >
                            <a href="upload-images.jsp?linkId=1">
                                	<img src="assets/documents/<%=adminId %>.jpg" onerror="this.src='assets/images/admin.png'" width="100" height="150" style="background-color: white;">
                                </a>
                            </div>
                             <p class="text-center"><a href="upload-photos.jsp?linkId=1">Edit Profile Photo</a> &nbsp;|&nbsp;<a href="upload-photos.jsp?linkId=2">Edit Cover Photo</a></p>
                            <h3 class="text-center">
                            <%=session.getAttribute("business_name") %>
                             </h3>
                           
                            <hr>
                            <ul class="list-unstyled text-center">
                                
                                <li><p><i class="fa fa-envelope m-r-xs"></i><a href="#"><%=session.getAttribute("admin_email") %></a></p></li>
                                <li><p><i class="fa fa-mobile m-r-xs"></i><a href="#"><%=session.getAttribute("admin_phone") %></a></p></li>
                            </ul>
                            <hr>
                            <!--<button class="btn btn-primary btn-block"><i class="fa fa-plus m-r-xs"></i>Follow</button>-->
                        </div>
                          
                         <div class="col-md-9"> 
						 <%@include file="alerts.jsp"%>
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Profile Information</h4>
                                </div>
                                <div class="panel-body">
                               
                                    <form  name="wizardForm" action="profile-submit.jsp" method="post"  id="wizardForm">
                                    	<input type="hidden" name="status" value="profile">
                                          <div class="form-group">
                                            <label for="exampleInputEmail1">Username</label>
                                            <input type="text" name="userName"  value="<%=rsAdmin.getString("userName")%>" class="form-control" id="input-Default" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email</label>
                                            <input type="email" name="email"  value="<%=rsAdmin.getString("email")%>" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>                                            
                                            <input type="password" class="form-control" name="password"  value="<%=rsAdmin.getString("password")%>" id="exampleInputPassword1" placeholder="Password" >
                                        </div>
                                        
                                         <button type="submit" class="btn btn-primary">Save</button>
                                   
                                </div>
                           </div>
                         </div>
                          </form>
                        
                        
                       
                        </div>
                </div>
                </div>
                 <%
				}
				rsAdmin.close();
				stAdmin.close();
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