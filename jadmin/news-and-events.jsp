<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>
<%@include file="news-info.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
if(session.getAttribute("admin_id")!=null)
	{
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
        <link href="assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>        
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
         <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
		
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                           
                                <div class="panel-body">
                                
                                 <%
                            	if(request.getParameter("msg")!=null)	{
				if(request.getParameter("msg").equals("0"))	{%>		
                
                 <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        Already Exists !!<br>
                                    </div>
                	<%}
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
													
									if(request.getParameter("msg").equals("4"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Duplicate Registrant ID !!
                                    </div>	<br><%}
													}			
							%>
                                
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs">
                                            <li role="presentation" class="active">&nbsp;</li>
                                                                            
                                        </ul>
                          
                                    
                                      <!--  <div class="progress progress-sm m-t-sm">
                                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>-->
                                       
                                            <div class="tab-content">
                                                <div class="tab-pane active fade in" id="tab1">
                                                  <form id="wizardForm" name="wizardForm" enctype="multipart/form-data" method="post" action="news-and-events-submit.jsp">
                                                 <%
												 if(status.equals("edit"))
												 {
												 %>
                                                 <input type="hidden" name="status" value="edit">
                                                 <input type="hidden" name="id" value="<%=id%>">
                                                 
                                                 
                                                 <%}else{%>
                                                 <input type="hidden" name="status" value="insert">
                                                  <%}%>
                                             <input type="hidden" name="link_id" value="<%=link_id%>">
                                        <div align="right"><br>
                                        <button type="submit" tabindex="30" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                       
                                        </div>
                                        
                                                   
                                                 	<div class="row m-b-lg">
                                                       		
                                                                  <div class="form-group col-md-12">
                                                                  <%
																  if(!link_id.equals("1"))
																  {
																  if(image_1_status.equals("YES"))
																  {
																  %>
                                                                  		<div align="right"><img src="../<%=image_1%>" width="150" height="200"></div>
                                                                   		<h3 align="right">Change Photo (Width : 150px, Height  : 200px)</h3> 
                                                                         <div class="row" align="right">
                                                                              <div class="form-group col-md-12">
                                                                             
                                                                                <input name="F1" type="file" />
                                                                             </div>
                                                                         </div>  
                                                                   <%}else{%>
                                                                   		<h3 align="right">Upload Photo (Width : 150px, Height  : 200px)</h3> 
                                                                         <div class="row" align="right">
                                                                              <div class="form-group col-md-12">
                                                                              
                                                                                <input name="F1" type="file" />
                                                                             </div>
                                                                         </div>  
																   
																   <%}}%>
                                                                  
                                                                       <div class="row">       
                                                                       		<!--                                                            
                                                                          <div class="form-group col-md-3">
                                                                                <label>Select News Category</label>                          								
                                                								   <select class="form-control m-b-sm" tabindex="5"  name="news_category" required>
                                                                                   
                                                                                   <%
																				   //if(news_category.length()>0)
																				   //{
																				   %>
																				    <option value="<%//=news_category%>" selected><%//=news_category%></option>
                                                                                    <option value="">-- News Category--</option>                                                                                    <%//}else{%>
                                                                                   <option value="" selected>-- News Category--</option>                                                                                     <%
																					//}%>
                                                                                    <option value="Family Apostolate">Family Apostolate</option>
                                                                                    <option value="Mathruvedhi">Mathruvedhi</option>
                                                                                    <option value="Pithrudedhi">Pithruvedhi</option>
                                                                                    <option value="Kerala Labour Movement">Kerala Labour Movement</option>
                                                                                    <option value="General News">General News</option>
                                                                                    <option value="Course Page">Course Page</option>
                                                                                    </select>                                               								
                                                                            </div>-->
                                                                           <div class="form-group col-md-3">
                                                                           <label><%=name_text%> Date</label>
                                                                             <input type="text" class="form-control date-picker" readonly tabindex="13"  required  value="<%=news_date%>"  maxlength="249" name="news_date"  placeholder="Date of Event">                                   
                                                 							  
                                                                            </div>
                                                                            <div class="form-group col-md-3">
                                                                            <label><%=name_text%> Heading</label>
                                                                            <input type="text" class="form-control" tabindex="14"  required  value="<%=news_heading%>"  maxlength="249" name="news_heading"  placeholder="News Headline">                
                                                                            </div>
                                                                            <div class="form-group col-md-12">
                                                                            <label><%=name_text%> in Short</label>
                                                                            <input type="text" class="form-control" tabindex="14"  value="<%=news_short%>"  maxlength="249" name="news_short"  placeholder="News in Short">                
                                                                            </div>
                                                                           <div class="form-group col-md-12">
                                                                           <label><%=name_text%> in Detail</label>
                                                                            <textarea id="news_describe" name="news_describe"  class="summernote form-control" rows="10" placeholder="Enter News Here..."><%=news_describe%></textarea>
<script>
$(document).ready(function() {
      $('.summernote').summernote({
        height: 300,
        onKeyup: function(e) {
           $("#news_describe").html($(this).code());
        }
      });
});</script>
                                                                            </div>
                                                                           
                                                                        </div>   
                                                                       
                                                                            
                                                                           
                                                                        </div>   
                                                                         
                                                                                                                                 
                                                                 </div>
                                                          
                                                       </form>  	
                                                    </div>
                                                
                                                </div>
                                                 <br><br>
                                                        <div class="col-md-12">
                                                       <div class="table-responsive">
                                   
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>&nbsp;</th>                                            
                                                <th>Info</th>                                            
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>&nbsp;</th>                                            
                                                <th>Info</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <%
						int i=0;
			  			int flag_count=0;
						String query_show="select * from news_tab order by modified_date desc";
						Statement st_news_show=con.createStatement();
						ResultSet rs_news_show=st_news_show.executeQuery(query_show);
						while(rs_news_show.next())
						{
						i=i+1;
						
					
%>
                                        
                                            <tr>
                                                <td><%=i%></td>
                                                <th><%
												if(rs_news_show.getString("image_1_status").equals("YES")){%><img src="../<%=rs_news_show.getString("image_1")%>" width="150" height="200"><%}
												%></th>                                            
                                               <td>
												 
                                                <%
												if(rs_news_show.getString("news_heading").length()>0){%>
                                                <span><%=rs_news_show.getString("news_heading")%> </span><br>
												<%}
												if(rs_news_show.getString("news_describe").length()>0){%>
                                                <span><%=rs_news_show.getString("news_describe")%> </span><br>
												<%}
												
                                                if(rs_news_show.getString("news_category").length()>0){%>
                                                
                                                Category : <%=rs_news_show.getString("news_category")%> <br>
                                              
                                                <%}
												if(rs_news_show.getString("news_date").length()>0){%>
                                                <br> News Date : 
                                                <%
												/*********************FORMAT DATE*****************************************/												
                                                SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy");  
												SimpleDateFormat dt1 = new SimpleDateFormat("dd MMMMM yyyy");                                              
                                                Date date1 = dt.parse(rs_news_show.getString("news_date"));
                                                /************************************************************************/
												%>
                                                <%=dt1.format(date1)%> 
												<%}%><br>
                                           
                                             
                                                </td>                                                
                                               
                                                <td>
                                                
                                                <a href="news-and-events.jsp?link_id=<%=link_id%>&status=edit&id=<%=rs_news_show.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="news-config-submit.jsp?link_id=<%=link_id%>&status=delete&id=<%=rs_news_show.getString("id")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            <%
						//agreement_signed="";
						}
						st_news_show.close();
						rs_news_show.close();
						
						if(i==0)
						{
					
%>											
											 <tr>
                                                <td colspan="8" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
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
        <script src="assets/plugins/summernote-master/summernote.min.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>        
        <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/js/pages/form-select2.js"></script>
        <script src="assets/js/pages/form-elements.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>