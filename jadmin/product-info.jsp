<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
	
								
	
%>
<%@include file="product-data.jsp"%>
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
			//new_file_name=document.wizardForm.page_title.value;		
			
			var sel = document.getElementById("page_title");
			var text= sel.options[sel.selectedIndex].text;				
			new_file_name = text.replace(/\s+/g, '-').toLowerCase();
			document.wizardForm.page_name.value=new_file_name;
			
		}
		function create_file_name_category()
		{
			//new_file_name_a=document.wizardForm.page_category.value;		
			
			var sel_a = document.getElementById("page_category");
			text_a= sel_a.options[sel_a.selectedIndex].text;	
						
			new_file_name_a = text_a.replace(/\s+/g, '-').toLowerCase();
			document.wizardForm.page_name.value=new_file_name+"-"+new_file_name_a;
			
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
            <form id="wizardForm" name="wizardForm" method="post" action="product-info-submit.jsp">
            <input type="hidden" name="link_id" value="<%=link_id%>">
            <input type="hidden" name="status" value="<%=status%>">
            <input type="hidden" name="id" value="<%=id%>">
            <div class="row m-b-lg">
                <div class="col-md-12">                
                   <div class="row">
                      <br>
                        <div class="form-group col-md-3">
                            <label for="exampleInputName">Rose Category</label>
                           
                            <select  name="page_title" id="page_title"  onChange="return create_file_name()"  class="form-control" required>
                             <%
						if(status.equals("edit"))
						{
						%>
                         <option value="<%=page_title_id%>"  selected><%=page_title%></option>
                          <option value="">--- Select ---</option>
                        <%}else{%>
                            <option value=""  selected>--- Select ---</option>
                            <%}
											 String query_roses="SELECT category_name,id FROM category_tab where category_status='1' order by modified_date asc";
	         Statement st_roses=con.createStatement();
			 ResultSet rs_roses=st_roses.executeQuery(query_roses);
			 while(rs_roses.next())
			 {
			
											%>
                            <option value="<%=rs_roses.getString("id")%>"><%=rs_roses.getString("category_name")%></option>
                              <%
			 }
			 rs_roses.close();
			 st_roses.close();
										   %>
                            </select>
                        </div>      
                        <div class="form-group col-md-3">
                            <label for="exampleInputName">Category Name</label>
                           
                            <select  name="page_category" id="page_category"  onChange="return create_file_name_category()"  class="form-control" required>	
                           
                            <%
						if(status.equals("edit"))
						{
						%>
                         <option value="<%=page_category_id%>"  selected><%=page_category%></option>
                          <option value="">--- Select ---</option>
                        <%}else{%>
                            <option value=""  selected>--- Select ---</option>
                            <%}
											 String query_category="SELECT category_name,id FROM category_tab where category_status='2' order by modified_date asc";
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
                        <%
						if(!status.equals("edit"))
						{
						%>
                        <div class="form-group col-md-6">
                            <label for="exampleInputName">Page Name</label>
                            <input type="text" class="form-control" required name="page_name" value="<%=page_name%>" maxlength="99" placeholder="Page Name" >
                        </div>
                        <%}%>  
                   </div>
                   
                   <div class="row">
                   <div class="form-group col-md-8">
                            <label for="exampleInputName">Short Describe</label>
                            <input type="text" class="form-control" name="page_short" value="<%=page_short%>" maxlength="249" placeholder="Short Describe" >
                   </div>
                   </div>
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
                    <div class="row">
                      <br>
                        <div class="form-group col-md-2">
                            <label for="exampleInputName">Rate</label>
                            <input type="text" class="form-control" name="page_rate" value="<%=page_rate%>" maxlength="9" placeholder="Rate" >
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail">Keywords</label>
                            <input type="text" class="form-control" name="page_key" value="<%=page_key%>"  maxlength="249" placeholder="Meta Keywords" >
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputName">Description</label>
                            <input type="text" class="form-control" name="page_describe" value="<%=page_describe%>" maxlength="249" placeholder="Meta Description" >
                        </div>
                        
                   </div>
 
                                
                </div>
            </div>
             <div align="right"><br><button type="submit" class="btn btn-primary">Save</button></div>
            </form>   
                                                </div>
                                                                                 
                                              
                                                     
                                                </div>    
                                                
                                   
                                                
                                                
                                                 </div>
                                            
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">View <%=name_text%></h4>
                                </div>
                              
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th><%=name_text%></th>
                                                    <th>Upload</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                               <%
		
			 int i_1=0;
			 String selectQry="SELECT * FROM product_tab where link_id='"+link_id+"' order by page_title asc";
	         Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery(selectQry);
			 while(rs.next())
			 {
			 i_1=i_1+1;
			  %>
              
                                            <tbody>
                                            
                                                <tr>
                                                    <th scope="row"><%=i_1%></th>
                                                    <td>													
													<%
													String query_c="select category_name from category_tab where id='"+rs.getString("page_title")+"'";
				Statement st_c=con.createStatement();
				ResultSet rs_c=st_c.executeQuery(query_c);
				if(rs_c.next())
				{
					out.println(rs_c.getString("category_name")+" -");
				}
				rs_c.close();
				st_c.close();
				
				String query_d="select category_name from category_tab where id='"+rs.getString("page_category")+"'";
				Statement st_d=con.createStatement();
				ResultSet rs_d=st_d.executeQuery(query_d);
				if(rs_d.next())
				{
					
					//out.println(rs_d.getString("category_name"));
				}
				rs_d.close();
				st_d.close();
													%> <%=rs.getString("page_short")%> - $ <%=rs.getString("page_rate")%>
                                                    
                                                    </td>     
                                                    <td>
                                                    <%
                                                    int count_a=0;
													String upload_show_query="select id,image_1,image_1_status from  upload_tab where link_id='"+link_id+"' and image_id='"+rs.getString("id")+"'";				   													Statement st_upload_show=con.createStatement();
													ResultSet rs_upload_show=st_upload_show.executeQuery(upload_show_query);
													while(rs_upload_show.next())
													{
													count_a=count_a+1;
													if(rs_upload_show.getString("image_1_status").equals("YES"))
													{
													%>
                                                   <a href="upload-images.jsp?&status=edit&id=<%=rs_upload_show.getString("id")%>&link_id=<%=link_id%>&image_id=<%=rs.getString("id")%>"> <img src="../<%=rs_upload_show.getString("image_1")%>" width="50" height="50">
                                                    </a>
                                                    <%}													 
													}
													rs_upload_show.close();
													st_upload_show.close();
													
													if(count_a==0)
													{
													%>
                                                    <a href="upload-images.jsp?link_id=<%=link_id%>&image_id=<%=rs.getString("id")%>">Upload Image</a>
                                                    <%
													}
													%>
                                                     <!--
                                                    <form method="post" action="categories-submit.jsp" name="priority_form">  
                                                    <input type="hidden" name="status" value="editp">                            
                                                    <input type="hidden" name="id" value="<%//=rs.getString("id")%>">                            
                                                    <input type="hidden" name="link_id" value="<%//=link_id%>"> 
                                                    <select name="priority">                                                    
                                                 
                                                    <option value="0" selected>-- Select --</option>
                                                    <%
													//for(int i=1;i<=priority_count;i++)
													//{
													%>
                                                    <option value="<%//=i%>"><%//=i%></option>
                                                    <%
													//}
													%>
                                                    </select> 
                                                    <%//=rs.getString("priority")%><button type="submit" class="btn btn-default btn-xs">GO</button>
                                        			</form>
                                                    -->
                                                    </td>
                                                    <td><!--<a href="change-image.jsp?status=edit&article_id=<%//=rs.getString("id")%>&link_id=<%//=link_id%>" title="Edit"><i class="fa fa-image"></i></a>&nbsp;&nbsp;--><a href="product-info.jsp?status=edit&id=<%=rs.getString("id")%>&link_id=<%=link_id%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="product-info-submit.jsp?link_id=<%=link_id%>&status=delete&id=<%=rs.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                                </tr>
                                                
                                               
                                                  <%
				}
				rs.close();
				st.close();

				%>
                
				<%
				if(i_1==0)
				{
				%>
                
                							<tr>
                                                  <th colspan="4" class="text-danger">No Data Avaliable !!</th>
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