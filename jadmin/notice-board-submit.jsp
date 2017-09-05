<%
/*
 * @(#)downloadmanagement_done.jsp
 * Copyright (c) iDreamzSolutions
 * Cochin,India.
 * All rights reserved.
 * Upload Image Done
 * Created by Aji Varghese on 22/02/2008
 * Modified by  Aji Varghese on 22/02/2008
 * @version 	Tomcat5.0	MySQL 5.0
 * @author 	iDreamzSoltuions - The Perfect IT Solution
 */
%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="employees-data.jsp"%>
<%
response.setHeader("Cache-Control","no-cache");//1.1
response.setHeader("Pragma","no-cache");//1.0
response.setDateHeader("Expires",-1);//proxy
%>

<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>

<%
		
		try
		{
			 mySmartUpload.initialize(pageContext);
			 mySmartUpload.setAllowedFilesList("jpg,png,doc,pdf,docx");
			 mySmartUpload.upload();
		}
		catch(Exception e)
		{
			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"notice-board.jsp"+" class="+"buttonlink"+">Click Here</a> To ReUpload");
			out.close();
		}
		
String pathSeperator=System.getProperty("file.separator");
String path=application.getRealPath("");

		//path
		


if(mySmartUpload.getRequest().getParameter("status")!=null)			{	status=mySmartUpload.getRequest().getParameter("status").replaceAll("'", "`");				}

if(mySmartUpload.getRequest().getParameter("id")!=null)				{	caption=mySmartUpload.getRequest().getParameter("id").replaceAll("'", "`");						}

if(mySmartUpload.getRequest().getParameter("location")!=null)			{	location=mySmartUpload.getRequest().getParameter("location").replaceAll("'", "`");				}else location="0";

if(mySmartUpload.getRequest().getParameter("department")!=null)			{	department=mySmartUpload.getRequest().getParameter("department").replaceAll("'", "`");				}

if(mySmartUpload.getRequest().getParameter("news_category")!=null)	{	category=mySmartUpload.getRequest().getParameter("news_category").replaceAll("'", "`");	}

if(mySmartUpload.getRequest().getParameter("news_date")!=null)		{	strDate=mySmartUpload.getRequest().getParameter("news_date").replaceAll("'", "`");			}

if(mySmartUpload.getRequest().getParameter("news_short")!=null)		{	infoShort=mySmartUpload.getRequest().getParameter("news_short").replaceAll("'", "`");			}

if(mySmartUpload.getRequest().getParameter("news_heading")!=null)	{	name=mySmartUpload.getRequest().getParameter("news_heading").replaceAll("'", "`");		}

if(mySmartUpload.getRequest().getParameter("news_describe")!=null)	{	infoDescribe=mySmartUpload.getRequest().getParameter("news_describe").replaceAll("'", "`");	}

if(location.equals(""))
	location="0";

if(department.equals(""))
	department="0";

SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy");
Date noticeDate = dt.parse(strDate);
SimpleDateFormat dt1= new SimpleDateFormat("yyyy-MM-dd");
strDate=dt1.format(noticeDate);

//out.println(status+id+category+strDate+name+infoShort+infoDescribe+locationId+departmentId);

path+=pathSeperator+"login"+pathSeperator+"documents"+pathSeperator;

out.println(status+caption+"        ");

if(status.equals("edit"))
{
	String sqlDelete="delete from noticeboard_tab where caption='"+caption+"'";
	Statement stmtDelete=con.createStatement();
	stmtDelete.executeUpdate(sqlDelete);
	
}



String newsQuery="";

newsQuery="select id from  noticeboard_tab";
Statement stNewsView=con.createStatement();
ResultSet rsNewsView=stNewsView.executeQuery(newsQuery);
while(rsNewsView.next())
{
	MYID=rsNewsView.getInt("id")+1;
}
rsNewsView.close();
stNewsView.close();

//if(status.equals("edit"))
{
	//MYID=Integer.parseInt(id);	
}

imgPath[0]="NA";

infoValue="N_"+MYID;

caption=infoValue;

com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();

		for(int i=0;i<myfile.getCount();i++)
		{
								//Initial Value of image path or user notification value;
				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);
				
				if(!myFile.isMissing())
				{  
						myFile.saveAs(path+infoValue+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
						
						imgPath[i]=infoValue+"." +myFile.getFileExt();
						
				
						NOOFIMAGES=NOOFIMAGES+1;
						
						FLAGCHECK=1;
						//out.println(imgPath[i];
						
				if(NOOFIMAGES==1)	{	image1Status="YES"; }
										
				}
			}//end of for loop
			

			
String employeeList="";

if(Integer.parseInt(location)!=0)
{
	if(Integer.parseInt(department)!=0)
	{
		employeeList="select employeeId from  employee_tab where location="+location+" and department="+department;
	}
	else
	{
		employeeList="select employeeId from  employee_tab where location="+location;
	}
	
}
else
{
	if(Integer.parseInt(department)!=0)
	{
		employeeList="select employeeId from  employee_tab where department="+department;
	}
	else
	{
		employeeList="select employeeId from  employee_tab";
	}
}


Statement stEmployeeList=con.createStatement();
ResultSet rsEmployeeList=stEmployeeList.executeQuery(employeeList);
		
while(rsEmployeeList.next())
{
	out.println(rsEmployeeList.getString("employeeId"));
	
	
	
				
		String sqlinsert="";
		sqlinsert="insert into noticeboard_tab(location,department,category,employeeId,caption,strDate,name,infoShort,infoDescribe,image1,image1Status,status,createdDate,modifiedDateTime)values('"+location+"','"+department+"','"+category+"','"+rsEmployeeList.getString("employeeId")+"','"+caption+"','"+strDate+"','"+name+"','"+infoShort+"','"+infoDescribe+"','"+imgPath[0]+"','"+image1Status+"','ENABLED',now(),now())";
		Statement stmtinsert=con.createStatement();
		stmtinsert.executeUpdate(sqlinsert);
		stmtinsert.close();	
		
	
	
	
}




stEmployeeList.close();
rsEmployeeList.close();

if(status.equals("insert"))
{
	response.sendRedirect("notice-board.jsp?status=insert&msg=insert");
}
if(status.equals("edit"))
{
	response.sendRedirect("notice-board.jsp?status=insert&msg=edit");
}
			
			con.close();
%>