<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>

<%

if((session.getAttribute("admin_id")!=null))
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
        <script>
		function createFileName()
		{
			var newFileName=document.wizardForm.imageCaption.value;			
			newFileName = newFileName.replace(/\s+/g, '-').toLowerCase();
			document.wizardForm.fileName.value=newFileName;
			
		}
		
		function checkCoverPhoto(target) {
			
		    if(target.files[0].type.indexOf("image") == -1) {
		        document.getElementById("photoLabel").innerHTML = "File not supported";
		        return false;
		    }
		    if(target.files[0].size > 512000) {
		        document.getElementById("photoLabel").innerHTML = "Image too big (max 500kb)";
		        return false;
		    }
		    
		    document.getElementById("photoLabel").innerHTML = "";
		    return true;
		}
		function checkPhoto(target) {
			
			var image = document.getElementById('fileUpload');
			var width = image.naturalWidth;
			var height = image.naturalHeight;
			image.onload = function() {
				  width = this.width;
				  height = this.height;
				};
			
		    if(target.files[0].type.indexOf("image") == -1) {
		        document.getElementById("photoLabel").innerHTML = "File not supported";
		        return false;
		    }
		    if(target.files[0].size > 51200) {
		        document.getElementById("photoLabel").innerHTML = "Image too big (max 50kb)"+width;
		        return false;
		    }
		    
		    document.getElementById("photoLabel").innerHTML = "";
		    return true;
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
            <a href="/" class="logo-text"><span><%=titleName%></span></a>
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
                        <li class="active"><%=nameCaption%></li>
                    </ol>
                </div>
                
                <div class="page-title">
                    <div class="container">
                      <h3><%=nameCaption%></h3> 
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                            
           		<div class="row">
                   <div class="col-md-12">
                   		<div class="panel panel-white">
                           <div class="panel-body">
                          	<%
                           	if(request.getParameter("msg")!=null)	
                           	{
								if(request.getParameter("msg").equals("0"))	{%>		
                
                 					<div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      <%
                                      if(request.getParameter("linkId")!=null)	
                                     	{
                                    	  if(request.getParameter("linkId").equals("1"))	{%>
                                    	  
                                    	  		Image size should be less than 50 KB !!
                                    	  <%
                                    	  }
                                    	  else if(request.getParameter("linkId").equals("2"))	{%>
                                    	  
                              	  		Image size should be less than 500 KB !!
                              	  		<%
                                    		  
                                    	  }
                                     	}
                                      %> 
                                        
                                    </div>
                				<%}
								if(request.getParameter("msg").equals("1"))		{%>		 
									<div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Photo uploaded successfully !!
                                    </div>	<%}
								if(request.getParameter("msg").equals("2"))		{%>		 
								<div class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                   Invalid File Format ! Please Re Upload .jpg File !!!
                                </div>	<%}
							}			
							%>    
                       <div id="rootwizard">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">&nbsp;</li>
                            </ul>
                         	<div class="tab-content">
                               <div class="tab-pane active fade in" id="tab1"> 
                                              
                   		<form  enctype="multipart/form-data" method="post" action="upload-photos-submit.jsp">
                     			<input type="hidden" name="link_id" value="<%=linkId%>">											<%session.setAttribute("linkId",linkId); %>
                     			
                     			
                     		 <%
							if((linkId.equals("1"))) // upload profile photo 
							{
							%>  
							<div class="form-group col-md-12">
                                   	<h2>Upload Profile Photo</h2>
                                               
                                      <div class="row m-b-lg"> 
                                      
                              <div class="form-group col-md-6">  
                               <div class="profile-image-container">
                               		<img src="assets/documents/<%=adminId %>.jpg" onerror="this.src='assets/images/admin.png'"  alt="" width="100" height="130">
                            	</div>
                                <h3 class="text-center"><%=session.getAttribute("business_name") %></h3>
	                            <p class="text-center"></p>
	                            <hr>
	                            <ul class="list-unstyled text-center">
	                                <li><p><i class="fa fa-envelope m-r-xs"></i><a href="#"><%=session.getAttribute("admin_email") %></a></p></li>
	                                <li><p><i class="fa fa-mobile m-r-xs"></i><a href="#"><%=session.getAttribute("admin_phone") %></a></p></li>
	                            </ul>
	                            <hr>
                               </div>
                               <div class="form-group col-md-6">
                                <div align="right"><br>
                              		<button type="submit" tabindex="30" class="btn btn-primary">Upload</button>&nbsp;&nbsp;
                              	 </div>
                                 <h5>Upload Image (Width : <%=image1Width%> px, Height  : <%=image1Height%> px,  Format : jpg)</h5>
                                 
                                 <input name="F1" type="file" onchange="checkPhoto(this)" id="fileUpload"/> 
                                 <label id="photoLabel" style="color: red;"></label>
                                 <br>
                                 <input type="hidden" name="linkId" value="<%=linkId%>">
                                 
                                 </div>
                              	 </div></div>
                            <%
							}
                            else if((linkId.equals("2"))) // upload cover photo 
							{
							%>  
							<div class="form-group col-md-12">
                                   	<h2>Upload Cover Photo</h2>
                                               
                                      <div class="row m-b-lg"> 
                                      
                              <div class="form-group col-md-6">  
                               <div class="profile-cover" style="width: 400px;height: 125px;">
                            			<img src="assets/documents/<%=adminId %>_COVER.jpg" onerror="this.src='documents/profile-cover.png'" alt=""  width="400" height="125">
                            		
                            	</div>
                                <h3 class="text-center"><%=session.getAttribute("business_name") %></h3>
	                            <p class="text-center"></p>
	                            <hr>
	                            <ul class="list-unstyled text-center">
	                                <li><p><i class="fa fa-envelope m-r-xs"></i><a href="#"><%=session.getAttribute("admin_email") %></a></p></li>
	                                <li><p><i class="fa fa-mobile m-r-xs"></i><a href="#"><%=session.getAttribute("admin_phone") %></a></p></li>
	                            </ul>
	                            <hr>
                               </div>
                               <div class="form-group col-md-6">
                                <div align="right"><br>
                              		<button type="submit" tabindex="30" class="btn btn-primary">Upload</button>&nbsp;&nbsp;
                              	 </div>
                                 <h5>Upload Image (Width : <%=image1Width%> px, Height  : <%=image1Height%> px,  Format : jpg)</h5>
                                 
                                 <input name="F1" type="file" onchange="checkCoverPhoto(this)"/> 
                                 <label id="photoLabel" style="color: red;"></label>
                                 <br>
                                 <input type="hidden" name="linkId" value="<%=linkId%>">
                                 
                                 </div>
                              	 </div></div>
                            <%
							}
                            %>     	
                			</form>	</div> </div></div>
                   </div>
                </div>
                </div></div></div>
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