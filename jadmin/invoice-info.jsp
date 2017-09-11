<%
String type="",copyInvoiceNo="",recordInvioce="";
if(request.getParameter("id")!=null)										{				id=request.getParameter("id").replaceAll("'","`");			}
if(request.getParameter("status")!=null)									{				status=request.getParameter("status").replaceAll("'","`");			}
if(request.getParameter("type")!=null)									{				type=request.getParameter("type").replaceAll("'","`");			}

int INVOICENO=0; //  invoice_no=0;
String showInvoiceNo="";
int flag_count=0;	
String invoicePrefix="",startInvoiceNo="",invoiceSuffix="",body1="",body2="",paypalEmail="";

if(session.getAttribute("admin_id")!=null)
{
		
String invoice_settings_query="select * from  invoice_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
Statement st_invoice_settings_view=con.createStatement();
ResultSet rs_invoice_settings_view=st_invoice_settings_view.executeQuery(invoice_settings_query);

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


String invoice_no_query="select * from  invoice_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
Statement st_invoice_no_view=con.createStatement();
ResultSet rs_invoice_no_view=st_invoice_no_view.executeQuery(invoice_no_query);
while(rs_invoice_no_view.next())
{
		flag_count=flag_count+1;
		INVOICENO=Integer.parseInt(startInvoiceNo)+1;
}
if(flag_count==0)
{
	INVOICENO=Integer.parseInt(startInvoiceNo)+1;
}

rs_invoice_settings_view.close();
st_invoice_settings_view.close();
if(invoicePrefix.length()>0)	{	invoicePrefix=invoicePrefix+"-";	}
if(invoiceSuffix.length()>0)	{	invoiceSuffix="-"+invoiceSuffix;	}
showInvoiceNo= invoicePrefix + INVOICENO + invoiceSuffix;
copyInvoiceNo=showInvoiceNo;
}	

String issueDate="",dueDate="",refNo="",clientName="";
if(status.equals("edit"))
{

String invoice_show_query="select ino,issueDate,dueDate,refNo,clientName from  invoice_tab where id='"+id+"'";
Statement st_invoice_show_view=con.createStatement();
ResultSet rs_invoice_show_view=st_invoice_show_view.executeQuery(invoice_show_query);
while(rs_invoice_show_view.next())
{
	showInvoiceNo=rs_invoice_show_view.getString("ino");
	
	issueDate=rs_invoice_show_view.getString("issueDate");
	dueDate=rs_invoice_show_view.getString("dueDate");
	
	refNo=rs_invoice_show_view.getString("refNo");
	clientName=rs_invoice_show_view.getString("clientName");
	
}
rs_invoice_show_view.close();
st_invoice_show_view.close();
}


%>