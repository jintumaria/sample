<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%
/*
*retrieving values from addnewproposal.jsp page
*/
if(session.getAttribute("admin_id")!=null)
{
		String paymentDate="",addQty="1",addRate="",status="",id="",idq="",invoiceNo="";	
		
		if(request.getParameter("payment_date")!=null)			{				paymentDate=request.getParameter("payment_date");				}
		if(request.getParameter("add_rate")!=null)			{				addRate=request.getParameter("add_rate");					}
		if(request.getParameter("status")!=null)			{				status=request.getParameter("status");						}
		if(request.getParameter("id")!=null)				{				id=request.getParameter("id");								}
		if(request.getParameter("idq")!=null)				{	idq=request.getParameter("idq"); 							 }			
		if(request.getParameter("invoice_no")!=null)				{	invoiceNo=request.getParameter("invoice_no"); 							 }			
		
		if(status.equals("insert"))
		{
			String sql="insert into add_cart(userId,sessionId,itemName,addQty,addRate,status,createdDate,modifiedDateTime)values('"+session.getAttribute("admin_id").toString()+"','"+invoiceNo+"','"+paymentDate+"','"+addQty+"','"+addRate+"','B',now(),now())";			
					Statement st=con.createStatement();
					st.executeUpdate(sql);			
					st.close();
					
					String sql1="update invoice_tab set invoiceStatus='ENABLED1' where ino='"+invoiceNo+"'";			
					Statement st1=con.createStatement();
					st1.executeUpdate(sql1);			
					st1.close();	
					
					response.sendRedirect("record-payment.jsp?msg=2&status=edit&id="+invoiceNo);	
		}
		
		if(status.equals("delete"))
		{
					String sql2="delete from add_cart where id='"+idq+"'";		
					//out.println(sql2);	
					Statement st2=con.createStatement();
					st2.executeUpdate(sql2);			
					st2.close();		
					
					String sql4="update invoice_tab set invoiceStatus='ENABLED' where ino='"+id+"'";			
					Statement st4=con.createStatement();
					st4.executeUpdate(sql4);			
					st4.close();
					
					response.sendRedirect("record-payment.jsp?msg=2&status=edit&id="+id);
		}
}

		con.close();
%>