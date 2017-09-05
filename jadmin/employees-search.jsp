<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>
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
        <meta name="description" content="<%=titleName%>" />
        <meta name="keywords" content="<%=titleName%>" />
        <meta name="author" content="<%=titleAuthor%>" />
        
        
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
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
     
        
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">
        <main class="page-content content-wrap">
           
            <%@include file="outer-menu.jsp"%>
             
            <%@include file="menu.jsp"%>
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="#">Employees</a></li>
                        <li class="active">Search Employees</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Search Employees</h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
					<!--<div class="row">
						<div class="col-md-12" align="right">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">+ Add New Employee </button>
							</div>
						</div>
					</div>-->
					<div class="panel-body">
                        <a href="employees.jsp"><button type="button" class="btn btn-success btn-addon m-b-sm btn-rounded"><i class="fa fa-plus"></i> Add New Employee</button></a>                                        
                    </div>
					
                    <div class="row">		
					<%@include file="alerts.jsp"%>
                        <div class="col-md-12">
                            <div class="panel panel-white">                                
                                <div class="panel-body">
                                   <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Date of Joining</th>
												<th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Date of Joining</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
										 
                                        <tbody>
										<%
										Statement stShowData=con.createStatement();
			ResultSet rsShowData=stShowData.executeQuery("select id,firstName,lastName,email,employeeID,dateOfJoining,status,lastLoginDateTime from employee_tab order by firstName,lastName asc");
			while(rsShowData.next())
			{
				COUNTDATA=COUNTDATA+1;
				spiltDate=rsShowData.getString("dateOfJoining").split("/");
				
				%>
                                            <tr>
                                                <td><%=COUNTDATA%></td>
                                                <td><%=rsShowData.getString("firstName")%>&nbsp;<%=rsShowData.getString("lastName")%> [<%=rsShowData.getString("employeeID")%>]</td>
                                                <td><%=rsShowData.getString("email")%></td>
                                                <td>
												<%
												if(!spiltDate[2].equals("0000"))
													{
														%>
														<%=spiltDate[1]%>-<%=spiltDate[0]%>-<%=spiltDate[2]%>
														<%
													}
												%>												
												</td>
                                                <td>
												<%
												if(rsShowData.getString("status").equals("YES")) {
												%>
												Active
												<%}else{%>
												Not Active
												<%
												}%>
												</td>
                                                <td><a href="employees-stat.jsp?id=<%=rsShowData.getString("id")%>"><i class="fa  fa-eye"></i></a>&nbsp;&nbsp;
												<a href="employees.jsp?status=edit&id=<%=rsShowData.getString("id")%>" title="View"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="employees-submit.jsp?status=delete&id=<%=rsShowData.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            <%
			}
			rsShowData.close();
			stShowData.close();
			
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
        <script src="assets/plugins/jquery-mockjax-master/jquery.mockjax.js"></script>
        <script src="assets/plugins/moment/moment.js"></script>
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="assets/plugins/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/js/modern.min.js"></script>
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