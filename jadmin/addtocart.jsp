<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%
/*
*retrieving values from addnewproposal.jsp page
*/
		String item_name="",add_qty="1",add_rate="",status="",id="",idq="";	
		
		if(request.getParameter("item_name")!=null)			{				item_name=request.getParameter("item_name");				}
		if(request.getParameter("add_qty")!=null)			{				add_qty=request.getParameter("add_qty");					}
		if(request.getParameter("add_rate")!=null)			{				add_rate=request.getParameter("add_rate");					}
		if(request.getParameter("status")!=null)			{				status=request.getParameter("status");						}
		if(request.getParameter("id")!=null)				{				id=request.getParameter("id");								}
		if(request.getParameter("idq")!=null)				{	idq=request.getParameter("idq"); 							 }			
		
		
		if(status.equals("edit"))
		{
					String sql1="update add_cart set item_name='"+item_name+"',add_qty='"+add_qty+"',add_rate='"+add_rate+"' where id='"+id+"'";			
					Statement st1=con.createStatement();
					st1.executeUpdate(sql1);			
					st1.close();		
					response.sendRedirect("invoices.jsp");		
			
		}
		if(status.equals("delete"))
		{
					String sql2="delete from add_cart where id='"+id+"'";			
					Statement st2=con.createStatement();
					st2.executeUpdate(sql2);			
					st2.close();	
					String p="";
					if(request.getParameter("page")!=null)
					{
						p=request.getParameter("page");
					}
					if(p.equals("quote"))
					{
						response.sendRedirect("quotes.jsp?msg=3&status=edit&id="+idq);
					}
					else
					{
					response.sendRedirect("invoices.jsp?msg=3&status=edit&id="+idq);
					}
		}
		con.close();
%>