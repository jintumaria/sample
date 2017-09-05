<%
if(session.getAttribute("admin_id")!=null)
	{
		response.sendRedirect("home.jsp");
	}
%>
<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title><%=titleName%></title>
        <link rel="SHORTCUT ICON" href="../jadmin/assets/images/admin.png"/>
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
        
    </head>
    
    <body class="page-login">
        <main class="page-content">
        
            <div class="page-inner">
                <div id="main-wrapper">
                
                    <div class="row">            	
                      			
                    
                          <div class="col-md-3 center">
                          <%@include file="../jadmin/alerts.jsp"%>   
                            <div class="login-box">
                               <p>  <a href="index.jsp" class="logo-name text-lg text-center"><img src="../img/logo.png" alt="<%=titleAuthor%>"></a></p>
                               <form class="m-t-md" method="post" action="index-submit.jsp">
                                    <div class="form-group">
                                        <input type="email" name="userName" class="form-control" placeholder="User Name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block">Login</button>
                                    <!--<a href="forgot.html" class="display-block text-center m-t-md text-sm">Forgot Password?</a>
                                      -->                                 
                                </form>
                                <p class="text-center m-t-xs text-sm">2017 &copy; FSHDesign</p>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
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
        <script src="../jadmin/assets/js/modern.min.js"></script>
        
    </body>
</html>

<%
con.close();

%>