<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="client-info.jsp"%>
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
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
         <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
		
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>   
		<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
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
            <div class="navbar">
                <div class="navbar-inner container">
                    <div class="sidebar-pusher">
                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic push-sidebar">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>
                    <div class="logo-box">
                        <a href="home.jsp" class="logo-text"><span><%=titleName%></span></a>
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
                        <li><a href="#">Clients</a></li>
                        <li class="active">Manage Projects</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
						<h3>Manage Projects</h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                 <%
                            	if(request.getParameter("msg")!=null)	{
				
				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
					if(request.getParameter("msg").equals("2"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
									if(request.getParameter("msg").equals("3"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Deleted Successfully !!
                                    </div>	<br><%}
													}			
							%>
                                <%@include file="project-info.jsp" %>
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs">
                                            <li role="presentation" class="active"><h4></h4>&nbsp;</li>
                                        </ul>
                                         <div class="tab-content">
                                         <div class="tab-pane active fade in" id="tab1">
                                                <script src="client.js"></script>
                                            <form id="wizardForm" name="wizardForm" method="post" action="projects-submit.jsp">
                                                 <%
												int teamId=0;
												if(status.equals("edit"))
												 {
												 %>
                                                 <input type="hidden" name="status" value="edit" class="test-status">
                                                 <input type="hidden" name="id" value="<%=id%>" class="test-id">
                                                 
                                                 
                                                 <%}else{%>
														<input type="hidden" name="status" value="insert" class="test-status">
														
														<%
														teamName="T";
														Statement st_team_name=con.createStatement();
														ResultSet rs_team_name=st_team_name.executeQuery("select max(team) as team from project_tab");
														if(rs_team_name.next())
														{
														if(rs_team_name.getString("team")!=null&& rs_team_name.getString("team").length()>1)
															{
															teamId=Integer.parseInt((rs_team_name.getString("team")).substring(1));
															}
														}
														rs_team_name.close();
														st_team_name.close();
														teamId=teamId+1;
														teamName=teamName+teamId;
														
																									
												 }	%>
												  
												 
												<input type="hidden" name="team" value="<%=teamName%>" class="test-team">	
													
												<div align="right">
													<br>
													<button type="submit" class="btn btn-primary submit-save">Save</button>&nbsp;&nbsp;
													<br><br>
												</div>
												 <div class="row m-b-lg">
													<div class="col-md-12">
														<div class="row">
															<div class="form-group col-md-5">
																		<label for="exampleInputName"></label>
																		<%
																		String query_inv_customer="select clientName,id from client_tab where userId='"+session.getAttribute("admin_id")+"'  and clientCategory='1' order by clientName asc";
																		//out.println(query_inv_customer);
																		Statement st_inv_customer=con.createStatement();
																		ResultSet rs_inv_customer=st_inv_customer.executeQuery(query_inv_customer);
																		%>
																		<select name="clientName"  required id="client_name" onChange="checkAvailabilityFunction1('checkDiv',document.wizardForm.client_name.value)" class="js-states form-control test-client" tabindex="-1" style="width: 100%">
																		<%
																		if(status.equals("edit"))
																		{
																		%>
																		<option value="<%=clientName%>" selected><%=clientName %></option>
																		<option value="" >--- Select Customer  ---</option>
																		<%
																		}
																		else
																		{
																		%>
																		<option value="" selected>--- Select Customer  ---</option>
																		<%
																		}
																		while(rs_inv_customer.next()) 
																		{
																		%>
																		<option value="<%=rs_inv_customer.getString("clientName")%>"><%=rs_inv_customer.getString("clientName")%></option>
																		<%
																		}
																		rs_inv_customer.close();
																		st_inv_customer.close();
																		
																		%>
																		</select>        
															</div>
															<div class="form-group col-md-2">
																<br>
																<a href="clients.jsp?page=project"><button type="button" class="btn btn-secondary">Add New Customer +</button></a>
															</div>
															<div class="form-group col-md-5">
															 <div id="checkDiv">   
																<label for="exampleInputEmail"></label>
															 </div>
															</div>
														</div>
													<div class="row">
														<div class="form-group col-md-8">
															<input type="text" class="form-control test-project-name" required name="projectName" placeholder="Project Name" value="<%=projectName%>" value="" maxlength="249">
														</div>
														<div class="form-group col-md-2">
															<input type="text" class="form-control test-project-code" name="projectNumber" placeholder="Project Number" value="<%=projectCode%>" maxlength="99">
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-3">
															<input type="text" class="form-control date-picker test-starting-date"  value="<%=startingDate%>"  name="startingDate" placeholder="Starts on" maxlength="19" required>
														</div>
														<div class="form-group col-md-3">
															<input type="text" class="form-control date-picker test-ending-date"  value="<%=endingDate%>"  name="endingDate" placeholder="Expected Date of Delivery" maxlength="19" required>
														</div>
													</div>	
												
													<div class="row">
														<div class="form-group col-md-10">
																    <textarea rows="3" cols="10" class="form-control test-special-notes" name="specialNotes" placeholder="Special Notes"><%=specialNotes %> </textarea>
															</div>
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
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-white">
									 <div class="panel-heading clearfix">
									   <h4 class="panel-title">Projects</h4>
								     </div>
									<div class="panel-body">
										<div id="rootwizard">
											<div class="col-md-12">
												<div class="row">
													<div class="form-group col-md-12">
														 <div class="table-responsive">
															<table id="example" class="display table" style="width: 100%; cellspacing: 0;">
																	<thead>
																		<tr>
																			<th>#</th>
																			<th>Project</th>
																			<th>Customer</th>
																			<th>Time Period</th>
																			<th>Actions</th>
																		</tr>
																	</thead>
																	<tfoot>
																		<tr>
																			<th>#</th>
																			<th>Project</th>
																			<th>Customer</th>
																			<th>Time Period</th>
																			<th>Actions</th>
																		</tr>
																	</tfoot>
																	<tbody>
																<%
																int i=0;
																Statement st_project=con.createStatement();
																ResultSet rs_project=st_project.executeQuery("select id,clientName,projectName, projectCode,startingDate, endingDate,otherInfo,team, projectType, tasks from project_tab order by endingDate");
																while(rs_project.next())
																{
																	i=i+1;
																%>
																	<tr>
																		<td><%=i%></td>
																		<td><%=rs_project.getString("projectName") %>
																		<% if(rs_project.getString("projectCode")!=null&&rs_project.getString("projectCode").length()>0) { %> (<%=rs_project.getString("projectCode")%> )<%  } %> </td>
																		<td><%=rs_project.getString("clientName") %>
																		</td>
																		<td><%=rs_project.getString("startingDate") %> to <%=rs_project.getString("endingDate") %></td>
																		
																		<td>
																		<a href="project-view.jsp?status=view&id=<%=rs_project.getString("id")%>" title="View"><i class="fa fa-eye"></i></a>&nbsp;&nbsp;
																		
																		<a href="projects.jsp?status=edit&id=<%=rs_project.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;

																		<a href="projects-submit.jsp?status=delete&id=<%=rs_project.getString("id")%>&team=<%=rs_project.getString("team")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i>
																		</td>
																	</tr>
															  <%}
																rs_project.close();
																st_project.close();
															  %>	
																		
																	</tbody>
																</table>
															 </div>
														</div>
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
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/js/pages/form-select2.js"></script>
        <!--<script src="assets/js/mytest.js"></script> -->
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>