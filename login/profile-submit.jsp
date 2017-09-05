<%/*including database connection file*/%>
<%@include file="../jadmin/include/dbconnection.jsp"%>
<%@include file="../jadmin/include/utilities.jsp"%>
<%
String firstName="",lastName="",localAddress="",permanentAddress="",fatherName="",dateOfBirth="00/00/0000",gender="",mobile="",location="",department="";
String designation="",employeeId="",dateOfJoining="00/00/0000",joiningSalary="",accountHolderName="",accountNumber="",bankName="",bankBranch="",passportNumber="";   			

	if(request.getParameter("firstName")!=null)					{		firstName= request.getParameter("firstName");					}
	if(request.getParameter("lastName")!=null)					{		lastName= request.getParameter("lastName");						}
	if(request.getParameter("localAddress")!=null)				{		localAddress= request.getParameter("localAddress");				}
	if(request.getParameter("permanentAddress")!=null)			{		permanentAddress= request.getParameter("permanentAddress");		}
	if(request.getParameter("fatherName")!=null)				{		fatherName= request.getParameter("fatherName");					}
	if(request.getParameter("dateOfBirth")!=null)				{		dateOfBirth= request.getParameter("dateOfBirth");				}
	if(request.getParameter("gender")!=null)					{		gender= request.getParameter("gender");					}
	if(request.getParameter("phone")!=null)						{		phone= request.getParameter("phone");					}
	if(request.getParameter("mobile")!=null)					{		mobile= request.getParameter("mobile");					}
	if(request.getParameter("location")!=null)					{		location= request.getParameter("location");						}
	if(request.getParameter("department")!=null)				{		department= request.getParameter("department");					}
	if(request.getParameter("designation")!=null)				{		designation= request.getParameter("designation");				}
	if(request.getParameter("employeeId")!=null)				{		employeeId= request.getParameter("employeeId");					}
	
	if(request.getParameter("dateOfJoining")!=null)				{		dateOfJoining= request.getParameter("dateOfJoining");			}
	if(request.getParameter("joiningSalary")!=null)				{		joiningSalary= request.getParameter("joiningSalary");			}
	if(request.getParameter("accountHolderName")!=null)			{		accountHolderName= request.getParameter("accountHolderName");	}
	if(request.getParameter("accountNumber")!=null)				{		accountNumber= request.getParameter("accountNumber");			}
	if(request.getParameter("bankName")!=null)					{		bankName= request.getParameter("bankName");						}
	if(request.getParameter("bankBranch")!=null)				{		bankBranch= request.getParameter("bankBranch");					}
	if(request.getParameter("passportNumber")!=null)			{		passportNumber= request.getParameter("passportNumber");			}
	
	if(request.getParameter("id")!=null)						{		id= request.getParameter("id");									}
	
	if(dateOfJoining.equals(""))	{	dateOfJoining="00/00/0000";	}
	if(dateOfBirth.equals(""))		{	dateOfBirth="00/00/0000";	}
	
if(session.getAttribute("login_id")!=null)
	{	

		if(status.equals("edit"))
		{		
					
			Statement stEdit=con.createStatement();
			stEdit.executeUpdate("update employee_tab set firstName='"+firstName+"',lastName='"+lastName+"',email='"+email+"',localAddress='"+localAddress+"',permanentAddress='"+permanentAddress+"',fatherName='"+fatherName+"',dateOfBirth='"+dateOfBirth+"',password='"+password+"',gender='"+gender+"',phone='"+phone+"',mobile='"+mobile+"',location='"+location+"',department='"+department+"',designation='"+designation+"',dateOfJoining='"+dateOfJoining+"',joiningSalary='"+joiningSalary+"',accountHolderName='"+accountHolderName+"',accountNumber='"+accountNumber+"',bankName='"+bankName+"',bankBranch='"+bankBranch+"',passportNumber='"+passportNumber+"',modifiedDateTime=now() where id='"+id+"' ");
			stEdit.close();		
			
			response.sendRedirect("profile.jsp?&msg=edit&status=edit");
		}		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

