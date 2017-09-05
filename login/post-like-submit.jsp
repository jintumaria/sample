<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%@include file="../jadmin/employees-data.jsp"%>
<%
if(session.getAttribute("login_id")!=null)
{
	String post="";
	int FLAG=0;
	if(request.getParameter("post")!=null) 	  {		post=request.getParameter("post");		}
	if(request.getParameter("status")!=null)  {		status=request.getParameter("status");	}
	
	if(status.equals("delete"))
	{
		Statement st_sel=con.createStatement();
		ResultSet rs_sel=st_sel.executeQuery("select * from post_tab where id='"+post+"' and employeeId='"+employeeId+"'");
		if(rs_sel.next())
		{
			FLAG=1;
			Statement st=con.createStatement();
			st.executeUpdate("delete from post_tab where id='"+post+"'");
			st.close();
		}
		rs_sel.close();
		st_sel.close();
	}
	if(FLAG!=1)
	{
		Statement st_select=con.createStatement();
		ResultSet rs_select=st_select.executeQuery("select id from like_post_tab where post='"+post+"' and employeeId='"+employeeId+"'");
		if(rs_select.next())
		{
			Statement st=con.createStatement();
			st.executeUpdate("update like_post_tab set status='"+status+"' where id='"+rs_select.getString("id")+"'");
			st.close();
		}
		else
		{
			Statement st=con.createStatement();
			String queryInsert="";
			queryInsert="insert into like_post_tab(employeeId,post,status,createdDate,modifiedDateTime) values('"+employeeId+"','"+post+"','"+status+"',now(),now())";
			st.executeUpdate(queryInsert);
			st.close();
		}
		rs_select.close();
		st_select.close();
	
		st_select=con.createStatement();
		String qry="select id,likes from post_tab where id="+post+"";
		//out.println(qry);
		rs_select=st_select.executeQuery(qry);
		if(rs_select.next())
		{
			int likes=rs_select.getInt("likes");
			out.println("likes : "+likes);
			if(status.equals("like")) 		 {	 likes=likes+1; 	}
			else if(status.equals("unlike")) { 	 likes=likes-1; 	}
			
			if(likes<0) { likes=0; }
			Statement st=con.createStatement();
			st.executeUpdate("update post_tab set likes='"+likes+"' where id='"+rs_select.getString("id")+"'");
			st.close();
		}
		rs_select.close();
		st_select.close();
	}
	con.close();
	response.sendRedirect("home.jsp");
}
%>