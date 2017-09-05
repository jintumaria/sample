<%
/*
 * @(#)deletedetails.jsp
 *
 * Copyright (c) iDreamzSolutions
 * Cochin,India.
 * All rights reserved.
 * Created by Midhun Jacob on 12/03/2007
 * Modified by Midhun Jacob on 12/03/2007
 * @version 	Tomcat5.0	MySQL 5.0
 * @author 	iDreamzSoltuions - The Perfect IT Solution
 */
%>
<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>

<%
/*
* Retrieving values from admin-delete-submit.jsp
*/
if(session.getAttribute("admin_id")!=null)
	{
		String id="",status="",link_id="",ino="";		
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id").replaceAll("'", "`");					}
		if(request.getParameter("status")!=null)			{	status=request.getParameter("status").replaceAll("'", "`");			}
		if(request.getParameter("link_id")!=null)			{	link_id=request.getParameter("link_id").replaceAll("'", "`");			}
		if(request.getParameter("ino")!=null)				{	ino=request.getParameter("ino").replaceAll("'", "`");				}
		
		
		if(status.equals("deletei"))
		{
		Statement st=con.createStatement();
		int n=st.executeUpdate("delete from invoice_details where id='"+id+"'");
		if(n==1)
		st.close();
		
		Statement st1=con.createStatement();
		int n1=st1.executeUpdate("delete from add_cart where session_id='"+ino+"'");
		if(n1==1)
		st1.close();
		
		
		response.sendRedirect("search-invoices.jsp?msg=1&status="+link_id);
		
		
		}
		
		con.close();
}
else
{ 
	response.sendRedirect("admin-sessionexpire.jsp");
}
%>

