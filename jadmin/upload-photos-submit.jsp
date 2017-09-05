<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>

<%

response.setHeader("Cache-Control","no-cache");//1.1

response.setHeader("Pragma","no-cache");//1.0

response.setDateHeader("Expires",-1);//proxy

%>

<%/*including database connection file*/%>



<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>

<%
		int fileSizeCheck=0;

				

		String imgPathJ[]=new String[10];		

		
		
		if(mySmartUpload.getRequest().getParameter("link_id")!=null)		
		{	
			linkId=mySmartUpload.getRequest().getParameter("link_id").replaceAll("'", "`");		
		}
		
		//out.println("link id : "+linkId);
		
		
		if(session.getAttribute("linkId")!=null)
		{
			linkId=session.getAttribute("linkId").toString();
		}
		//out.println("link id : "+linkId);
		
		try
		{

			 mySmartUpload.initialize(pageContext);

			 mySmartUpload.setAllowedFilesList("jpg");

			 mySmartUpload.upload();

		}
		catch(Exception e)
		{
			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"upload-photos.jsp?linkId="+linkId+" class="+"buttonlink"+">Click Here</a> To ReUpload");
			
			//out.close();
			if(linkId.equals("1"))
			{
				response.sendRedirect("upload-photos.jsp?msg=2&linkId=1");
			}
			else if(linkId.equals("2"))
			{
				response.sendRedirect("upload-photos.jsp?msg=2&linkId=2");
			}
			
		}	
		
		String pathSeperator=System.getProperty("file.separator");

		String path=application.getRealPath("");
				
			// path="C:/Eclipse-Workspace/workspace_NEW/FSH_JUNE_02/WebContent";



String photoId="";


String uuid = UUID.randomUUID().toString();

				photoId=uuid.substring(0,8)+"_"+id;

			path+=pathSeperator+"jadmin"+pathSeperator+"assets"+pathSeperator+"documents"+pathSeperator;

			//out.print("<br>"+path+"<br>"+photoId);
			
			
			//path=path.replace('/','\\');//comment for linux

			com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();
			

		int imageCount=0;

		int flagCount=0;

		imgPath[0]="NA";

		   for(int i=0;i<myfile.getCount();i++)
		  {
				//Initial Value of image path or user notification value;

				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);

				if(!myFile.isMissing())
				{//p=i+1;
			     	fileSizeCheck=1;

					int fileSize = myFile.getSize();
					
	
					if(linkId.equals("1"))
					{
						photoId=adminId;
						if(fileSize <=51200)
						{
							fileSizeCheck=2;
	
							myFile.saveAs(path+photoId+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
							
										out.print(path+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
	
							imgPath[i]=path+photoId+"." +myFile.getFileExt();
								out.println(imgPath[i]);
							imageCount=imageCount+1;
	
							flagCount=1;
	
							//out.println(fileSize+"emp Id "+adminId);
	
							if(imageCount==1){	image1Status="YES"; }
							response.sendRedirect("upload-photos.jsp?msg=1&linkId=1");
						}
						else
						{
							out.println("file size error");
							out.println(fileSize);
							response.sendRedirect("upload-photos.jsp?msg=0&linkId=1");
						}
					}
					else if(linkId.equals("2"))
					{
						photoId=adminId+"_COVER";
						if(fileSize <=512000)
						{
							fileSizeCheck=2;
	
							myFile.saveAs(path+photoId+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);
							
										out.print(path+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");
	
							imgPath[i]=path+photoId+"." +myFile.getFileExt();
								out.println(imgPath[i]);
							imageCount=imageCount+1;
	
							flagCount=1;
	
							//out.println(fileSize);
	
							if(imageCount==1){	image1Status="YES"; }
							response.sendRedirect("upload-photos.jsp?msg=1&linkId=2");
						}
						else
						{
							out.println("file size error");
							out.println(fileSize);
							response.sendRedirect("upload-photos.jsp?msg=0&linkId=2");
						}
					}
				}

			}//end of for loop
			
			%>