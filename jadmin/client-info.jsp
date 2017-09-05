<%

if(request.getParameter("id")!=null)										{				id=request.getParameter("id").replaceAll("'","`");			}
if(request.getParameter("status")!=null)									{				status=request.getParameter("status").replaceAll("'","`");			}

		
String customer_query="select * from  client_tab where id='"+id+"'";
//out.println(application_query);
Statement st_customer_view=con.createStatement();
ResultSet rs_customer_view=st_customer_view.executeQuery(customer_query);

String clientName="",address1="",address2="",city="",state="",country="",postalcode="",mobile="",fax="",website="",fname="",lname="",contactEmail="",contactPhone="";

	
if(rs_customer_view.next())
{
			if(status.equals("edit")||status.equals("view")){
			clientName=rs_customer_view.getString("clientName");
			address1=rs_customer_view.getString("address1");
			address2=rs_customer_view.getString("address2");
			city=rs_customer_view.getString("city");
			state=rs_customer_view.getString("state");
			country=rs_customer_view.getString("country");
			postalcode=rs_customer_view.getString("postalcode");
			phone=rs_customer_view.getString("phone");
			mobile=rs_customer_view.getString("mobile");
			fax=rs_customer_view.getString("fax");
			website=rs_customer_view.getString("website");
			email=rs_customer_view.getString("email");
			fname=rs_customer_view.getString("fname");
			lname=rs_customer_view.getString("lname");
			contactEmail=rs_customer_view.getString("contactEmail");
			contactPhone=rs_customer_view.getString("contactPhone");
			
			}
  
}

rs_customer_view.close();
st_customer_view.close();
	
		
	

%>