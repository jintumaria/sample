<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String status="";
		String clientName="",address1="",address2="",city="",state="",country="",postalcode="",phone="",mobile="",fax="",website="",email="",fname="",lname="",contactEmail="",contactPhone="";
		
		String adminid=session.getAttribute("admin_id").toString();
		String id="",page_show="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		if(request.getParameter("page")!=null)		{	page_show=request.getParameter("page"); 	 				 }
		
		if(request.getParameter("client_name")!=null)		{	clientName=request.getParameter("client_name").replaceAll("'", "`");				 }
  		if(request.getParameter("address_1")!=null)			{	address1=request.getParameter("address_1").replaceAll("'", "`"); 	 }
		if(request.getParameter("address_2")!=null)			{	address2=request.getParameter("address_2").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("city")!=null)			{	city=request.getParameter("city").replaceAll("'", "`");									 }
  		if(request.getParameter("state")!=null)			{	state=request.getParameter("state").replaceAll("'", "`"); 			 }
		if(request.getParameter("country")!=null)		{	country=request.getParameter("country").replaceAll("'", "`");	     }
		if(request.getParameter("postalcode")!=null)	{	postalcode=request.getParameter("postalcode").replaceAll("'", "`");	 }
		
		if(request.getParameter("phone")!=null)		{	phone=request.getParameter("phone").replaceAll("'", "`");				 			 }
  		if(request.getParameter("mobile")!=null)	{	mobile=request.getParameter("mobile").replaceAll("'", "`"); 	 }
		if(request.getParameter("fax")!=null)	    {	fax=request.getParameter("fax").replaceAll("'", "`"); 			 }
		if(request.getParameter("website")!=null)	{	website=request.getParameter("website").replaceAll("'", "`"); 	 }
		if(request.getParameter("email")!=null)	    {	email=request.getParameter("email").replaceAll("'", "`"); 		 }
		
		if(request.getParameter("fname")!=null)		{	fname=request.getParameter("fname").replaceAll("'", "`");				 			 }
  		if(request.getParameter("lname")!=null)		{	lname=request.getParameter("lname").replaceAll("'", "`"); 		 }
		if(request.getParameter("contactemail")!=null)  {	contactEmail=request.getParameter("contactemail").replaceAll("'", "`"); 	 }
		if(request.getParameter("contactphone")!=null)	{	contactPhone=request.getParameter("contactphone").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id"); 							 }			
			
		if(status.equals("insert"))
		{
			
		int priority_count=0;
		Statement st=con.createStatement();
		String sql="select email from client_tab where email='"+email+"'";
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			priority_count=1;
		}
		rs.close();
		st.close();
			
			if(priority_count==0)
			{						
			//statement to insert values		
			String sqlinsert="insert into client_tab(userId,clientName,address1,address2,city,state,country,postalcode,phone,mobile,fax,website,email,fname,lname,contactEmail,contactPhone,clientStatus,createdDate,modifiedDateTime,clientCategory)values('"+adminid+"','"+clientName+"','"+address1+"','"+address2+"','"+city+"','"+state+"','"+country+"','"+postalcode+"','"+phone+"','"+mobile+"','"+fax+"','"+website+"','"+email+"','"+fname+"','"+lname+"','"+contactEmail+"','"+contactPhone+"','ENABLED',now(),now(),'1')";
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();
				response.sendRedirect("clients.jsp?msg=1&page="+page_show);
			}
			else
			{
				response.sendRedirect("clients.jsp?msg=0&page="+page_show);
			}			
			
			
			
		}	
		if(status.equals("edit"))
		{			
					
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update client_tab set clientName='"+clientName+"',address1='"+address1+"',address2='"+address2+"',city='"+city+"',state='"+state+"',country='"+country+"',postalcode='"+postalcode+"',phone='"+phone+"',mobile='"+mobile+"',fax='"+fax+"',website='"+website+"',email='"+email+"',fname='"+fname+"',lname='"+lname+"',contactEmail='"+contactEmail+"',contactPhone='"+contactPhone+"',modifiedDateTime=now() where id='"+id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("clients.jsp?msg=2&page="+page_show);
		}		
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from client_tab where id='"+id+"'");
			//closing statement
			stmtdelete.close();
			
			response.sendRedirect("clients.jsp?msg=3&page="+page_show);
		}
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

