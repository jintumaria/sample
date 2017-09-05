<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
{
	
	
	if(status.equals("insert"))
	{
		if(request.getParameter("name")!=null) { name=request.getParameter("name");}
		if(request.getParameter("email")!=null)  { email=request.getParameter("email");    }
		if(request.getParameter("phone")!=null)    { phone=request.getParameter("phone");      }
		
		Statement stInsert=con.createStatement();
		stInsert.executeUpdate("insert into user_tab(name,email,phone,createdDate,modifiedDateTime)values('"+name+"','"+email+"','"+phone+"',now(),now())");
		stInsert.close();		
		
		response.sendRedirect("user.jsp?msg=insert&status=insert");	
	}
	else if(status.equals("edit"))
	{
		
	}
}
%>