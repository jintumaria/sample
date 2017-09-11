<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
%>
<%

String msg="";
if(request.getParameter("msg")!=null)	{	msg=request.getParameter("msg");	}

	String status="",link_id="",name_text="",name_name="",id="",category_id="",n_id="";
	if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 }
	if(request.getParameter("link_id")!=null)		{	link_id=request.getParameter("link_id"); }
  	if(request.getParameter("id")!=null)			{	id=request.getParameter("id"); }
	if(request.getParameter("category_id")!=null)	{	category_id=request.getParameter("category_id");  }
	if(request.getParameter("n_id")!=null)			{	n_id=request.getParameter("n_id");  }
	
						
String display_page="";						
						
	
		if(link_id.equals("3"))				{			name_text="Meal Items"; name_name="Meal Items";display_page="../about.jsp";		
			
		
		if(n_id.length()>0)
		{
			name_text="Nutritional Facts"; name_name="Nutritional Facts";
			
			
		}
		
													}
		if(link_id.equals("4"))				{			name_text="Breakfast Items"; name_name="Breakfast Items";display_page="../about.jsp";	
		
		if(n_id.length()>0)
		{
			name_text="Nutritional Facts"; name_name="Nutritional Facts";
			
			
		}					
											}
															
		if(link_id.equals("2"))				{			name_text="Caste"; name_name="Caste";													}
		
		
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
                        <li><a href="#"><%=name_text%></a></li>
                        <li class="active">Manage&nbsp;<%=name_text%></li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Manage&nbsp;<%=name_text%></h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                <%
	if(msg.equals("insert"))
	{
	%>
   			  <div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                Inserted Successfully !!
                            </div>
     <%
	 }
	if(msg.equals("edit"))
	{
	 %>       
            
			<div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                Updated Successfully !!
                            </div>
      <%
	  }
	  if(msg.equals("delete"))
	{
	 %>       
            
			<div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                Deleted Successfully !!
                            </div>
      <%
	  }
	  %>
                    <div class="row">
                         <%
			if(status.equals("insert"))
			{
			%>
                        <div class="col-md-10">
                            <div class="panel panel-white">
                                 <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Add New</h4>
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" method="post" action="sub-categories-submit.jsp">
                                    <input name="status" type="hidden" value="<%=status%>">
									<input name="link_id" type="hidden" value="<%=link_id%>">
                                      <%
									  if(!link_id.equals("4"))	{
									  %>
                                    	 <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label">Category</label>
                                            <div class="col-sm-10">
                                            
                                                 <%
										  String query2="select * from category_tab where category_status='"+link_id+"' order by category_name asc";
												Statement st_product2=con.createStatement();
												ResultSet rs_product2=st_product2.executeQuery(query2);
										%>
                                                <select name="category" class="js-states form-control" tabindex="-1" style="width: 100%">
					<option value="" selected>--- SELECT  ---</option>
					<%
						while(rs_product2.next()) 
						{
					%>
					<option value="<%=rs_product2.getString("id")%>"><%=rs_product2.getString("category_name")%></option>
					<%
					}
					rs_product2.close();
					st_product2.close();

					%>
    		</select>
                                            </div>
                                        </div>
                                        <%}%>
                                        <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=name_text%>&nbsp;Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="category_name" id="input-Default">
                                            </div>
                                        </div>
                                       <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=name_text%>&nbsp;Rate</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" value="0" name="category_caption" id="input-Default">
                                            </div>
                                        </div>
                                       
                                        
                                        <button type="submit" class="btn btn-primary">Save</button>
                                     </form>
                                 </div>
                            </div>
                        </div>
                     <%
		}
		if(status.equals("insertn"))
			{
						
						String show_sub="";
						String query_show_sub="select category_name from subcategory_tab where category_id='"+n_id+"' order by category_name asc";						
						Statement st_sub=con.createStatement();
						ResultSet rs_sub=st_sub.executeQuery(query_show_sub);
						if(rs_sub.next())
						{
							show_sub=rs_sub.getString("category_name");
						}
						rs_sub.close();
						st_sub.close();
				
			%>
                        <div class="col-md-10">
                            <div class="panel panel-white">
                                 <div class="panel-heading clearfix">
                                    <h4 class="panel-title"><%=show_sub%></h4>
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" method="post" action="sub-categories-submit.jsp">
                                    <input name="status" type="hidden" value="<%=status%>">
									<input name="link_id" type="hidden" value="<%=link_id%>">
                                     <input name="n_id" type="hidden" value="<%=n_id%>">
                                    
                                    	 <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label">Nutrition Name</label>
                                            <div class="col-sm-10">
                                            
                                                 <%
										  String query_n_facts="select * from category_tab where category_status='1' order by category_name asc";
												Statement st_product_n_facts=con.createStatement();
												ResultSet rs_product_n_facts=st_product_n_facts.executeQuery(query_n_facts);
										%>
                                                <select name="category_name" class="js-states form-control" tabindex="-1" style="width: 100%">
					<option value="" selected>--- SELECT  ---</option>
					<%
						while(rs_product_n_facts.next()) 
						{
					%>
					<option value="<%=rs_product_n_facts.getString("id")%>"><%=rs_product_n_facts.getString("category_name")%></option>
					<%
					}
					rs_product_n_facts.close();
					st_product_n_facts.close();

					%>
    		</select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=name_text%>&nbsp;Value</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="category_caption" id="input-Default">
                                            </div>
                                        </div>
                                      
                                        <button type="submit" class="btn btn-primary">Save</button>
                                     </form>
                                 </div>
                            </div>
                        </div>
                     <%
		}
		if(status.equals("edit"))
			{
			
						String queryView="select * from subcategory_tab where category_id='"+category_id+"'";
						Statement st_productView=con.createStatement();
						ResultSet rs_productView=st_productView.executeQuery(queryView);
						
						if(rs_productView.next())

						{	
						
						String result_category_id="",result_category_name="";
						String query_category="select * from category_tab where id='"+rs_productView.getString("category")+"'";
						Statement st_product_category=con.createStatement();
						ResultSet rs_product_category=st_product_category.executeQuery(query_category);
						if(rs_product_category.next())
						{
							result_category_id=rs_product_category.getString("id");
							result_category_name=rs_product_category.getString("category_name");
						}
						rs_product_category.close();
						st_product_category.close();
			%>
            		 <div class="col-md-10">
                            <div class="panel panel-white">
                                 <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Edit </h4>
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" method="post" action="sub-categories-submit.jsp">
                                    <input name="status" type="hidden" value="<%=status%>">
                                    <input name="link_id" type="hidden" value="<%=link_id%>">
                                    <input type="hidden" name="category_id" value="<%=rs_productView.getString("category_id")%>">
                                    <%
									if(!link_id.equals("4"))
									{
									%>
                                     <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label">Category</label>
                                            <div class="col-sm-10">
                                            
                                                
                                                <select name="category" class="js-states form-control" tabindex="-1" style="width: 100%">
					<option value="<%=result_category_id%>" selected><%=result_category_name%></option>
					<%
						String queryedit="select * from category_tab where category_status='"+link_id+"' order by category_name asc";
						Statement st_productedit=con.createStatement();
						ResultSet rs_productedit=st_productedit.executeQuery(queryedit);
						while(rs_productedit.next()) 
						{
					%>
					<option value="<%=rs_productedit.getString("id")%>"><%=rs_productedit.getString("category_name")%></option>
					<%
					}
					rs_productedit.close();
					st_productedit.close();

					%>
    		</select>
                                            </div>
                                        </div>
                                        <%}%>
                                        <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=name_text%>&nbsp;Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"  value="<%=rs_productView.getString("category_name")%>"  name="category_name" id="input-Default">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=name_text%>&nbsp;Rate</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" value="<%=rs_productView.getString("category_caption")%>" name="category_caption" id="input-Default">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                     </form>
                                 </div>
                            </div>
                        </div>
            
              <%
						
					}
					rs_productView.close();
					st_productView.close();
		}
		%>    
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
                                                    <th>Nutritional Facts</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            
                                               <%
											   String query="select * from subcategory_tab where link_status='"+link_id+"' order by category_name asc";						
						Statement st_product=con.createStatement();
						ResultSet rs_product=st_product.executeQuery(query);
						
		 
		  int i=0;
		  int flag=0;
		  int incr=0;
		  String classnameNew="";
			while(rs_product.next())
						{
						String query_category_view="select * from category_tab where id='"+rs_product.getString("category")+"'";
						Statement st_product_category_view=con.createStatement();
						ResultSet rs_product_category_view=st_product_category_view.executeQuery(query_category_view);
						if(rs_product_category_view.next())
						{
							
							classnameNew=rs_product_category_view.getString("category_name");
						}
						rs_product_category_view.close();
						st_product_category_view.close();
						
						i=i+1;
						%>
              
                                            <tbody>
                                            
                                                <tr>
                                                    <th scope="row"><%=i%></th>
                                                    <td>
													<%=rs_product.getString("category_name")%>
                                                    
                                                    <%
													
											if(rs_product.getString("category_caption").length()>0)
											{
												if(rs_product.getString("category_caption").equals("0"))
												{
												%>
												(Default)
												<%
												}else{
												%>
                                                ($<%=rs_product.getString("category_caption")%>)
                                                <%
												}
											}
											%>
                                            <%
													if(!link_id.equals("4")){
													%>  -  <%=classnameNew%> 
                                                   
													<%}%>
                                            <br><br>
                                            <%
						int i_count=0;
                        String query_show_sub="select s.category_name,m.category_caption,m.category_id from sub_mirror_category_tab m,category_tab s where m.category='"+rs_product.getString("category_id")+"' and m.category_name=s.id order by m.category_name asc";	
						//out.println(query_show_sub)	;				
						Statement st_sub=con.createStatement();
						ResultSet rs_sub=st_sub.executeQuery(query_show_sub);
						while(rs_sub.next())
						{
							i_count=i_count+1;	
						    %>
                            <a onClick="return con_delete()" href="sub-categories-submit.jsp?status=deletein&link_id=<%=link_id%>&n_id=<%=rs_product.getString("category_id")%>&id=<%=rs_sub.getString("m.category_id")%>"><%=i_count%>. <%=rs_sub.getString("s.category_name")%> (<%=rs_sub.getString("m.category_caption")%>)</a> <br>
							
							<%
                        }
						rs_sub.close();
						st_sub.close();%>
                                                    </td>     
                                                    <td><a href="sub-categories.jsp?status=insertn&link_id=<%=link_id%>&n_id=<%=rs_product.getString("category_id")%>">Add Nutritional Facts</a></td>                                               
                                                    <td><a href="sub-categories.jsp?status=edit&link_id=<%=link_id%>&category_id=<%=rs_product.getString("category_id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="sub-categories-submit.jsp?status=delete&link_id=<%=link_id%>&category_id=<%=rs_product.getString("category_id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                                </tr>
                                                
                                               
                                                  <%
												  classnameNew="";
				}
				rs_product.close();
				st_product.close();

				%>
                
				<%
				if(i==0)
				{
				%>
                
                							<tr>
                                                  <th colspan="3" class="text-danger">No Data Avaliable !!</th>
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
         <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
         <script src="assets/js/pages/form-select2.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>