<%
/*
 * @(#)category_master_submit.jsp
 * Copyright (c) iDreamzSolutions
 * Cochin,India.
 * All rights reserved.
 * Created by Aji Varghese on 05/12/2007
 * Modified by Aji Varghese on 07/12/2007
 * @version 	Tomcat5.0	MySQL 5.0
 * @author 	iDreamzSoltuions - The Perfect IT Solution
 */
%>
<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String category_id="",category="",category_name="",category_describe="",new_page_title="",status="",category_caption="",n_id="";
		String path=application.getRealPath("");
		String page_config="",page_name="",id="";
		
		String pathSeperator=System.getProperty("file.separator");
		
		String link_id="";
		if(request.getParameter("page_name")!=null)			{	page_name=request.getParameter("page_name").replaceAll("'", "`");						}	
		if(request.getParameter("category_name")!=null)		{	category_name=request.getParameter("category_name").replaceAll("'", "`");				}	
		if(request.getParameter("category_caption")!=null)		{	category_caption=request.getParameter("category_caption").replaceAll("'", "`");								}			
		if(request.getParameter("category")!=null)		{	category=request.getParameter("category").replaceAll("'", "`");								}			
		if(request.getParameter("category_describe")!=null)	{	category_describe=request.getParameter("category_describe").replaceAll("'", "`");		}		
		if(request.getParameter("status")!=null)			{	status=request.getParameter("status");													}
		if(request.getParameter("category_id")!=null) 		{	category_id=request.getParameter("category_id");										}		
		if(request.getParameter("link_id")!=null) 			{	link_id=request.getParameter("link_id");												}	
		
		String page_title="",meta_keywords="",meta_description="";
		if(request.getParameter("page_title")!=null)		{	page_title=request.getParameter("page_title"); 	 				 }
		if(request.getParameter("meta_keywords")!=null)		{	meta_keywords=request.getParameter("meta_keywords");				 }
  		if(request.getParameter("meta_description")!=null)	{	meta_description=request.getParameter("meta_description").replaceAll("'", "`"); 	 }
		
		if(request.getParameter("n_id")!=null)				{	n_id=request.getParameter("n_id").replaceAll("'", "`"); 	 }
		if(request.getParameter("id")!=null)				{	id=request.getParameter("id").replaceAll("'", "`"); 	 }
			
		
		Statement st=con.createStatement();
		String sql="select count(*) from subcategory_tab where category_name ='"+category_name+"' and link_status='"+link_id+"'";
		ResultSet rs=st.executeQuery(sql);
		rs.next();
		//out.println("Category :"+category);
		//out.println("Category Name :"+category_name);
		
		/*if(rs.getInt(1) > 0)
		{
			response.sendRedirect("category_master.jsp?success=exists&status=insert");
		}
		else
		{*/
		if(status.equals("insert"))
		{
		int priority_count=0;
		Statement st_priority=con.createStatement();
		String sql_priority="select count(*) from subcategory_tab where category='"+category+"'";
		ResultSet rs_priority=st_priority.executeQuery(sql_priority);
		rs_priority.next();
		priority_count=rs_priority.getInt(1)+1;
		rs_priority.close();
		st_priority.close();
			
			//statement to insert values		
			String sqlinsert=("insert into subcategory_tab(category_name,category,category_caption,category_status,created_date,modified_date,link_status,page_name,page_title,meta_keywords,meta_description,priority)values('"+category_name+"','"+category+"','"+category_caption+"','ENABLED',now(),now(),'"+link_id+"','"+page_name+"','"+page_title+"','"+meta_keywords+"','"+meta_description+"','"+priority_count+"')");
			
			
			
			
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();						
			response.sendRedirect("sub-categories.jsp?msg=insert&status=insert&link_id="+link_id);
		}		
		if(status.equals("insertn"))
		{
		
			//statement to insert values		
			String sqlinsert="insert into sub_mirror_category_tab(category_name,category,category_caption,category_status,created_date,modified_date,link_status,page_name,page_title,meta_keywords,meta_description)values('"+category_name+"','"+n_id+"','"+category_caption+"','ENABLED',now(),now(),'"+link_id+"','"+page_name+"','"+page_title+"','"+meta_keywords+"','"+meta_description+"')";
			
			Statement stmtinsert=con.createStatement();
			//insert the row
			stmtinsert.executeUpdate(sqlinsert);
			//closing statement
			stmtinsert.close();						
			response.sendRedirect("sub-categories.jsp?msg=insert&status=insertn&n_id="+n_id+"&link_id="+link_id);
		}		
		if(status.equals("edit"))
		{
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update subcategory_tab set category_name='"+category_name+"',category='"+category+"',category_caption='"+category_caption+"',page_name='"+page_name+"',page_title='"+page_title+"',meta_keywords='"+meta_keywords+"',meta_description='"+meta_description+"' where category_id='"+category_id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("sub-categories.jsp?msg=edit&status=insert&link_id="+link_id);
		}		
		if(status.equals("enable"))
		{
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update subcategory_tab set category_status='ENABLED' where category_id='"+category_id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("sub-categories.jsp?msg=enabled&status=insert&link_id="+link_id);
		}	
		if(status.equals("disable"))
		{
			Statement stmtedit=con.createStatement();
			//update the row
			stmtedit.executeUpdate("update subcategory_tab set category_status='DISABLED' where category_id='"+category_id+"' ");
			//closing statement
			stmtedit.close();		
			response.sendRedirect("sub-categories.jsp?msg=disabled&status=insert&link_id="+link_id);
		}	
		//}
		if(status.equals("delete"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from subcategory_tab where category_id='"+category_id+"'");
			//closing statement
			stmtdelete.close();		
			
			
			
			response.sendRedirect("sub-categories.jsp?msg=delete&status=insert&link_id="+link_id);
		}
		if(status.equals("deletein"))
		{
			Statement stmtdelete=con.createStatement();
			//deleting the row
			stmtdelete.executeUpdate("delete from sub_mirror_category_tab where category_id='"+id+"'");
			//closing statement
			stmtdelete.close();		
			
			
			
			//response.sendRedirect("sub-categories.jsp?msg=delete&status=insert&link_id="+link_id);
			response.sendRedirect("sub-categories.jsp?msg=insertin&status=insertn&n_id="+n_id+"&link_id="+link_id);
			
		}
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

