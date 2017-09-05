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
        <link rel="SHORTCUT ICON" href="assets/images/admin.png"/>
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
        <link href="../jadmin/assets/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        
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
           <li class="active">Notice Board</li>
       </ol>
   </div>
    <div class="page-title">
     <div class="container">
       <h3>Notice Board</h3> 
     </div>
   </div>          
   <div id="main-wrapper" class="container">
      <div class="row">
		<%@include file="../jadmin/alerts.jsp"%>
		<div class="col-lg-12 col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading">
                        <h4 class="panel-title">Noticeboard</h4>
                </div>
                <div class="panel-body">
					  <div class="table-responsive project-stats">  
                                       <table class="table">
                                           <thead>
                                               <tr>
                                                   <th>#</th>
												   <td>&nbsp;</td>
												   <th>News</th>
											   </tr>
                                           </thead>
                                           <tbody>
										   <%
                                    	 int i=0;
										String newsQuery="select id,caption,category,strDate,name,infoShort, infoDescribe,image1,image1Status,createdDate,modifiedDateTime,readStatus from  noticeboard_tab where  employeeId='"+employeeId+"' and status='ENABLED' order by modifiedDateTime desc";
										//System.out.println(newsQuery);
										Statement stNewsView=con.createStatement();
										ResultSet rsNewsView=stNewsView.executeQuery(newsQuery);
										while(rsNewsView.next())
										 {
											i=i+1;
											%>
											<tr>
												<td><%=i%></td>
												<td><%
			                                    if(rsNewsView.getString("image1Status").equals("YES"))
			                                    { %>
				                                <img src="documents/<%=rsNewsView.getString("image1") %>" class="img-circle" width="100" height="120" alt="">	
                                                           
											  <%} %></td>
												<td> 
													<h3><%=rsNewsView.getString("name") %> : <%
													  String[] temp;
													  String delimiter = "-";
													  temp = rsNewsView.getString("strDate").split(delimiter);
													%>
	                                                <%=temp[2]%>-<%=temp[1]%>-<%=temp[0]%> </h3>
													<p><%=rsNewsView.getString("infoShort") %></p>
													<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">More</button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">
															<center><%=rsNewsView.getString("name") %> : <%=temp[2]%>-<%=temp[1]%>-<%=temp[0]%></center> </h4>
                                                        </div>
                                                        <div class="modal-body">
															<table width="100%">
															<tr><td>
															<img src="documents/<%=rsNewsView.getString("image1") %>" class="img" width="300" height="320" alt=""> </td>	
                                                            <td><%=rsNewsView.getString("infoDescribe") %>
															</td></tr></table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                           <!-- <button type="button" class="btn btn-success">Save changes</button> -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
													<div align="right">
													Posted on : <%=rsNewsView.getString("modifiedDateTime") %>
													</div>
												</td>
											</tr>
									  <% }
											rsNewsView.close();
											stNewsView.close();
									  %>	 
                                            <% if(i==0){%><tr> <td colspan="3" ><center><font color="red">No data available!!!</font></center></td> </tr> <% } %> 
                                           </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
		
		
      </div>
               
			</div><!-- Row -->
		</div><!-- Main Wrapper -->
	 
	</div><!-- Page Inner -->
                
                 <%@include file="footer.jsp"%>
            </div><!-- Page Inner -->
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
        <script src="../jadmin/assets/js/modern.min.js"></script>
        <script src="../jadmin/assets/js/pages/profile.js"></script>
		 <script src="../jadmin/assets/js/pages/calendar.js"></script>
		 
		  <script src="../jadmin/assets/js/pages/inbox.js"></script>
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>
