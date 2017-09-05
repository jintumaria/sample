<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%@include file="../jadmin/employees-data.jsp"%>
<%
if(session.getAttribute("login_id")!=null)
{
	String post="";
	if(request.getParameter("post")!=null) {	post=request.getParameter("post");	}
	out.println(post);
	
	Statement st=con.createStatement();
	String queryInsert="";
	queryInsert="insert into post_tab(employeeId,post,createdDate,modifiedDateTime) values('"+employeeId+"','"+post+"',now(),now())";
	st.executeUpdate(queryInsert);
	st.close();
	response.sendRedirect("home.jsp");
}
%>