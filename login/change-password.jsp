<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>

<%@include file="../jadmin/employees-data.jsp"%>

<%@include file="images-data.jsp"%>


<%

if((session.getAttribute("login_id")!=null))
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
        <link href="../jadmin/assets/plugins/pace-master/themes/blue/pace-theme-flash.css" rel="stylesheet"/>
        <link href="../jadmin/assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet"/>
        <link href="../jadmin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/line-icons/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/waves/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/3d-bold-navigation/css/style.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>        
        <link href="../jadmin/assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
         <link href="../jadmin/assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        
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
        
        <script type="text/javascript">
        function checkPass()
        {
                var x = document.changePassword.currentPassword.value;
                if (x.length < 2 ){
                      //  alert("The password must contain minimum 2 Characters");
                        document.getElementById("curPass").innerHTML = "The password must contain minimum 2 Characters";
                        return false;
                   }
                else
                	{
                		document.getElementById("curPass").innerHTML = "";
                    	return true;
                	}
        }
        function checkNewPass()
        {
                var x = document.changePassword.newPassword.value;
                if (x.length < 2 ){
                      //  alert("The password must contain minimum 4 Characters"); 
                        document.getElementById("newPass").innerHTML = "New password must contain minimum 2 Characters";
                        return false;
                   }
                else 
            	{
            		document.getElementById("newPass").innerHTML = "";
                	return true;
            	}
        }
        function checkConPass()
        {
                var x = document.changePassword.confirmPassword.value;
                var y = document.changePassword.newPassword.value;
                if (x.length < 2 )
                {
                   // alert("The password must contain minimum 2 Characters"); 
                    document.getElementById("conPass").innerHTML = "New password must contain minimum 2 Characters";
                    return false;
                }
                else if(x!=y)
                {
                	//alert("Re-enter the same password");
                	document.getElementById("conPass").innerHTML = "Re-enter the same password";
                	return false;
                }
                else
            	{
            		document.getElementById("conPass").innerHTML = "";
                	return true;
            	}
        }
        function validate()
        {
                var x = document.changePassword.currentPassword.value;
                var y = document.changePassword.confirmPassword.value;
                var z = document.changePassword.newPassword.value;
                if (x.length < 2 || y.length < 2 || z.length < 2)
                {
                    //alert("The password must contain minimum 2 Characters");
                    document.getElementById("conPass").innerHTML = "The password must contain minimum 2 Characters";
                    return false;
                }
                else if(y!=z)
                {
                	//alert("Re-enter the same password");
                	document.getElementById("conPass").innerHTML = "Re-enter the same password";
                	return false;
                }
                else
            	{
            		document.getElementById("conPass").innerHTML = "";
                	return true;
            	}
        }
        </script>
		
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
            <a href="<%=displayPage%>" class="logo-text"><span><%=titleName%></span></a>
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
                        <li class="active"><%=nameText%> Password</li>
                    </ol>
                </div>
                
                <div class="page-title">
                    <div class="container">
                      <h3><%=nameText%> Password</h3> 
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                 <div class="row">
					<%@include file="../jadmin/alerts.jsp"%>
                     <div class="col-md-12">
                     <div class="panel panel-white">
                     <div class="panel-body">
                        	
                           <div id="rootwizard">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">&nbsp;</li>
                            </ul>
                         	<div class="tab-content">
                               <div class="tab-pane active fade in" id="tab1"> 
                                              
                   		
                     	 
							<div class="form-group col-md-12">
                                   	<h2>Change Password</h2>
                              
                              	 <div class="row m-b-lg">
                                     <div class="col-md-3">
                                     </div>
                                        <div class="col-md-6">
                                        	<form  method="post" name="changePassword" action="change-password-submit.jsp">
                     						<input type="hidden" name="id" value="<%=id%>">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="CurrentPassword">Current Password</label>
                                                    <input type="password" class="form-control"   maxlength="99" name="currentPassword" id="currentPassword" placeholder="Current Password" onchange="checkPass();" required>
                                                	<label id="curPass" style="color: red;"></label>
                                                </div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group  col-md-6">
                                                    <label for="New Password">New Password</label>
                                                    <input type="password"  maxlength="99" class="form-control" name="newPassword" id="newPassword"   placeholder="New Password" onchange="checkNewPass();" required>
                                                	<label id="newPass" style="color: red;"></label>
                                                </div>
                                               </div>
                                               <div class="row">
												<div class="form-group col-md-6">
                                                     <label for="ConfirmPassword">Confirm Password</label>
                                                     <input type="password"  maxlength="99" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" onchange="checkConPass();" required>
                                                 	<label id="conPass" style="color: red;"></label>
                                                 </div>
                                                 </div>
                                                 <div align="right"><br>
                              						<button type="submit" tabindex="30" class="btn btn-primary" onclick="return validate();">Change Password</button>&nbsp;&nbsp;
                              	 				 </div>
                              	 				</form>	 
                                                </div>
                                               </div>
                              	 </div>
                           
                			</div> </div></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- Row -->    
           		</div>
				<%@include file="footer.jsp"%>
            </div>
           
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
        <script src="../jadmin/assets/plugins/summernote-master/summernote.min.js"></script>
        <script src="../jadmin/assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../jadmin/assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="../jadmin/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>        
        <script src="../jadmin/assets/plugins/select2/js/select2.min.js"></script>        
        <script src="../jadmin/assets/js/modern.min.js"></script>
        <script src="../jadmin/assets/js/pages/form-wizard.js"></script>
        <script src="../jadmin/assets/js/pages/form-select2.js"></script>
        <script src="../jadmin/assets/js/pages/form-elements.js"></script>
      
        
    </body>
</html>

<%
}
else
{
		response.sendRedirect("sessionexpire.jsp");
}
%>