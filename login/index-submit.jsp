<%
if(session.getAttribute("admin_id")!=null)
	{
		response.sendRedirect("index.jsp?msg=2");
	}else{
%>
<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%
	PreparedStatement psLogin=null;
	psLogin=con.prepareStatement("select * from employee_tab  where email=? and password=? and status=? and dateOfJoining <> ?");
	psLogin.setString(1,userName);
	psLogin.setString(2,password);
	psLogin.setString(3,"YES");
	psLogin.setString(4,"00/00/0000");
	
	ResultSet rsLogin=psLogin.executeQuery();
	if(rsLogin.next())
	{
		FLAGCHECK=1;
		// Check the Admin Status
		session.setAttribute("login_name",rsLogin.getString("firstName"));
		session.setAttribute("login_id",rsLogin.getInt("id"));
		session.setAttribute("login_location",rsLogin.getInt("location"));
		session.setAttribute("login_status",rsLogin.getString("status"));
		session.setAttribute("email",rsLogin.getString("email"));				
		session.setAttribute("logo_path","assets/images/admin.png");
			
		 if(rsLogin.getString("location").equals("2"))
		 {
			 strDate = formatterIndiaDateTime.format(todayDate.getTime());
		 }
		 if(rsLogin.getString("location").equals("1"))
		 {
			  strDate = formatterCanadaDateTime.format(todayDate.getTime());
		 }
		 
         out.println("strdate=>" + strDate);

		   
		Statement stEdit=con.createStatement();
		stEdit.executeUpdate("update employee_tab set lastLoginDateTime='"+strDate+"' where id='"+rsLogin.getInt("id")+"' ");
		stEdit.close();	
		
		response.sendRedirect("home.jsp?msg=1");
     			
	}
	if(FLAGCHECK==0)
	{
		response.sendRedirect("index.jsp?msg=0");
	}
	rsLogin.close();
	con.close();
}
%>


