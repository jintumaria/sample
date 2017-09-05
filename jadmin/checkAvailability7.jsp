<%@ page import="java.sql.*"%>
<%@include file="include/dbconnection.jsp"%>

<%

if(session.getAttribute("admin_id")!=null)
{
	try
	{
		int flag=0;
		String employee="",team="";
		if(request.getParameter("value1")!=null && request.getParameter("value1").length()>0) 
		{
			employee=request.getParameter("value1");
		}
		if(request.getParameter("value2")!=null && request.getParameter("value2").length()>0) 
		{
			team=request.getParameter("value2");
		}
		//out.println(employee+team);
		
		Statement st_check=con.createStatement();
		ResultSet rs_check=st_check.executeQuery("select id from team_tab where team='"+team+"' and employeeId='"+employee+"'");
		if(rs_check.next())
		{
			flag=1;
		}
		rs_check.close();
		st_check.close();
		
		if(flag==0)
		{
			st_check=con.createStatement();
			rs_check=st_check.executeQuery("select id from employee_tab where employeeId='"+employee+"'");
			if(rs_check.next())
			{
				flag=0;  
			}
			else
			{
				flag=2;
			}
			rs_check.close();
			st_check.close();
		}
		if(flag==2)
		{
			out.println("<font color='red'>Invalid Employee ID</font>"); 
		}
		else
		{
			if(flag==0)
			{
				Statement st_insert=con.createStatement();
				st_insert.executeUpdate("insert into team_tab(team,employeeId,createdDate,modifiedDateTime) values('"+team+"','"+employee+"',now(),now())");
				st_insert.close();
			}
		
		%>
		<table id="example" class="table table-bordered table-striped" style="width: 100%; cellspacing: 0;">
		<thead>
			<tr>
				<th>#</th>
				<th>Employee</th>
			<!--	<th>Role</th>
				<th>Budget Hours</th>
				<th>Cost Rate /Hour</th> -->
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
		<%
		int c=0;
		Statement st_list=con.createStatement();
		ResultSet rs_list=st_list.executeQuery("select firstName,lastName,role,budgetHours,costRate,employee_tab.employeeId from team_tab, employee_tab where team_tab.employeeId=employee_tab.employeeId and  team='"+team+"' ");
		while(rs_list.next())
		{
			c=c+1;
			%>
			<tr>
				<td><%=c %></td>  
				<td><%=rs_list.getString("firstName") %> <%=rs_list.getString("lastName") %> [ <%=rs_list.getString("employee_tab.employeeId") %> ] </td>  
				<!--<td><%=rs_list.getString("Role") %></td>  
				<td><%=rs_list.getString("budgetHours") %></td>  
				<td><%=rs_list.getString("costRate") %></td>  -->
				<td>Delete</td>
			</tr>
			
			<%
		}
		rs_list.close();
		st_list.close();
		
		%>
		<tr>
				<td>&nbsp;</td>  
				<td>&nbsp;</td>  
				<td>&nbsp;</td>  
				
			</tr>
		</tbody>
		</table>
		<%
		}
	}
	catch(Exception e)
	{
		out.print("Error occured in checkAvailability7.jsp "+e);
	}
}
%>
