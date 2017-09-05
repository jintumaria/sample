<%

String news_category="",news_date="",news_heading="",news_short="",news_describe="",image_1="",image_1_status="",created_date="",modified_date="",status="",id="";
String link_id="",name_text="",name_name="";
String display_page="";	

if(request.getParameter("id")!=null)		{ id=request.getParameter("id");				}
if(request.getParameter("status")!=null)	{ status=request.getParameter("status");		}
if(request.getParameter("link_id")!=null)	{ link_id=request.getParameter("link_id");		}
if(link_id.equals("1"))						{	name_text="Testimonials"; name_name="testimonial";display_page="../about/";		}

		
String news_query="";
if(status.equals("edit")||status.equals("view")){

news_query="select * from  news_tab where id='"+id+"'";
Statement st_news_view=con.createStatement();
ResultSet rs_news_view=st_news_view.executeQuery(news_query);

if(rs_news_view.next())
{
			news_category=rs_news_view.getString("news_category");
			news_date=rs_news_view.getString("news_date");
			news_heading=rs_news_view.getString("news_heading");
			news_short=rs_news_view.getString("news_short");
			news_describe=rs_news_view.getString("news_describe");
			
			image_1=rs_news_view.getString("image_1");
			image_1_status=rs_news_view.getString("image_1_status");
			created_date=rs_news_view.getString("created_date");
			modified_date=rs_news_view.getString("modified_date");
			
}
rs_news_view.close();
st_news_view.close();
	
}		
	

%>