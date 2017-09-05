<%
String projectName="", projectCode="", startingDate="", endingDate="",specialNotes="", teamName="";
String projectType="Fixed", tasks="";

if(request.getParameter("status")!=null) {	status=request.getParameter("status");	}
if(request.getParameter("id")!=null)     {	id=request.getParameter("id");		}

if(status.equals("edit"))
{
	Statement st_info=con.createStatement();
	ResultSet rs_info=st_info.executeQuery("select clientName,projectName, projectCode,startingDate, endingDate,otherInfo,team, projectType, tasks from project_tab where id='"+id+"'");
	if(rs_info.next())
	{
		clientName=rs_info.getString("clientName");
		projectName=rs_info.getString("projectName");
		projectCode=rs_info.getString("projectCode");
		startingDate=rs_info.getString("startingDate");
		endingDate=rs_info.getString("endingDate");
		specialNotes=rs_info.getString("otherInfo");
		teamName=rs_info.getString("team");
		//projectType=rs_info.getString("projectType");
		//tasks=rs_info.getString("tasks");
	}
	rs_info.close();
	st_info.close();
}	
%>