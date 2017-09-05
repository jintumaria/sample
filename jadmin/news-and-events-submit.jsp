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

<%
response.setHeader("Cache-Control","no-cache");//1.1
response.setHeader("Pragma","no-cache");//1.0
response.setDateHeader("Expires",-1);//proxy
%>
<%/*including database connection file*/%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>
<%
		
		String news_category="",news_date="",news_heading="",news_describe="",news_short="";
		
		String link_id="";

		try
		{
			 mySmartUpload.initialize(pageContext);
			 mySmartUpload.setAllowedFilesList("jpg,webp");
			 mySmartUpload.upload();
		}
		catch(Exception e)
		{
			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"news-and-events.jsp"+" class="+"buttonlink"+">Click Here</a> To ReUpload");
			out.close();
		}	
				
		
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");
		
if(mySmartUpload.getRequest().getParameter("status")!=null)			{	status=mySmartUpload.getRequest().getParameter("status").replaceAll("'", "`");				}
if(mySmartUpload.getRequest().getParameter("id")!=null)				{	id=mySmartUpload.getRequest().getParameter("id").replaceAll("'", "`");						}
	
if(mySmartUpload.getRequest().getParameter("news_category")!=null)	{	news_category=mySmartUpload.getRequest().getParameter("news_category").replaceAll("'", "`");	}

if(mySmartUpload.getRequest().getParameter("news_date")!=null)		{	news_date=mySmartUpload.getRequest().getParameter("news_date").replaceAll("'", "`");			}
if(mySmartUpload.getRequest().getParameter("news_short")!=null)		{	news_short=mySmartUpload.getRequest().getParameter("news_short").replaceAll("'", "`");			}
if(mySmartUpload.getRequest().getParameter("news_heading")!=null)	{	news_heading=mySmartUpload.getRequest().getParameter("news_heading").replaceAll("'", "`");		}
if(mySmartUpload.getRequest().getParameter("news_describe")!=null)	{	news_describe=mySmartUpload.getRequest().getParameter("news_describe").replaceAll("'", "`");	}
if(mySmartUpload.getRequest().getParameter("link_id")!=null)		{	link_id=mySmartUpload.getRequest().getParameter("link_id").replaceAll("'", "`");				}

		////////////////////////////////////////////////			
			
			int news_id=0;
			String news_value="";
			String news_query="";

news_query="select id from  news_tab";
Statement st_news_view=con.createStatement();
ResultSet rs_news_view=st_news_view.executeQuery(news_query);
while(rs_news_view.next())
{
	news_id=rs_news_view.getInt("id")+1;
}
rs_news_view.close();
st_news_view.close();


if(status.equals("edit"))
{
	news_id=Integer.parseInt(id);	
}
			news_value="N"+news_id;
			path+=pathSeperator+"photos"+pathSeperator;
			//out.print("<br>"+path+"<br>");
			//path=path.replace('/','\\');//comment for linux
			com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();
			
			
		//int noOfFiles=myfile.getCount();
		//File dir=new File(path+userid);
		int imagecount=0;
		int flag_count=0;
		imgPath[0]="NA";
	

						

		   for(int i=0;i<myfile.getCount();i++)
		  {
				//Initial Value of image path or user notification value;
				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);
				if(!myFile.isMissing())
				{//p=i+1;
						myFile.saveAs(path+news_value+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
						//out.print(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
						imgPath[i]="img/"+news_value+"." +myFile.getFileExt();
						imagecount=imagecount+1;
						flag_count=1;
						//out.println(imgPath[i];
						
				if(imagecount==1)	{	image_1_status="YES"; }
										
				}
			}//end of for loop
			
			
			if(status.equals("insert"))
			{			
								
			String sqlinsert="";
			
			sqlinsert="insert into news_tab(link_id,news_category,news_date,news_heading,news_short,news_describe,image_1,image_1_status,status,created_date,modified_date)values('"+link_id+"','"+news_category+"','"+news_date+"','"+news_heading+"','"+news_short+"','"+news_describe+"','"+imgPath[0]+"','"+image_1_status+"','ENABLED',now(),now())";
												
			Statement stmtinsert=con.createStatement();
			stmtinsert.executeUpdate(sqlinsert);
			stmtinsert.close();	
			
				response.sendRedirect("news-and-events.jsp?status=insert&msg=1&link_id="+link_id);
			}
			
			
	
			if(status.equals("edit"))
			{
			 Statement stmtedit=con.createStatement();
			//update the row
			String sqledit="";
			
			if(flag_count==1)
			{
			sqledit="update news_tab set news_category='"+news_category+"',news_date='"+news_date+"',news_heading='"+news_heading+"',news_short='"+news_short+"',news_describe='"+news_describe+"',image_1='"+imgPath[0]+"',image_1_status='YES',modified_date=now() where id='"+id+"' ";
			
			}
			if(flag_count==0)
			{
			sqledit="update news_tab set news_category='"+news_category+"',news_date='"+news_date+"',news_heading='"+news_heading+"',news_short='"+news_short+"',news_describe='"+news_describe+"',modified_date=now() where id='"+id+"' ";
			
			}
			stmtedit.executeUpdate(sqledit);
			//closing statement
			stmtedit.close();		
			response.sendRedirect("news-and-events.jsp?status=edit&msg=2&link_id="+link_id+"&id="+id);
			
			}
			
			con.close();
		
		
			%>