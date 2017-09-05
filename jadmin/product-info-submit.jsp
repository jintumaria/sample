<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String page_title="",page_key="",page_describe="",page_rate="0",link_id="",other_info="",status="",id="",page_short="",page_name="",page_category="";
		
		if(request.getParameter("link_id")!=null)			{	link_id=request.getParameter("link_id").replaceAll("'","`");				 		}
  		if(request.getParameter("page_title")!=null)		{	page_title=request.getParameter("page_title").replaceAll("'","`"); 	 				}
		if(request.getParameter("page_name")!=null)			{	page_name=request.getParameter("page_name").replaceAll("'","`"); 	 				}
		if(request.getParameter("page_key")!=null)			{	page_key=request.getParameter("page_key").replaceAll("'","`"); 	 					}
		if(request.getParameter("page_short")!=null)		{	page_short=request.getParameter("page_short").replaceAll("'","`"); 	 				}
		if(request.getParameter("page_describe")!=null)		{	page_describe=request.getParameter("page_describe").replaceAll("'","`"); 	 		}
		if(request.getParameter("page_rate")!=null)			{	page_rate=request.getParameter("page_rate").replaceAll("'","`"); 	 				}
		if(request.getParameter("other_info")!=null)		{	other_info=request.getParameter("other_info").replaceAll("'","`"); 	 				}
		
		if(request.getParameter("status")!=null)			{	status=request.getParameter("status").replaceAll("'","`"); 	 						}
		if(request.getParameter("page_category")!=null)		{	page_category=request.getParameter("page_category").replaceAll("'","`"); 	 		}
		if(request.getParameter("id")!=null)		{	id=request.getParameter("id").replaceAll("'","`"); 	 		}
		
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");		
			
		
			/*
			int product_flag=0;
			String product_count_query="select link_id from  product_tab where link_id='"+link_id+"'";
			Statement st_product_count=con.createStatement();
			ResultSet rs_product_count=st_product_count.executeQuery(product_count_query);
			while(rs_product_count.next())
			{
					product_flag=1;
			}
			rs_product_count.close();
			st_product_count.close();
			*/
			
				
			
			
			
			if(status.equals("insert"))
			{
			
			
					
					
			
			String sqlinsert=("insert into product_tab(page_title,page_name,page_category,page_key,page_short,page_describe,page_rate,other_info,link_id,status,created_date,modified_date)values('"+page_title+"','"+page_name+"','"+page_category+"','"+page_key+"','"+page_short+"','"+page_describe+"','"+page_rate+"','"+other_info+"','"+link_id+"','YES',now(),now())");
			Statement stmtinsert=con.createStatement();
			stmtinsert.executeUpdate(sqlinsert);
			stmtinsert.close();	
			
			
			
			String page_config="dynamic/product-detail";	
			File f = new File(path+pathSeperator+page_name); 
					if(!f.exists()){
						f.mkdirs();
					}
					
			String strPath = path+pathSeperator+page_name+pathSeperator+"index.jsp";
				
			File strFile = new File(strPath);			
			boolean fileCreated = strFile.createNewFile();
				
			FileInputStream fileInputStream = new FileInputStream(path+pathSeperator+page_config+".jsp");		
			FileOutputStream fileOutputStream = new FileOutputStream(path+pathSeperator+page_name+pathSeperator+"index.jsp");
		
			int bufferSize;
			byte[] bufffer = new byte[512];
			while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
			fileOutputStream.write(bufffer, 0, bufferSize);
				}
				
				
			
			response.sendRedirect("product-info.jsp?status="+status+"&link_id="+link_id+"&msg=1");
			
			}
			if(status.equals("edit"))
			{
			Statement stmtedit=con.createStatement();
			//out.println("update product_tab set page_title='"+page_title+"',page_category='"+page_category+"',page_key='"+page_key+"',page_short='"+page_short+"',page_describe='"+page_describe+"',page_rate='"+page_rate+"',other_info='"+other_info+"',modified_date=now() where id='"+id+"'");
			stmtedit.executeUpdate("update product_tab set page_title='"+page_title+"',page_category='"+page_category+"',page_key='"+page_key+"',page_short='"+page_short+"',page_describe='"+page_describe+"',page_rate='"+page_rate+"',other_info='"+other_info+"',modified_date=now() where id='"+id+"' ");	
			stmtedit.close();
			
			response.sendRedirect("product-info.jsp?status="+status+"&link_id="+link_id+"&msg=1");
			
			}					
			if(status.equals("delete"))
			{
						
						String query="select page_name from product_tab where id='"+id+"' ";
						Statement st_query=con.createStatement();
						ResultSet rs_query=st_query.executeQuery(query);
						if(rs_query.next())
						{
							
							    File index  = new File(path+pathSeperator+rs_query.getString("page_name"));							 
								File[] files = index.listFiles();
								for (File file : files) {
									file.delete();
								}
								index.delete();
							
						}
						rs_query.close();
						st_query.close();
						
						String query_delete="select image_1 from upload_tab where image_id='"+id+"' ";
						Statement st_query_delete=con.createStatement();
						ResultSet rs_query_delete=st_query_delete.executeQuery(query_delete);
						if(rs_query_delete.next())
						{
							
							File f=new File(path+pathSeperator+rs_query_delete.getString("image_1"));			
							f.delete();
						
							//out.println("File deleted successfully");				
							
						}
						rs_query_delete.close();
						st_query_delete.close();
						
					
			
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from product_tab where id='"+id+"'");
			//closing statement
			stmtdelete.close();
			
			Statement stmtuploaddelete=con.createStatement();
			//deleting the row
			stmtuploaddelete.executeUpdate("delete from upload_tab where image_id='"+id+"'");
			//closing statement
			stmtuploaddelete.close();
			
			response.sendRedirect("product-info.jsp?status=insert&link_id="+link_id+"&msg=delete");
			
			}
				
		
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

