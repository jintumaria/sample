<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String invoicePrefix="",startInvoiceNo="",invoiceSuffix="",body1="",body2="",paypalEmail="";
		
		String adminid=session.getAttribute("admin_id").toString();
		
		String id="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("invoice_prefix")!=null)			{	invoicePrefix=request.getParameter("invoice_prefix");				 }
  		if(request.getParameter("start_invoice_no")!=null)			{	startInvoiceNo=request.getParameter("start_invoice_no").replaceAll("'", "`"); 	 }
		if(request.getParameter("invoice_suffix")!=null)			{	invoiceSuffix=request.getParameter("invoice_suffix").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("body1")!=null)			{	body1=request.getParameter("body1").replaceAll("'", "`"); 									 }
  		if(request.getParameter("body2")!=null)			{	body2=request.getParameter("body2").replaceAll("'", "`"); 			 }
		if(request.getParameter("paypal_email")!=null)			{	paypalEmail=request.getParameter("paypal_email").replaceAll("'", "`"); 			 }
		
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id"); 							 }			
			
		
			
		int priority_count=0;
		Statement st=con.createStatement();
		String sql="select userId from invoice_settings_tab where userId='"+adminid+"'";
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
			String sqlinsert="insert into invoice_settings_tab(userId,invoicePrefix,startInvoiceNo,invoiceSuffix,body1,body2,status,createdDate,modifiedDateTime,paypalEmail)values('"+adminid+"','"+invoicePrefix+"','"+startInvoiceNo+"','"+invoiceSuffix+"','"+body1+"','"+body2+"','ENABLED',now(),now(),'"+paypalEmail+"')";
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
			stmtedit.executeUpdate("update invoice_settings_tab set invoicePrefix='"+invoicePrefix+"',startInvoiceNo='"+startInvoiceNo+"',invoiceSuffix='"+invoiceSuffix+"',body1='"+body1+"',body2='"+body2+"',paypalEmail='"+paypalEmail+"',modifiedDateTime=now() where userId='"+adminid+"' ");
			//closing statement
			stmtedit.close();		
				
			}			
			
			response.sendRedirect("invoice-settings.jsp?msg=1");
	
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

