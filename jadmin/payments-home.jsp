<%
int count_record_1_home=0;
String query_calculate_1_home="",query_calculate_2_home="";
double tot_calculate_1_home=0.00,tot_calculate_2_home=0.00,tot_calculate_3_home=0.00;

if(record_invoice.length()>0)	
{ 
count_record_1_home=1;
query_calculate_1_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+record_invoice+"' and status='A' order by modified_date desc";
query_calculate_2_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+record_invoice+"' and status='B' order by modified_date desc";
	}
if(record_id.length()>0)			
{ 
count_record_1_home=2;
query_calculate_1_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+record_id+"' and status='A' order by modified_date desc";
query_calculate_2_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+record_id+"' and status='B' order by modified_date desc";
			}
if(count_record_1_home==0)
{
query_calculate_1_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and status='A' order by modified_date desc";
query_calculate_2_home="select add_qty,add_rate from add_cart where user_id='"+session.getAttribute("admin_id")+"' and status='B' order by modified_date desc";
}

							
								
								Statement st_calculate_1_home=con.createStatement();
								ResultSet rs_calculate_1_home=st_calculate_1_home.executeQuery(query_calculate_1_home);
								while(rs_calculate_1_home.next())
								{
								tot_calculate_1_home=tot_calculate_1_home+(Double.parseDouble(rs_calculate_1_home.getString("add_qty"))*(Double.parseDouble(rs_calculate_1_home.getString("add_rate"))));
								}
								rs_calculate_1_home.close();
								st_calculate_1_home.close();
								
								
								Statement st_calculate_2_home=con.createStatement();
								ResultSet rs_calculate_2_home=st_calculate_2_home.executeQuery(query_calculate_2_home);
								while(rs_calculate_2_home.next())
								{
								tot_calculate_2_home=tot_calculate_2_home+(Double.parseDouble(rs_calculate_2_home.getString("add_qty"))*(Double.parseDouble(rs_calculate_2_home.getString("add_rate"))));
								}
								rs_calculate_2_home.close();
								st_calculate_2_home.close();
								
							tot_calculate_3_home=tot_calculate_1_home - tot_calculate_2_home;
%>