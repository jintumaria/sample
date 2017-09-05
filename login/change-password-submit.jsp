<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>


<%
String currentPassword="",newPassword="";

if(request.getParameter("currentPassword")!=null)	{		currentPassword= request.getParameter("currentPassword");	}

if(request.getParameter("newPassword")!=null)	{		newPassword= request.getParameter("newPassword");	}

if(request.getParameter("id")!=null)		{		id= request.getParameter("id");	}

if(session.getAttribute("login_id")!=null)
{	
	Statement stSelect=con.createStatement();
	ResultSet rsSelect=stSelect.executeQuery("select employeeId from employee_tab where password='"+currentPassword+"' and id='"+id+"'");
	if(rsSelect.next())
	{		
				
		Statement stEdit=con.createStatement();
		stEdit.executeUpdate("update employee_tab set password='"+newPassword+"',modifiedDateTime=now() where id='"+id+"' ");
		stEdit.close();		
		
		response.sendRedirect("change-password.jsp?&msg=editpass&status=edit");
	}
	else
	{
		response.sendRedirect("change-password.jsp?&msg=failpass&status=edit");
	}
	stSelect.close();
con.close();	
}
else
{
response.sendRedirect("sessionexpire.jsp");
}

%>