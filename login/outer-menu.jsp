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
<div class="topmenu-outer">
                        <div class="top-menu">                           
                            <ul class="nav navbar-nav navbar-right">                              
                                <li class="dropdown">
                                    <a href="home.jsp" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown">
                                        <span class="user-name"><%=firstName%> <%=lastName%><i class="fa fa-angle-down"></i></span>
                                        
                                        <img class="img-circle avatar" src="documents/<%=employeeId %>.jpg" onerror="this.src='documents/avatar.png'" width="40" height="40" alt="documents/avatar.png">
                                    	
                                    </a>
                                    <ul class="dropdown-menu dropdown-list" role="menu">                                       
                                        <li role="presentation"><a href="profile.jsp?status=edit"><i class="fa fa-bullseye m-r-xs"></i>Profile Information</a></li> 
										<li role="presentation"><a href="change-password.jsp"><i class="fa fa-gear m-r-xs"></i>Change Password</a></li>             
										<li role="presentation"><a href="logout.jsp"><i class="fa fa-sign-out m-r-xs"></i>Log out</a></li>																		
                                    </ul>
                                </li>
                               <!-- <li>
                                    <a href="javascript:void(0);" class="waves-effect waves-button waves-classic" id="showRight">
                                        <i class="fa fa-comments"></i>
                                    </a>
                                </li>-->
                            </ul><!-- Nav -->
                        </div><!-- Top Menu -->
                    </div>
					 </div>
             </div>