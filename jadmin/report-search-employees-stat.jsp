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
        
		<script src="check.js"></script>
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">
        <main class="page-content content-wrap">
            <%@include file="outer-menu.jsp"%>             
            <%@include file="menu.jsp"%>            
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="employees-search.jsp">Employees</a></li>
                        <li class="active">Employees Status</li>
                    </ol>
                </div>
				<%
			Statement stShowData=con.createStatement();
			ResultSet rsShowData=stShowData.executeQuery("select id,firstName,lastName,email,mobile,employeeID,dateOfJoining,status,lastLoginDateTime,location from employee_tab where id='"+id+"'");
			if(rsShowData.next())
			{
				COUNTDATA=COUNTDATA+1;
				spiltDate=rsShowData.getString("dateOfJoining").split("/");
				
				%>
				
                <div class="page-title">
                    <div class="container">
                        <h3>Employees Status - <%=rsShowData.getString("employeeID")%></h3>
                    </div>
                </div>
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="invoice col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h1 class="m-b-md"><b><%=rsShowData.getString("firstName")%>&nbsp;<%=rsShowData.getString("lastName")%></b></h1>
                                            <address>
                                               <%=rsShowData.getString("email")%><br>
                                               Mobile : <%=rsShowData.getString("mobile")%><br>
											  Joining Date : <%
												if(!spiltDate[2].equals("0000"))
													{
														%>
														<%=spiltDate[1]%>-<%=spiltDate[0]%>-<%=spiltDate[2]%>
														<%
													}
												%>	
                                            </address>
                                        </div>     
										<%
																if(!rsShowData.getString("lastLoginDateTime").equals("0000-00-00 00:00:00"))
																{
																%>
										
                                        <div class="col-md-12">
                                            <hr>
											 <div class="col-md-6">
                                            <p>
                                                <strong>Last Login Date & Time</strong><br>
                                               	<%					
												  
												   Date dateShow=dtSourceDate.parse(rsShowData.getString("lastLoginDateTime"));
												   //out.println(formatterShow.format(dateShow));											 
												
												%>
                                            </p>
											</div>
											 <div class="col-md-6">
											 <p>
                                                <strong>Search By Date</strong><br>
												<form class="form-inline" method="post" action="report-search-employees-stat.jsp">
												<input type="hidden" name="id" value=<%=id%>>
													<div class="form-group">
														<label class="sr-only" for="exampleInputEmail2">Date From</label>
														<input type="text" name="from_date" required class="form-control date-picker" id="exampleInputEmail2" placeholder="From Date">
													</div>
													<div class="form-group">
														<label class="sr-only" for="exampleInputPassword2">Date To</label>
														<input type="text" name="to_date" required class="form-control  date-picker" id="exampleInputPassword2" placeholder="To Date">
													</div>													
													<button type="submit" class="btn btn-info">Search</button>
												</form>
											 </p>
											 </div>
                                        </div>
										 
                                        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
									
                                        <div class="col-md-12">
                                            <h3> Report</h3>
                                            <p><%	
											
											String from_date="",to_date="";
											
								if(request.getParameter("from_date")!=null)	{	from_date= request.getParameter("from_date");	}
								if(request.getParameter("to_date")!=null)	{	to_date= request.getParameter("to_date");	}
					
									DateFormat dtSourceFromDate = new SimpleDateFormat("MM/dd/yyyy");
									DateFormat dtDestinationToDate = new SimpleDateFormat("yyyy-MM-dd");	
									
									Date Fdate = dtSourceFromDate.parse(from_date);
									Date Tdate = dtSourceFromDate.parse(to_date);
									long grandTotalTime=0;
																	//out.println("select distinct(date) from check_tab where employeeId='"+rsShowData.getString("id")+"' and modifiedDateTime between '"+dtDestinationToDate.format(Fdate)+"' and '"+dtDestinationToDate.format(Tdate)+"' order by modifiedDateTime asc");
																	Statement stTodayStatus=con.createStatement();
																	ResultSet rsTodayStatus=stTodayStatus.executeQuery("select distinct(date) from check_tab where employeeId='"+rsShowData.getString("id")+"' and modifiedDateTime between '"+dtDestinationToDate.format(Fdate)+"' and '"+dtDestinationToDate.format(Tdate)+"' order by modifiedDateTime asc");
																	while(rsTodayStatus.next())
																	{
																		COUNTMODAL=COUNTMODAL+1;
																		String[] words=rsTodayStatus.getString("date").split("-");
																		
																	%>
																	<br><br><%=COUNTMODAL%>. <%=words[2]%>.<%=words[1]%>.<%=words[0]%><br><br>

																	<%	
																	long beforeTime=0,afterTime=0,totalTime=0;
																	
																	Statement stStatus=con.createStatement();
																	ResultSet rsStatus=stStatus.executeQuery("select modifiedDateTime,status,clientip from check_tab where date='"+rsTodayStatus.getString("date")+"' and  employeeId='"+rsShowData.getString("id")+"' order by modifiedDateTime asc");
																	while(rsStatus.next())
																	{
																		dateShow=rsStatus.getTimestamp("modifiedDateTime");
																		//dateShow=dtSourceDate.parse(rsStatus.getString("modifiedDateTime"));
																		%>
																		<%=rsStatus.getString("status").toUpperCase()%> : 
																		
																		<%=formatterShow.format(dateShow) %> (<%=rsStatus.getString("clientip") %> )<br>
																		
																		<%
																		
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
																	
																	int seconds = (int) totalTime / 1000;
																	// calculate hours minutes and seconds
																    int hours = seconds / 3600;
																    int minutes = (seconds % 3600) / 60;
																    seconds = (seconds % 3600) % 60;
																	
																	out.println("<br><b>"+hours +" Hours "+minutes + " Minutes "+seconds + " Seconds</b>");
																	}
																	rsTodayStatus.close();
																	stTodayStatus.close();
																	
																	int seconds = (int) grandTotalTime / 1000;
																	// calculate hours minutes and seconds
																    int hours = seconds / 3600;
																    int minutes = (seconds % 3600) / 60;
																    seconds = (seconds % 3600) % 60;
																	
																	out.println("<br><br><b>TOTAL TIME : "+hours +" Hours "+minutes + " Minutes "+seconds + " Seconds</b>");
																	
																	
																	
																	COUNTMODAL=0;
																	%></p>
                                           							<div align="right">
                                           							<a href="excel-search-employees-stat.jsp?id=<%=id %>&from_date=<%=from_date %>&to_date=<%=to_date %>" title="Download Status Report" target="_blank"><i class="fa fa-download"></i> Download Report</a> 
                                           							&nbsp;&nbsp;
                                           							<a href="pdf-search-employee-stat.jsp?id=<%=id %>&from_date=<%=from_date %>&to_date=<%=to_date %>" title="Download Status Report" target="_blank"><i class="fa fa-download"></i> Download PDF </a>
																	</div>
																	
                                        </div>
										
										
										<%
																}
																	%>
                                    </div><!--row-->
                                </div>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
				
				     <%
			}
			rsShowData.close();
			stShowData.close();
			
											%>
											
				
				
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
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
        <script src="assets/js/modern.min.js"></script>
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