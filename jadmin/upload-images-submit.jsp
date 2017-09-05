<%
/*
 * @(#)upload-images-submit.jsp
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
<%@include file="../include/dbconnection.jsp"%>
<%@include file="../include/utilities.jsp"%>

<%
response.setHeader("Cache-Control","no-cache");//1.1
response.setHeader("Pragma","no-cache");//1.0
response.setDateHeader("Expires",-1);//proxy
%>
<%/*including database connection file*/%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.UUID"%>


<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>
<%
		int file_size_check=0;
		String imgPath[]=new String[10];		
		String imgPathJ[]=new String[10];		
		String image_1_status="NO",image_2_status="NO",status="";
		String id="";
		String link_id="",file_name="",alt_tag="",image_caption="",image_describe="",image_link="",image_id="0";

		try
		{
			 mySmartUpload.initialize(pageContext);
			 mySmartUpload.setAllowedFilesList("jpg,png");
			 mySmartUpload.upload();
		}
		catch(Exception e)
		{
			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"home.jsp"+" class="+"buttonlink"+">Click Here</a> To ReUpload");
			out.close();
		}	
				
		
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");
		
if(mySmartUpload.getRequest().getParameter("status")!=null)			{	status=mySmartUpload.getRequest().getParameter("status").replaceAll("'", "`");						}
if(mySmartUpload.getRequest().getParameter("id")!=null)				{	id=mySmartUpload.getRequest().getParameter("id").replaceAll("'", "`");								}
	
if(mySmartUpload.getRequest().getParameter("link_id")!=null)		{	link_id=mySmartUpload.getRequest().getParameter("link_id").replaceAll("'", "`");					}
if(mySmartUpload.getRequest().getParameter("file_name")!=null)		{	file_name=mySmartUpload.getRequest().getParameter("file_name").replaceAll("'", "`");				}

if(mySmartUpload.getRequest().getParameter("alt_tag")!=null)		{	alt_tag=mySmartUpload.getRequest().getParameter("alt_tag").replaceAll("'", "`");					}
if(mySmartUpload.getRequest().getParameter("image_caption")!=null)	{	image_caption=mySmartUpload.getRequest().getParameter("image_caption").replaceAll("'", "`");		}

if(mySmartUpload.getRequest().getParameter("image_describe")!=null)	{	image_describe=mySmartUpload.getRequest().getParameter("image_describe").replaceAll("'", "`");		}
if(mySmartUpload.getRequest().getParameter("image_link")!=null)		{	image_link=mySmartUpload.getRequest().getParameter("image_link").replaceAll("'", "`");				}
if(mySmartUpload.getRequest().getParameter("image_id")!=null)		{	image_id=mySmartUpload.getRequest().getParameter("image_id").replaceAll("'", "`");				}


		////////////////////////////////////////////////			
			
			path+=pathSeperator+"img"+pathSeperator;
			//out.print("<br>"+path+"<br>");
			//path=path.replace('/','\\');//comment for linux
			com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();
			
			
		//int noOfFiles=myfile.getCount();
		//File dir=new File(path+userid);
		int imagecount=0;
		int flag_count=0;
		imgPath[0]="NA";
	
		int count_thumb=0;
						
			
			
		   for(int i=0;i<myfile.getCount();i++)
		  {
		  		
				//Initial Value of image path or user notification value;
				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);
				if(!myFile.isMissing())
				{//p=i+1;
				
				     	file_size_check=1;
						
						int fileSize = myFile.getSize();
						
						if(fileSize <=500000)
						{
						
						if(link_id.equals("2"))
						{
							count_thumb=count_thumb+1;
							file_size_check=2;
							if(count_thumb==2)
							{
								myFile.saveAs(path+file_name+"_t"+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
								imgPath[i]="img/"+file_name+"_t"+"." +myFile.getFileExt();
							}else
							{
								myFile.saveAs(path+file_name+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
								imgPath[i]="img/"+file_name+"." +myFile.getFileExt();
							}
							//out.print(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
							
							imagecount=imagecount+1;
							flag_count=1;
							out.println(fileSize);
							
							if(imagecount==1)	{	image_1_status="YES"; }
							if(imagecount==2)	{	image_1_status="YES";image_2_status="YES"; }
						}else
						{
							file_size_check=2;
							myFile.saveAs(path+file_name+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
							//out.print(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
							imgPath[i]="img/"+file_name+"." +myFile.getFileExt();
							imagecount=imagecount+1;
							flag_count=1;
							out.println(fileSize);
							
							if(imagecount==1)	{	image_1_status="YES"; }
							if(imagecount==2)	{	image_1_status="YES";image_2_status="YES"; }
						}
						
						}
										
				}
			}//end of for loop
			
			Date now = null;
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   		now = new Date();
			
			if(status.equals("insert"))
			{
			
						
			String sqlinsert="";
			
			sqlinsert="insert into upload_tab(link_id,file_name,alt_tag,image_caption,image_describe,image_link,image_1,image_1_status,image_2,image_2_status,upload_status,created_date,modified_date,image_id)values('"+link_id+"','"+file_name+"','"+alt_tag+"','"+image_caption+"','"+image_describe+"','"+image_link+"','"+imgPath[0]+"','"+image_1_status+"','"+imgPath[1]+"','"+image_2_status+"','YES','"+dateFormat.format(now)+"','"+dateFormat.format(now)+"','"+image_id+"')";
						
			//out.println(sqlinsert);									
			///out.close();
			Statement stmtinsert=con.createStatement();
			stmtinsert.executeUpdate(sqlinsert);
			stmtinsert.close();	
			if(file_size_check==1)
				{
					response.sendRedirect("upload-images.jsp?status=insert&image_id="+image_id+"&msg=100&link_id="+link_id);
				}
				else
				{
					response.sendRedirect("upload-images.jsp?status=insert&image_id="+image_id+"&msg=1&link_id="+link_id);
				}
			
			}
			if(status.equals("edit"))
			{
			 Statement stmtedit=con.createStatement();
			//update the row
			String sqledit="";
			
			if(flag_count==1)
			{
				sqledit="update upload_tab set alt_tag='"+alt_tag+"',image_caption='"+image_caption+"',image_describe='"+image_describe+"',image_link='"+image_link+"',image_1='"+imgPath[0]+"',image_1_status='YES',image_2='"+imgPath[1]+"',image_2_status='YES',modified_date='"+dateFormat.format(now)+"' where id='"+id+"' ";
			
			}
			if(flag_count==0)
			{
				sqledit="update upload_tab set alt_tag='"+alt_tag+"',image_caption='"+image_caption+"',image_describe='"+image_describe+"',image_link='"+image_link+"',modified_date='"+dateFormat.format(now)+"' where id='"+id+"' ";
			
			}
			stmtedit.executeUpdate(sqledit);
			stmtedit.close();		
			
			if(file_size_check==1)
				{
					response.sendRedirect("upload-images.jsp?status=edit&image_id="+image_id+"&msg=100&link_id="+link_id+"&id="+id);			
				}
				else
				{
					response.sendRedirect("upload-images.jsp?status=edit&image_id="+image_id+"&msg=2&link_id="+link_id+"&id="+id);
				}
			
		}
			
			con.close();
		
		
			%>