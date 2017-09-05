		  
			
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Mybox</h4>
                                    <div class="panel-control">
                                        <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Reload" class="panel-reload"><i class="icon-reload"></i></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="inbox-widget slimscroll">
									<% 
											String postid="";
											int p=0;
											Statement st=con.createStatement();
											ResultSet rs_post=st.executeQuery("select * from post_tab order by modifiedDateTime desc");
											while(rs_post.next())
											{
												String likeStatus="";
												Statement st_select=con.createStatement();
												ResultSet rs_select=st_select.executeQuery("select id,status from like_post_tab where post='"+rs_post.getString("id")+"' and employeeId='"+employeeId+"'");
												if(rs_select.next())
												{
													likeStatus=rs_select.getString("status");
												}
												rs_select.close();
												st_select.close();
												if(!likeStatus.equals("delete"))
												{
													Statement st_emp=con.createStatement();
													ResultSet rs_emp=st_emp.executeQuery("select firstName,lastName from employee_tab where employeeId='"+rs_post.getString("employeeId")+"'");
													if(rs_emp.next())
													{
														p=p+1;
													%>
											<div class="inbox-item">
                                                <div class="inbox-item-img"><img src="documents/<%=employeeId %>.jpg" class="img-circle" alt=""></div>
                                                <p class="inbox-item-author"><%=rs_emp.getString("firstName") %> <%=rs_emp.getString("lastName") %></p>
												<p class="inbox-item-text"><%=rs_post.getString("post") %> </p>
												<p class="inbox-item-date"><%=rs_post.getString("modifiedDateTime") %></p>
												<% if(likeStatus.equals("like")) 
												{ %>
												<div class="fa-item col-md-2 col-sm-2"><a href="post-like-submit.jsp?post=<%=rs_post.getString("id")%>&status=unlike" title="Unlike"><%=rs_post.getString("likes") %>&nbsp;<i class="fa fa-thumbs-o-down"></i> 
												</a></div>	
											  <% }
												else{																
												%>
												<div class="fa-item col-md-2 col-sm-2">
												<a href="post-like-submit.jsp?post=<%=rs_post.getString("id")%>&status=like" title="Like"><%=rs_post.getString("likes") %>&nbsp;<i class="fa fa-thumbs-o-up"></i> </a>
												</div>
												<% }
												%>
												<div class="fa-item col-md-2 col-sm-2">
													<a  title="Comments" onclick="checkComment('<%=rs_post.getString("id") %>','comment','postcomment<%=p%>','<%=rs_post.getString("comments") %>')"><%=rs_post.getString("comments") %>&nbsp;<i class="fa fa-comments-o" ></i></a >
												</div>
												
												<div class="fa-item col-md-2 col-sm-2">
													<a href="post-like-submit.jsp?post=<%=rs_post.getString("id")%>&status=delete"><i class="fa fa-trash-o"></i> </a>
												</div>
												
                                            </div>
											<div id="postcomment<%=p%>" >
														
											</div>
                                         <%
																//onclick="checkComment(document.home.postid.value);"
													}
													rs_emp.close();
													st_emp.close();
												}
											}
											rs_post.close();
											st.close();
										%>
										
                                    </div>
                                </div>
                            </div>
                        
					