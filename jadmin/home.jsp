<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="include/display-count.jsp"%>

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
        <link href="assets/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        
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
                        <li class="active">Dashboard</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <h3>Dashboard</h3>
                    </div>
                </div>
                <%@include file="payments.jsp" %>
             	<div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                <a href="employees-search.jsp">
                                    <div class="info-box-stats">
                                        <p class="counter"><%=employee_count %></p>
                                        <span class="info-box-title">Employees</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-users"></i>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                    <div class="info-box-stats">
                                        <p><%=session.getAttribute("admin_currency")%>&nbsp;<span class="counter"><%=tot_calculate_1%></span></p>
                                        <span class="info-box-title">Total Sales</span>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                <a href="invoice-owing.jsp">
                                    <div class="info-box-stats">
                                        <p><%=session.getAttribute("admin_currency")%>&nbsp;<span class="counter"><%=tot_calculate_3%></span></p>
                                        <span class="info-box-title">Total Amount Owing</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-eye"></i>
                                    </div>
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            </div>
                                        </div>
                                    </div> </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                <a href="invoices-search.jsp">
                                    <div class="info-box-stats">
                                        <p><span class="counter"><%=invoice_count%></span></p>
                                        <span class="info-box-title">No Of Invoices</span>
                                    </div>
                                  <div class="info-box-icon">
                                        <i class="icon-basket"></i>
                                    </div>
                                    
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            </div>
                                        </div>
                                    </div></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel info-box panel-white">
                                <div class="panel-body">
                                <a href="clients.jsp">
                                    <div class="info-box-stats">
                                        <p class="counter"><%=client_count%></p>
                                        <span class="info-box-title">Customers</span>
                                    </div>
                                    <div class="info-box-icon">
                                        <i class="icon-users"></i>
                                    </div>
                                    
                                    <div class="info-box-progress">
                                        <div class="progress progress-xs progress-squared bs-n">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                                
                            </div>
                            
                        </div>
                        
                        
                    </div><!-- Row -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
				                           <!--  <div class="row">
				                             	<div class="col-sm-12">
				                             		<%
				                             		 String currDate = new SimpleDateFormat("MM-dd-yyyy-HH:mm").format(new Date());
				                             	     out.println(currDate);
				                             	     
				                             	     currDate = new SimpleDateFormat("MM-dd-yyyy-kk:mm").format(new Date());
				                             	     out.println(currDate);
				                             	     				                             	     
				                             		%>
				                             	</div>
				                             </div> -->
                                <div class="row">
                                    <div class="col-sm-8">
                                    		<%
                                    		if(session.getAttribute("admin_email")!=null)
                                    		{
                                    			attendeeEmail=session.getAttribute("admin_email").toString();
                                    		}
                                    		%>
											<div class="panel-body">
												<iframe src="https://calendar.google.com/calendar/embed?src=<%=attendeeEmail %>&ctz=Asia/Calcutta" style="border: 0" width="700" height="430" frameborder="0" scrolling="no"></iframe>
                 							
											</div>
									
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="stats-info">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">Attendance %</h4>
                                                
                                            </div>
                                             <div class="panel-body">
                                            <div align="right">
                                            	<form action="home.jsp" method="post">
                                            	<%
                                            	int P_YEAR=0,P_MONTH=0;
                                                Calendar now = Calendar.getInstance();
                                                if(now.get(Calendar.MONTH)==0)
                                                {
                                                	P_YEAR=now.get(Calendar.YEAR)-1;
                                                }
                                                else
                                                {
                                                	P_YEAR=now.get(Calendar.YEAR);
                                                }
                                                P_MONTH=now.get(Calendar.MONTH);
                                                
                                               
                                            	int START_YEAR=0;
                                            	
                                            	String year=P_YEAR+"";
                                            	Statement stYear=con.createStatement();
                                            	ResultSet rsYear=stYear.executeQuery("SELECT min(date) FROM check_tab");
                                            	if(rsYear.next())
                                            	{
                                            		year=rsYear.getString("min(date)");
                                            		
                                            		year=year.substring(0,4);
                                                	START_YEAR=Integer.parseInt(year);
                                            	}
                                            	else
                                            	{
                                            		START_YEAR=P_YEAR;
                                            	}
                                            	stYear.close();
                                            	
                                            	%>
                                            	
                                                	
                                                	<select name="month" >
	                                                	<option>--Month--</option>
	                                                	<option value="01">January</option>
	                                                	<option value="02">February</option>
	                                                	<option value="03">March</option>
	                                                	<option value="04">April</option>
	                                                	<option value="05">May</option>
	                                                	<option value="06">June</option>
	                                                	<option value="07">July</option>
	                                                	<option value="08">August</option>
	                                                	<option value="09">September</option>
	                                                	<option value="10">October</option>
	                                                	<option value="11">November</option>
	                                                	<option value="12">December</option>
                                                	</select>
                                                	<select name="year">
	                                                	<option>--Year--</option>
	                                                	<%
	                                                	for(int i=START_YEAR;i<=P_YEAR;i++)
	                                                	{
	                                                		%>
	                                                		<option value="<%=i %>"><%=i %></option>
	                                                		<%
	                                                	}
	                                                	%>
	                                                	
                                                	</select>
                                                	<button type="submit" class="btn btn-success"><i class="fa fa-search"></i></button>
                                                </form>
                                                </div>
                                           
                                            <%
                                            
                                            if(request.getParameter("year")!=null) 	{ 	P_YEAR=Integer.parseInt(request.getParameter("year"));		}
                                            if(request.getParameter("month")!=null) { 	P_MONTH=Integer.parseInt(request.getParameter("month"));	}
                                            
                                            String fromDate=P_YEAR+"-"+P_MONTH+"-01";
                                            String toDate=P_YEAR+"-"+P_MONTH+"-32";
                                            
                                            DateFormat dtDestinationToDate = new SimpleDateFormat("yyyy-MM-dd");	
                                            
                                            Date fDate = dtDestinationToDate.parse(fromDate);
                                            fromDate=dtDestinationToDate.format(fDate);
                                            
                                            Date tDate = dtDestinationToDate.parse(toDate);
                                            toDate=dtDestinationToDate.format(tDate);
                                            
        									
                                            String monthName="";
                                            if(P_MONTH==1) 			{  	monthName="January";     }
                                            else if(P_MONTH==2) 	{   monthName="February";    }
                                            else if(P_MONTH==3) 	{ 	monthName="March";       }
                                            else if(P_MONTH==4) 	{   monthName="April";       }
                                            else if(P_MONTH==5) 	{   monthName="May";         }
                                            else if(P_MONTH==6) 	{   monthName="June";        }
                                            else if(P_MONTH==7) 	{   monthName="July";        }
                                            else if(P_MONTH==8) 	{   monthName="August";      }
                                            else if(P_MONTH==9) 	{  	monthName="September";   }
                                            else if(P_MONTH==10)	{  	monthName="October";     }
                                            else if(P_MONTH==11)	{  	monthName="November";    }
                                            else if(P_MONTH==12)	{ 	monthName="December";    }
                                            %>
                                            
                                            	<center><b> <%=monthName %> <%=P_YEAR %></b></center>
                                                <ul class="list-unstyled">
                                                	<%
                                                	
                                                	Statement stEmployee=con.createStatement();
													ResultSet rsEmployee=stEmployee.executeQuery("select id,firstName, lastName, employeeId from employee_tab where status='YES'");
													while(rsEmployee.next())
													{
														long grandTotalTime=0;
														long hours=0, minutes=0, seconds=0;
														Statement stTodayStatus=con.createStatement();
														ResultSet rsTodayStatus=stTodayStatus.executeQuery("select distinct(date) from check_tab where employeeId='"+rsEmployee.getString("id")+"' and modifiedDateTime between '"+fromDate+"' and '"+toDate+"' order by modifiedDateTime asc");
														while(rsTodayStatus.next())
														{
															long beforeTime=0,afterTime=0,totalTime=0;
															Date dateShow=null;
															
															Statement stStatus=con.createStatement();
															ResultSet rsStatus=stStatus.executeQuery("select modifiedDateTime,status from check_tab where date='"+rsTodayStatus.getString("date")+"' and  employeeId='"+rsEmployee.getString("id")+"' order by modifiedDateTime asc");
															while(rsStatus.next())
															{
																//dateShow=dtSourceDate.parse(rsStatus.getString("modifiedDateTime"));
																dateShow=rsStatus.getTimestamp("modifiedDateTime");
																
																if(rsStatus.getString("status").toUpperCase().equals("CHECKIN"))
																{
																	if(beforeTime==0)
																		beforeTime=dateShow.getTime();
																}
																else if(rsStatus.getString("status").toUpperCase().equals("BREAKIN"))
																{
																	beforeTime=dateShow.getTime()-beforeTime;
																	totalTime=totalTime+beforeTime;
																	beforeTime=0;
																}
																else if(rsStatus.getString("status").toUpperCase().equals("BREAKOUT"))
																{
																	afterTime=dateShow.getTime();
																	beforeTime=dateShow.getTime();
																}
																else if(rsStatus.getString("status").toUpperCase().equals("CHECKOUT"))
																{
																	if(beforeTime==0)
																	{
																		totalTime=0;
																	}
																	else if(afterTime==0)
																	{
																		beforeTime=dateShow.getTime()-beforeTime;
																		totalTime=totalTime+beforeTime;
																		beforeTime=0;
																	}
																	else
																	{
																		afterTime=dateShow.getTime()-afterTime;
																		totalTime=totalTime+afterTime;
																		afterTime=0;
																	}
																}
															}
															rsStatus.close();
															stStatus.close();
															
															grandTotalTime=grandTotalTime+totalTime;
															
															
														}
														rsTodayStatus.close();
														stTodayStatus.close();
														
														seconds = (int) grandTotalTime / 1000;
														// calculate hours minutes and seconds
													    hours = seconds / 3600;
													    minutes = (seconds % 3600) / 60;
													    seconds = (seconds % 3600) % 60;
														
														%>
														<li><%=rsEmployee.getString("firstName") %>&nbsp;<%=rsEmployee.getString("lastName") %> 
														
														<%
														double percent=0.0;
														percent=(hours/200.0)*100.0;
														
														if(percent>100)
														{
															percent=100.0;
														}
														%> 
														
															<div class="text-success pull-right">
															<%
															if(percent>=95)
															{
																%>
																<font style="color: green;"><%=percent %>% <i class="fa fa-level-up"></i></font>
																<%
															}
															else if(percent>=90&&percent<95)
															{
																%>
																<font style="color: orange;"><%=percent %>%<i class="fa fa-level-down"></i></font>
																<%
															}
															else
															{
																%>
																<font style="color: red;"><%=percent %>% <i class="fa fa-level-down"></i></font>
																<%
															}
															%>
															</div>
														</li>
														<%
													}
													rsEmployee.close();
													stEmployee.close();
                                                	%>
                                                   <!-- <li>Joel Castro<div class="text-success pull-right">99%<i class="fa fa-level-up"></i></div></li>
                                                    <li>Midhun Jacob<div class="text-success pull-right">82%<i class="fa fa-level-up"></i></div></li>
                                                    <li>George Mathew<div class="text-success pull-right">85%<i class="fa fa-level-up"></i></div></li>
                                                    <li>Sandeep Alexander<div class="text-danger pull-right">88%<i class="fa fa-level-down"></i></div></li>
                                                    <li>Thimothy<div class="text-danger pull-right">75%<i class="fa fa-level-down"></i></div></li>  -->                                                  
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-5 col-md-6">
                            <div class="panel twitter-box">
                                <div class="panel-body">
                                    <div class="live-tile" data-mode="flip" data-speed="750" data-delay="3000">
                                        <span class="tile-title pull-right">New Tweets</span>
                                        <i class="fa fa-twitter"></i>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="panel facebook-box">
                                <div class="panel-body">
                                    <div class="live-tile" data-mode="carousel" data-direction="horizontal" data-speed="750" data-delay="4500">
                                        <span class="tile-title pull-right">Facebook Feed</span>
                                        <i class="fa fa-facebook"></i>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Inbox</h4>
                                    <div class="panel-control">
                                        <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Reload" class="panel-reload"><i class="icon-reload"></i></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="inbox-widget slimscroll">
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar2.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Sandra Smith</p>
                                                <p class="inbox-item-text">Hey! I'm working on your...</p>
                                                <p class="inbox-item-date">13:40 PM</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar3.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Christopher</p>
                                                <p class="inbox-item-text">I've finished it! See you so...</p>
                                                <p class="inbox-item-date">13:34 PM</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar4.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Amily Lee</p>
                                                <p class="inbox-item-text">This theme is awesome!</p>
                                                <p class="inbox-item-date">13:17 PM</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar5.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Nick Doe</p>
                                                <p class="inbox-item-text">Nice to meet you</p>
                                                <p class="inbox-item-date">12:20 PM</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar2.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Sandra Smith</p>
                                                <p class="inbox-item-text">Hey! I'm working on your...</p>
                                                <p class="inbox-item-date">10:15 AM</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="assets/images/avatar4.png" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author">Amily Lee</p>
                                                <p class="inbox-item-text">This theme is awesome!</p>
                                                <p class="inbox-item-date">9:56 AM</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Project Stats</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive project-stats">  
                                       <table class="table">
                                           <thead>
                                               <tr>
                                                   <th>#</th>
                                                   <th>Project</th>
                                                   <th>Status</th>
                                                   <th>Manager</th>
                                                   <th>Progress</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               <tr>
                                                   <th scope="row">452</th>
                                                   <td>Mailbox Template</td>
                                                   <td><span class="label label-info">Pending</span></td>
                                                   <td>David Green</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                               <tr>
                                                   <th scope="row">327</th>
                                                   <td>Wordpress Theme</td>
                                                   <td><span class="label label-primary">In Progress</span></td>
                                                   <td>Sandra Smith</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                               <tr>
                                                   <th scope="row">226</th>
                                                   <td>Modern Admin Template</td>
                                                   <td><span class="label label-success">Finished</span></td>
                                                   <td>Chritopher Palmer</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                               <tr>
                                                   <th scope="row">178</th>
                                                   <td>eCommerce template</td>
                                                   <td><span class="label label-danger">Canceled</span></td>
                                                   <td>Amily Lee</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                               <tr>
                                                   <th scope="row">157</th>
                                                   <td>Website PSD</td>
                                                   <td><span class="label label-info">Testing</span></td>
                                                   <td>Nick Doe</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                               <tr>
                                                   <th scope="row">157</th>
                                                   <td>Fronted Theme</td>
                                                   <td><span class="label label-warning">Waiting</span></td>
                                                   <td>David Green</td>
                                                   <td>
                                                       <div class="progress progress-sm">
                                                           <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                                           </div>
                                                       </div>
                                                   </td>
                                               </tr>
                                           </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- Main Wrapper -->
                <%@include file="footer.jsp"%>
            </div><!-- Page Inner -->


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
        <script src="assets/plugins/fullcalendar/lib/moment.min.js"></script>
        <script src="assets/plugins/fullcalendar/fullcalendar.min.js"></script>
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/calendar.js"></script>
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>