<%@ page import="java.sql.*"%>
<%@include file="include/dbconnection.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
{
try
{
	String itemName="",itemQty="",itemRate="",invoiceNo="";
	if(request.getParameter("value")!=null && request.getParameter("value").length()>0)
	{
		itemName = request.getParameter("value");
	}	
	if(request.getParameter("value1")!=null && request.getParameter("value1").length()>0)
	{
		itemQty = request.getParameter("value1");
	}	
	if(request.getParameter("value2")!=null && request.getParameter("value2").length()>0)
	{
		itemRate = request.getParameter("value2");
	}
	if(request.getParameter("value3")!=null && request.getParameter("value3").length()>0)
	{
		invoiceNo = request.getParameter("value3");
	}	
	
	
	String idq="";
			String query_idq="Select id from invoice_tab where ino='"+invoiceNo+"'";
			Statement stm_idq=con.createStatement();
			ResultSet rs_idq= stm_idq.executeQuery(query_idq);
			while(rs_idq.next())
			{
			idq=rs_idq.getString("id");
			}
			rs_idq.close();
			stm_idq.close();
	
			int COUNT_I=0;
	        String query="Select * from add_cart where userId='"+session.getAttribute("admin_id").toString()+"' and sessionId='"+invoiceNo+"' and itemName='"+itemName+"' ";
			Statement stm=con.createStatement();
			ResultSet rs= stm.executeQuery(query);
			while(rs.next())
			{
				COUNT_I=COUNT_I+1;
			}
			rs.close();
			stm.close();
			
			if(COUNT_I==0)
			{
								
					String sql="insert into add_cart(userId,sessionId,itemName,addQty,addRate,status,createdDate,modifiedDateTime)values('"+session.getAttribute("admin_id").toString()+"','"+invoiceNo+"','"+itemName+"','"+itemQty+"','"+itemRate+"','A',now(),now())";			
					Statement st=con.createStatement();
					st.executeUpdate(sql);			
					st.close();	
					
					
				
			}
			
			%>
            <table id="example" class="table table-bordered table-striped" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Description</th>
                                                <th>Qty</th>
                                                <th>Rate</th>
                                                <th>Sub Total</th>                                              
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%
						int j=0;
						 double value_amount=0.00,tot_value_amount=0.00;
			  			String query_invoice_temp="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+invoiceNo+"' and status='A' order by modifiedDateTime desc";
						Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
				value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
						
%>
                                        
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=rs_invoice_temp.getString("itemName")%></td>
                                                <td><%=rs_invoice_temp.getString("addQty")%></td>
                                                <td><%=rs_invoice_temp.getString("addRate")%></td>
                                                <td><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=value_amount%></td>
                                               
                                                <td><a href="addtocart.jsp?status=delete&id=<%=rs_invoice_temp.getString("id")%>&idq=<%=idq%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                            
                                            <%
							value_amount=0.0;				
						}
						st_invoice_temp.close();
						rs_invoice_temp.close();
						
						if(j==0)
						{
					
%>											<tr>
                                                <td colspan="6" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
											 
						<%
						}
						%>
                        				<tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>&nbsp;</th>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                        <tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>Total : </th>  
                                                <td><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=tot_value_amount%></td>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                        				
                                            
                                            <tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>Grand Total : </th>  
                                                <th><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=tot_value_amount%></th>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                        </tbody>
                                       </table>  
            <%
			
	con.close();
	
	
}
catch(Exception e)
{
	out.print("Error occured in checkAvailability2.jsp "+e);
}
}
%>
