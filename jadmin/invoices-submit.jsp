<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@ page import="java.io.File"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String invoiceNo="",issueDate="",dueDate="",refNo="",clientName="",additionalInfo="",body1="";
		
		String adminid=session.getAttribute("admin_id").toString();
		String id="",idq="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("invoice_no")!=null)		{	invoiceNo=request.getParameter("invoice_no").replaceAll("'", "`");		 }
  		if(request.getParameter("issue_date")!=null)		{	issueDate=request.getParameter("issue_date").replaceAll("'", "`"); 	 }
		if(request.getParameter("due_date")!=null)			{	dueDate=request.getParameter("due_date").replaceAll("'", "`"); 	 	 }
		
		if(request.getParameter("ref_no")!=null)			{	refNo=request.getParameter("ref_no").replaceAll("'", "`");									 }
  		if(request.getParameter("client_name")!=null)			{	clientName=request.getParameter("client_name").replaceAll("'", "`"); 			 }
		if(request.getParameter("additional_info")!=null)			{	additionalInfo=request.getParameter("additional_info").replaceAll("'", "`"); 			 }
		if(request.getParameter("body1")!=null)			{	body1=request.getParameter("body1").replaceAll("'", "`"); 			 }
		
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id"); 							 }		
		
		String location="",location1="",currency="";
								currency=session.getAttribute("admin_currency").toString();
								String query_admin_show="select * from admin_tab where id= '"+session.getAttribute("admin_id")+"'";
								Statement st_admin_show=con.createStatement();
								ResultSet rs_admin_show=st_admin_show.executeQuery(query_admin_show);
								if(rs_admin_show.next())  
								{
									 if(rs_admin_show.getString("address1")!=null){if(rs_admin_show.getString("address1").length()>0) {	
									 location=location+rs_admin_show.getString("address1");}}
									 if(rs_admin_show.getString("address2")!=null){if(rs_admin_show.getString("address2").length()>0) {	
									 location=location+", "+rs_admin_show.getString("address2");}}
								 	 if(rs_admin_show.getString("city")!=null){if(rs_admin_show.getString("city").length()>0) {	
									 location=location+", "+rs_admin_show.getString("city");}}
								 	 if(rs_admin_show.getString("state")!=null){if(rs_admin_show.getString("state").length()>0) {	
									 location=location+", "+rs_admin_show.getString("state");}}
									 if(rs_admin_show.getString("country")!=null){if(rs_admin_show.getString("country").length()>0) {	
									 location=location+", "+rs_admin_show.getString("country");}}
								 	 if(rs_admin_show.getString("postalcode")!=null){if(rs_admin_show.getString("postalcode").length()>0) {	
									 location=location+" - "+rs_admin_show.getString("postalcode");}}
							
								}
								rs_admin_show.close();
								st_admin_show.close();
								
								String query_user_show="select * from client_tab where clientName= '"+clientName+"'";
								Statement st_user_show=con.createStatement();
								ResultSet rs_user_show=st_user_show.executeQuery(query_user_show);
								if(rs_user_show.next())  
								{
									 if(rs_user_show.getString("address1")!=null){if(rs_user_show.getString("address1").length()>0) {	
									 location1=location1+rs_user_show.getString("address1");}}
									 if(rs_user_show.getString("address2")!=null){if(rs_user_show.getString("address2").length()>0) {	
									 location1=location1+", "+rs_user_show.getString("address2");}}
								 	 if(rs_user_show.getString("city")!=null){if(rs_user_show.getString("city").length()>0) {	
									 location1=location1+", "+rs_user_show.getString("city");}}
								 	 if(rs_user_show.getString("state")!=null){if(rs_user_show.getString("state").length()>0) {	
									 location1=location1+", "+rs_user_show.getString("state");}}
									 if(rs_user_show.getString("country")!=null){if(rs_user_show.getString("country").length()>0) {	
									 location1=location1+", "+rs_user_show.getString("country");}}
								 	 if(rs_user_show.getString("postalcode")!=null){if(rs_user_show.getString("postalcode").length()>0) {	
									 location1=location1+" - "+rs_user_show.getString("postalcode");}}
							
								}
								rs_user_show.close();
								st_user_show.close();
								
								
				
										
		if(status.equals("insert"))
		{
			
		int priority_count=0;
		Statement st=con.createStatement();
		String sql="select ino from invoice_tab where ino='"+invoiceNo+"' and userId='"+adminid+"' ";
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
			String sqlinsert="insert into invoice_tab(userId,ino,issueDate,dueDate,refNo,clientName,location,location1,additionalInfo,paymentMethod,paymentStatus,invoiceStatus,createdDate,modifiedDateTime,body1,currency)values('"+adminid+"','"+invoiceNo+"','"+issueDate+"','"+dueDate+"','"+refNo+"','"+clientName+"','"+location+"','"+location1+"','"+additionalInfo+"','YES','NO','ENABLED',now(),now(),'"+body1+"','"+currency+"')";
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
			
			String startInvoiceNo="";
			int TEMPINO=0;// temp_ino=0;
			String invoice_settings_query="select * from  invoice_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
			Statement st_invoice_settings_view=con.createStatement();
			ResultSet rs_invoice_settings_view=st_invoice_settings_view.executeQuery(invoice_settings_query);
			
			if(rs_invoice_settings_view.next())
			{
						startInvoiceNo=rs_invoice_settings_view.getString("startInvoiceNo");
									
			}
									
			rs_invoice_settings_view.close();
			st_invoice_settings_view.close();
			
			TEMPINO=Integer.parseInt(startInvoiceNo)+1;
			
			Statement stmtedit1=con.createStatement();
			//update the row
			stmtedit1.executeUpdate("update invoice_settings_tab set startInvoiceNo='"+TEMPINO+"' where userId='"+session.getAttribute("admin_id").toString()+"' ");
			//closing statement
			stmtedit1.close();		
					
			
				response.sendRedirect("invoice.jsp?invoice_no="+invoiceNo);
			}
			else
			{
				response.sendRedirect("invoices.jsp?msg=0");
			}			
			
			
			
		}	
		if(status.equals("edit"))
		{			
					
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update invoice_tab set issueDate='"+issueDate+"',dueDate='"+dueDate+"',refNo='"+refNo+"',clientName='"+clientName+"',location='"+location+"',location1='"+location1+"',body1='"+body1+"',currency='"+currency+"',modifiedDateTime=now() where id='"+id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("invoice.jsp?invoice_no="+invoiceNo);
		}	
		
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from invoice_tab where ino='"+id+"'");
			//closing statement
			stmtdelete.close();
			
			Statement stmtdelete1=con.createStatement();
			//deleting the row
			stmtdelete1.executeUpdate("delete from add_cart where sessionId='"+id+"'");
			//closing statement
			stmtdelete1.close();
			
			
			response.sendRedirect("invoices.jsp?msg=3");
		}	
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

