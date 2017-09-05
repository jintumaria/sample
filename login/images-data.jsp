<%		
if(request.getParameter("linkId")!=null)		{	linkId=request.getParameter("linkId"); }
if(request.getParameter("id")!=null)			{	 id=request.getParameter("id");			 }
if(request.getParameter("status")!=null)		{	 status=request.getParameter("status");	 }
if(request.getParameter("imageId")!=null)		{	 imageId=request.getParameter("image_id");	 }

if(linkId.equals("1"))			
{		
	nameText="Profile "; nameCaption="Profile Photo";image1Width="300";image1Height="300";readOnlyAction="readonly";NOOFIMAGES=1;displayPage="/"; }
else if(linkId.equals("2"))
{
	nameText="Cover "; nameCaption="Cover Photo";image1Width="980";image1Height="300";readOnlyAction="readonly";NOOFIMAGES=1;displayPage="/";
}
 

%>