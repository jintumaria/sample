<%
if(session.getAttribute("login_id")!=null)
	{
		response.sendRedirect("index.jsp?msg=2");
	}else{
%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%
	PreparedStatement psLogin=null;
	psLogin=con.prepareStatement("select * from admin_tab  where userName=? and password=?");
	psLogin.setString(1,userName);
	psLogin.setString(2,password);
	ResultSet rsLogin=psLogin.executeQuery();
	if(rsLogin.next())
	{
		FLAGCHECK=1;
		// Check the Admin Status
		session.setAttribute("admin_name",rsLogin.getString("userName"));
		session.setAttribute("admin_id",rsLogin.getInt("id"));
		session.setAttribute("admin_status",rsLogin.getString("status"));
		session.setAttribute("admin_email",rsLogin.getString("email"));				
		session.setAttribute("logo_path","assets/images/admin.png");
		session.setAttribute("business_name",rsLogin.getString("businessName"));
		System.out.println(" bsn "+session.getAttribute("business_name"));
		
		session.setAttribute("admin_currency",rsLogin.getString("currency"));
		session.setAttribute("admin_currency_code",rsLogin.getString("currencyCode"));
		session.setAttribute("admin_phone",rsLogin.getString("phone"));
		session.setAttribute("admin_website",rsLogin.getString("website"));
		
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


