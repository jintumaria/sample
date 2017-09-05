<%@include file="include/dbconnection.jsp"%>
<%
response.setHeader("Cache-Control","no-cache");//1.1
response.setHeader("Pragma","no-cache");//1.0
response.setDateHeader("Expires",-1);//proxy
%>
<%
if(session.getAttribute("admin_id")!=null)
	{
%>
<%/*including database connection file*/%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>
<%
		String imgPath[]=new String[10];		
		String imgPathJ[]=new String[10];		
		String adminid=session.getAttribute("admin_id").toString();
	
		try
		{
			 mySmartUpload.initialize(pageContext);
			 mySmartUpload.setAllowedFilesList("jpg,JPG,png,PNG,jpeg,JPEG");
			 mySmartUpload.upload();
		}
		catch(Exception e)
		{
			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"upload-logo.jsp class="+"buttonlink"+">Click Here</a> To ReUpload");
			out.close();
		}
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");		
		
		String mark_id="";	
		Statement st_business=con.createStatement();
		String sql_business="select admin_email,business_name from admin_tab where admin_id='"+adminid+"'";
		ResultSet rs_business=st_business.executeQuery(sql_business);
		if(rs_business.next())
		{
			mark_id=rs_business.getString("business_name");
			
		}								
		rs_business.close();
		st_business.close();	
		
		
		////////////////////////////////////////////////			
		//path+=pathSeperator+"photos"+pathSeperator;
		path+=pathSeperator+"assets"+pathSeperator+"documents"+pathSeperator;
		//out.print("<br>"+path+"<br>");
		//path=path.replace('/','\\');//comment for linux
		com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();
		//int noOfFiles=myfile.getCount();
		//File dir=new File(path+userid);
		int imagecount=0;
		for(int i=0;i<10;i++)
		{
			imgPath[i]="Not Uploaded Image "+(i+1);
		}

		
		
		
		//if(dir.mkdir())//checking for directory creation
		//{
			for(int i=0;i<myfile.getCount();i++)
		  {
				//Initial Value of image path or user notification value;
				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);
				if(!myFile.isMissing())
				{//p=i+1;
						//myFile.saveAs(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
						myFile.saveAs(path+mark_id+"-logo." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
						//out.print(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
						//imgPath[i]="photos/"+userid+"/img_"+i+"." +myFile.getFileExt();
						imgPath[i]="assets/documents/"+mark_id+"-logo." +myFile.getFileExt();
						imagecount=imagecount+1;
						//out.println(imgPath[i]);			
						
						String sql_useradmin="";
													
			sql_useradmin="update admin_tab set file_1='"+imgPath[0]+"',file_status_1='YES' where admin_id="+adminid;
			//out.println(sql_useradmin);
			Statement stuseradmin=con.createStatement();
			//insert the row
			stuseradmin.executeUpdate(sql_useradmin);
			//closing statement
			stuseradmin.close();
			con.close();		
					
				
				}
			}//end of for loop
		//}//end of dir creation
					
			response.sendRedirect("upload-logo.jsp");

}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>