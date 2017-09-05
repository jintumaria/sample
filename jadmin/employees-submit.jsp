<%/*including database connection file*/%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="employees-data.jsp"%>

<%
if(session.getAttribute("admin_id")!=null)
	{
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
		
	
			
		if(status.equals("insert"))
		{
			
			Statement stCountData=con.createStatement();
			ResultSet rsCountData=stCountData.executeQuery("select id from employee_tab where email='"+email+"'");
			while(rsCountData.next())
			{
				COUNTDATA=1;				
			}
			rsCountData.close();
			stCountData.close();
			
						
			
			if(COUNTDATA==0)
			{
				Statement stGetID=con.createStatement();
				ResultSet rsGetID=stGetID.executeQuery("select id from employee_tab");
				while(rsGetID.next())
				{	
					FLAGCHECK=1;
					MYID = rsGetID.getInt("id")+1;		
				}
				rsGetID.close();
				stGetID.close();
				
				if(FLAGCHECK==0)				{
					employeeId=adminName.toUpperCase()+"1";
				}
				else				{
					employeeId=adminName.toUpperCase()+ MYID;
				}
			Statement stInsert=con.createStatement();
			stInsert.executeUpdate("insert into employee_tab(firstName,lastName,email,localAddress,permanentAddress,fatherName,dateOfBirth,password,gender,phone,mobile,location,department,designation,employeeId,dateOfJoining,joiningSalary,accountHolderName,accountNumber,bankName,bankBranch,passportNumber,status,createdDate,modifiedDateTime)values('"+firstName+"','"+lastName+"','"+email+"','"+localAddress+"','"+permanentAddress+"','"+fatherName+"','"+dateOfBirth+"','"+password+"','"+gender+"','"+phone+"','"+mobile+"','"+location+"','"+department+"','"+designation+"','"+employeeId+"','"+dateOfJoining+"','"+joiningSalary+"','"+accountHolderName+"','"+accountNumber+"','"+bankName+"','"+bankBranch+"','"+passportNumber+"','YES',now(),now())");
			stInsert.close();		
			
			response.sendRedirect("employees-search.jsp?msg=insert&status=insert");		
			
			}
			else{
				response.sendRedirect("employees.jsp?linkId="+linkId+"&msg=exists&status=insert");
			}
			
			
		}	
		
		
		if(status.equals("edit"))
		{
			
					
			Statement stEdit=con.createStatement();
			stEdit.executeUpdate("update employee_tab set firstName='"+firstName+"',lastName='"+lastName+"',email='"+email+"',localAddress='"+localAddress+"',permanentAddress='"+permanentAddress+"',fatherName='"+fatherName+"',dateOfBirth='"+dateOfBirth+"',password='"+password+"',gender='"+gender+"',phone='"+phone+"',mobile='"+mobile+"',location='"+location+"',department='"+department+"',designation='"+designation+"',dateOfJoining='"+dateOfJoining+"',joiningSalary='"+joiningSalary+"',accountHolderName='"+accountHolderName+"',accountNumber='"+accountNumber+"',bankName='"+bankName+"',bankBranch='"+bankBranch+"',passportNumber='"+passportNumber+"',modifiedDateTime=now() where id='"+id+"' ");
			stEdit.close();		
			
			response.sendRedirect("employees.jsp?linkId="+linkId+"&msg=edit&id="+id+"&status=insert");
		
		}		
		
		if(status.equals("delete"))
		{
			Statement stDelete=con.createStatement();
			stDelete.executeUpdate("delete from employee_tab where id='"+id+"'");
			stDelete.close();		
			response.sendRedirect("employees-search.jsp");		
			
		}
		
	con.close();	
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>

