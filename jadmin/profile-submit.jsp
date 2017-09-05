<%/*including db connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%
  if(session.getAttribute("admin_id")!=null)
	{	
		
		if(status.equals("profile"))
		{
			Statement st_admin_profile_edit=con.createStatement();
			st_admin_profile_edit.execute("update admin_tab set userName='"+userName+"',email='"+email+"',password='"+password+"' where id= '"+adminId+"' ");
			st_admin_profile_edit.close();
			response.sendRedirect("profile.jsp?msg=edit");
		}
		
		
		con.close();
	}
	else
	{
		response.sendRedirect("sessionexpire.jsp");
	}
%>
 