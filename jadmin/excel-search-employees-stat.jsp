<%@ page import="java.util.*"%><%DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");Date date1 = new Date();//System.out.println(dateFormat.format(date1)); %><%@ page contentType="application/vnd.ms-excel"%> <% response.setHeader("Content-Disposition", "inline; filename=\"Download-"+dateFormat.format(date1)+".xls\""); %>
<%@include file="include/dbconnection.jsp"%><%@include file="include/utilities.jsp"%><%
if(session.getAttribute("admin_id")!=null)
{
	Statement stShowData=con.createStatement();
	ResultSet rsShowData=stShowData.executeQuery("select id,firstName,lastName,email,mobile,employeeID,dateOfJoining,status,lastLoginDateTime,location from employee_tab where id='"+id+"'");
	if(rsShowData.next())
	{
		COUNTDATA=COUNTDATA+1;
		spiltDate=rsShowData.getString("dateOfJoining").split("/");
		
		String from_date="",to_date="";
		if(request.getParameter("from_date")!=null)	{	from_date= request.getParameter("from_date");	}
		if(request.getParameter("to_date")!=null)	{	to_date= request.getParameter("to_date");	}
		
		DateFormat dtSourceFromDate = new SimpleDateFormat("MM/dd/yyyy");
		DateFormat dtDestinationToDate = new SimpleDateFormat("yyyy-MM-dd");	
		
		Date Fdate = dtSourceFromDate.parse(from_date);
		Date Tdate = dtSourceFromDate.parse(to_date);
		long grandTotalTime=0;
		Date dateShow;
		Statement stTodayStatus=con.createStatement();
		%>		&nbsp;<br><h3>Employees Status - <%=rsShowData.getString("employeeID")%>&nbsp; :&nbsp; <%=rsShowData.getString("firstName")%>&nbsp;<%=rsShowData.getString("lastName")%></h3><br><br>
		
		<%
		ResultSet rsTodayStatus=stTodayStatus.executeQuery("select distinct(date) from check_tab where employeeId='"+rsShowData.getString("id")+"' and modifiedDateTime between '"+dtDestinationToDate.format(Fdate)+"' and '"+dtDestinationToDate.format(Tdate)+"' order by modifiedDateTime asc");
		while(rsTodayStatus.next())
		{
			COUNTMODAL=COUNTMODAL+1;
			String[] words=rsTodayStatus.getString("date").split("-");
			
		%>		<h4><%=COUNTMODAL%>. &nbsp;&nbsp; <%=words[2]%>.<%=words[1]%>.<%=words[0]%> </h4>		<table style="width: 100%;" border="1">		<thead><th><br>Status<br></th><th><br>Time<br></th></thead>		<%			int f=0;		long beforeTime=0,afterTime=0,totalTime=0;		Statement stStatus=con.createStatement();		ResultSet rsStatus=stStatus.executeQuery("select modifiedDateTime,status from check_tab where date='"+rsTodayStatus.getString("date")+"' and  employeeId='"+rsShowData.getString("id")+"' order by modifiedDateTime asc");		while(rsStatus.next())		{			dateShow=dtSourceDate.parse(rsStatus.getString("modifiedDateTime"));			%>						<tr>
			<td>
			<%=rsStatus.getString("status").toUpperCase()%></td>
			<td> 
			
			<%=formatterShow.format(dateShow) %></td></tr>
			
			<%
			
			if(rsStatus.getString("status").toUpperCase().equals("CHECKIN"))
			{
				if(beforeTime==0)
					beforeTime=dateShow.getTime();
			}
			else if(rsStatus.getString("status").toUpperCase().equals("BREAKIN"))
			{
				beforeTime=dateShow.getTime()-beforeTime;
				totalTime=totalTime+beforeTime;
				beforeTime=0;
			}
			else if(rsStatus.getString("status").toUpperCase().equals("BREAKOUT"))
			{
				afterTime=dateShow.getTime();
				beforeTime=dateShow.getTime();
			}
			else if(rsStatus.getString("status").toUpperCase().equals("CHECKOUT"))
			{
				if(beforeTime==0)
				{
					totalTime=0;
				}
				else if(afterTime==0)
				{
					beforeTime=dateShow.getTime()-beforeTime;
					totalTime=totalTime+beforeTime;
					beforeTime=0;
				}
				else
				{
					afterTime=dateShow.getTime()-afterTime;
					totalTime=totalTime+afterTime;
					afterTime=0;
				}
			}
		%> </tr> <% 
		}
		rsStatus.close();
		stStatus.close();		%> </table> <%
		
		grandTotalTime=grandTotalTime+totalTime;
		
		int seconds = (int) totalTime / 1000;
		// calculate hours minutes and seconds
	    int hours = seconds / 3600;
	    int minutes = (seconds % 3600) / 60;
	    seconds = (seconds % 3600) % 60;
		
		//out.println("<br><b>"+hours +" Hours "+minutes + " Minutes "+seconds + " Seconds</b>");
		%>		<div>
		<br><b><%=hours %> Hours <%=minutes %> Minutes <%=seconds %> Seconds</b><br><br><br>&nbsp;</div>
		<%
		}
		rsTodayStatus.close();
		stTodayStatus.close();
		
		int seconds = (int) grandTotalTime / 1000;
		// calculate hours minutes and seconds
	    int hours = seconds / 3600;
	    int minutes = (seconds % 3600) / 60;
	    seconds = (seconds % 3600) % 60;
		
		//out.println("<br><br><b>TOTAL TIME : "+hours +" Hours "+minutes + " Minutes "+seconds + " Seconds</b>");
		
		
		%>
		<b><h3>Grand Total :<%=hours %> Hours <%=minutes %> Minutes <%=seconds %> Seconds</h3></b>
		
		<%
		COUNTMODAL=0;
	}
	rsShowData.close();
	stShowData.close();

}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>