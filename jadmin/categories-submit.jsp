<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
		
		if(status.equals("insert"))
		{
			if(linkId.equals("1"))
			{
				Statement stCountData=con.createStatement();
				ResultSet rsCountData=stCountData.executeQuery("select id from location_tab where name='"+name+"' and status='"+linkId+"'");
				while(rsCountData.next())
				{
					COUNTDATA=1;
				}
				rsCountData.close();
				rsCountData.close();
				
				
				
				if(COUNTDATA==0)
				{
					Statement stGetCode=con.createStatement();
					ResultSet rsGetCode=stGetCode.executeQuery("select id from location_tab");
					while(rsGetCode.next())
					{	
						FLAGCHECK=1;
						MYID = rsGetCode.getInt("id")+1;		
					}
					rsGetCode.close();
					stGetCode.close();
					
					if(FLAGCHECK==0)				{
						code=adminName.toUpperCase()+"O"+"1";
					}
					else				{
						code=adminName.toUpperCase()+"O"+ MYID;
					}
				Statement stInsert=con.createStatement();
				stInsert.executeUpdate("insert into location_tab(name,address,phone,email,password,status,createdDate,modifiedDate,code)values('"+name+"','"+address+"','"+phone+"','"+email+"','"+password+"','"+linkId+"',now(),now(),'"+code+"')");
				stInsert.close();		
				
				response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=insert&status=insert");
				}
				else{
					response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=exists&status=insert");
				}
			}
			else
			{
				Statement stCountData=con.createStatement();
				ResultSet rsCountData=stCountData.executeQuery("select id from category_tab where name='"+name+"' and status='"+linkId+"'");
				while(rsCountData.next())
				{
					COUNTDATA=1;
				}
				rsCountData.close();
				rsCountData.close();
				
				if(COUNTDATA==0)
				{
				Statement stInsert=con.createStatement();
				stInsert.executeUpdate("insert into category_tab(name,caption,status,createdDate,modifiedDate)values('"+name+"','"+caption+"','"+linkId+"',now(),now())");
				stInsert.close();		
				
				response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=insert&status=insert");
				}
				else{
					response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=exists&status=insert");
				}
			}	
			
		}	
		
		
		if(status.equals("edit"))
		{
			
			if(linkId.equals("1"))
			{		
				Statement stEdit=con.createStatement();
				stEdit.executeUpdate("update location_tab set name='"+name+"',address='"+address+"',phone='"+phone+"',email='"+email+"',password='"+password+"',modifiedDate=now() where id='"+id+"' ");
				stEdit.close();		
			}else{
				Statement stEdit=con.createStatement();
				stEdit.executeUpdate("update category_tab set name='"+name+"',caption='"+caption+"',modifiedDate=now() where id='"+id+"' ");
				stEdit.close();	
			}
			
			
			response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=edit&status=insert");
		}		
		
		if(status.equals("delete"))
		{
			if(linkId.equals("1"))
			{
				Statement stDelete=con.createStatement();
				stDelete.executeUpdate("delete from location_tab where id='"+id+"'");
				stDelete.close();	
			}else{
				Statement stDelete=con.createStatement();
				stDelete.executeUpdate("delete from category_tab where id='"+id+"'");
				stDelete.close();	
			}				
					
			response.sendRedirect("categories.jsp?linkId="+linkId+"&msg=delete&status=insert");
		}
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

