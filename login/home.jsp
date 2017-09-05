<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%@include file="../jadmin/employees-data.jsp"%>
<%
if(session.getAttribute("login_id")!=null)
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
        <link href="../jadmin/assets/plugins/pace-master/themes/blue/pace-theme-flash.css" rel="stylesheet"/>
        <link href="../jadmin/assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet"/>
        <link href="../jadmin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/line-icons/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/waves/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/3d-bold-navigation/css/style.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        
        <!-- Theme Styles -->
        <link href="../jadmin/assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="../jadmin/assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
		<script src="check.js"></script> 
    <script> 
	
	</script>   
		
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">        
        <main class="page-content content-wrap">
            
            <%@include file="outer-menu.jsp"%>
               
            <%@include file="menu.jsp"%>
            <div class="page-inner">
                <div class="profile-cover" style=" background: url('documents/<%=employeeId %>_COVER.jpg');background-size: cover;width: 100%;height: 300px;position: relative;">
                    <div class="container">
                        <div class="col-md-12 profile-info">
							<%
							if(MYID==0){%>														
							<div class="profile-info-value">
							  <form method="post" name="formcheckin" action="check-submit.jsp">
							  <input type="hidden" name="status" value="checkin">
							  <button type="submit" class="btn btn-danger btn-addon m-b-sm btn-rounded"><i class="fa fa-plus"></i> CHECK IN</button>
							  </form>          
							</div>
							<%
							}
							if(MYID==1){%>
                            <div class="profile-info-value">
							  <form method="post" name="formcheckin" action="check-submit.jsp">
							  <input type="hidden" name="status" value="breakin">
							  <button type="submit" class="btn btn-info btn-addon m-b-sm btn-rounded"><i class="fa fa-plus"></i> BREAK IN</button>
                              </form>          
                            </div>
							
                            <div class="profile-info-value">
								<form method="post" name="formcheckin" action="check-submit.jsp">
							    <input type="hidden" name="status" value="checkout">
                                <button type="submit" class="btn btn-danger btn-addon m-b-sm btn-rounded"><i class="fa fa-minus"></i> CHECK OUT</button>
                                 </form>       
                            </div>
                            <%}
							if(MYID==2){%>
							
							<div class="profile-info-value">
							  <form method="post" name="formcheckin" action="check-submit.jsp">
							  <input type="hidden" name="status" value="breakout">
							  <button type="submit" class="btn btn-info btn-addon m-b-sm btn-rounded"><i class="fa fa-minus"></i> BREAK OUT</button>
                              </form>          
                            </div>
							<%}
							if(MYID==3){%>
							  <div class="profile-info-value">
							  <form method="post" name="formcheckin" action="check-submit.jsp">
							  <input type="hidden" name="status" value="breakin">
							  <button type="submit" class="btn btn-info btn-addon m-b-sm btn-rounded"><i class="fa fa-plus"></i> BREAK IN</button>
                              </form>          
                            </div>
							 <div class="profile-info-value">
								<form method="post" name="formcheckin" action="check-submit.jsp">
							    <input type="hidden" name="status" value="checkout">
                                <button type="submit" class="btn btn-danger btn-addon m-b-sm btn-rounded"><i class="fa fa-minus"></i> CHECK OUT</button>
                                 </form>       
                            </div>
							<%}
							%>
                        </div>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
					
                    <div class="row">
						
                        <div class="col-md-3 user-profile">
                         <div class="profile-image-container">
                            <a href="upload-images.jsp?linkId=1">
                                	<img src="documents/<%=employeeId %>.jpg" onerror="this.src='documents/avatar.png'" width="100" height="130">
                                </a>
                            </div>
                             <p class="text-center"><a href="upload-images.jsp?linkId=1">Edit Profile Photo</a> &nbsp;|&nbsp;<a href="upload-images.jsp?linkId=2">Edit Cover Photo</a></p>
                            <h3 class="text-center"><%=firstName%> <%=lastName%> </h3>
                            <p class="text-center"><%=designation%></p>
                            <hr>
                            <ul class="list-unstyled text-center">
                                <li><p><i class="fa fa-map-marker m-r-xs"></i><%=localAddress%></p></li>
                                <li><p><i class="fa fa-envelope m-r-xs"></i><a href="#"><%=email%></a></p></li>
                                <li><p><i class="fa fa-mobile m-r-xs"></i><a href="#"><%=mobile%></a></p></li>
                            </ul>
                            <hr>
                            <!--<button class="btn btn-primary btn-block"><i class="fa fa-plus m-r-xs"></i>Follow</button>-->
                        </div>
						<!--<div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                    <div class="info-box-stats">
                                        <p class="counter">3</p>
                                        <span class="info-box-title">Leaves</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-users"></i>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                    <div class="info-box-stats">
                                        <p class="counter">11</p>
                                        <span class="info-box-title">Tasks Pending</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-eye"></i>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                    <div class="info-box-stats">
                                        <p class="counter">10</p>
                                        <span class="info-box-title">New emails recieved</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-envelope"></i>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <div class="col-md-9 m-t-lg">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div class="post">
									<form name="home" action="post-submit.jsp" method="post">
                                        <textarea name="post" class="form-control" placeholder="Post" rows="4=6"></textarea>
                                        <div class="post-options">
                                            <button class="btn btn-default pull-right">Post</button>
                                        </div>
										</form>
                                    </div>
									
                                </div>
                            </div>
						<div id="refreshMyPage">	
							<%@include file="comments.jsp"%>
                        </div>
                        </div>
										
                    </div>
                </div>
                 <%@include file="footer.jsp"%>
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
        
        <!-- Javascripts -->
        <script src="../jadmin/assets/plugins/jquery/jquery-2.1.3.min.js"></script>
        <script src="../jadmin/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="../jadmin/assets/plugins/pace-master/pace.min.js"></script>
        <script src="../jadmin/assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="../jadmin/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="../jadmin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../jadmin/assets/plugins/switchery/switchery.min.js"></script>
        <script src="../jadmin/assets/plugins/uniform/jquery.uniform.min.js"></script>
        <script src="../jadmin/assets/plugins/classie/classie.js"></script>
        <script src="../jadmin/assets/plugins/waves/waves.min.js"></script>
        <script src="../jadmin/assets/plugins/3d-bold-navigation/js/main.js"></script>
        <script src="../jadmin/assets/js/modern.min.js"></script>
        <script src="../jadmin/assets/js/pages/profile.js"></script>
		 <script src="../jadmin/assets/js/pages/calendar.js"></script>
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>