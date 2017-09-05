<%

if(request.getParameter("id")!=null)										{				id=request.getParameter("id").replaceAll("'","`");			}
if(request.getParameter("status")!=null)									{				status=request.getParameter("status").replaceAll("'","`");			}

		
String customer_query="select `id`, `userId`, `quotePrefix`, `startQuoteNo`, `quoteSuffix`, `body1`, `body2`, `status`, `createdDate`, `modifiedDateTime`, `paypalEmail` from  quote_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
//out.println(application_query);
Statement st_quote_settings_view=con.createStatement();
ResultSet rs_quote_settings_view=st_quote_settings_view.executeQuery(customer_query);

String quotePrefix="",startQuoteNo="",quoteSuffix="",body1="",body2="",paypalEmail="";

	
if(rs_quote_settings_view.next())
{
			quotePrefix=rs_quote_settings_view.getString("quotePrefix");
			startQuoteNo=rs_quote_settings_view.getString("startQuoteNo");
			quoteSuffix=rs_quote_settings_view.getString("quoteSuffix");
			body1=rs_quote_settings_view.getString("body1");
			body2=rs_quote_settings_view.getString("body2");
			paypalEmail=rs_quote_settings_view.getString("paypalEmail");
			
 }

rs_quote_settings_view.close();
st_quote_settings_view.close();
	
		
	

%>