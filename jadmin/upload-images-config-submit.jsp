<%/*including database connection file*/%>
<%@include file="../include/dbconnection.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		String id="",status="",link_id="",image_id="";
		
		if(request.getParameter("status")!=null)		{	status=request.getParameter("status"); 	 				 }
		if(request.getParameter("id")!=null)			{	id=request.getParameter("id");							 }
		if(request.getParameter("link_id")!=null)			{	link_id=request.getParameter("link_id");			 }
		if(request.getParameter("image_id")!=null)			{	image_id=request.getParameter("image_id");			 }
		
  		
		String pathSeperator=System.getProperty("file.separator");
		String path=application.getRealPath("");
			
		
		if(status.equals("delete"))
		{
			String query="select image_1,image_2 from upload_tab where id='"+id+"' ";
						Statement st_query=con.createStatement();
						ResultSet rs_query=st_query.executeQuery(query);
						if(rs_query.next())
						{
							//out.println(path+pathSeperator+rs_query.getString("image_1"));
							File f=new File(path+pathSeperator+rs_query.getString("image_1"));
							f.delete();
							
							if(!link_id.equals("1"))
							{
								File f1=new File(path+pathSeperator+rs_query.getString("image_2"));
								f1.delete();
							}
							
						}
						rs_query.close();
						st_query.close();
			
			
			Statement stmtdelete=con.createStatement();
			stmtdelete.executeUpdate("delete from upload_tab where id='"+id+"'");
			stmtdelete.close();
								
			response.sendRedirect("upload-images.jsp?msg=delete&status=insert&image_id="+image_id+"&link_id="+link_id);
			
		}
		
	
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

