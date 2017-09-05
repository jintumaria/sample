<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%
// Decalring variables
	String adminstatus="";
	String username="",password="";
	int flag_check=0;
	if(request.getParameter("username")!=null)	{		username=request.getParameter("username");	}
	if(request.getParameter("password")!=null)	{		password=request.getParameter("password");	}
	// Prepared Statement
	PreparedStatement ps=null;
	ps=con.prepareStatement("select * from admin_tab  where admin_name=? and admin_pass=?");
	ps.setString(1,username);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();
// Checking in database
	if(rs.next())
	{
		flag_check=1;
			// Check the Admin Status
				/*stting values to session admin_name,admin_id,admin_status*/
				session.setAttribute("admin_name",rs.getString("userName"));
				session.setAttribute("admin_id",rs.getInt("id"));
				session.setAttribute("admin_status",rs.getString("status"));
				session.setAttribute("admin_email",rs.getString("email"));
				session.setAttribute("business_name",rs.getString("businessName"));
				System.out.println(" bsn "+session.getAttribute("business_name"));
				session.setAttribute("admin_currency",rs.getString("currency"));
				session.setAttribute("admin_currency_code",rs.getString("currencyCode"));
				session.setAttribute("admin_phone",rs.getString("phone"));
				session.setAttribute("admin_website",rs.getString("website"));
				
				
				session.setAttribute("logo_path","assets/images/admin.png");
				
				response.sendRedirect("home.jsp?msg=1");
     			/** Authentication success for Administrators*/
%>
				<jsp:forward page="home.jsp">
				<jsp:param name="msg" value="1"/>
				</jsp:forward>
<%
	}
			if(flag_check==0)
			{
				response.sendRedirect("index.jsp?msg=1");
	/** Authentication failed,action forward to login page*/
%>
				<jsp:forward page="index.jsp">
				<jsp:param name="msg" value="0"/>
				</jsp:forward>
	
<%
			}
	rs.close();
	con.close();
%>


