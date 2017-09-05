<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
%>
<%

String msg="";
if(request.getParameter("msg")!=null)	{	msg=request.getParameter("msg");	}
String display_page="";
	String status="",link_id="",name_text="",name_name="",id="";
	if(request.getParameter("link_id")!=null)	{	link_id=request.getParameter("link_id"); }
	
     if(link_id.equals("2"))				{			name_text="Contact Enquiries"; name_name="Contact Enquiries";	display_page="../contact/";					}
	 if(link_id.equals("1"))				{			name_text="Subscription Requests"; name_name="Subscription Requests";	display_page="../franchising/";					}
		
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
                        <li class="active">Manage <%=name_text%></li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Manage <%=name_text%></h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                <%
	
	  if(msg.equals("1"))
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
                         <div class="col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading clearfix">
                                    <h4 class="panel-title">View <%=name_text%></h4>
                                </div>
                               <div align="right" style="padding-right:20px;">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th><%=name_text%></th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                               <%
		
			 int i_1=0;
			 String selectQry="SELECT id,message FROM enquiry_tab where link_id='"+link_id+"' order by modified_date desc";
	         Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery(selectQry);
			 while(rs.next())
			 {
			 i_1=i_1+1;
			  %>
              
                                            <tbody>
                                            
                                                <tr>
                                                    <th scope="row"><%=i_1%></th>
                                                    <td><%=rs.getString("message")%></td>    
                                                    <td><a href="../include/contact-submit.jsp?link_id=<%=link_id%>&status=delete&id=<%=rs.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
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