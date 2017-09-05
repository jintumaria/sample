<%@ page import="java.sql.*"%>
<%@include file="include/dbconnection.jsp"%>
<%
try
{
	if(request.getParameter("value")!=null && request.getParameter("value").length()>0)
	{
		
		String username = request.getParameter("value");
		String table    = request.getParameter("table");
		int flag_count=0;
		//out.println(username);
		//out.println("select category_id,category_name from subcategory_tab where category='"+username+"'");
		%>
		
										  <%
										   String client_info_query="select * from client_tab where clientName='"+username+"'";
										   String address_1="",address_2="",city="",state="",country="",postalcode="",email="";
										   Statement st_client_info_query=con.createStatement();
										   ResultSet rs_client_info_query=st_client_info_query.executeQuery(client_info_query);		
										   if(rs_client_info_query.next())
										   {%>
										   		<label for="exampleInputEmail"><br /><%=username%>,<br /><%
										   if(rs_client_info_query.getString("address1").length()>0) {	%> <%=rs_client_info_query.getString("address1")%> <%}%>
								<% if(rs_client_info_query.getString("address2").length()>0) {	%> ,  <%=rs_client_info_query.getString("address2")%> <%}%>
								<% if(rs_client_info_query.getString("city").length()>0) {	%> , <%=rs_client_info_query.getString("city")%> <%}%>
								<% if(rs_client_info_query.getString("state").length()>0) {	%> , <%=rs_client_info_query.getString("state")%> <%}%>
								<% if(rs_client_info_query.getString("country").length()>0) {	%> , <%=rs_client_info_query.getString("country")%> <%}%>
								<% if(rs_client_info_query.getString("postalcode").length()>0) {	%> - <%=rs_client_info_query.getString("postalcode")%> <%}%>
										     </label> 
										  <%
										  }
										  rs_client_info_query.close();
										  st_client_info_query.close();
										  %>
	
			<%				
		con.close();
		
	}
	else
	{
	
		%>
         <label for="exampleInputEmail">&nbsp;</label>
        <%
	}
}
catch(Exception e)
{
	out.print("Error occured in checkAvailability1.jsp "+e);
}
%>
