<%
	
String content_query="select page_title,page_key,page_describe,other_info from  content_tab where link_id='"+link_id+"'";
//out.println(application_query);
Statement st_content_view=con.createStatement();
ResultSet rs_content_view=st_content_view.executeQuery(content_query);

String page_title="",page_key="",page_describe="",other_info="";

	
if(rs_content_view.next())
{
			page_title=rs_content_view.getString("page_title");
			page_key=rs_content_view.getString("page_key");
			page_describe=rs_content_view.getString("page_describe");	
			
			other_info=rs_content_view.getString("other_info");	
				
}

rs_content_view.close();
st_content_view.close();		
%>