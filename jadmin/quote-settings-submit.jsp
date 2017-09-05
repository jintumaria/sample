<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		
		String quotePrefix="",startQuoteNo="",quoteSuffix="",body1="",body2="",paypalEmail="";

		String adminid=session.getAttribute("admin_id").toString();
		
		String id="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("quotePrefix")!=null)			{	quotePrefix=request.getParameter("quotePrefix");				 }
  		if(request.getParameter("startQuoteNo")!=null)			{	startQuoteNo=request.getParameter("startQuoteNo").replaceAll("'", "`"); 	 }
		if(request.getParameter("quoteSuffix")!=null)			{	quoteSuffix=request.getParameter("quoteSuffix").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("body1")!=null)			{	body1=request.getParameter("body1").replaceAll("'", "`"); 									 }
  		if(request.getParameter("paypalEmail")!=null)			{	paypalEmail=request.getParameter("paypalEmail").replaceAll("'", "`"); 			 }
		
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id"); 							 }			
			
		
			
		int priority_count=0;
		Statement st=con.createStatement();
		String sql="select userId from quote_settings_tab where userId='"+adminid+"'";
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			priority_count=1;
		}
		rs.close();
		st.close();
			
			if(priority_count==0)
			{						
			//statement to insert values		
			String sqlinsert="insert into quote_settings_tab(userId,quotePrefix,startQuoteNo,quoteSuffix,body1,body2,status,createdDate,modifiedDateTime,paypalEmail)values('"+adminid+"','"+quotePrefix+"','"+startQuoteNo+"','"+quoteSuffix+"','"+body1+"','"+body2+"','ENABLED',now(),now(),'"+paypalEmail+"')";
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
				
			}
			else
			{
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update quote_settings_tab set quotePrefix='"+quotePrefix+"',startQuoteNo='"+startQuoteNo+"',quoteSuffix='"+quoteSuffix+"',body1='"+body1+"',body2='"+body2+"',paypalEmail='"+paypalEmail+"',modifiedDateTime=now() where userId='"+adminid+"' ");
			//closing statement
			stmtedit.close();		
				
			}			
			
			response.sendRedirect("quote-settings.jsp?msg=1");
	
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

