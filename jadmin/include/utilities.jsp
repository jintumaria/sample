<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@page import="java.util.UUID"%>
<%@page import="java.io.*"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>


<%
String titleName="",titleAuthor="";
String msg="",userName="",password="",status="",email="",adminId="",adminName="";
String loginId="",loginName="",loginLocation="";
String linkId="",id="",myQuery="";

String name="",address="",phone="",code="",caption="";
String nameText="",nameCaption="",currentDate="";
Calendar todayDate = Calendar.getInstance();
String strDate="",strDateTime="";

String[] spiltDate=msg.split("/");
String[] spiltStringConstant=msg.split(",");
int FLAGCHECK=0,COUNTDATA=0,MYID=0,COUNTMODAL=0,NOOFIMAGES=0;
String stringConstant="";

String fileName="",altTag="",imageCaption="",imageDescribe="",imageLink="",image1="";
String image1Status="NO",image2="",image2Status="",uploadStatus="",imageId="";
String readOnlyAction="";
String displayPage="";	
String image1Width="",image1Height="",image2Width="",image2Height="";




String category="",infoShort="", infoDescribe="",infoValue="";
String imgPath[]=new String[10];



TimeZone objCanadaTime = TimeZone.getTimeZone("PST");
TimeZone objIndianTime = TimeZone.getTimeZone("IST");	
TimeZone objCentralTime = TimeZone.getTimeZone("CDT");	

DateFormat formatterDefault = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
formatterDefault.setTimeZone(objIndianTime);       	

DateFormat formatterCanadaDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
formatterCanadaDateTime.setTimeZone(objCanadaTime);

DateFormat formatterCanadaDate = new SimpleDateFormat("yyyy-MM-dd");
formatterCanadaDate.setTimeZone(objCanadaTime);

DateFormat formatterIndiaDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
formatterIndiaDateTime.setTimeZone(objIndianTime);

DateFormat formatterIndiaDate = new SimpleDateFormat("yyyy-MM-dd");
formatterIndiaDate.setTimeZone(objIndianTime);
												   
DateFormat dtSourceDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
DateFormat dtDestinationDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

DateFormat dtSourceDateOnly = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat formatterShow = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss a");
																																																					   												   
												   

if(request.getParameter("msg")!=null)	{	msg=request.getParameter("msg");	}
if(request.getParameter("userName")!=null)	{	userName=request.getParameter("userName");	}
if(request.getParameter("password")!=null)	{	password=request.getParameter("password");	}
if(request.getParameter("status")!=null)	{	status=request.getParameter("status");	}
if(request.getParameter("linkId")!=null)	{	linkId=request.getParameter("linkId");	}
if(request.getParameter("email")!=null)	{	email=request.getParameter("email");	}
if(request.getParameter("id")!=null)		{	id=request.getParameter("id");	}

if(request.getParameter("name")!=null)		{	name=request.getParameter("name");			}
if(request.getParameter("caption")!=null)	{	caption=request.getParameter("caption");	}
if(request.getParameter("address")!=null)	{	address=request.getParameter("address");	}
if(request.getParameter("phone")!=null)		{	phone=request.getParameter("phone");		}


if(session.getAttribute("admin_id")!=null)	{		
	adminId=session.getAttribute("admin_id").toString();
	adminName=session.getAttribute("admin_name").toString();	
	
	}

if(session.getAttribute("login_id")!=null)	{		
	loginId=session.getAttribute("login_id").toString();
	loginName=session.getAttribute("login_name").toString();	
	loginLocation=session.getAttribute("login_location").toString();
	}
	


Statement stTitle=con.createStatement();
ResultSet rsTitle=stTitle.executeQuery("select name,status from  title_tab");

	while(rsTitle.next())
	{
		if(rsTitle.getString("status").equals("SITE"))				{				titleName=rsTitle.getString("name");			}
		if(rsTitle.getString("status").equals("AUTHOR"))				{			titleAuthor=rsTitle.getString("name");			}
	
	}
	
rsTitle.close();
stTitle.close();
	
	
if(linkId.equals("1"))		{	nameText="Location";			}
if(linkId.equals("2"))		{	nameText="Leave Types";			}
if(linkId.equals("100"))	{	nameText="Departments";			}
if(linkId.equals("101"))	{	nameText="Designations";		}
if(linkId.equals("50")) 	{   nameText="Categories";      	}
if(linkId.equals("51")) 	{   nameText="Calendar Events";     }
if(linkId.equals("52")) 	{   nameText="Configure Email Id";     }


String attendeeEmail="";

		if(loginLocation.equals("2"))
		 {
			 strDate = formatterIndiaDate.format(todayDate.getTime());
		 }
		 if(loginLocation.equals("1"))
		 {
			  strDate = formatterCanadaDate.format(todayDate.getTime());
		 }		 
		 

Statement stCheckStatus=con.createStatement();
ResultSet rsCheckStatus=stCheckStatus.executeQuery("select status from check_tab where employeeId='"+session.getAttribute("login_id")+"' and date='"+strDate+"' order by id asc");
//out.println("select status from check_tab where employeeId='"+session.getAttribute("login_id")+"' and date='"+strDate+"' order by modifiedDateTime asc");
while(rsCheckStatus.next())
{
	if(rsCheckStatus.getString("status").equals("checkin"))	{ MYID=1;	}
	if(rsCheckStatus.getString("status").equals("breakin"))	{ MYID=2;	}
	if(rsCheckStatus.getString("status").equals("breakout")){ MYID=3;	}
	if(rsCheckStatus.getString("status").equals("checkout")){ MYID=0;	}
	
	
}
//out.println("Sa:"+ MYID);

rsCheckStatus.close();
stCheckStatus.close();
	
	
String record_id="",record_invoice="",record_quote="";
%>