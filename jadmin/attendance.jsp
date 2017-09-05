<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
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
                        <li><a href="#">Attendance</a></li>
                        <li class="active">Attendance</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Mark Attendance</h3>
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
					<div class="row">
					<%@include file="alerts.jsp"%>
                        <div class="col-md-6">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Search by</h4>
                                </div>
                                <div class="panel-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Location</label>
                                            <select class="form-control m-b-sm" name="location" id="location">
																		
																		<option value="" selected>--- Select Location ---</option>
																		<%																
	         Statement stLocation=con.createStatement();
			 ResultSet rsLocation=stLocation.executeQuery("SELECT name,id,address FROM location_tab where status='1' order by name asc");
			 while(rsLocation.next())
			 {
																		%>
				<option value="<%=rsLocation.getString("id")%>"><%=rsLocation.getString("name")%>,<%=rsLocation.getString("address")%></option>
			 <%}
			 rsLocation.close();
			 stLocation.close();
			%>	
											</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Date</label>
                                            <input type="text" value="<%=currentDate%>"   maxlength="99"  class="form-control date-picker" name="currentDate" id="currentDate" placeholder="Attendance Date">
                                        </div>                                        
                                        <button type="submit" class="btn btn-primary">Go</button>
                                    </form>
                                </div>
                            </div>
                        </div>
					</div>
                    <div class="row">		
					
                        <div class="col-md-12">
                            <div class="panel panel-white">                                
                                <div class="panel-body">
                                   <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>ID</th>
                                                <th>Mark</th>
												<th>Leave Type</th>
                                                <th>Comments</th>
												<th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>ID</th>
                                                <th>Mark</th>
                                                <th>Leave Type</th>
                                                <th>Comments</th>
												<th>Actions</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
										<%
										Statement stShowData=con.createStatement();
			ResultSet rsShowData=stShowData.executeQuery("select id,firstName,lastName,employeeID from employee_tab where dateOfJoining <> '00/00/0000' order by firstName asc");
			while(rsShowData.next())
			{
				COUNTDATA=COUNTDATA+1;				
				%>
                                            <tr>
                                                <td><%=COUNTDATA%></td>
                                                <td><%=rsShowData.getString("firstName")%>&nbsp;<%=rsShowData.getString("lastName")%></td>
                                                <td><%=rsShowData.getString("employeeID")%></td>
                                                <td><button type="button" class="btn btn-success">P</button>
                                                <button type="button" class="btn btn-danger active">A</button>
												</td>
                                                <td><select class="form-control m-b-sm" name="leaveType" id="leaveType">
																		
													<option value="" selected>--- Select Leave Type ---</option>
													<%																	
Statement stLeaveType=con.createStatement();
ResultSet rsLeaveType=stLeaveType.executeQuery("SELECT name,id FROM category_tab where status='2' order by name asc");
while(rsLeaveType.next())
{
													%>
<option value="<%=rsLeaveType.getString("id")%>"><%=rsLeaveType.getString("name")%></option>
<%}
rsLeaveType.close();
stLeaveType.close();
%>	
													</select></td>
                                                <td><input type="text" class="form-control" maxlength="249" value="" name="comments" id="input-Default"></td>
												<td><a href="#" title="Edit"><i class="fa fa-edit"></i></a></td>
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