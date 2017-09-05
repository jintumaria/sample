<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>      
<%@page import="java.util.Properties"%>                                                                                                     
<%@page import="javax.mail.Session"%>                                                                                                       
<%@page import="javax.mail.Authenticator"%>                                                                                                 
<%@page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@page import="javax.mail.Message"%>                                                                                                       
<%@page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@page import="javax.mail.Transport"%> 
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
 <!-- Styles -->       
<%
if(session.getAttribute("admin_id")!=null)
	{
		String ino="",message_caption="",subject="",status="";		
		String email_to="",message="";
										
		if(request.getParameter("invoice_no")!=null)							   {				ino=request.getParameter("invoice_no").replaceAll("'","`");			}
		if(request.getParameter("status")!=null)							   {				status=request.getParameter("status").replaceAll("'","`");			}
		
		if(status.equals("sendemail"))
							{	
							
							subject="You have received an Invoice ("+ino+") from "+session.getAttribute("admin_name").toString();							
							//statement to insert values		
	
													
													
					String invoice_to="";
					String invoice_query="select * from  invoice_tab where ino='"+ino+"'";
					Statement st_invoice_view=con.createStatement();
					ResultSet rs_invoice_view=st_invoice_view.executeQuery(invoice_query);
					if(rs_invoice_view.next())
					{
					String logo_path="",location="";
					String pathSeperator=System.getProperty("file.separator");
					String path=application.getRealPath("");		
		
					invoice_to=rs_invoice_view.getString("customer_name");
					record_invoice=ino;
					logo_path="http://myoffice.fshdesign.org/"+session.getAttribute("logo_path").toString();
					location=rs_invoice_view.getString("location");
                
				
							
							message_caption="";
							
							
							
							
					}
					rs_invoice_view.close();
					st_invoice_view.close();
									
							String smtpServer = null;                                                                                                                   
							String smtpPort = null;                                                                                                                     
							final String authAddress = "noreply@fshdesign.org";                                                                                
							final String authPassword = "try@12345";                                                                              
							//String subject = null;                                                                                                                      
							//String email = null;                                                                                                                        
							//String message = null;                                                                                                                      
							String send = "send";                                                                                                 
							String siteName=request.getServerName();                                                                                                    
							siteName=siteName.replaceAll("www.","");                                                                                                    

							if(send!=null){
									smtpServer = "mail.fshdesign.org";
									smtpPort = "2525";    
									email_to = "midhun.jacob@gmail.com";      
									message = message_caption;     
									
									try{                                             
											Properties props = new Properties();     
											props.put("mail.smtp.host", smtpServer); 
											props.put("mail.smtp.port", smtpPort);   
											props.put("mail.smtp.auth", "true");         
																					 
											// create some properties and get the default Session
											Session sessionMail = Session.getInstance(props, new Authenticator() {
												 public PasswordAuthentication getPasswordAuthentication() {      
														 return new PasswordAuthentication(authAddress, authPassword);
												 }                                                                    
												});                                                                   
																												  
											sessionMail.setDebug(true);
							
											// create a message
											Message msg = new MimeMessage(sessionMail);
								
											// set the from and to address
											InternetAddress addressFrom = new InternetAddress(authAddress,"MyOffice");
											msg.setFrom(addressFrom);
								
											InternetAddress[] addressTo = new InternetAddress[1];
											addressTo[0] = new InternetAddress(email_to);
											msg.setRecipients(Message.RecipientType.TO, addressTo);
								
								
											// Optional : You can also set your custom headers in the Email if you Want
											msg.addHeader("site", siteName);
								
											// Setting the Subject and Content Type
											msg.setSubject(subject);
											msg.setContent(message, "text/html"); 
											Transport.send(msg);
									
									}catch(Exception e){
											out.println("error : "+e);
											e.printStackTrace(response.getWriter());
									}
									
							}		
							
							response.sendRedirect("invoice.jsp?invoice_no="+ino+"&msg=1");			
							}else{
							
							//response.sendRedirect("invoice.jsp?msg=0");
						
					}
con.close();										

}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>
				

		
				
			
			
			
		
				
