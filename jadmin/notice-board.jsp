<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="employees-data.jsp"%>
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
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        
        <link href="assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>        
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
         <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        
     <script type="text/javascript">
		function checkImage(target) {
			
		    if(target.files[0].type.indexOf("image") == -1) {
		        document.getElementById("photoLabel").innerHTML = "File not supported";
		        return false;
		    }
		    if(target.files[0].size > 512000) {
		        document.getElementById("photoLabel").innerHTML = "Image too big (max 500kb)";
		        return false;
		    }
		    
		    document.getElementById("photoLabel").innerHTML = "";
		    return true;
		}
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
                        <li><a href="#">Notice Board</a></li>
                        
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Add Notice Board</h3>
                    </div>
                </div>
				 <div id="main-wrapper" class="container">
					 <%@include file="alerts.jsp"%>
					 <div class="row">						
                        <div class="col-md-12">
                            <div class="panel panel-white">                                
                                <div class="panel-body">
                                
                                	<div id="rootwizard">
                                   <ul class="nav nav-tabs">
                                       <li role="presentation" class="active">&nbsp;</li>
                                   </ul>
                                      <div class="tab-content">
                                      <div class="tab-pane active fade in" id="tab1">
									  <form id="wizardForm" name="wizardForm" enctype="multipart/form-data" method="post" action="notice-board-submit.jsp">
									  <%
                                          if(request.getParameter("status")!=null)
                                        	  status=request.getParameter("status");
                                          
                                          if(request.getParameter("caption")!=null)
                                        	  caption=request.getParameter("caption");
										  if(status.equals("edit"))
										 {
											 
										 %>
										 <%@include file="notice-board-data.jsp"%>
                                             <input type="hidden" name="status" value="edit">
                                             <input type="hidden" name="id" value="<%=caption%>">
                                          <%}else{%>
                                             <input type="hidden" name="status" value="insert">
                                          <%}%>
                                      <div align="right"><br>
                                       		<button type="submit" tabindex="30" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                       </div>
                                        <div class="row m-b-lg">
                                          
                                          <div class="form-group col-md-12">
                                                       
                                          	<%
										  if(image1Status.equals("YES"))
										  {
										  %>
										  <br>
                                          	<div align="right"><img src="../login/documents/<%=image1 %>" width="150" height="200"></div>
                                            <h3 align="right">Change Document (Maximum file size : 500kb)</h3> 
                                            <div class="row" align="right">
                                                 <div class="form-group col-md-12">
                                                
                                                   <input name="F1" type="file" onchange="checkImage(this)" />
												    <label id="photoLabel" style="color: red;"></label>
                                                </div>
                                            </div>  
                                           <%}else{%>
                                            <h3 align="right">Upload Document (Maximum file size : 500kb)</h3> 
                                            <div class="row" align="right">
                                                 <div class="form-group col-md-12">
                                                 
                                                   <input name="F1" type="file" onchange="checkImage(this)" />
												    <label id="photoLabel" style="color: red;"></label>
                                                </div>
                                            </div>  
											<%}%>
											<div class="row">       
                                              <div class="col-md-4">		                                                            
                                              
                                                  <label>Location</label>                          								
                  								   <select class="form-control m-b-sm" tabindex="5"  name="location">
                  								   		<%
                  								   		Statement stCategory=con.createStatement();
                  								   		ResultSet rsCategory=null;
                  								   		if(status.equals("edit")&&Integer.parseInt(location)!=0)
                  								   		{
                  								   		myQuery="SELECT name,address FROM location_tab where status='"+1+"' and id="+location;
                  								  		rsCategory=stCategory.executeQuery(myQuery);
                  								  		if(rsCategory.next())
                  								  		{
                  								  		%>
                  								   		<option value="<%=location %>"><%=rsCategory.getString("name") %> <%=rsCategory.getString("address")%></option>
                  								   		<%
                  								  		}
                  								   		}
                  								   		else
                  								   		{
                  								   		%>
                  								   		<option value="">--Select Location--</option>
                  								   		<%
                  								   		}
                  								   		
                  								   		myQuery="SELECT name,id,address FROM location_tab where status='"+1+"' order by name asc";
                  								  		rsCategory=stCategory.executeQuery(myQuery);
		                  								while(rsCategory.next())
		                  								{
		                  									%>
		                  									<option value="<%=rsCategory.getString("id")%>"><%=rsCategory.getString("name")%> <%=rsCategory.getString("address")%></option>
		                  									<%
		                  								}
                  								   		%>
                                                   		
                                                      </select>                                               								
                                              </div>
                                              <div class="col-md-4">
                                        		
                                                  <label>Department</label>                          								
                  								   <select class="form-control m-b-sm" tabindex="5"  name="department">
                  								   		<%
                  								   		if(status.equals("edit")&&Integer.parseInt(department)!=0)
                  								   		{
                  								   		myQuery="SELECT name FROM category_tab where status='"+100+"' and id="+department;
                  								  		rsCategory=stCategory.executeQuery(myQuery);
                  								  		if(rsCategory.next())
                  								  		{
                  								  		%>
                  								   		<option value="<%=department %>"><%=rsCategory.getString("name") %></option>
                  								   		<%
                  								  		}
                  								   		}
                  								   		else
                  								   		{
                  								   		%>
                                                      <option value="">--Select Department--</option>
                  								   		<%
                  								   		}
                  								   		stCategory=con.createStatement();
                  								   		myQuery="SELECT name,id FROM category_tab where status='"+100+"' order by name asc";
                  								  		rsCategory=stCategory.executeQuery(myQuery);
		                  								while(rsCategory.next())
		                  								{
		                  									%>
		                  									<option value="<%=rsCategory.getString("id")%>"><%=rsCategory.getString("name")%></option>
		                  									<%
		                  								}
                  								   		%>
                                                      </select>                                               								
                                              </div>
                                               <div class="col-md-4">
                                               
                                                   <label>Category</label>                          								
                   								   <select class="form-control m-b-sm" tabindex="5"  name="news_category" required>
                   								   		<%
                  								   		if(status.equals("edit"))
                  								   		{
                  								   		myQuery="SELECT name FROM category_tab where status='"+50+"' and id="+category;
                  								  		rsCategory=stCategory.executeQuery(myQuery);
                  								  		if(rsCategory.next())
                  								  		{
                  								  		%>
                  								   		<option value="<%=category %>"><%=rsCategory.getString("name") %></option>
                  								   		<%
                  								  		}
                  								   		}
                  								   		else
                  								   		{
                  								   		%>
                                                      <option value="">--Select Category--</option>
                  								   		<%
                  								   		}
                  								   		stCategory=con.createStatement();
                  								   		myQuery="SELECT name,id FROM category_tab where status='"+50+"' order by name asc";
                  								  		rsCategory=stCategory.executeQuery(myQuery);
		                  								while(rsCategory.next())
		                  								{
		                  									%>
		                  									<option value="<%=rsCategory.getString("id")%>"><%=rsCategory.getString("name")%></option>
		                  									<%
		                  								}
                  								   		%>
                                                       
                                                       </select>                                               								
                                               </div>
                                                                       
                                            <div class="col-md-3">    
                              				
                                                  <label>Date</label>
                                                  <input type="text" class="form-control date-picker" readonly tabindex="13"  required  value="<%=strDate%>"  maxlength="249" name="news_date"  placeholder="Date of Event">                                   
                        					
                        					</div>
                           					<div class="col-md-9">
                                 				
                                                      <label>Heading</label>
                                                      <input type="text" class="form-control" tabindex="14"  required  value="<%=name %>"  maxlength="249" name="news_heading"  placeholder="News Headline"  required>                
                                               
                                            </div>  
											<div class="form-group col-md-12">
                                            <label>in Short</label>
                                            <input type="text" class="form-control" tabindex="14"  required  value="<%=infoShort %>"  maxlength="249" name="news_short"  placeholder="News in Short"  required>                
                                            </div>
                           					<div class="form-group col-md-12">
                                               <label>in Detail</label>
                                                <textarea id="news_describe" name="news_describe"  class="summernote form-control" rows="10" placeholder="Enter News Here..."> <%=infoDescribe %></textarea>
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
                                                  </div></div></div>
                                       
                                        </div></div>
								</div>
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
						int I=0;
			  			
						String queryShow="select distinct(createdDate),location, department, category,caption ,strDate,name,infoShort, infoDescribe,image1,image1Status,createdDate,modifiedDateTime from noticeboard_tab order by modifiedDateTime desc";
						Statement stNewsShow=con.createStatement();
						ResultSet rsNewsShow=stNewsShow.executeQuery(queryShow);
						while(rsNewsShow.next())
						{
						I=I+1;
				%>
				<tr>
                                                <td><%=I%></td>
                                                <th><%
												if(rsNewsShow.getString("image1Status").equals("YES")){%><img src="../login/documents/<%=rsNewsShow.getString("image1")%>" width="150" height="200"><%}
												%></th>
												                                            
                                               <td>
												<%
												if(rsNewsShow.getString("name").length()>0){%>
                                                <span><%=rsNewsShow.getString("name")%> </span><br><br>
												<%}
												if(rsNewsShow.getString("infoShort").length()>0){%>
                                                <span><%=rsNewsShow.getString("infoShort")%> </span><br><br>
												<%}
												if(rsNewsShow.getString("infoDescribe").length()>0){%>
                                                <span><%=rsNewsShow.getString("infoDescribe")%> </span>
												<%}
												%>
                                                <br><br>
                                                <%
                                                if(rsNewsShow.getInt("location")!=0)
                                                {
                                                	myQuery="SELECT name,address FROM location_tab where status='"+1+"' and id="+rsNewsShow.getString("location");
                                                	rsCategory=stCategory.executeQuery(myQuery);
	          								  		if(rsCategory.next())
	          								  		{
                                                	%>
                                                	Location : <%=rsCategory.getString("name") %> <%=rsCategory.getString("address") %> 
                                                	<%
	          								  		}
                                                }
                                                else
                                                {
                                                	%>
                                                	Location : All
                                                	<%
                                                }
                                                %> <br><br>
                                                 <%
                                                if(rsNewsShow.getInt("department")!=0)
                                                {
                                                	myQuery="SELECT name FROM category_tab where status='"+100+"' and id="+rsNewsShow.getString("department");
                                                	rsCategory=stCategory.executeQuery(myQuery);
	          								  		if(rsCategory.next())
	          								  		{
                                                	%>
                                                	Department : <%=rsCategory.getString("name") %>  
                                                	<%
	          								  		}
                                                }
                                                else
                                                {
                                                	%>
                                                	Department : All
                                                	<%
                                                }
                                                %> <br><br>
                                                <%
                                                if(rsNewsShow.getInt("category")!=0)
                                                {
                                                	myQuery="SELECT name FROM category_tab where status='"+50+"' and id="+rsNewsShow.getString("category");
                                                	rsCategory=stCategory.executeQuery(myQuery);
	          								  		if(rsCategory.next())
	          								  		{
                                                	%>
                                                	Category : <%=rsCategory.getString("name") %>  
                                                	<%
	          								  		}
                                                } %>
                                                 <br>
                                              
                                                <%
												if(rsNewsShow.getString("strDate").length()>0){%>
                                                <br> News Date :
                                                <%
												
												  String[] temp;
												  String delimiter = "-";
												  temp = rsNewsShow.getString("strDate").split(delimiter);
												%>
                                                <%=temp[2]%>-<%=temp[1]%>-<%=temp[0]%> 
												<%}%><br>
                                               <br>
                                                <b>Last Modified Date : <%=rsNewsShow.getString("modifiedDateTime")%></b>
                                                </td>                                                
                                               
                                                <td>
                                                
                                                <a href="notice-board.jsp?status=edit&caption=<%=rsNewsShow.getString("caption")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
                                                <a href="notice-board-config-submit.jsp?status=delete&caption=<%=rsNewsShow.getString("caption")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
				
				<%      }
						stNewsShow.close();
						rsNewsShow.close();
						
						if(I==0)
						{
						%>											
						<tr><td colspan="8" align="center" style="color:#FF0000;">No Data Avaliable !!!</td></tr>
						<%}%>
										
										</tbody>
										</table>
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
                </div> <%@include file="footer.jsp"%>
			</div>
	</main><%@include file="footer-nav.jsp"%>
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
        
         <script src="assets/js/pages/form-elements.js"></script>
        <script src="assets/plugins/summernote-master/summernote.min.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
        
    </body>
</html>
<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>