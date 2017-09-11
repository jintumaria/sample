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
        <link href="../jadmin/assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>
        <link href="../jadmin/assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="../jadmin/assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        <link href="../jadmin/assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        
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
    <body class="page-header-fixed compact-menu page-horizontal-bar">
        <div class="overlay"></div>
        
        <main class="page-content content-wrap">
             <%@include file="outer-menu.jsp"%>
               
            <%@include file="menu.jsp"%>
            
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Projects</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Projects</h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Projects</h4>
                                </div>
                                <div class="panel-body">
									
                                   <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Project</th>
												<th>Role</th>
                                                <th>Time Period</th>
                                                <th>Action</th>
                                               
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Project</th>
												<th>Role</th>
                                                <th>Time Period</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </tfoot>
                                        <tbody>
											<% 
											    int i=0;
												Statement st_project=con.createStatement();
												ResultSet rs_project=st_project.executeQuery("select p.id,p.clientName,p.projectName,p.projectCode, p.startingDate,p.endingDate,p.otherInfo,p.team,p.tasks,t.role  from project_tab p, team_tab t where p.team=t.team and p.status='0' and t.status='0' and t.employeeId='FSH10' order by p.modifiedDateTime desc");
												while(rs_project.next())
												{
													i=i+1;
													%>
													<tr>
														<td><%=i%></td>
														<td><%=rs_project.getString("p.projectName")%> 
														<% if(rs_project.getString("p.projectCode").length()>0){ %>
															[ <%=rs_project.getString("p.projectCode")%> ]	
														<% } %>
														</td>
														<td><%=rs_project.getString("t.role") %></td>
														<td><%=rs_project.getString("p.startingDate")%> to <%=rs_project.getString("p.endingDate")%></td>
														<!--<td><span class="label label-primary">In Progress</span></td> -->
														<td>
														<%if(rs_project.getString("t.role").equals("High Level")) { %>
															<a>Manage Tasks</a>
														<% } %>
														</td>
													</tr>
													<%
												}
												rs_project.close();
											    st_project.close();
											%>
                                             
                                        </tbody>
                                       </table>  
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
                
            </div><!-- Page Inner -->
			 <%@include file="footer.jsp"%>
        </main><!-- Page Content -->
        
        <div class="cd-overlay"></div>
	

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
        <script src="../jadmin/assets/plugins/jquery-mockjax-master/jquery.mockjax.js"></script>
        <script src="../jadmin/assets/plugins/moment/moment.js"></script>
        <script src="../jadmin/assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="../jadmin/assets/plugins/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
        <script src="../jadmin/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="../jadmin/assets/js/modern.min.js"></script>
        <script src="../jadmin/assets/js/pages/table-data.js"></script>
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>
