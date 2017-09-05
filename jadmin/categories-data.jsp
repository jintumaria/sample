<%
if(linkId.equals("1"))
{
	Statement stDisplay=con.createStatement();
	ResultSet rsDisplay=stDisplay.executeQuery("select name,address,phone,email,password from location_tab where id='"+id+"'");
	if(rsDisplay.next())
	{
				name=rsDisplay.getString("name");
				address=rsDisplay.getString("address");
				phone=rsDisplay.getString("phone");
				email=rsDisplay.getString("email");
				password=rsDisplay.getString("password");				
							
	}
	rsDisplay.close();
	stDisplay.close();	
}	
else
{
	Statement stDisplay=con.createStatement();
	ResultSet rsDisplay=stDisplay.executeQuery("select name,caption from category_tab where id='"+id+"'");
	if(rsDisplay.next())
	{
				name=rsDisplay.getString("name");
				caption=rsDisplay.getString("caption");
				
	}
	rsDisplay.close();
	stDisplay.close();	
}
%>