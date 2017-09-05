<%

if(request.getParameter("id")!=null)										{				id=request.getParameter("id").replaceAll("'","`");			}
if(request.getParameter("status")!=null)									{				status=request.getParameter("status").replaceAll("'","`");			}

		
String customer_query="select * from  invoice_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
//out.println(application_query);
Statement st_invoice_settings_view=con.createStatement();
ResultSet rs_invoice_settings_view=st_invoice_settings_view.executeQuery(customer_query);

String invoicePrefix="",startInvoiceNo="",invoiceSuffix="",body1="",body2="",paypalEmail="";

	
if(rs_invoice_settings_view.next())
{
			invoicePrefix=rs_invoice_settings_view.getString("invoicePrefix");
			startInvoiceNo=rs_invoice_settings_view.getString("startInvoiceNo");
			invoiceSuffix=rs_invoice_settings_view.getString("invoiceSuffix");
			body1=rs_invoice_settings_view.getString("body1");
			body2=rs_invoice_settings_view.getString("body2");
			paypalEmail=rs_invoice_settings_view.getString("paypalEmail");
			
  
}

rs_invoice_settings_view.close();
st_invoice_settings_view.close();
	
		
	

%>