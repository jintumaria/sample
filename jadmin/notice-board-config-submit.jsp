<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		if(request.getParameter("caption")!=null)			{	caption=request.getParameter("caption");							 }
		
		
		if(status.equals("delete"))
		{
			
			
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from noticeboard_tab where caption='"+caption+"'");
			//closing statement
			stmtdelete.close();
								
			response.sendRedirect("notice-board.jsp?msg=delete&status=insert");
			
		}
		
	
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

