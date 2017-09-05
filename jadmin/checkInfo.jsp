<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>

<%
try
{
	if(request.getParameter("value")!=null && request.getParameter("value").length()>0)
	{
		
		stringConstant = request.getParameter("value");		
		spiltStringConstant=stringConstant.split(",");	
	%>
	<div class="col-md-6">
		<h3>View More...</h3>                                       
	   <p><%//=stringConstant%></p>
	   <%
	   try{
	   %>
	   <p>Location : <%=spiltStringConstant[1]%>, <%=spiltStringConstant[2]%>, <%=spiltStringConstant[10]%> - <%//=spiltStringConstant[13]%></p>
	   <p>Service Provider : <%=spiltStringConstant[4]%></p
	   <p>Latitude / Longitude : <%=spiltStringConstant[5]%>, <%=spiltStringConstant[6]%></p>
	   <p>Time Zone : <%=spiltStringConstant[12]%></p>
	   <p>IP Address : <%=spiltStringConstant[8]%></p>
	   <p><iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=<%=spiltStringConstant[5]%>,<%=spiltStringConstant[6]%> (custom heading)&amp;output=embed"></iframe></p>
	   <%}
	   catch(Exception e){
	   }%>
    </div>
	<%
	}
	else
	{
	
		%>
         <div class="col-md-6">
                                            <h3>View More..</h3>                                       
                                           <p>No Info Avaliable !!</p>
                                        </div>
        <%
	}
}
catch(Exception e)
{
	out.print("Error occured in checkAvailability1.jsp "+e);
}
con.close();
%>
