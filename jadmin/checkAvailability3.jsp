<%@ page import="java.sql.*"%>
<%@include file="../include/dbconnection.jsp"%>
<%
try
{
	if(request.getParameter("value")!=null && request.getParameter("value").length()>0)
	{
		
		String out_value = request.getParameter("value");
		int flag_count=0;
		//out.println(out_value);
		//out.println("select category_id,category_name from subcategory_tab where category='"+out_value+"'");
		%>
		<select name="caste" id="caste" class="js-states form-control" tabindex="-1" style="width: 100%">
         <option value="" selected>--- Caste  ---</option>
				
										  <%
										   String subcategory_name="select category_id,category_name from subcategory_tab where category='"+out_value+"'";
										   Statement st_subcategory=con.createStatement();
										   ResultSet rs_subcategory=st_subcategory.executeQuery(subcategory_name);		
										   while(rs_subcategory.next())
										   {
										   %>
										  <option value="<%=rs_subcategory.getString("category_id")%>"><%=rs_subcategory.getString("category_name")%></option>
										  <%
										  }
										  rs_subcategory.close();
										  st_subcategory.close();
										  %>
	 </select>						
	 		
			<%				
		con.close();
		
	}
	else
	{
	
		%>
        <select name="caste" id="caste" class="js-states form-control" tabindex="-1" style="width: 100%">
                    <option value="" selected>--- SELECT  ---</option>
                    </select>
        <%
	}
}
catch(Exception e)
{
	out.print("Error occured in checkAvailability1.jsp "+e);
}
%>
