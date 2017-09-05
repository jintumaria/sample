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
                        <li class="active"><%=nameText%> Profile</li>
                    </ol>
                </div>
                
                <div class="page-title">
                    <div class="container">
                      <h3><%=nameText%> Profile</h3> 
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                 <div class="row">
					<%@include file="../jadmin/alerts.jsp"%>
                     <div class="col-md-12">
                     <div class="panel panel-white">
                     <div class="panel-body">
                         <div id="rootwizard">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user m-r-xs"></i>Personal Info</a></li>
                             <!--   <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-database m-r-xs"></i>Company Info</a></li> -->                                          
                                <li role="presentation"><a href="#tab3" data-toggle="tab"><i class="fa fa-bank m-r-xs"></i>Account Information</a></li>
                            </ul>
                          
                                    
                              <div class="progress progress-sm m-t-sm">
                                  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                  </div>
                              </div>
                            <form id="wizardForm" name="wizardForm" method="post" action="profile-submit.jsp">
								<input type="hidden" name="status" value="<%=status%>">
								<input type="hidden" name="linkId" value="<%=linkId%>">
								<input type="hidden" name="id" value="<%=id%>">
                                <div class="tab-content">
                                 <div class="tab-pane active fade in" id="tab1">
                                   <div class="row m-b-lg">
                                     <div class="col-md-6">
                                        <div class="row">
																
                                            <div class="form-group col-md-6">
                                                <label for="FirstName">First Name</label>
                                                <input type="text" class="form-control" value="<%=firstName%>" maxlength="249" required name="firstName" id="firstName" placeholder="First Name">
                                            </div>
                                             <div class="form-group  col-md-6">
                                                 <label for="Last Name">Last Name</label>
                                                 <input type="text" class="form-control col-md-6" value="<%=lastName%>"   maxlength="249" name="lastName" required id="lastName" placeholder="Last Name" >
                                             </div>
                                              <div class="form-group col-md-12">
                                                  <label for="Email">Email address</label>
                                                  <input type="email" class="form-control" value="<%=email%>"   maxlength="249" required name="email" id="email"  placeholder="Enter email" >
                                              </div>			
											  <div class="form-group col-md-12">
                                                  <label for="LocalAddress">Local Address</label>
                                                  <input type="text" class="form-control" value="<%=localAddress%>"   maxlength="249"  name="localAddress"  id="localAddress" placeholder="Local Address">
                                              </div>
											  <div class="form-group col-md-12">
                                                   <label for="PermanentAddress">Permanent Address</label>
                                                   <input type="text" class="form-control" value="<%=permanentAddress%>"   maxlength="249" name="permanentAddress" id="permanentAddress" placeholder="Permanent Address">
                                               </div>
                                                               
                                         </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="FatherName">Father's Name</label>
                                                    <input type="text" class="form-control"  value="<%=fatherName%>"  maxlength="249" name="fatherName" id="fatherName" placeholder="Father's Name">
                                                </div>
                                                <div class="form-group  col-md-6">
                                                    <label for="DateOfBirth">Date of Birth</label>
                                                    <input type="text"  maxlength="99" class="form-control date-picker" name="dateOfBirth" id="dateOfBirth" value="<%=dateOfBirth%>"  placeholder="Date of Birth">
                                                </div>
                                                 
												<div class="form-group col-md-3">
                                                    <label for="Gender">Gender</label>
                                                    <select name="gender" id="gender" class="form-control m-b-sm">
													<%
													if((status.equals("edit"))&&(gender.length()>0))
													{
													%>
													<option value="<%=gender%>" selected><%=gender%></option>
													<option value="">--- Select Gender ---</option>
													<%
													}else{
													%>
													<option value="" selected>--- Select Gender ---</option>
													<%}%>
													
													<option value="Male">Male</option>
													<option value="Female">Female</option>
											
													</select>
                                                  </div>
												<div class="form-group col-md-4">
                                                     <label for="Phone">Phone</label>
                                                     <input type="text" value="<%=phone%>"   maxlength="99" class="form-control" name="phone" id="phone" placeholder="Phone" >
                                                 </div>
                                                  <div class="form-group col-md-5">
                                                      <label for="Mobile">Mobile</label>
                                                      <input type="text" value="<%=mobile%>"   maxlength="99" class="form-control" name="mobile" id="mobile" placeholder="Mobile" >
                                                  </div>
                                                  <div class="form-group col-md-6">
                                                  <!--  <label for="Password">Password</label> -->
                                                    <input type="hidden"  maxlength="99" required class="form-control" name="password" id="password" value="<%=password%>"  placeholder="Password" >
                                                </div>
												<div class="form-group col-md-6">
                                                 <!--   <label for="ConfirmPassword">Confirm Password</label> -->
                                                    <input type="hidden"  maxlength="99" required class="form-control" name="confirmpassword" value="<%=password%>"  id="confirmpassword" placeholder="Confirm Password">
                                                </div>
                                                 </div>
                                                </div>
                                               </div>
                                                </div>
                                                <div class="tab-pane fade" id="tab2">
                                                    <div class="row">
                                                        <div class="col-md-6">
																<div class="form-group col-md-6">
                                                                    <label for="Location">Location</label>
																	   <select class="form-control m-b-sm" name="location" id="location">
																		<%
																		if((status.equals("edit"))&&(location.length()>0))
																		{
																		%>
																		<option value="<%=locationId%>" selected><%=location%>,<%=locationAddress%></option>
																		<option value="">--- Select Location ---</option>
																		<%
																		}else{
																		%>
																		<option value="" selected>--- Select Location ---</option>
																		<%}																	
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
																<div class="form-group col-md-6">
                                                                    <label for="Department">Department</label>
																	   <select class="form-control m-b-sm" name="department" id="department">
																		<%
																		if((status.equals("edit"))&&(department.length()>0))
																		{
																		%>
																		<option value="<%=departmentId%>" selected><%=department%></option>
																		<option value="">--- Select Department ---</option>
																		<%
																		}else{
																		%>
																		<option value="" selected>--- Select Department ---</option>
																		<%}																	
	         Statement stDepartment=con.createStatement();
			 ResultSet rsDepartment=stDepartment.executeQuery("SELECT name,id FROM category_tab where status='100' order by name asc");
			 while(rsDepartment.next())
			 {
																		%>
				<option value="<%=rsDepartment.getString("id")%>"><%=rsDepartment.getString("name")%></option>
			 <%}
			 rsDepartment.close();
			 stDepartment.close();
			%>	
																		</select>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="Designation">Designation</label>
                                                                    <select class="form-control m-b-sm" name="designation" id="designation">
																		<%
																		if((status.equals("edit"))&&(designation.length()>0))
																		{
																		%>
																		<option value="<%=designationId%>" selected><%=designation%></option>
																		<option value="">--- Select Designation ---</option>
																		<%
																		}else{
																		%>
																		<option value="" selected>--- Select Designation ---</option>
																		<%}	
			 String queryDesignation="SELECT name,id FROM category_tab where status='101' order by name asc";
	         Statement stDesignation=con.createStatement();
			 ResultSet rsDesignation=stDesignation.executeQuery(queryDesignation);
			 while(rsDesignation.next())
			 {
																		%>
				<option value="<%=rsDesignation.getString("id")%>"><%=rsDesignation.getString("name")%></option>
			 <%}
			 rsDesignation.close();
			 stDesignation.close();
			%>	
																		</select>
                                                                </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <!--<div class="form-group col-md-12">
                                                                <label for="EmployeeID">Employee ID</label>
                                                                <input type="text" class="form-control"  maxlength="99"  name="employeeId" id="employeeId" placeholder="Employee ID" >
                                                            </div>-->
                                                            <div class="form-group col-md-12">
                                                                <label for="DateOfJoining">Date of Joining</label>
                                                                <input type="text" value="<%=dateOfJoining%>"   maxlength="99"  class="form-control date-picker" name="dateOfJoining" id="dateOfJoining" placeholder="Date of Joining">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputQuantity">Joining Salary</label>
                                                                <input type="text" value="<%=joiningSalary%>"   maxlength="9"  class="form-control" name="joiningSalary" id="joiningSalary" placeholder="Joining Salary" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
												
                                                <div class="tab-pane fade" id="tab3">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            
                                                            <div class="form-group col-md-6">
                                                                <label for="AccountHolderName">Account Holder Name</label>
                                                                <input type="text" value="<%=accountHolderName%>"   maxlength="99"  class="form-control" name="accountHolderName" id="accountHolderName" placeholder="Account Holder Name">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="AccountNumber">Account Number</label>
                                                                <input type="text" value="<%=accountNumber%>"   maxlength="99"  class="form-control" name="accountNumber" id="accountNumber" placeholder="Account Number">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="BankName">Bank Name</label>
                                                                <input type="text" value="<%=bankName%>"   maxlength="99"  class="form-control" name="bankName" id="bankName" placeholder="Bank Name">
                                                            </div>
															 <div class="form-group col-md-6">
                                                                <label for="BankBranch">Bank Branch</label>
                                                                <input type="text" value="<%=bankBranch%>"   maxlength="99"  class="form-control" name="bankBranch" id="bankBranch" placeholder="Bank Branch">
                                                            </div>
															 <div class="form-group col-md-6">
                                                                <label for="PassportNumber">Passport Number</label>
                                                                <input type="text" value="<%=passportNumber%>"   maxlength="99"  class="form-control" name="passportNumber" id="passportNumber" placeholder="Passport Number">
                                                            </div>
															
															<div class="form-group col-md-6">
                                                                <label for="SubmitButton">&nbsp;</label><br>
																	<button type="submit" class="btn btn-success">Save Information</button>
																
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label class="f-s-12">By pressing Save Information You will Agree to the Payment <a href="#">Terms & Conditions</a></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <ul class="pager wizard">
                                                    <li class="previous"><a href="#" class="btn btn-default">Previous</a></li>
                                                    <li class="next"><a href="#" class="btn btn-default">Next</a></li>
                                                </ul>
                                            </div>
                                        </form>
                                    </div>
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