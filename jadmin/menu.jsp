
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
                        <li class="droplink"><a href="#"><span class="menu-icon icon-pin"></span><p>Content Management</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                                 <li><a href="#">Home</a></li>
								 <li><a href="#">About Us</a></li>
                                 <li><a href="#">CSR</a></li>
								 <li><a href="#">Careers</a></li>
								 <li><a href="#">News and Events</a></li>
								 <li><a href="#">Testimonials</a></li>
								 <li><a href="#">Services</a></li>
								 <li><a href="#">Projects</a></li>
								 <li><a href="#">People</a></li>
								 <li><a href="#">Clients</a></li>
								 <li><a href="#">Contact</a></li>                               
                            </ul>
                        </li>
						  <li class="droplink"><a href="#"><span class="menu-icon  icon-users"></span><p>Social Media</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                                  <li><a href="twitter.jsp">Twitter</a></li>							  							  
                            </ul>
                        </li>
                        <li class="droplink"><a href="#"><span class="menu-icon  icon-users"></span><p>Employee Management</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            
                                  <li><a href="employees-search.jsp">Employees</a></li> 
                                 <!-- <li><a href="attendance.jsp">Attendance</a></li> -->
                                   <li><a href="notice-board.jsp?status=insert">Notice Board</a></li> 
                                  
								<!--  
								  <li><a href="#">Leave Application</a></li>
								  <li><a href="#">Holidays</a></li>	-->							  
                            </ul>
                        </li>
                        <!-- <li class="droplink"><a href="#"><span class="menu-icon icon-note"></span><p>Projects</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            	<li><a href="#">Project Information</a></li> 
                                <li><a href="#">Document Manager</a></li>                                                                                
                            </ul>
                        </li> -->
                        
                        <li class="droplink"><a href="#"><span class="menu-icon  icon-users"></span><p>Project Management</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            
                                  <li><a href="projects.jsp?status=insert">New Project</a></li> 
                                  <li><a href="projects-search.jsp">Search Projects</a></li> 
                             </ul>
                        </li>
                        <li class="droplink"><a href="#"><span class="menu-icon icon-envelope-open"></span><p>Sales</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                                      <li class="droplink"><a href="#">Quotes <span class="arrow"></span></a>
                                        <ul class="sub-menu">
                                            <li><a href="quotes.jsp">Create Quotes</a></li>
                                             <li><a href="quote-settings.jsp">Quote Settings</a></li>
                                              <li><a href="quotes-search.jsp">Search Quotes</a></li> 
                                        </ul>
                                   </li>
                                    <li class="droplink"><a href="#">Invoices <span class="arrow"></span></a>
                                        <ul class="sub-menu">
                                            <li><a href="invoices.jsp">Create Invoices</a></li>
                                            <li><a href="invoice-settings.jsp">Invoice Settings</a></li>
                                              <li><a href="invoices-search.jsp">Search Invoices</a></li>                                        
                                       </ul>
                                   </li>  
                                   <li><a href="clients.jsp">Customers</a></li>     
                                                                              
                            </ul>
                        </li>
                        <li class="droplink"><a href="#"><span class="menu-icon icon-settings"></span><p>Settings</p><span class="arrow"></span></a>
                            <ul class="sub-menu">
                            	<li><a href="categories.jsp?status=insert&linkId=1">Locations</a></li> 
                                <li><a href="categories.jsp?status=insert&linkId=100">Departments</a></li> 
                                <li><a href="categories.jsp?status=insert&linkId=101">Designations</a></li> 
                                <li><a href="categories.jsp?status=insert&linkId=2">Leave Types</a></li> 
                                <li><a href="categories.jsp?status=insert&linkId=50">Categories</a></li> 
                                <li><a href="categories.jsp?status=insert&linkId=51">Calendar Events</a></li>   
                                 <li><a href="user.jsp?status=insert">Configure Users</a></li>
								          
								<li><a href="#">General Settings</a>
								
								</li>        								
                            </ul>
                        </li>
                    </ul>
                </div><!-- Page Sidebar Inner -->
            </div><!-- Page Sidebar -->