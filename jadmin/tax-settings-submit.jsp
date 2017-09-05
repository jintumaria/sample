<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String taxName="",taxPercent="";
		
		String adminid=session.getAttribute("admin_id").toString();
		String id="",taxStatus="";
	
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("tax_name")!=null)				{	taxName=request.getParameter("tax_name").replaceAll("'", "`"); 		 }
  		if(request.getParameter("tax_percent")!=null)			{	taxPercent=request.getParameter("tax_percent").replaceAll("'", "`"); 	 }
		if(request.getParameter("tax_status")!=null)			{	taxStatus=request.getParameter("tax_status"); 	 }
			 
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id"); 							 }			
		//out.println("HeloooL :"+tax_status);
		if(status.equals("insert"))
		{
			//statement to insert values		
			String sqlinsert="insert into tax_tab(userId,taxName,taxPercent,status,createdDate,modifiedDateTime)values('"+adminid+"','"+taxName+"','"+taxPercent+"','YES',now(),now())";
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
				response.sendRedirect("invoice-settings.jsp?msg=1");
					
			
			
			
		}	
		if(status.equals("edit"))
		{			
					
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update tax_tab set taxName='"+taxName+"',taxPercent='"+taxPercent+"',status='"+taxStatus+"',modifiedDateTime=now() where id='"+id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("invoice-settings.jsp?msg=2");
		}		
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from tax_tab where id='"+id+"'");
			//closing statement
			stmtdelete.close();
			
			response.sendRedirect("invoice-settings.jsp?msg=3");
		}
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

