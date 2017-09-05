<%
if(session.getAttribute("login_id")!=null)	{	id=session.getAttribute("login_id").toString();		}
String firstName="",lastName="",localAddress="",permanentAddress="",fatherName="",dateOfBirth="",gender="",mobile="",location="",locationId="",locationAddress="",department="",departmentId="";
String designation="",designationId="",employeeId="",dateOfJoining="",joiningSalary="",accountHolderName="",accountNumber="",bankName="",bankBranch="",passportNumber="";

status="insert";
nameText="Add New";
Statement stDisplay=con.createStatement();
ResultSet rsDisplay=stDisplay.executeQuery("select * from employee_tab where id='"+id+"'");
if(rsDisplay.next())
{
			
	status="edit";
	nameText="Edit";
	id=rsDisplay.getString("id");
	firstName=rsDisplay.getString("firstName");
	lastName=rsDisplay.getString("lastName");
	email=rsDisplay.getString("email");
	localAddress=rsDisplay.getString("localAddress");
	permanentAddress=rsDisplay.getString("permanentAddress");

	fatherName=rsDisplay.getString("fatherName");
	dateOfBirth=rsDisplay.getString("dateOfBirth");
	if(dateOfBirth.equals("00/00/0000"))	{		dateOfBirth="";	}
	password=rsDisplay.getString("password");
	gender=rsDisplay.getString("gender");
	phone=rsDisplay.getString("phone");
	mobile=rsDisplay.getString("mobile");
	
	Statement stShowLocation=con.createStatement();
	ResultSet rsShowLocation=stShowLocation.executeQuery("select name,id,address from  location_tab where id='"+rsDisplay.getString("location")+"'");
	if(rsShowLocation.next())
	{
			locationId=rsShowLocation.getString("id");
			location=rsShowLocation.getString("name");
			locationAddress=rsShowLocation.getString("address");
	}
	rsShowLocation.close();
	stShowLocation.close();			
	
	
	Statement stShowDepartment=con.createStatement();
	ResultSet rsShowDepartment=stShowDepartment.executeQuery("select name,id from  category_tab where id='"+rsDisplay.getString("department")+"'");
	if(rsShowDepartment.next())
	{
			departmentId=rsShowDepartment.getString("id");
			department=rsShowDepartment.getString("name");
	}
	rsShowDepartment.close();
	stShowDepartment.close();			
	
	
	Statement stShowDesignation=con.createStatement();
	ResultSet rsShowDesignation=stShowDesignation.executeQuery("select name,id from  category_tab where id='"+rsDisplay.getString("designation")+"'");
	if(rsShowDesignation.next())
	{
			designationId=rsShowDesignation.getString("id");
			designation=rsShowDesignation.getString("name");
	}
	rsShowDesignation.close();
	stShowDesignation.close();		
	
	employeeId=rsDisplay.getString("employeeId");
	dateOfJoining=rsDisplay.getString("dateOfJoining");
	if(dateOfJoining.equals("00/00/0000"))	{		dateOfJoining="";	}
	joiningSalary=rsDisplay.getString("joiningSalary");

	accountHolderName=rsDisplay.getString("accountHolderName");
	accountNumber=rsDisplay.getString("accountNumber");
	bankName=rsDisplay.getString("bankName");
	bankBranch=rsDisplay.getString("bankBranch");
	passportNumber=rsDisplay.getString("passportNumber");	
	
}
rsDisplay.close();
stDisplay.close();		
%>