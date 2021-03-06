<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="quote-info.jsp"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.itextpdf.text.BaseColor"%>
<%@ page import="com.itextpdf.text.Chunk"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.Element"%>
<%@ page import="com.itextpdf.text.Font"%>
<%@ page import="com.itextpdf.text.pdf.BaseFont"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import="com.itextpdf.text.List"%>
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


<%
if(session.getAttribute("admin_id")!=null)
	{
                String ino="";
				if(request.getParameter("quoteNo")!=null)	{ ino=request.getParameter("quoteNo");	}
				
					String invoice_to="",company_location="",invoice_address="",currency_code="";
					String invoice_query="select clientName,location,location1,issueDate,currency,refNo,termsAndConditions from  quote_tab where ino='"+ino+"'";
					Statement st_quote_view=con.createStatement();
					ResultSet rs_quote_view=st_quote_view.executeQuery(invoice_query);
					if(rs_quote_view.next())
					{
						invoice_to=rs_quote_view.getString("clientName");
						company_location=rs_quote_view.getString("location").toUpperCase();
						invoice_address=rs_quote_view.getString("location1");
						issueDate=rs_quote_view.getString("issueDate");
						refNo=rs_quote_view.getString("refNo");
						currency_code=rs_quote_view.getString("currency");
						termsAndConditions=rs_quote_view.getString("termsAndConditions");
					}
					rs_quote_view.close();
					st_quote_view.close();
try {

				record_quote=ino;
 				String new_page_title="";
				new_page_title=invoice_to.replaceAll(" ","-");
				
				String path=application.getRealPath("");
								//path="C:/Eclipse-Workspace/workspace_NEW/FSH_JUNE_02/WebContent/";
				String pathSeperator=System.getProperty("file.separator");
				String my_document=ino+"-"+new_page_title+".pdf";
				OutputStream file = new FileOutputStream(new File(path+pathSeperator+"jadmin"+pathSeperator+"documents"+pathSeperator+my_document));			  
				Document document = new Document();
	            PdfWriter.getInstance(document, file);				
				//PdfWriter writer = PdfWriter.getInstance(document, file);
				
				
 					
				Font subFont = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
				Font subFontA = new Font(Font.FontFamily.HELVETICA, 12);
				Font capFont = new Font(Font.FontFamily.HELVETICA, 10,Font.BOLD|Font.UNDERLINE);
				
				Font paraFont = new Font(Font.FontFamily.HELVETICA, 10);
				Font paraFontUnder = new Font(Font.FontFamily.HELVETICA, 10,Font.UNDERLINE);
				Font smallBold = new Font(Font.FontFamily.HELVETICA, 10,Font.BOLD);
				Font paraFont1 = new Font(Font.FontFamily.HELVETICA, 7);
				
				Font largeFont = new Font(Font.FontFamily.HELVETICA, 18,Font.BOLD);
				
				
				
						 
			     //Inserting Image in PDF
			     Image image = Image.getInstance (path+pathSeperator+"jadmin"+pathSeperator+session.getAttribute("logo_path"));
			     //image.scaleAbsolute(70f, 50f);//image width,height	
 				 image.scalePercent(50);
				 
				 float[] columnInvoiceWidths = {5,2,2};
       			 PdfPTable tableInvoice = new PdfPTable(columnInvoiceWidths);
				 tableInvoice.setWidthPercentage(100);
			     
				 tableInvoice.getDefaultCell().setBorder(0);
        		 tableInvoice.getDefaultCell().setPadding(8);
				 
				 
					  tableInvoice.addCell(new Phrase("Quote To",smallBold));
				      tableInvoice.addCell(new Phrase("Issue Date",smallBold));
				      tableInvoice.addCell(new Phrase("Ref No",smallBold));
					  
					  tableInvoice.addCell(new Phrase(invoice_to+", "+invoice_address,paraFont));
				      tableInvoice.addCell(new Phrase(issueDate,paraFont));
				       tableInvoice.addCell(new Phrase(refNo,paraFont));
					  

				 float[] columnWidths = {2, 10, 3,3,3};
       			 PdfPTable table = new PdfPTable(columnWidths);
				 table.setWidthPercentage(100);
			     
				// table.getDefaultCell().setBorder(2);
        		 table.getDefaultCell().setPadding(15);
				 table.getDefaultCell().setBackgroundColor(new BaseColor(243, 243, 243));
				
				table.getDefaultCell().setBorder(Rectangle.LEFT | Rectangle.TOP);
				table.getDefaultCell().setUseBorderPadding(true);
				table.getDefaultCell().setBorderWidthLeft(1);
				table.getDefaultCell().setBorderColorLeft(new BaseColor(250, 250, 250));
				table.getDefaultCell().setBorderWidthTop(1);
				table.getDefaultCell().setBorderColorTop(new BaseColor(250, 250, 250));
				table.getDefaultCell().setBorderWidthBottom(1);
				table.getDefaultCell().setBorderColorBottom(new BaseColor(250, 250, 250));
				table.getDefaultCell().setBorderWidthRight(1);
				table.getDefaultCell().setBorderColorRight(new BaseColor(250, 250, 250));
					 			               
 					  table.addCell(new Phrase("#",smallBold));
				      table.addCell(new Phrase("Description",smallBold));
				      table.addCell(new Phrase("Quantity",smallBold));
					  table.addCell(new Phrase("Price",smallBold));
				      table.addCell(new Phrase("Total",smallBold));
				       
					   int j=0;
					   double value_amount=0.00,tot_value_amount=0.00;
			  			String query_invoice_temp="select * from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+ino+"' and status='A' order by modified_date desc";
						Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
								value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
							
									  
							  table.addCell(new Phrase(Integer.toString(j),paraFont));
							  table.addCell(new Phrase(rs_invoice_temp.getString("item_name"),paraFont));
							  table.addCell(new Phrase(rs_invoice_temp.getString("add_qty"),paraFont));
							  table.addCell(new Phrase(rs_invoice_temp.getString("add_rate"),paraFont));
							  table.addCell(new Phrase(Double.toString(value_amount),paraFont));
							  
							 
					  
						  value_amount=0.0;				
						}
							st_invoice_temp.close();
							rs_invoice_temp.close();							
							
							
				      table.setSpacingBefore(30.0f);       // Space Before table starts, like margin-top in CSS
				      table.setSpacingAfter(30.0f);        // Space After table starts, like margin-Bottom in CSS
					  							          
 	%>					
 <%@include file="payments.jsp"%>	
   <%				
					 float[] columnFinalWidths = {10, 5,3};
					 PdfPTable tableFinal = new PdfPTable(columnFinalWidths);
					 tableFinal.setWidthPercentage(100);
					 
					 tableFinal.getDefaultCell().setBorder(0);
					 tableFinal.getDefaultCell().setPadding(8);
				 
				 
					  if(tot_calculate_3 == 0)
										  {       
 					
				  tableFinal.addCell(new Phrase("PAID IN FULL",largeFont));
										  }
										  else
										  {
											    tableFinal.addCell(new Phrase("  ",paraFont));
										  }
					  
					  	
					  	tableFinal.getDefaultCell().setBorder(Rectangle.LEFT | Rectangle.TOP);
					  	tableFinal.getDefaultCell().setUseBorderPadding(true);
						tableFinal.getDefaultCell().setBorderWidthLeft(1);
						tableFinal.getDefaultCell().setBorderColorLeft(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthTop(1);
						tableFinal.getDefaultCell().setBorderColorTop(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthBottom(1);
						tableFinal.getDefaultCell().setBorderColorBottom(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthRight(1);
						tableFinal.getDefaultCell().setBorderColorRight(new BaseColor(250, 250, 250));
					  
					  tableFinal.addCell(new Phrase("Total Amount",subFontA));
				      tableFinal.addCell(new Phrase(currency_code+" "+tot_calculate_1,subFont));
					  
					  tableFinal.getDefaultCell().setBorder(0);
					  tableFinal.addCell(new Phrase("",paraFont));
					  
					
					  	tableFinal.getDefaultCell().setBorder(Rectangle.LEFT | Rectangle.TOP);
					  	tableFinal.getDefaultCell().setUseBorderPadding(true);
						tableFinal.getDefaultCell().setBorderWidthLeft(1);
						tableFinal.getDefaultCell().setBorderColorLeft(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthTop(1);
						tableFinal.getDefaultCell().setBorderColorTop(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthBottom(1);
						tableFinal.getDefaultCell().setBorderColorBottom(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthRight(1);
						tableFinal.getDefaultCell().setBorderColorRight(new BaseColor(250, 250, 250));
					  
					  tableFinal.addCell(new Phrase("Amount Received",subFontA));
				      tableFinal.addCell(new Phrase(currency_code+" "+tot_calculate_2,subFont));
					  
					  tableFinal.getDefaultCell().setBorder(0);
					  tableFinal.addCell(new Phrase("",paraFont));
					   
					  	tableFinal.getDefaultCell().setBorder(Rectangle.LEFT | Rectangle.TOP);
					  	tableFinal.getDefaultCell().setUseBorderPadding(true);
						tableFinal.getDefaultCell().setBorderWidthLeft(1);
						tableFinal.getDefaultCell().setBorderColorLeft(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthTop(1);
						tableFinal.getDefaultCell().setBorderColorTop(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthBottom(1);
						tableFinal.getDefaultCell().setBorderColorBottom(new BaseColor(250, 250, 250));
						tableFinal.getDefaultCell().setBorderWidthRight(1);
						tableFinal.getDefaultCell().setBorderColorRight(new BaseColor(250, 250, 250));
					  tableFinal.addCell(new Phrase("Balance Amount",subFontA));
				      tableFinal.addCell(new Phrase(currency_code+" "+tot_calculate_3,subFont));
					  
		
		            
			document.open();//PDF document opened........
				    
					 
					      			
					Paragraph preface = new Paragraph("QUOTE # : "+ino,subFont); 
					preface.setAlignment(Element.ALIGN_RIGHT);							
				    document.add(preface);	
					 
					document.add(image);	
					 document.add( Chunk.NEWLINE );
					document.add(tableInvoice);
					document.add(table);
					
					document.add( Chunk.NEWLINE );
					
					if(termsAndConditions!=null)
					{
						Paragraph terms = new Paragraph("Terms and Conditions : ",smallBold); 
						terms.setAlignment(Element.ALIGN_LEFT);							
					    document.add(terms);
					    
						terms = new Paragraph(termsAndConditions,paraFont); 
						terms.setAlignment(Element.ALIGN_LEFT);							
					    document.add(terms);	
					}
					document.add( Chunk.NEWLINE );
		            //document.add(image1);
					document.add(tableFinal);
					document.add( Chunk.NEWLINE );
					LineSeparator ls = new LineSeparator();
					document.add(new Chunk(ls));
	                
 					//document.add(new Paragraph(company_location,paraFont));
					Paragraph location = new Paragraph(company_location,paraFont); 
					location.setAlignment(Element.ALIGN_CENTER);							
				    document.add(location);
					//document.add(new Paragraph(company_location,paraFont));
					Paragraph email1 = new Paragraph("Email : "+session.getAttribute("admin_email"),paraFont); 
					email1.setAlignment(Element.ALIGN_CENTER);							
				    document.add(email1);
					//document.add(new Paragraph(company_location,paraFont));
					Paragraph additional_info = new Paragraph("Phone : "+session.getAttribute("admin_phone")+", Website : "+session.getAttribute("admin_website"),paraFont); 
					additional_info.setAlignment(Element.ALIGN_CENTER);							
				    document.add(additional_info);
				
					//document.add(new Paragraph(company_location,paraFont));
					document.add( Chunk.NEWLINE );
					document.add( Chunk.NEWLINE );
					document.add( Chunk.NEWLINE );
					document.add( Chunk.NEWLINE );
					document.add( Chunk.NEWLINE );
		
					
					Paragraph location1 = new Paragraph("THIS IS  A COMPUTER GENERATED QUOTE.",paraFont1); 
					location1.setAlignment(Element.ALIGN_CENTER);							
				    document.add(location1);
					
			
					
		            document.close();
 				
			             file.close();
 
            out.println("Pdf created successfully..");
						//out.println("http://activebody.fshdesign.org/documents"+pathSeperator+my_document);
			
		response.sendRedirect("http://fshdesign.org/jadmin/documents"+pathSeperator+my_document);			
		//response.sendRedirect("documents"+pathSeperator+my_document);	
				
						//response.sendRedirect("http://localhost:8080/myoffice/documents"+pathSeperator+my_document);
 
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