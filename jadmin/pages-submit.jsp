<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
response.setHeader("Cache-Control","no-cache");//1.1

response.setHeader("Pragma","no-cache");//1.0

response.setDateHeader("Expires",-1);//proxy

%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="mySmartUpload" class="com.jspsmart.upload.SmartUpload" scope="request"/>

<%@ page import = "com.kcyl.CreateThumbnail" %>

<%

		GregorianCalendar gcalendar= new GregorianCalendar();

		String caption="",category="",subcategory="",body1="",body2="",test1="",labelname="",readmore="0",readmore1="0",readmore2="0",category_caption="";

		String imgPath[]=new String[15];		

		String imgPathJ[]=new String[15];	

		String photo_status_1="NO",photo_status_2="NO",photo_status_3="NO",photo_status_4="NO",photo_status_5="NO",photo_status_6="NO";

		try

		{

			 mySmartUpload.initialize(pageContext);

				mySmartUpload.setAllowedFilesList("jpg,JPG,png,PNG,GIF,gif,jpeg,JPEG");

				mySmartUpload.upload();

		}

		catch(Exception e)

		{

			out.println("Invalid File Format ! Please Re Upload the File !.... Please <a href="+"admin-add-products.jsp"+" class="+"buttonlink"+">Click Here</a> To Re Upload");

			out.close();

		}
		
		String new_page_title="";
		String page_config="";
		
		String photo_path="",logo="",logo_status="",show_on="",heading="",most_watched="";
		String size_1="0",size_2="0",size_3="0",size_4="0";
		String color_1="0",color_2="0",color_3="0",color_4="0",color_5="0",color_6="0",color_7="0",color_8="0",color_9="0",link_id="";
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");
		String time="";  
		time="T"+gcalendar.get(Calendar.SECOND);		
		String id="",status="";

		if(mySmartUpload.getRequest().getParameter("category")!=null)		{	category=mySmartUpload.getRequest().getParameter("category").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("subcategory")!=null)	{	subcategory=mySmartUpload.getRequest().getParameter("subcategory").replaceAll("'", "`");	}
		if(mySmartUpload.getRequest().getParameter("labelname")!=null)		{	labelname=mySmartUpload.getRequest().getParameter("labelname").replaceAll("'", "`");	    }
		if(mySmartUpload.getRequest().getParameter("caption")!=null)		{	caption=mySmartUpload.getRequest().getParameter("caption").replaceAll("'", "`");			}
	 	if(mySmartUpload.getRequest().getParameter("heading")!=null)		{	heading=mySmartUpload.getRequest().getParameter("heading").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("readmore")!=null)		{	readmore=mySmartUpload.getRequest().getParameter("readmore").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("readmore1")!=null)		{	readmore1=mySmartUpload.getRequest().getParameter("readmore1").replaceAll("'", "`");		}
		if(mySmartUpload.getRequest().getParameter("readmore2")!=null)		{	readmore2=mySmartUpload.getRequest().getParameter("readmore2").replaceAll("'", "`");		}
		
		if(mySmartUpload.getRequest().getParameter("link_id")!=null)		{	link_id=mySmartUpload.getRequest().getParameter("link_id").replaceAll("'", "`");			}
		
		if(mySmartUpload.getRequest().getParameter("size_1")!=null)		{	size_1=mySmartUpload.getRequest().getParameter("size_1").replaceAll("'", "`");					}
		if(mySmartUpload.getRequest().getParameter("size_2")!=null)		{	size_2=mySmartUpload.getRequest().getParameter("size_2").replaceAll("'", "`");					}
		if(mySmartUpload.getRequest().getParameter("size_3")!=null)		{	size_3=mySmartUpload.getRequest().getParameter("size_3").replaceAll("'", "`");					}
		if(mySmartUpload.getRequest().getParameter("size_4")!=null)		{	size_4=mySmartUpload.getRequest().getParameter("size_4").replaceAll("'", "`");					}

		if(mySmartUpload.getRequest().getParameter("color_1")!=null)		{	color_1=mySmartUpload.getRequest().getParameter("color_1").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_2")!=null)		{	color_2=mySmartUpload.getRequest().getParameter("color_2").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_3")!=null)		{	color_3=mySmartUpload.getRequest().getParameter("color_3").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_4")!=null)		{	color_4=mySmartUpload.getRequest().getParameter("color_4").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_5")!=null)		{	color_5=mySmartUpload.getRequest().getParameter("color_5").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_6")!=null)		{	color_6=mySmartUpload.getRequest().getParameter("color_6").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_7")!=null)		{	color_7=mySmartUpload.getRequest().getParameter("color_7").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_8")!=null)		{	color_8=mySmartUpload.getRequest().getParameter("color_8").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("color_9")!=null)		{	color_9=mySmartUpload.getRequest().getParameter("color_9").replaceAll("'", "`");			}
		if(mySmartUpload.getRequest().getParameter("link_id")!=null)		{	link_id=mySmartUpload.getRequest().getParameter("link_id").replaceAll("'", "`");			}
		
	
		
		if(mySmartUpload.getRequest().getParameter("most_watched")!=null)			{	most_watched=mySmartUpload.getRequest().getParameter("most_watched").replaceAll("'", "`");				 }
		if(mySmartUpload.getRequest().getParameter("body1")!=null)		{	body1=mySmartUpload.getRequest().getParameter("body1").replaceAll("'", "`");	  }
 	 	if(mySmartUpload.getRequest().getParameter("body2")!=null)		{	body2=mySmartUpload.getRequest().getParameter("body2").replaceAll("'", "`");	  }
 	 	if(mySmartUpload.getRequest().getParameter("show_on")!=null)			{	show_on=mySmartUpload.getRequest().getParameter("show_on").replaceAll("'", "`");	  		}

		String page_title="",meta_keywords="",meta_description="";
		if(mySmartUpload.getRequest().getParameter("page_title")!=null)		{	page_title=mySmartUpload.getRequest().getParameter("page_title").replaceAll("'", "`"); 	 				 }
		if(mySmartUpload.getRequest().getParameter("meta_keywords")!=null)		{	meta_keywords=mySmartUpload.getRequest().getParameter("meta_keywords").replaceAll("'", "`");				 }
  		if(mySmartUpload.getRequest().getParameter("meta_description")!=null)	{	meta_description=mySmartUpload.getRequest().getParameter("meta_description").replaceAll("'", "`"); 	 }
		
		String priority="";
		if(mySmartUpload.getRequest().getParameter("priority")!=null)	{	priority=mySmartUpload.getRequest().getParameter("priority").replaceAll("'", "`"); 	 }

	// GETTING UNIQUE VALUE FOR SAVING

		int priority_count=0;
		Statement st_priority=con.createStatement();
		String sql_priority="select count(*) from page_tab";
		ResultSet rs_priority=st_priority.executeQuery(sql_priority);
		rs_priority.next();
		priority_count=rs_priority.getInt(1)+1;
		rs_priority.close();
		st_priority.close();
		
			if((link_id.equals("3"))||(link_id.equals("4")))
			{
				if(link_id.equals("3"))
				{
					page_config="dynamic-store";
				}
				if(link_id.equals("4"))
				{
					page_config="dynamic-blog";
				}
				
					
				new_page_title=caption.replaceAll(" ","-");
				new_page_title=new_page_title.toLowerCase();			
				category_caption=new_page_title;
				
				String strPath = path+pathSeperator+new_page_title+".jsp";
				
				
					File f = new File(path+pathSeperator+new_page_title); 
					if(!f.exists()){
						f.mkdirs();
					}
					strPath = path+pathSeperator+new_page_title+pathSeperator+"index.jsp";
				
				
				File strFile = new File(strPath);			
				boolean fileCreated = strFile.createNewFile();
				
				
				FileInputStream fileInputStream = new FileInputStream(path+pathSeperator+page_config+".jsp");		
				FileOutputStream fileOutputStream = new FileOutputStream(path+pathSeperator+new_page_title+pathSeperator+"index.jsp");
			
			
				
				int bufferSize;
				byte[] bufffer = new byte[512];
			    while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
			    fileOutputStream.write(bufffer, 0, bufferSize);
					}
			}
			String sessionid=session.getId();
			int sessionvalue=sessionid.length();
			String user_name="J"+id+sessionid.substring(0,2)+time;					
			////////////////////////////////////////////////
			String userid=user_name;
			path+=pathSeperator+"photos"+pathSeperator;
			//out.print("<br>"+path+"<br>");
			//path=path.replace('/','\\');//comment for linux
			com.jspsmart.upload.Files myfile= mySmartUpload.getFiles();
		//int noOfFiles=myfile.getCount();
		File dir=new File(path+userid);
		int imagecount=0;
		for(int i=0;i<10;i++)
		{

			imgPath[i]="Not Uploaded Image "+(i+1);

		}
		if(dir.mkdir())//checking for directory creation

		{

			for(int i=0;i<myfile.getCount();i++)

		  {

				//Initial Value of image path or user notification value;

				com.jspsmart.upload.File myFile=mySmartUpload.getFiles().getFile(i);

				if(!myFile.isMissing())

				{//p=i+1;

						myFile.saveAs(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt(), mySmartUpload.SAVE_AUTO);

						//out.print(path+userid+pathSeperator+"img_"+i+"." +myFile.getFileExt()+"<br>");

						imgPath[i]="photos/"+userid+"/img_"+i+"." +myFile.getFileExt();

						imagecount=imagecount+1;

						//out.println(imgPath[i]);

						imgPathJ[i]="photos/"+userid+"/img_1"+i+"." +myFile.getFileExt();

						CreateThumbnail ct = new CreateThumbnail(path+userid+"/img_"+i+"."+myFile.getFileExt());

						ct.getThumbnail(370, CreateThumbnail.HORIZONTAL);

						ct.saveThumbnail(new File(path+userid+"/img_1"+i+"." +myFile.getFileExt()), CreateThumbnail.IMAGE_JPEG);

				

				if(imagecount==1)	{	photo_status_1="YES"; }

				if(imagecount==2)	{	photo_status_1="YES";photo_status_2="YES"; }

				if(imagecount==3)	{	photo_status_1="YES";photo_status_2="YES";photo_status_3="YES"; }						

				if(imagecount==4)	{	photo_status_1="YES";photo_status_2="YES";photo_status_3="YES";photo_status_4="YES"; }

				if(imagecount==5)	{	photo_status_1="YES";photo_status_2="YES";photo_status_3="YES";photo_status_4="YES";photo_status_5="YES"; }			

		  		if(imagecount==6)	{	photo_status_1="YES";photo_status_2="YES";photo_status_3="YES";photo_status_4="YES";photo_status_5="YES";photo_status_6="YES"; }	

				}

			}//end of for loop

		}//end of dir creation

			String sql_useradmin="";
			
				String stat_id="ENABLED1";
				if(link_id.equals("4"))
				{
					stat_id="ENABLED2";
				}
			
			sql_useradmin="INSERT INTO page_tab(caption,heading,category,subcategory,labelname,description,more_describe,readmore,readmore1,readmore2,show_on,most_watched,file_1,file_11,photo_status_1,file_2,file_22,photo_status_2,file_3,file_33,photo_status_3,file_4,file_44,photo_status_4,file_5,file_55,photo_status_5,file_6,file_66,photo_status_6,file_count,product_status,created_date,modified_date,size_1,size_2,size_3,size_4,color_1,color_2,color_3,color_4,color_5,color_6,color_7,color_8,color_9,page_name,page_title,meta_keywords,meta_description,priority)VALUES('"+caption+"','"+heading+"','"+category+"','"+subcategory+"','"+labelname+"','"+body1+"','"+body2+"','"+readmore+"','"+readmore1+"','"+readmore2+"','"+show_on+"','"+most_watched+"','"+imgPathJ[0]+"','"+imgPath[0]+"','"+photo_status_1+"','"+imgPathJ[1]+"','"+imgPath[1]+"','"+photo_status_2+"','"+imgPathJ[2]+"','"+imgPath[2]+"','"+photo_status_3+"','"+imgPathJ[3]+"','"+imgPath[3]+"','"+photo_status_4+"','"+imgPathJ[4]+"','"+imgPath[4]+"','"+photo_status_5+"','"+imgPathJ[5]+"','"+imgPath[5]+"','"+photo_status_6+"','"+imagecount+"','"+stat_id+"',NOW(),NOW(),'"+size_1+"','"+size_2+"','"+size_3+"','"+size_4+"','"+color_1+"','"+color_2+"','"+color_3+"','"+color_4+"','"+color_5+"','"+color_6+"','"+color_7+"','"+color_8+"','"+color_9+"','"+new_page_title+"','"+page_title+"','"+meta_keywords+"','"+meta_description+"','"+priority_count+"')";	
			
			
		try
			{
			Statement stuseradmin=con.createStatement();
			//insert the row
			stuseradmin.executeUpdate(sql_useradmin);
			//closing statement
			stuseradmin.close();
			response.sendRedirect("admin-add-pages.jsp?status=insert&msg=insert&link_id="+link_id);

			}
			catch(Exception ex)
			{

				response.sendRedirect("admin-add-pages.jsp?status=insert&excep=true&msg=true&link_id="+link_id);

			}

			con.close();
%>
