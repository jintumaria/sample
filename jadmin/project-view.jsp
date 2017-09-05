<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
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
        <!-- Theme Styles -->
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">

        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>

        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
		
		<script src="check.js"></script>
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
                        <li><a href="#">Project</a></li>
                        <li class="active">Search Project</li>
                    </ol>
                </div>
                <div class="page-title">
                     <div class="container">

                   </div>
                </div>
                <div id="main-wrapper" class="container">
                   <div class="row">

             <div class="col-md-12">
                 <div class="panel panel-white">
                      <div class="panel-heading clearfix">

                     </div>

		 <div class="panel-body">
		  <div id="rootwizard">
		   <div class="row m-b-lg">
							<%@include file="project-info.jsp" %>	
            <div class="col-md-12">
                <div class="panel panel-white">
                  <div class="panel-heading clearfix">
                      <h4 class="panel-title">Project - <%=projectName%></h4>
                   </div>
					
                    <div class="panel-body">
                   		<input type="hidden" name="id" value="<%=id%>" class="test-id">
                   		 <table>
						 <tr>
						 <td>Customer  </td> <td> : <%=clientName%></td>
						 </tr>
						 <tr><td colspan="2"><br></td></tr>
						 <tr>
						 <td>Project Name  </td><td> : <%=projectName%></td>
						 </tr>
						 <tr><td colspan="2"><br></td></tr>
						 <tr>
						 <td>Project No. </td><td> : <%=projectCode%></td>
						 </tr>
						 <tr><td colspan="2"><br></td></tr>
						 <tr>
						 <td>Starts on </td><td> : <%=startingDate%></td>
						 </tr>
						 <tr><td colspan="2"><br></td></tr>
						 <tr>
						 <td>Expected Date of Delivery </td><td> : <%=endingDate%></td>
						 </tr>
						 <tr><td colspan="2"><br></td></tr>
						 </table>
						 <b>Team</b> <br>
						 <%
							int j=0;
							Statement st_team=con.createStatement();
							ResultSet rs_team=st_team.executeQuery("select t.employeeId,t.role,e.firstName,e.lastName from team_tab t, employee_tab e where t.employeeId=e.employeeId and t.team='"+teamName+"' order by e.firstName, e.lastName");
							while(rs_team.next())
							{
								j=j+1;
								%> <%=j %>.&nbsp; <%=rs_team.getString("e.firstName") %> <%=rs_team.getString("e.lastName") %> [ <%=rs_team.getString("t.employeeId") %> ] <br> <%
							}
							rs_team.close();
							st_team.close();
							%>	
							<br><br>
							
							<form name="project" action="project-submit.jsp" method="post">
							<div class="row">
							<div class="form-group col-md-3">
									   <input type="text" class="form-control" name="employee" placeholder="Employee Id" value="" maxlength="9" onChange="checkAvailabilityFunction8(this,'checkDiv1','<%=teamName %>')">
							<br>
							<div class="checkDiv1"></div>
							</div>
							
							<div class="form-group col-md-3">
									   <select name="role" class="form-control"><option value="">--Select Role--</option> 
										<option value="High">High</option>
										<option value="Middle">Middle</option>
										<option value="Low">Low</option>
									   </select>
							</div>
							<div class="form-group col-md-1">
								<button type="submit" onClick="checkAvailabilityFunction8(this,'checkDiv1','<%=teamName %>')" class="btn btn-secondary">Add</button>&nbsp;&nbsp;
							</div>
							
						</div>
						</form>
				    </div>
				</div>   
            </div>
                 	
        </div></div></div>
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
        <script src="assets/plugins/jquery-mockjax-master/jquery.mockjax.js"></script>
        <script src="assets/plugins/moment/moment.js"></script>
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="assets/plugins/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
		<script src="assets/js/pages/table-data.js"></script>

    </body>

</html>

<%

}

else

{

	response.sendRedirect("sessionexpire.jsp");

}

%>