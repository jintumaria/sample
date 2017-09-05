<%

String nameName="";
String fileName="",altTag="",imageCaption="",imageDescribe="",imageLink="",image1="",image1Status="",image2="",image2Status="",uploadStatus="";

String readOnlyAction="",imageLinkId="";

String imageId="";

int noOfImages=0;

String displayPage="";
	
String image1Width="",image1Height="",image2Width="",image2Height="";
		
if(request.getParameter("linkId")!=null)		{	linkId=request.getParameter("linkId"); }
if(request.getParameter("id")!=null)			{	 id=request.getParameter("id");			 }
if(request.getParameter("status")!=null)		{	 status=request.getParameter("status");	 }
if(request.getParameter("imageId")!=null)		{	 imageId=request.getParameter("image_id");	 }

if(linkId.equals("1"))			
{		
	nameText="Profile "; nameName="Profile ";image1Width="300";image1Height="300";readOnlyAction="readonly";noOfImages=1;displayPage="/"; }
else if(linkId.equals("2"))
{
	nameText="Cover "; nameName="Cover ";image1Width="980";image1Height="300";readOnlyAction="readonly";noOfImages=1;displayPage="/";
}


%>