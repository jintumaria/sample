<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%
if(session.getAttribute("login_id")!=null)
	{
	/*
		Statement stCountData=con.createStatement();
		ResultSet rsCountData=stCountData.executeQuery("select employeeId from attendance_tab where employeeId='"+rsLogin.getInt("id")+"' and date=CURDATE()");
		while(rsCountData.next())
		{
			COUNTDATA=1;				
		}
		rsCountData.close();
		stCountData.close();	
	*/	
	    if(loginLocation.equals("2"))
		 {
			 strDate = formatterIndiaDate.format(todayDate.getTime());
			 strDateTime = formatterIndiaDateTime.format(todayDate.getTime());
		 }
		 if(loginLocation.equals("1"))
		 {
			  strDate = formatterCanadaDate.format(todayDate.getTime());
			  strDateTime = formatterCanadaDateTime.format(todayDate.getTime());
		 }	
		
		if(COUNTDATA==0)
			{
				Statement stInsert=con.createStatement();
				stInsert.executeUpdate("insert into check_tab(employeeId,date,status,session,ip,host,clientip,latitude,longitude,comments,pagename,createdDate,modifiedDateTime)values('"+session.getAttribute("login_id")+"','"+strDate+"','"+status+"','"+session.getId()+"','"+request.getRemoteAddr()+"','"+request.getRemoteHost()+"','"+request.getHeader("x-forwarded-for")+"','0','0','0','0',now(),'"+strDateTime+"')");
				stInsert.close();	
			}		
			
		response.sendRedirect("home.jsp?msg=1");
     			

	
}
	else
{
	response.sendRedirect("sessionexpire.jsp");
}
	

%>


