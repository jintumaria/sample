<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String page_title="",page_key="",page_describe="",link_id="",other_info="";
		
		if(request.getParameter("link_id")!=null)			{	link_id=request.getParameter("link_id").replaceAll("'","`");				 		}
  		if(request.getParameter("page_title")!=null)		{	page_title=request.getParameter("page_title").replaceAll("'","`"); 	 				}
		if(request.getParameter("page_key")!=null)			{	page_key=request.getParameter("page_key").replaceAll("'","`"); 	 					}
		if(request.getParameter("page_describe")!=null)		{	page_describe=request.getParameter("page_describe").replaceAll("'","`"); 	 		}
		if(request.getParameter("other_info")!=null)		{	other_info=request.getParameter("other_info").replaceAll("'","`"); 	 				}
		
		
			int content_flag=0;
			String content_count_query="select link_id from  content_tab where link_id='"+link_id+"'";
			Statement st_content_count=con.createStatement();
			ResultSet rs_content_count=st_content_count.executeQuery(content_count_query);
			while(rs_content_count.next())
			{
					content_flag=1;
			}
			rs_content_count.close();
			st_content_count.close();
			
			if(content_flag==0)
			{
			String sqlinsert=("insert into content_tab(page_title,page_key,page_describe,other_info,link_id,status,created_date,modified_date)values('"+page_title+"','"+page_key+"','"+page_describe+"','"+other_info+"','"+link_id+"','YES',now(),now())");
			Statement stmtinsert=con.createStatement();
			stmtinsert.executeUpdate(sqlinsert);
			stmtinsert.close();	
			
			}
			if(content_flag==1)
			{
			Statement stmtedit=con.createStatement();
			stmtedit.executeUpdate("update content_tab set page_title='"+page_title+"',page_key='"+page_key+"',page_describe='"+page_describe+"',other_info='"+other_info+"',modified_date=now() where link_id='"+link_id+"' ");	
			stmtedit.close();
			
			}					
			response.sendRedirect("content-info.jsp?link_id="+link_id+"&msg=1");
				
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

