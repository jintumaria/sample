<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.DateFormat"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.util.Date"%>


<%@ page import="com.itextpdf.text.BaseColor" %>
<%@ page import="com.itextpdf.text.Chunk"%>
<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.Element"%>
<%@ page import="com.itextpdf.text.Font"%>
<%@ page import="com.itextpdf.text.pdf.BaseFont"%>
<%@ page import="com.itextpdf.text.Image"%>

<%@ page import="com.itextpdf.text.ListItem"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.Phrase"%>
<%@ page import="com.itextpdf.text.PageSize"%>
<%@ page import="com.itextpdf.text.pdf.ColumnText"%>
<%@ page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="com.itextpdf.text.pdf.PdfGState"%>
<%@ page import="com.itextpdf.text.pdf.PdfReader"%>
<%@ page import="com.itextpdf.text.pdf.PdfStamper"%>
<%@ page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@ page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@ page import="com.itextpdf.text.pdf.PdfPageEventHelper"%>
<%@ page import="com.itextpdf.text.Rectangle"%>
<%@ page import="com.itextpdf.text.pdf.draw.LineSeparator"%>

<%DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
Date date1 = new Date();
//System.out.println(dateFormat.format(date1)); %>
<%
if(session.getAttribute("admin_id")!=null)
{
  				
	try 
	{
		 String selectQry="select id,firstName,lastName,email,mobile,employeeID,dateOfJoining,status,lastLoginDateTime,location from employee_tab where id='"+id+"'";
         Statement st=con.createStatement();
		 ResultSet rsShowData=st.executeQuery(selectQry);
		 if(rsShowData.next())
		 {
			COUNTDATA=COUNTDATA+1;
			spiltDate=rsShowData.getString("dateOfJoining").split("/");
			
			String from_date="",to_date="";
			if(request.getParameter("from_date")!=null)	{	from_date= request.getParameter("from_date");	}
			if(request.getParameter("to_date")!=null)	{	to_date= request.getParameter("to_date");	}
			
			DateFormat dtSourceFromDate = new SimpleDateFormat("MM/dd/yyyy");
			DateFormat dtDestinationToDate = new SimpleDateFormat("yyyy-MM-dd");	
			
			Date Fdate = dtSourceFromDate.parse(from_date);
			Date Tdate = dtSourceFromDate.parse(to_date);
			long grandTotalTime=0;
			Date dateShow;
			Statement stTodayStatus=con.createStatement();
			String path=application.getRealPath("");			
									
			String pathSeperator=System.getProperty("file.separator");
			String my_document=rsShowData.getString("employeeID")+".pdf";
			OutputStream file = new FileOutputStream(new File(path+pathSeperator+"jadmin"+pathSeperator+"documents"+pathSeperator+my_document));			  
			Document document = new Document();
            PdfWriter.getInstance(document, file);

				Font headFont = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD);
			Font subFont = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
			Font subFontA = new Font(Font.FontFamily.HELVETICA, 12);
			Font capFont = new Font(Font.FontFamily.HELVETICA, 10,Font.BOLD|Font.UNDERLINE);
			Font paraFont = new Font(Font.FontFamily.HELVETICA, 8);
			Font paraFontUnder = new Font(Font.FontFamily.HELVETICA, 10,Font.UNDERLINE);
			Font smallBold = new Font(Font.FontFamily.HELVETICA, 9,Font.BOLD);
			Font paraFont1 = new Font(Font.FontFamily.HELVETICA, 7);
			  document.open();//PDF document opened........
		    
			  Paragraph preface_heading = new Paragraph("FSHDesign",headFont); 
			  preface_heading.setAlignment(Element.ALIGN_CENTER);							
		      document.add(preface_heading);
		      
		      document.add( Chunk.NEWLINE );			String[] from_words=from_date.split("/");			
		     String[] to_words=to_date.split("/"); 
			  Paragraph preface_subheading = new Paragraph("Employee Status : "+from_words[1]+"."+from_words[0]+"."+from_words[2]+" to "+to_words[1]+"."+to_words[0]+"."+to_words[2]+"\n\n"+rsShowData.getString("employeeID")+" : "+rsShowData.getString("firstName")+" "+rsShowData.getString("lastName"),subFont); 
			  preface_subheading.setAlignment(Element.ALIGN_CENTER);							
		      document.add(preface_subheading);	
					  
			document.add( Chunk.NEWLINE );
			
				
					
				ResultSet rsTodayStatus=stTodayStatus.executeQuery("select distinct(date) from check_tab where employeeId='"+rsShowData.getString("id")+"' and modifiedDateTime between '"+dtDestinationToDate.format(Fdate)+"' and '"+dtDestinationToDate.format(Tdate)+"' order by modifiedDateTime asc");
				while(rsTodayStatus.next())
				{
					 document.add( Chunk.NEWLINE );
					
					
					COUNTMODAL=COUNTMODAL+1;
					String[] words=rsTodayStatus.getString("date").split("-");
					
					Paragraph heading = new Paragraph(COUNTMODAL+".  "+words[2]+"."+words[1]+"."+words[0],capFont); 
					heading.setAlignment(Element.ALIGN_LEFT);							
				    document.add(heading);
					   
				    float[] columnWidthsStatus = {4,4,4};
					 PdfPTable tableStatus = new PdfPTable(columnWidthsStatus);
					 tableStatus.setWidthPercentage(100);
					 
					 tableStatus.getDefaultCell().setBorder(1);
					 tableStatus.getDefaultCell().setPadding(8);
					 
				     tableStatus.addCell(new Phrase("Status",smallBold));
				     tableStatus.addCell(new Phrase("Time",smallBold));
				     tableStatus.addCell(new Phrase("#",smallBold));	  
					
			    long beforeTime=0,afterTime=0,totalTime=0;
				
				Statement stStatus=con.createStatement();
				ResultSet rsStatus=stStatus.executeQuery("select modifiedDateTime,status from check_tab where date='"+rsTodayStatus.getString("date")+"' and  employeeId='"+rsShowData.getString("id")+"' order by modifiedDateTime asc");
				while(rsStatus.next())
				{

					dateShow=dtSourceDate.parse(rsStatus.getString("modifiedDateTime"));
					
					tableStatus.addCell(new Phrase(rsStatus.getString("status").toUpperCase(),paraFont));
					
					tableStatus.addCell(new Phrase(formatterShow.format(dateShow),paraFont));
					tableStatus.addCell(new Phrase(" ",paraFont));
					
					if(rsStatus.getString("status").toUpperCase().equals("CHECKIN"))
					{
						if(beforeTime==0)
							beforeTime=dateShow.getTime();
					}
					else if(rsStatus.getString("status").toUpperCase().equals("BREAKIN"))
					{
						beforeTime=dateShow.getTime()-beforeTime;
						totalTime=totalTime+beforeTime;
						beforeTime=0;
					}
					else if(rsStatus.getString("status").toUpperCase().equals("BREAKOUT"))
					{
						afterTime=dateShow.getTime();
						beforeTime=dateShow.getTime();
					}
					else if(rsStatus.getString("status").toUpperCase().equals("CHECKOUT"))
					{
						if(beforeTime==0)
						{
							totalTime=0;
						}
						else if(afterTime==0)
						{
							beforeTime=dateShow.getTime()-beforeTime;
							totalTime=totalTime+beforeTime;
							beforeTime=0;
						}
						else
						{
							afterTime=dateShow.getTime()-afterTime;
							totalTime=totalTime+afterTime;
							afterTime=0;
						}
					}
					
					 document.add( Chunk.NEWLINE );
				
				}
				rsStatus.close();
				stStatus.close();
				
				
			  	
				grandTotalTime=grandTotalTime+totalTime;
				
				int seconds = (int) totalTime / 1000;
				// calculate hours minutes and seconds
			    int hours = seconds / 3600;
			    int minutes = (seconds % 3600) / 60;
			    seconds = (seconds % 3600) % 60;
			    
			    tableStatus.addCell(new Phrase(" ",smallBold));
			     tableStatus.addCell(new Phrase("",smallBold));
			     tableStatus.addCell(new Phrase(hours+" Hours  "+minutes+" Minutes  "+seconds+" Seconds",smallBold));		
			    
				
			    document.add(tableStatus); 
			    
			    document.add( Chunk.NEWLINE );
			   
			}
				rsTodayStatus.close();
				stTodayStatus.close();
				
				int seconds = (int) grandTotalTime / 1000;
				// calculate hours minutes and seconds
			    int hours = seconds / 3600;
			    int minutes = (seconds % 3600) / 60;
			    seconds = (seconds % 3600) % 60;
				
			
			    document.add( Chunk.NEWLINE );
				//out.println("<br><br><b>TOTAL TIME : "+hours +" Hours "+minutes + " Minutes "+seconds + " Seconds</b>");
					
				Paragraph headingTotal = new Paragraph("Total : "+hours+" Hours  "+minutes+" Minutes  "+seconds+" Seconds",capFont); 
				headingTotal.setAlignment(Element.ALIGN_LEFT);							
			    document.add(headingTotal);
					
				
					 
					  
				// document.add(table_ladies); 
					  
					  COUNTMODAL=0; 
				
			
				  document.add( Chunk.NEWLINE );
				  document.add( Chunk.NEWLINE );		
				  document.add( Chunk.NEWLINE );
				  document.add( Chunk.NEWLINE );
				  document.add( Chunk.NEWLINE );		
				  document.add( Chunk.NEWLINE );
				  
				  Paragraph location1 = new Paragraph("Document generated by - FSHDesign.",paraFont1); 
					location1.setAlignment(Element.ALIGN_CENTER);							
				    document.add(location1);

		            document.close();
				
			             file.close();
		 

            out.println("Pdf created successfully..");
			con.close();
				
		//response.sendRedirect("http://www.fshdesign.in/jadmin/documents"+pathSeperator+my_document);	
		
		response.sendRedirect("documents"+pathSeperator+my_document);
		
		 }
		 	rsShowData.close();
			st.close();
		 
        } catch (Exception e) {
			out.println(e);
            e.printStackTrace();
        }
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>
