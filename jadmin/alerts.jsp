<%
if(msg.equals("insert"))
{
%>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Inserted Successfully !!
</div>
<%
}
if(msg.equals("edit"))
{
%>       

<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Updated Successfully !!
</div>
<%
}
if(msg.equals("exists"))
{
%>       

<div class="alert alert-warning alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Already Exists !!
</div>
<%
}
if(msg.equals("delete"))
{
%>       

<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Deleted Successfully !!
</div>
<%
}
if(msg.equals("0"))	
{
%>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Invalid Username or Password !!
</div>
 <%
 }  if(msg.equals("1"))			  		{

%>
<div class="alert alert-warning alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Successfully Logged Out !!
</div>
 <%
 }
 if(msg.equals("2"))			  		{

%>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
Please logout all other sessions and try again !!
</div>
 <%
 }
 if(msg.equals("editpass"))
 {
 %>       

 <div class="alert alert-success alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 Your password changed successfully !!
 </div>
 <%
 }
 if(msg.equals("failpass"))	
 {
 %>
 <div class="alert alert-danger alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 Change password operation failed. Try again !!
 </div>
  <%
  }
%>