<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%@include file="../jadmin/employees-data.jsp"%>

<%
try
{
	String post="",no="";
	if(request.getParameter("value1")!=null) { 		post=request.getParameter("value1"); 	}
	if(request.getParameter("value3")!=null) { 		no=request.getParameter("value3"); 		}
	
%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comments <br><div class="inbox-item">
<% Statement st_comment=con.createStatement();
   ResultSet rs_comment=st_comment.executeQuery("select * from comments_post_tab where post='"+post+"' order by modifiedDateTime");
   while(rs_comment.next())
   {
	Statement st_emp1=con.createStatement();
	ResultSet rs_emp1=st_emp1.executeQuery("select firstName,lastName from employee_tab where employeeId='"+rs_comment.getString("employeeId")+"'");
	if(rs_emp1.next())
	{																
	%>
	<div class="col-md-1"></div>
	<div class="col-md-11">
	
	<p class="inbox-item-author"><%=rs_emp1.getString("firstName") %> <%=rs_emp1.getString("lastName") %></p>
	<p class="inbox-item-date"><%=rs_comment.getString("modifiedDateTime") %>
	</p>
	<p class="inbox-item-text"><%=rs_comment.getString("comments") %>
	<% if(rs_comment.getString("employeeId").equals(employeeId)) { %>
	<div align="right"><a href="post-comment.jsp?postid=<%=post%>&status=delete&no=<%=no%>&commentid=<%=rs_comment.getString("id")%>"  title="Delete"><i class="fa fa-trash-o"></i> </a></div> <% } %>
	</p>
	</div>
	<%
	}
	rs_emp1.close();
	st_emp1.close();
   }
   rs_comment.close();
   st_comment.close();
%> </div>
	
		<form action="post-comment.jsp">
			<input type="hidden" name="postid" value="<%=post%>">
			<input type="hidden" name="status" value="<%=status%>">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="text" name="comments"  placeholder="Write a comment" class="form-control">
			<div class="inbox-item"><p class="inbox-item-text">Press enter to post</p></div>
		</form>
		
<%
}
catch(Exception e)
{
	out.print("Error occured in checkComment.jsp "+e);
}
%>
