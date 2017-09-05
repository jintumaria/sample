<%
System.out.println("r id : ");


int count_record=0;
String query_calculate_1="",query_calculate_2="";
double tot_calculate_1=0.00,tot_calculate_2=0.00,tot_calculate_3=0.00;

if(record_invoice.length()>0)	
{ 
count_record=1;
query_calculate_1="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_invoice+"' and status='A' order by modifiedDateTime desc";
query_calculate_2="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_invoice+"' and status='B' order by modifiedDateTime desc";
}

else if(record_quote.length()>0)	
{ 
count_record=1;
query_calculate_1="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_quote+"' and status='A' order by modifiedDateTime desc";
query_calculate_2="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_quote+"' and status='B' order by modifiedDateTime desc";
}

if(record_id.length()>0)			
{ 
count_record=2;
query_calculate_1="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_id+"' and status='A' order by modifiedDateTime desc";
query_calculate_2="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+record_id+"' and status='B' order by modifiedDateTime desc";


}
if(count_record==0)
{
query_calculate_1="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and status='A' order by modifiedDateTime desc";
query_calculate_2="select addQty,addRate from add_cart where userId='"+session.getAttribute("admin_id")+"' and status='B' order by modifiedDateTime desc";
}

System.out.println("r id : "+record_id);

							
								
								Statement st_calculate_1=con.createStatement();
								ResultSet rs_calculate_1=st_calculate_1.executeQuery(query_calculate_1);
								while(rs_calculate_1.next())
								{
								tot_calculate_1=tot_calculate_1+(Double.parseDouble(rs_calculate_1.getString("addQty"))*(Double.parseDouble(rs_calculate_1.getString("addRate"))));
								}
								rs_calculate_1.close();
								st_calculate_1.close();
								
								
								Statement st_calculate_2=con.createStatement();
								ResultSet rs_calculate_2=st_calculate_2.executeQuery(query_calculate_2);
								while(rs_calculate_2.next())
								{
								tot_calculate_2=tot_calculate_2+(Double.parseDouble(rs_calculate_2.getString("addQty"))*(Double.parseDouble(rs_calculate_2.getString("addRate"))));
								}
								rs_calculate_2.close();
								st_calculate_2.close();
								
							tot_calculate_3=tot_calculate_1 - tot_calculate_2;
%>