<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%

if(request.getParameter("id")!=null)		{				id=request.getParameter("id").replaceAll("'","`");			}
if(request.getParameter("status")!=null)	{				status=request.getParameter("status").replaceAll("'","`");			}

int QUOTENO=0;
String showQuoteNo="";
int FLAGCOUNT=0;	
String quotePrefix="",startQuoteNo="",quoteSuffix="",body1="",body2="",paypalEmail="",termsAndConditions="";

if(session.getAttribute("admin_id")!=null)
{
		
String quoteSettingsQuery="select * from  quote_settings_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
Statement st_quote_settings_view=con.createStatement();
ResultSet rs_quote_settings_view=st_quote_settings_view.executeQuery(quoteSettingsQuery);

if(rs_quote_settings_view.next())
{
			quotePrefix=rs_quote_settings_view.getString("quotePrefix");
			startQuoteNo=rs_quote_settings_view.getString("startQuoteNo");
			quoteSuffix=rs_quote_settings_view.getString("quoteSuffix");
			body1=rs_quote_settings_view.getString("body1");
			body2=rs_quote_settings_view.getString("body2");
			paypalEmail=rs_quote_settings_view.getString("paypalEmail");
}
termsAndConditions=body1;


rs_quote_settings_view.close();
st_quote_settings_view.close();


String quote_no_query="select * from  quote_tab where userId='"+session.getAttribute("admin_id").toString()+"'";
Statement st_quote_no_view=con.createStatement();
ResultSet rs_quote_no_view=st_quote_no_view.executeQuery(quote_no_query);
while(rs_quote_no_view.next())
{
		FLAGCOUNT=FLAGCOUNT+1;
		QUOTENO=Integer.parseInt(startQuoteNo)+1;
}
if(FLAGCOUNT==0)
{
		QUOTENO=Integer.parseInt(startQuoteNo)+1;
}

rs_quote_settings_view.close();
st_quote_settings_view.close();
if(quotePrefix.length()>0)	{	quotePrefix=quotePrefix+"-";	}
if(quoteSuffix.length()>0)	{	quoteSuffix="-"+quoteSuffix;	}
showQuoteNo= quotePrefix + QUOTENO+ quoteSuffix;
}		
String issueDate="",refNo="",clientName="";
if(status.equals("edit"))
{

String quote_show_query="select ino,issueDate,refNo,clientName,termsAndConditions from  quote_tab where id='"+id+"'";
Statement st_quote_show_view=con.createStatement();
ResultSet rs_quote_show_view=st_quote_show_view.executeQuery(quote_show_query);
while(rs_quote_show_view.next())
{
	showQuoteNo=rs_quote_show_view.getString("ino");
	issueDate=rs_quote_show_view.getString("issueDate");
	refNo=rs_quote_show_view.getString("refNo");
	clientName=rs_quote_show_view.getString("clientName");
	termsAndConditions=rs_quote_show_view.getString("termsAndConditions");
	
	
	SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat dt1= new SimpleDateFormat("MM/dd/yyyy");
	
	Date dobDate = dt.parse(issueDate);
	issueDate=dt1.format(dobDate);
	
}
rs_quote_show_view.close();
st_quote_show_view.close();
}
	

%>