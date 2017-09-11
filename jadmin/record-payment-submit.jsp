<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%
/*
*retrieving values from addnewproposal.jsp page
*/
if(session.getAttribute("admin_id")!=null)
{
		String payment_date="",add_qty="1",add_rate="",status="",id="",idq="",invoice_no="";	
		
		if(request.getParameter("payment_date")!=null)			{				payment_date=request.getParameter("payment_date");				}
		if(request.getParameter("add_rate")!=null)			{				add_rate=request.getParameter("add_rate");					}
		if(request.getParameter("status")!=null)			{				status=request.getParameter("status");						}
		if(request.getParameter("id")!=null)				{				id=request.getParameter("id");								}
		if(request.getParameter("idq")!=null)				{	idq=request.getParameter("idq"); 							 }			
		if(request.getParameter("invoice_no")!=null)				{	invoice_no=request.getParameter("invoice_no"); 							 }			
		
		if(status.equals("insert"))
		{
			String sql="insert into add_cart(user_id,session_id,item_name,add_qty,add_rate,status,created_date,modified_date)values('"+session.getAttribute("admin_id").toString()+"','"+invoice_no+"','"+payment_date+"','"+add_qty+"','"+add_rate+"','B',now(),now())";			
					Statement st=con.createStatement();
					st.executeUpdate(sql);			
					st.close();
					
					String sql1="update invoice_tab set invoice_status='ENABLED1' where ino='"+invoice_no+"'";			
					Statement st1=con.createStatement();
					st1.executeUpdate(sql1);			
					st1.close();	
					
					response.sendRedirect("record-payment.jsp?msg=2&status=edit&id="+invoice_no);	
		}
		
		if(status.equals("delete"))
		{
					String sql2="delete from add_cart where id='"+idq+"'";		
					//out.println(sql2);	
					Statement st2=con.createStatement();
					st2.executeUpdate(sql2);			
					st2.close();		
					
					String sql4="update invoice_tab set invoice_status='ENABLED' where ino='"+id+"'";			
					Statement st4=con.createStatement();
					st4.executeUpdate(sql4);			
					st4.close();
					
					response.sendRedirect("record-payment.jsp?msg=2&status=edit&id="+id);
		}
}

		con.close();
%>