<%@ page import="java.sql.*"%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
 
<%

if(session.getAttribute("admin_id")!=null)
{
	try
	{
		
		String clientName="",projectName="", projectNumber="", startingDate="", endingDate="",specialNotes="", team="";
		String projectType="Fixed", tasks="";
		int i=0;
		
		if(request.getParameter("clientName")!=null)    {	 clientName=request.getParameter("clientName");	        }
		if(request.getParameter("projectName")!=null)   {	 projectName=request.getParameter("projectName");	    }
		if(request.getParameter("projectNumber")!=null) {	 projectNumber=request.getParameter("projectNumber");	}
		if(request.getParameter("startingDate")!=null) {	startingDate=request.getParameter("startingDate");	 }
		if(request.getParameter("endingDate")!=null)   {	endingDate=request.getParameter("endingDate");		 }
		if(request.getParameter("specialNotes")!=null) {	specialNotes=request.getParameter("specialNotes");	 }
		if(request.getParameter("status")!=null) {	status=request.getParameter("status");	}
		if(request.getParameter("id")!=null)     {	id=request.getParameter("id");		}
		if(request.getParameter("team")!=null)   {	team=request.getParameter("team");		}
		
		out.println(status);
		if(status.equals("insert"))
		{
			
			Statement st=con.createStatement();
			i=st.executeUpdate("insert into project_tab(clientName,projectName,projectCode,startingDate,endingDate,otherInfo,team,projectType,tasks,createdDate,modifiedDateTime) values('"+clientName+"','"+projectName+"','"+projectNumber+"','"+startingDate+"','"+endingDate+"','"+specialNotes+"','"+team+"','"+projectType+"','"+tasks+"',now(),now())");
			st.close();
			
			
			response.sendRedirect("projects.jsp?status=insert&msg=1");
		}
		else if(status.equals("edit"))
		{
			Statement st=con.createStatement();
			String qry="update project_tab set clientName='"+clientName+"', projectName='"+projectName+"', projectCode='"+projectNumber+"', startingDate='"+startingDate+"', endingDate='"+endingDate+"',otherInfo='"+specialNotes+"',team='"+team+"',projectType='"+projectType+"',tasks='"+tasks+"', modifiedDateTime=now() where id='"+id+"'";
			
			i=st.executeUpdate(qry);
			st.close();
			
			response.sendRedirect("projects.jsp?status=insert&msg=2");
		}
		else if(status.equals("delete"))
		{
			out.println("hai");
			Statement st=con.createStatement();
			i=st.executeUpdate("delete from project_tab where id='"+id+"'");
			st.close();
			
			st=con.createStatement();
			i=st.executeUpdate("delete from team_tab where team='"+team+"'");
			st.close();
			
			response.sendRedirect("projects.jsp?status=insert&msg=3");
		}
			
		
		
		
	}
	catch(Exception e)
	{
		out.print("Error occured in checkAvailability7.jsp "+e);
	}
}
%>
