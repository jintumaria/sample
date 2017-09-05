<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String id="",status="",link_id="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		if(request.getParameter("id")!=null)			{	id=request.getParameter("id");							 }
		if(request.getParameter("link_id")!=null)		{	link_id=request.getParameter("link_id");			 }
		
		  
		
		if(status.equals("delete"))
		{
			
			
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from news_tab where id='"+id+"'");
			//closing statement
			stmtdelete.close();
								
			response.sendRedirect("news-and-events.jsp?msg=delete&status=insert&link_id="+link_id);
			
		}
		
	
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

