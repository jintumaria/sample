<script>
function goBack() {
    window.history.go(-1);
}
</script>
<script>
function con_logout()
{
	ans=confirm("Do u really want to Logout ?");

	if(ans!=0)	{		return true;	}
	else		{		return false;	}

}
function con_delete()
{
	ans=confirm("Do u really want to Delete ?");

	if(ans!=0)	{		return true;	}
	else		{		return false;	}

}
function con_u()
{
	ans=confirm("Do u really want to Un Tick ?");

	if(ans!=0)	{		return true;	}
	else		{		return false;	}

}
function con_t()

{
	ans=confirm("Do u really want to Tick ?");

	if(ans!=0)	{		return true;	}
	else		{		return false;	}

}
</script>
<div class="page-sidebar sidebar horizontal-bar">
                <div class="page-sidebar-inner">
                    <ul class="menu accordion-menu">
                        <li class="nav-heading"><span>Navigation</span></li>
                        <li class="active"><a href="home.jsp"><span class="menu-icon  icon-home"></span><p>Dashboard</p></a></li>                        
                        <li class="droplink"><a href="#"><span class="menu-icon  icon-users"></span><p>Leave</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                                  <li><a href="#">Apply Leave</a></li> 
								  <li><a href="#">My Leave</a></li>								  							  
                            </ul>
                        </li>
                        <%   
                                  String notificationQuery="";
                        		  notificationQuery="select count(id) from  noticeboard_tab where  employeeId='"+employeeId+"' and status='ENABLED' and readStatus='unread'";
                                  Statement stNotification=con.createStatement();
								  ResultSet rsNotification=stNotification.executeQuery(notificationQuery);
								  if(rsNotification.next())
								  {
									  COUNTDATA=Integer.parseInt(rsNotification.getString("count(id)"));
									  
								  }
                                  %>
						<li><a href="notice-board.jsp"><span class="menu-icon icon-note"></span><p>Notice Board
						<% if(COUNTDATA>0){ %><font color="red"> (<%=COUNTDATA %>)</font> <%} %>
								  
						</p></a></li>
						<!--<li class="droplink"><a href="#"><span class="menu-icon icon-envelope-open"></span><p>Mail Box</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            	<li><a href="#">Compose Message</a></li> 
                                <li><a href="#">Sent Message</a></li>                                                                                
                            </ul>
                        </li> -->
                         <li class="droplink"><a href="#"><span class="menu-icon icon-briefcase"></span><p>Projects</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            	<li><a href="#">Project Information</a></li> 
                                <li><a href="#">Document Manager</a></li>                                                                                
                            </ul>
                        </li>  
						 <li class="droplink"><a href="#"><span class="menu-icon icon-settings"></span><p>Settings</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            	<li><a href="logout.jsp">Logout</a></li> 
                                                                                                        
                            </ul>
                        </li>  
                    </ul>
                </div><!-- Page Sidebar Inner -->
            </div><!-- Page Sidebar -->