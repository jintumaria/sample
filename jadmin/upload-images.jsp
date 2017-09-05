<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%@include file="images-data.jsp"%>
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
        <script>
		function create_file_name()
		{
			var new_file_name=document.wizardForm.image_caption.value;			
			new_file_name = new_file_name.replace(/\s+/g, '-').toLowerCase();
			document.wizardForm.file_name.value=new_file_name;
			
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
                        <li class="active"><%=name_text%> Images</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                      <h3><%=name_text%> Images</h3> 
                    </div>
                </div>
               
                <div id="main-wrapper" class="container">
                    <div class="row">
                       
                    
                        <div class="col-md-12">
                        <%
                            	if(request.getParameter("msg")!=null)	{
				if(request.getParameter("msg").equals("0"))	{%>		
                
                 <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        Registrants Email Id already Exists !!<br>
                                    </div>
                	<%}
				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
									if(request.getParameter("msg").equals("100"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully without image. Image size should be less than 500 KB !! 
                                    </div>	<br><%}
					if(request.getParameter("msg").equals("2"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
									if(request.getParameter("msg").equals("3"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Deleted Successfully !!
                                    </div>	<br><%}
													
									if(request.getParameter("msg").equals("4"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Duplicate Registrant ID !!
                                    </div>	<br><%}
													}			
							%>
                            <div class="panel panel-white">
                           
                                <div class="panel-body">
                                
                              
                                
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user m-r-xs"></i><%=name_text%></a></li>                                           
                                        </ul>
                          
                                    <%
									int count_images=1;
									
									if(status.equals("insert"))
									{
										String upload_query="select id from  upload_tab where image_id='"+image_id+"' and link_id='"+link_id+"'";
										Statement st_upload_view=con.createStatement();
										ResultSet rs_upload_view=st_upload_view.executeQuery(upload_query);
										while(rs_upload_view.next())
										{
												count_images=count_images+1;
											
										}
										rs_upload_view.close();
										st_upload_view.close();
									}

if(count_images<=no_of_images)
{
									%>

                                     <form id="wizardForm" name="wizardForm" enctype="multipart/form-data" method="post" action="upload-images-submit.jsp">
                                     <input type="hidden" name="link_id" value="<%=link_id%>">
                                     <input type="hidden" name="status" value="<%=status%>">
                                      <input type="hidden" name="id" value="<%=id%>">
                                       <input type="hidden" name="image_id" value="<%=image_id%>">
                                            <div class="tab-content">
                                               <div class="row m-b-lg">
                                                       		
                                                                  
                                                                    
                                                                          
                                                                                                                                   
                                                                       <div class="row">       
                                                                       		                                                            
                                                                           
                                                                             <%
																			if((!link_id.equals("7")))
																			{
																			%>    
                                                                            <div class="form-group col-md-4">
                                                                             <label for="exampleInputName">Image Caption</label>
                                                                             <%
																		   if(!status.equals("edit"))
									{
																		   %>
                                                  <input type="text" onChange="return create_file_name()" class="form-control" name="image_caption"  value="<%=name_text%>" tabindex="3" maxlength="249" placeholder="Caption" ><%}else{%><input type="text" onChange="return create_file_name()" class="form-control" name="image_caption"  value="<%=image_caption%>" tabindex="3" maxlength="249" placeholder="Caption" >
                                                  
                                                  <%}%>
                                                                            </div>
                                                                            <div class="form-group col-md-4">
                                                                           <label for="exampleInputName">Image Alt</label>
                                                  <input type="text" class="form-control" name="alt_tag" value="<%=alt_tag%>" tabindex="3" maxlength="249" placeholder="Alt Tag" >
                                                                            </div>
                                                                            
                                                                            
                                                                            <%}%>
                                                                            <div class="form-group col-md-4">
                                                                           <label for="exampleInputName">File Name</label>
                                                                           <%
																		   if(!status.equals("edit"))
									{
																		   %>
                                                  <input type="text" class="form-control" <%=readonly_action%> required name="file_name" value="<%=name_name%><%
												  if((link_id.equals("1"))||(link_id.equals("2"))||(link_id.equals("5"))||(link_id.equals("7")))
												  {
												  %>-<%=count_images%><%}%>" tabindex="2" maxlength="249" placeholder="File Name" >
                                                                          <%}else{%>
                                                                          <input type="text" class="form-control" <%=readonly_action%> required name="file_name" value="<%=file_name%>" tabindex="2" maxlength="249" placeholder="File Name" >
                                                                          <%}%>  </div>
                                                                          <%
																			if((!link_id.equals("1"))&&(!link_id.equals("7")))
																			{
																			%>  
                                                                             <div class="form-group col-md-4">
                                                                             <label for="exampleInputName">Image Description</label>
                                                  <input type="text" class="form-control" name="image_describe"   value="<%=image_describe%>" tabindex="3" maxlength="249" placeholder="Description" >
                                                                            </div>
                                                                            <%
																			if(link_id.equals("6"))
																			{
																			%>
                                                                            <div class="form-group col-md-4">
                                                                              <label for="exampleInputName">Image Category</label>
                                                                              <select name="image_link" required id="image_link" class="js-states form-control" tabindex="9" style="width: 100%">
                                                                              
																			  
																			  <%
																	if(image_link.length()>0)
																	{
																		%>
																		<option value="<%=image_link_id%>" selected><%=image_link%></option>
																		<option value="">--- Category  ---</option>
																		<%
																	}else{
																	%>
																		<option value="" selected>---  Category  ---</option>
																	<%
																		}
										  					String query_category="select id,category_name from category_tab where category_status='1' order by category_name asc";
															Statement st_category=con.createStatement();
															ResultSet rs_category=st_category.executeQuery(query_category);
															while(rs_category.next())
															{
															%>
                                                  			<option value="<%=rs_category.getString("id")%>"><%=rs_category.getString("category_name")%></option>
                                                            <%
															}
															rs_category.close();
															st_category.close();
															%>
                                                  </select>
                                                                            </div>
                                                                            <%}else{%>
                                                                            <div class="form-group col-md-4">
                                                                              <label for="exampleInputName">Image Link</label>
                                                  <input type="text" class="form-control" name="image_link"   value="<%=image_link%>" tabindex="3" maxlength="249" placeholder="Link" >
                                                                            </div>
                                                                            <%}%>
                                                                             <%}%>
                                                                        </div>   
                                                                       
                                                                        <%
																  if(image_1_status.equals("YES"))
																  {
																  %>
                                                                  		<div> <a href="../<%=image_1%>" target="_blank"><img src="../<%=image_1%>" width="100" height="100"></a></div>
                                                                   		<h5>Upload Image (Width : <%=image_1_width%>px, Height  : <%=image_1_height%>px)</h5> 
                                                                         <div class="row">
                                                                              <div class="form-group col-md-12">
                                                                             
                                                                                <input name="F1" type="file" />
                                                                             </div>
                                                                         </div>  
                                                                   <%}else{%>
                                                                   		<h5>Upload Image (Width : <%=image_1_width%>px, Height  : <%=image_1_height%>px)</h5> 
                                                                         <div class="row">
                                                                              <div class="form-group col-md-12">
                                                                              
                                                                                <input name="F1" type="file" />
                                                                             </div>
                                                                         </div>  
																   
																   <%}
																  if(link_id.equals("22"))
																   {
																   if(image_2_status.equals("YES"))
																  {
																  %>
                                                                  		<div> <a href="../<%=image_2%>" target="_blank"><img src="../<%=image_2%>" width="100" height="100"></a></div>
                                                                   		<h5>Upload Thumbnail Image (Width : <%=image_2_width%>px, Height  : <%=image_2_height%>px)</h5> 
                                                                         <div class="row">
                                                                              <div class="form-group col-md-12">
                                                                             
                                                                                <input name="F2" type="file" />
                                                                             </div>
                                                                         </div>  
                                                                   <%}else{%>
                                                                   		<h5>Upload Thumbnail Image (Width : <%=image_2_width%>px, Height  : <%=image_2_height%>px)</h5> 
                                                                         <div class="row">
                                                                              <div class="form-group col-md-12">
                                                                              
                                                                                <input name="F2" type="file" />
                                                                             </div>
                                                                         </div>  
																   
																   <%}
																   }
																   %>
                                                                         
                                                                          <div align="right"><br>
                                        <button type="submit" tabindex="30" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                        </div>
                                                                       
                                                
                                   </div>
                                   </div></form>
                                                <%}%>
                                                
                                                 </div>
                                            
                                         <br><br>
                                                        <div class="col-md-12">
                                                      
                                                       <%
									String upload_show_query="select file_name,image_1,image_1_status,id,image_id from  upload_tab where link_id='"+link_id+"'";				   
									if(link_id.equals("2"))
									{
									 upload_show_query=upload_show_query+" and image_id="+image_id;
									}
									
Statement st_upload_show=con.createStatement();
ResultSet rs_upload_show=st_upload_show.executeQuery(upload_show_query);
while(rs_upload_show.next())
{
	
	%>
    <div class="form-group col-md-3" align="center">
    <%
														if(rs_upload_show.getString("image_1_status").equals("YES"))
														{
%>														<div style="padding-top:10px;"><%=rs_upload_show.getString("file_name")%></div>
                                                        &nbsp;&nbsp; <a href="upload-images.jsp?status=edit&image_id=<%=rs_upload_show.getString("image_id")%>&id=<%=rs_upload_show.getString("id")%>&link_id=<%=link_id%>"><img src="../<%=rs_upload_show.getString("image_1")%>" width="100" height="100"></a>
                                                        <div style="padding-top:10px;"><a href="upload-images.jsp?status=edit&image_id=<%=rs_upload_show.getString("image_id")%>&id=<%=rs_upload_show.getString("id")%>&link_id=<%=link_id%>">Edit</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="upload-images-config-submit.jsp?status=delete&id=<%=rs_upload_show.getString("id")%>&image_id=<%=rs_upload_show.getString("image_id")%>&link_id=<%=link_id%>">Delete</a></div>
                                                        <%
														}else{
%>
                                                        &nbsp;&nbsp;<a href="upload-images.jsp?status=edit&id=<%=rs_upload_show.getString("id")%>&image_id=<%=rs_upload_show.getString("image_id")%>&link_id=<%=link_id%>">Upload Image</a>
                                                        <%														
														}
	%>
    </div>
    <%
														
														}
														rs_upload_show.close();
														st_upload_show.close();
														%>
                                                        
                                                 
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