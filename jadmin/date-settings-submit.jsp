<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String start_date="",other_info="",end_date="",no_of_gents="0",no_of_ladies="0",link_id="";
		
		//out.println("A: "+ request.getParameter("start_date"));
		//out.println("B: "+ request.getParameter("end_date"));
		//out.println("CA: "+ request.getParameter("other_info"));
		
		String adminid=session.getAttribute("admin_id").toString();
		
		String id="";
		
		if(request.getParameter("status")!=null)			{	status=request.getParameter("status"); 	 				 }
		
		if(request.getParameter("start_date")!=null)		{	start_date=request.getParameter("start_date");							 }
  		if(request.getParameter("end_date")!=null)			{	end_date=request.getParameter("end_date").replaceAll("'", "`"); 			 }
		if(request.getParameter("no_of_gents")!=null)		{	no_of_gents=request.getParameter("no_of_gents");							 }
  		if(request.getParameter("no_of_ladies")!=null)		{	no_of_ladies=request.getParameter("no_of_ladies").replaceAll("'", "`"); 			 }
		
		if(request.getParameter("other_info")!=null)		{	other_info=request.getParameter("other_info").replaceAll("'", "`"); 	 }
		if(request.getParameter("link_id")!=null)			{	link_id=request.getParameter("link_id").replaceAll("'", "`"); 	 }
			if(request.getParameter("id")!=null)			{	id=request.getParameter("id").replaceAll("'", "`"); 	 }
		
		if(status.equals("insert"))
		{
			int date_count=0;
			Statement st=con.createStatement();
			String sql="select user_id from date_settings_tab where user_id='"+adminid+"' and center_id='"+link_id+"' and start_date='"+start_date+"'";
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				date_count=1;
			}
			rs.close();
			st.close();
		
			if(date_count == 0)
			{
				
				String sqlinsert="insert into date_settings_tab(center_id,user_id,start_date,end_date,no_of_gents,no_of_ladies,other_info,status,created_date,modified_date)values('"+link_id+"','"+adminid+"','"+start_date+"','"+end_date+"','"+no_of_gents+"','"+no_of_ladies+"','"+other_info+"','ENABLED',now(),now())";
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
				response.sendRedirect("date-settings.jsp?msg=1&status=insert&link_id="+link_id);
				
			}if(date_count == 1)
			{
				//statement to insert values		
				response.sendRedirect("date-settings.jsp?msg=0&status=insert&link_id="+link_id);
			}
			
		}
		if(status.equals("rooms"))
		{
			Statement stmtrooms_clear=con.createStatement();
			stmtrooms_clear.executeUpdate("delete from room_settings_tab where course_id='"+id+"'");
			stmtrooms_clear.close();			
		   
		   for(int i=0;i<=200;i++)
		   {
		   
		   	if(request.getParameter("check_box_"+i)!=null)		{	//room_info=room_info+"@"+request.getParameter("check_box_"+i);		 
			
			String sqlinsert="insert into room_settings_tab(center_id,user_id,course_id,room_no,status,created_date,modified_date)values('"+link_id+"','"+adminid+"','"+id+"','"+request.getParameter("check_box_"+i)+"','ENABLED',now(),now())";
			Statement stmtinsert=con.createStatement();
			stmtinsert.executeUpdate(sqlinsert);
			stmtinsert.close();
			
			}
			
		   }  			
					
			
			response.sendRedirect("date-settings.jsp?msg=1&status=rooms&link_id="+link_id+"&id="+id);
			
		}
		if(status.equals("edit"))
		{
			
					
			Statement stmtedit=con.createStatement();
			//update the row
			
			stmtedit.executeUpdate("update date_settings_tab set start_date='"+start_date+"',end_date='"+end_date+"',no_of_gents='"+no_of_gents+"',no_of_ladies='"+no_of_ladies+"',other_info='"+other_info+"' where id='"+id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("date-settings.jsp?msg=1&status=insert&link_id="+link_id);
		}
		
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from date_settings_tab where id='"+id+"'");
			//closing statement
			stmtdelete.close();		
					
			response.sendRedirect("date-settings.jsp?link_id="+link_id+"&msg=3&status=insert");
		}
		
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

