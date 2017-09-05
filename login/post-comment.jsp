<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%@include file="../jadmin/employees-data.jsp"%>
<%
if(session.getAttribute("login_id")!=null)
{
	String post="",comments="",no="";
	if(request.getParameter("postid")!=null) 	  {		post=request.getParameter("postid");		}
	if(request.getParameter("status")!=null)      {		status=request.getParameter("status");		}
	if(request.getParameter("comments")!=null)    {	    comments=request.getParameter("comments");	}
	if(request.getParameter("no")!=null)    	  {	    no=request.getParameter("no");	}
	if(status.equals("delete"))
	{
		String commentid="";
		if(request.getParameter("commentid")!=null)     {	commentid=request.getParameter("commentid");	}
		Statement st=con.createStatement();
		st.executeUpdate("delete from comments_post_tab where id='"+commentid+"'");
		st.close();
		Statement st_select=con.createStatement();
		String qry="select id,comments from post_tab where id="+post+"";
		ResultSet rs_select=st_select.executeQuery(qry);
		if(rs_select.next())
		{	
			int comment=rs_select.getInt("comments");
			comment=comment-1;
			if(comment<0) { comment=0; }
			st=con.createStatement();
			st.executeUpdate("update post_tab set comments='"+comment+"' where id='"+rs_select.getString("id")+"'");
			st.close();
		}
		rs_select.close();
		st_select.close();
	}
	else
	{
			Statement st=con.createStatement();
			String queryInsert="";
			queryInsert="insert into comments_post_tab(employeeId,post,comments,createdDate,modifiedDateTime) values('"+employeeId+"','"+post+"','"+comments+"',now(),now())";
			st.executeUpdate(queryInsert);
			st.close();
			
			int num=Integer.parseInt(no);
			num=num+1;
			st=con.createStatement();
			st.executeUpdate("update post_tab set comments='"+num+"' where id='"+post+"'");
			st.close();
	}
	
	response.sendRedirect("home.jsp");
	%>	
		<%@include file="comments.jsp"%>
		
	<%
}
%>