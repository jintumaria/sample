<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@ page import="java.io.File"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String quoteNo="",issueDate="",refNo="",clientName="",additionalInfo="",body1="",termsAndConditions="";
		
		String adminid=session.getAttribute("admin_id").toString();
		String id="",idq="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("quoteNo")!=null)		{	quoteNo=request.getParameter("quoteNo").replaceAll("'", "`");		 }
  		if(request.getParameter("issueDate")!=null)		{	issueDate=request.getParameter("issueDate").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("refNo")!=null)			{	refNo=request.getParameter("refNo").replaceAll("'", "`");									 }
  		if(request.getParameter("clientName")!=null)			{	clientName=request.getParameter("clientName").replaceAll("'", "`"); 			 }
		if(request.getParameter("additionalInfo")!=null)			{	additionalInfo=request.getParameter("additionalInfo").replaceAll("'", "`"); 			 }
		if(request.getParameter("body1")!=null)			{	body1=request.getParameter("body1").replaceAll("'", "`"); 			 }
		if(request.getParameter("termsAndConditions")!=null)			{	termsAndConditions=request.getParameter("termsAndConditions").replaceAll("'", "`"); 			 }
		
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
								
								String query_user_show="select * from client_tab where client_name= '"+clientName+"'";
								Statement st_user_show=con.createStatement();
								ResultSet rs_user_show=st_user_show.executeQuery(query_user_show);
								if(rs_user_show.next())  
								{
									 if(rs_user_show.getString("address_1")!=null){if(rs_user_show.getString("address_1").length()>0) {	
									 location1=location1+rs_user_show.getString("address_1");}}
									 if(rs_user_show.getString("address_2")!=null){if(rs_user_show.getString("address_2").length()>0) {	
									 location1=location1+", "+rs_user_show.getString("address_2");}}
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
								
								System.out.println("terms : "+termsAndConditions);						
		SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat dt1= new SimpleDateFormat("yyyy-MM-dd");
										
		if(status.equals("insert"))
		{
			
			Date dobDate = dt.parse(issueDate);
			issueDate=dt1.format(dobDate);
			
			
			
		int priority_count=0;
		Statement st=con.createStatement();
		String sql="select ino from quote_tab where ino='"+quoteNo+"' and userId='"+adminid+"' ";
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
			String sqlinsert="insert into quote_tab(userId,ino,issueDate,refNo,clientName,location,location1,additionalInfo,paymentMethod,paymentStatus,quoteStatus,createdDate,modifiedDateTime,body1,currency,termsAndConditions)values('"+adminid+"','"+quoteNo+"','"+issueDate+"','"+refNo+"','"+clientName+"','"+location+"','"+location1+"','"+additionalInfo+"','YES','NO','ENABLED',now(),now(),'"+body1+"','"+currency+"','"+termsAndConditions+"')";
			Statement stmtinsert=con.createStatement();
			out.println(sqlinsert);  //insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
			
			String start_quote_no="";
			int temp_ino=0;
			String quote_settings_query="select * from  quote_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
			Statement st_quote_settings_view=con.createStatement();
			ResultSet rs_quote_settings_view=st_quote_settings_view.executeQuery(quote_settings_query);
			
			if(rs_quote_settings_view.next())
			{
						start_quote_no=rs_quote_settings_view.getString("startQuoteNo");
									
			}
									
			rs_quote_settings_view.close();
			st_quote_settings_view.close();
			
			temp_ino=Integer.parseInt(start_quote_no)+1;
			
			Statement stmtedit1=con.createStatement();
			//update the row
			stmtedit1.executeUpdate("update quote_settings_tab set startQuoteNo='"+temp_ino+"' where userId='"+session.getAttribute("admin_id").toString()+"' ");
			//closing statement
			stmtedit1.close();		
					
			
				response.sendRedirect("quote.jsp?quoteNo="+quoteNo);
			}
			else
			{
				response.sendRedirect("quotes.jsp?msg=0");
			}			
			
			
			
		}	
		if(status.equals("edit"))
		{			
			Date dobDate = dt.parse(issueDate);
			issueDate=dt1.format(dobDate);
				
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update quote_tab set issueDate='"+issueDate+"',refNo='"+refNo+"',clientName='"+clientName+"',location='"+location+"',location1='"+location1+"',body1='"+body1+"',currency='"+currency+"',termsAndConditions='"+termsAndConditions+"', modifiedDateTime=now() where id='"+id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("quote.jsp?quoteNo="+quoteNo);
		}	
		
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from quote_tab where ino='"+id+"'");
			//closing statement
			stmtdelete.close();
			
			Statement stmtdelete1=con.createStatement();
			//deleting the row
			stmtdelete1.executeUpdate("delete from add_cart where session_id='"+id+"'");
			//closing statement
			stmtdelete1.close();
			
			
			response.sendRedirect("quotes.jsp?msg=3");
		}	
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>
