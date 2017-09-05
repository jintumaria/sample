<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="categories-data.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
%>
<%

	
	
						
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
                        <li><a href="#"><%=nameText%></a></li>
                        <li class="active">Manage <%=nameText%></li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Manage <%=nameText%></h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                <%@include file="alerts.jsp"%>
                    <div class="row">
                         
                        <div class="col-md-10">
                            <div class="panel panel-white">
                                 <div class="panel-heading clearfix">
                                    <h4 class="panel-title">Add New</h4>
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" method="post" action="categories-submit.jsp">
                                    <input name="status" type="hidden" value="<%=status%>">
									<input name="linkId" type="hidden" value="<%=linkId%>">
									<input name="id" type="hidden" value="<%=id%>">
                                        <div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%></label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" maxlength="249" value="<%=name%>" name="name" id="input-Default">
                                            </div>
                                        </div>   
										<%if(linkId.equals("2")){%>
										<div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%> - No of Days</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" maxlength="249" value="<%=caption%>" name="caption" id="input-Default">
                                            </div>
                                        </div> 		
										<%}if(linkId.equals("1")){%>
										<div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%> Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" maxlength="249" value="<%=address%>" name="address" id="input-Default">
                                            </div>
                                        </div> 

										<div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%> Phone</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" maxlength="249" value="<%=phone%>" name="phone" id="input-Default">
                                            </div>
                                        </div>        
										
										<div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%> Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" maxlength="249" value="<%=email%>" name="email" id="input-Default">
                                            </div>
                                        </div>   

										<div class="form-group">
                                            <label for="input-Default" class="col-sm-2 control-label"><%=nameText%> Password</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" maxlength="249" value="<%=password%>" name="password" id="input-Default">
                                            </div>
                                        </div>        																				
										<%}%>										
																				
                                                                      
                                        <button type="submit" class="btn btn-primary">Save</button>
                                     </form>
                                 </div>
                            </div>
                        </div>
                     
                         <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">View <%=nameText%></h4>
                                </div>                               
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th><%=nameText%> </th>                                                   
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                               <%
		
			 Statement stCategory=con.createStatement();
			 if(linkId.equals("1"))
			 {
				 
				 myQuery="SELECT name,id,email,phone,address,code FROM location_tab where status='"+linkId+"' order by name asc";
			 }
			 else
			 {
				 myQuery="SELECT name,id,caption FROM category_tab where status='"+linkId+"' order by name asc";
			 }
			 ResultSet rsCategory=stCategory.executeQuery(myQuery);
			 while(rsCategory.next())
			 {
			 COUNTDATA=COUNTDATA+1;
			  %>
              
                                            <tbody>
                                            
                                                <tr>
                                                    <th scope="row"><%=COUNTDATA%></th>
                                                    <td>
													
													<%=rsCategory.getString("name")%>
													<%
													if(linkId.equals("2"))
													{
														%>
														- <%=rsCategory.getString("caption")%> Days														
														<%
													}
													%>
													<%
													if(linkId.equals("1"))
													{
														%>
														[ <%=rsCategory.getString("code")%> ]
														<br>
														<%=rsCategory.getString("address")%>
														<br>
														Phone : <%=rsCategory.getString("Phone")%>
														<br>
														Email : <%=rsCategory.getString("email")%>
														<%
													}
													%>
													</td>     
                                                         
                                                   
                                                    <td><a href="categories.jsp?status=edit&id=<%=rsCategory.getString("id")%>&linkId=<%=linkId%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="categories-submit.jsp?linkId=<%=linkId%>&status=delete&id=<%=rsCategory.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                                </tr>
                                                
                                               
                                                  <%
				}
				rsCategory.close();
				stCategory.close();

				%>
                
				<%
				if(COUNTDATA==0)
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
        <script src="assets/js/modern.min.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>