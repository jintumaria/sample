<%
String newsQuery="";

 newsQuery="select location, department, category,strDate,name,infoShort, infoDescribe,image1,image1Status,createdDate,modifiedDateTime from  noticeboard_tab where caption='"+caption+"'";
 Statement stNewsView=con.createStatement();
 ResultSet rsNewsView=stNewsView.executeQuery(newsQuery);
 if(rsNewsView.next())
 {
	location=rsNewsView.getString("location");
	department=rsNewsView.getString("department");
	category=rsNewsView.getString("category");
	strDate=rsNewsView.getString("strDate");
	name=rsNewsView.getString("name");
	infoShort=rsNewsView.getString("infoShort");
	infoDescribe=rsNewsView.getString("infoDescribe");
	image1=rsNewsView.getString("image1");
	image1Status=rsNewsView.getString("image1Status");
	
 }
 rsNewsView.close();
 stNewsView.close();
 
 SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
 Date noticeDate = dt.parse(strDate);
 SimpleDateFormat dt1= new SimpleDateFormat("MM/dd/yyyy");
 strDate=dt1.format(noticeDate);

%>