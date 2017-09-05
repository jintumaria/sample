<%
String link_id="",name_text="",name_name="",display_page="",status="",id="",page_short="",page_name="",page_category="",page_category_id="";
if(request.getParameter("link_id")!=null)	{	link_id=request.getParameter("link_id"); }
if(request.getParameter("status")!=null)	{	status=request.getParameter("status"); }
if(request.getParameter("id")!=null)		{	id=request.getParameter("id"); }

if(link_id.equals("3"))			{					name_text="Product Roses"; name_name="Product Roses";display_page="#";				}
//if(link_id.equals("4"))			{					name_text="Breakfast"; name_name="Breakfast";display_page="#";					}
								
		
String page_title="",page_title_id="",page_key="",page_describe="",other_info="",page_rate="";


if(status.equals("edit"))
{
	String product_query="select page_title,page_key,page_name,page_category,page_short,page_describe,other_info,page_rate from  product_tab where id='"+id+"'";
	Statement st_product_view=con.createStatement();
	ResultSet rs_product_view=st_product_view.executeQuery(product_query);
	if(rs_product_view.next())
	{
		
				String query_a="select id,category_name from category_tab where id='"+rs_product_view.getString("page_title")+"'";
				Statement st_a=con.createStatement();
				ResultSet rs_a=st_a.executeQuery(query_a);
				if(rs_a.next())
				{
					page_title_id=rs_a.getString("id");
					page_title=rs_a.getString("category_name");
				}
				rs_a.close();
				st_a.close();
				
				String query_b="select id,category_name from category_tab where id='"+rs_product_view.getString("page_category")+"'";
				Statement st_b=con.createStatement();
				ResultSet rs_b=st_b.executeQuery(query_b);
				if(rs_b.next())
				{
					page_category_id=rs_b.getString("id");
					page_category=rs_b.getString("category_name");
				}
				rs_b.close();
				st_b.close();
				
				
				
				page_name=rs_product_view.getString("page_name");
				page_key=rs_product_view.getString("page_key");
				page_short=rs_product_view.getString("page_short");	
				page_describe=rs_product_view.getString("page_describe");	
				page_rate=rs_product_view.getString("page_rate");	
				other_info=rs_product_view.getString("other_info");	
					
	}
	
	rs_product_view.close();
	st_product_view.close();	
}	
%>