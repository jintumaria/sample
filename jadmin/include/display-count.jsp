<%

int client_count=0;
String query_client_count="select count(*) from client_tab where userId='"+session.getAttribute("admin_id")+"'";
Statement st_client_count=con.createStatement();
ResultSet rs_client_count=st_client_count.executeQuery(query_client_count);
rs_client_count.next();
client_count=rs_client_count.getInt(1);
rs_client_count.close();
st_client_count.close();

int invoice_count=0;
String query_invoice_count="select count(*) from invoice_tab where userId='"+session.getAttribute("admin_id")+"'";
Statement st_invoice_count=con.createStatement();
ResultSet rs_invoice_count=st_invoice_count.executeQuery(query_invoice_count);
rs_invoice_count.next();
invoice_count=rs_invoice_count.getInt(1);
rs_invoice_count.close();
st_invoice_count.close();


int employee_count=0;
String query_employee_count="select count(*) from employee_tab where status='YES'";
Statement st_employee_count=con.createStatement();
ResultSet rs_employee_count=st_employee_count.executeQuery(query_employee_count);
rs_employee_count.next();
employee_count=rs_employee_count.getInt("count(*)");
rs_employee_count.close();
st_employee_count.close();
%>