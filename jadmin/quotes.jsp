<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="include/dbconnection.jsp"%>
<%@include file="include/utilities.jsp"%>
<%@include file="quote-info.jsp"%>
<%
if(session.getAttribute("admin_id")!=null)
	{
%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title><%=titleName%></title>
        <link rel="SHORTCUT ICON" href="assets/images/admin.png"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta charset="UTF-8">
        <meta name="description" content="Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="FSHDesign" />
        
        <!-- Styles -->
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href="assets/plugins/pace-master/themes/blue/pace-theme-flash.css" rel="stylesheet"/>
        <link href="assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet"/>
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/line-icons/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/waves/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/3d-bold-navigation/css/style.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
        
        
        
        <!-- Theme Styles -->
        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="check.js"></script>       
        <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
  <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
   <script type="text/javascript" src="ckfinder/ckfinder.js"></script>	
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">
       
        <main class="page-content content-wrap">
            <div class="navbar">
                <div class="navbar-inner container">
                    <div class="sidebar-pusher">
                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic push-sidebar">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>
                    <div class="logo-box">
                        <a href="home.jsp" class="logo-text"><span><%=titleName%></span></a>
                    </div><!-- Logo Box -->
                    <div class="search-button">
                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic show-search"><i class="fa fa-search"></i></a>
                    </div>
                      <%@include file="outer-menu.jsp"%>
                </div>
            </div><!-- Navbar -->
             <%@include file="menu.jsp"%>
            <div class="page-inner">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="#">Quotes</a></li>
                        <li class="active">Manage Quotes</li>
                    </ol>
                </div>
                <div class="page-title">
                    <div class="container">
                        <% if(status.equals("edit")) {	 %>
                                            <h3>Edit Quote</h3><%}else{%>
                                           <h3>Add Quote</h3>
											<%}%>
                    </div>
                </div>
                
                <div id="main-wrapper" class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-white">
                           
                                <div class="panel-body">
                                
                                 <%
                                 
                                 
                            	if(request.getParameter("msg")!=null)	{
				if(request.getParameter("msg").equals("0"))	{%>		
                
                 <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        Quote already Exists !!<br>
                                    </div>
                	<%}
				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
					if(request.getParameter("msg").equals("2"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                       Saved Successfully !!
                                    </div>	<br><%}
									if(request.getParameter("msg").equals("3"))		{%>		 <div class="alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                      Deleted Successfully !!
                                    </div>	<br><%}
													}			
							%>
                                
                                    <div id="rootwizard">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active">&nbsp;</li>
                                                                                 
                                        </ul>
                          
                                    
                                      <!--  <div class="progress progress-sm m-t-sm">
                                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>-->
                                       
                                            <div class="tab-content">
    <div class="tab-pane active fade in" id="tab1">
   
    
       <form id="wizardForm" name="wizardForm" method="post" action="invoices-submit.jsp">
       <input type="hidden" name="additional_info" value="<%=body1%>">
       <input type="hidden" name="id" value="<%=id%>">
       <%
	   if(status.equals("edit"))
		{
	   %>
       <input type="hidden" name="status" value="edit">
       <%}else{%>
       <input type="hidden" name="status" value="insert">       
	   <%}%>
            <div align="right">
                <br>
                	<button type="submit" class="btn btn-primary">Save</button>&nbsp;&nbsp;
                                        <a href="quotes-search.jsp" ><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Search Quotes</button></a>
                <br><br>
            </div>
            <%
           
            %>
            <div class="row m-b-lg">
        		<div class="col-md-12">
        			<div class="row">
        				<div class="form-group col-md-2">
                         <label for="exampleInputName2">Invoice No</label>
                         <%if(status.equals("edit")){%>
                         <input type="text" class="form-control" required name="quoteNo" readonly   placeholder="Invoice Number" value="<%=showQuoteNo%>"  maxlength="249"  >
                         <%}else{%>
                         <input type="text" class="form-control" required name="quoteNo"   placeholder="Invoice Number" value="<%=showQuoteNo%>"  maxlength="249"  >
                         <%}%>
                        </div>
                        <div class="form-group col-md-3">
                         <label for="exampleInputName2">Date of Issue</label>
                         <input type="text" class="form-control date-picker" required  value="<%=issueDate%>"  name="issueDate" placeholder="Date of Issue" maxlength="99" >
                        </div>
                        
                        <div class="form-group col-md-2">
                         <label for="exampleInputName2">Ref No</label>
                         <input type="text" class="form-control" value="<%=refNo%>" name="refNo" placeholder="Reference No" maxlength="249" >
                        </div>
                       <!-- <div class="form-group col-md-2">
                         <label for="exampleInputName2">Discount</label>
                         <input type="text" class="form-control" value="0" name="discount" placeholder="Discount" maxlength="10" >
                        </div> -->
                        
                    </div>
                </div>
        </div>
        
        	<div class="row m-b-lg">
        		<div class="col-md-12">
        			<div class="row">
        				<div class="form-group col-md-5">
                                <label for="exampleInputName">To</label>
                                <%
                                String query_inv_customer="select client_name,id from client_tab where user_id='"+session.getAttribute("admin_id")+"'  and client_category='1' order by client_name asc";
                                //out.println(query_inv_customer);
                                Statement st_inv_customer=con.createStatement();
                                ResultSet rs_inv_customer=st_inv_customer.executeQuery(query_inv_customer);
                                %>
                                <select name="clientName"  required id="client_name" onChange="checkAvailabilityFunction1('checkDiv',document.wizardForm.clientName.value)" class="js-states form-control" tabindex="-1" style="width: 100%">
                                <%
								if(status.equals("edit"))
								{
								%>
                                <option value="<%=clientName%>" selected><%=clientName%></option>
                                <option value="">--- SELECT  ---</option>
                                
                                <%
								}
								else if(clientName!=null)
								{
									%>
	                                <option value="<%=clientName%>" selected><%=clientName%></option>
	                                <option value="">--- SELECT  ---</option>
	                                
	                                <%
								}
								else
								{
								%>
                                <option value="" selected>--- SELECT  ---</option>
                                <%
								}
                                while(rs_inv_customer.next()) 
                                {
                                %>
                                <option value="<%=rs_inv_customer.getString("client_name")%>"><%=rs_inv_customer.getString("client_name")%></option>
                                <%
                                }
                                rs_inv_customer.close();
                                st_inv_customer.close();
                                
                                %>
                                </select>        
        			</div>
                    <div class="form-group col-md-2">
                        <br>
                     <a href="clients.jsp?page=quote"><button type="button" class="btn btn-secondary">Add New Client +</button></a>
                    </div>
                    <div class="form-group col-md-5">
                     <div id="checkDiv">   
                        <label for="exampleInputEmail"></label>
                     </div>
                    </div>
        
        </div>
        </div>
        </div>
        <div class="row m-b-lg">
       		<div class="col-md-12">
       			<div class="row">
       				<div class="form-group col-md-8">
                               <label for="exampleInputName">Terms and Conditions</label><br>
                               <textarea rows="3" cols="10" class="form-control" name="termsAndConditions"><%=body1 %></textarea>
        				</div>
        			</div>
        			
        	</div>
         </div>
        </form>   
        <script>
		function isNumberKey(evt)
			{
				var charCode = (evt.which) ? evt.which : event.keyCode;
				if (charCode != 46 && charCode > 31 
				&& (charCode < 48 || charCode > 57))
					return false;
			
				return true;
			}
		</script>
        <form id="wizardForm1" name="wizardForm1" method="post" action="#" onSubmit="return checkcustomer()">
       
        <div class="row m-b-lg">
        		<div class="col-md-12">
        			<div class="row">
        				<div class="form-group col-md-6">
                         <label for="exampleInputName2">Description</label>
                         <input type="text" class="form-control" name="item_name" placeholder="Item Name" maxlength="249" >
                        </div>
                        <div class="form-group col-md-2">
                         <label for="exampleInputName2">Qty</label>
                         <input type="text" class="form-control" name="item_qty" onKeyPress="return isNumberKey(event);" placeholder="Item Qty" value="1" maxlength="9" >
                        </div>
                        <div class="form-group col-md-2">
                         <label for="exampleInputName2">Rate in <%=session.getAttribute("admin_currency").toString()%></label>
                         <input type="text" class="form-control" name="item_rate" onKeyPress="return isNumberKey(event);" placeholder="Item Rate" maxlength="9" >
                        </div>
                        <div class="form-group col-md-1"><br>
                         <button type="button" onClick="checkAvailabilityFunction2('checkDiv1',document.wizardForm1.item_name.value,document.wizardForm1.item_qty.value,document.wizardForm1.item_rate.value,document.wizardForm.invoice_no.value);" class="btn btn-secondary">Add</button>
                        </div>
                    </div>
                </div>
        </div>
      </form>
        <div class="row m-b-lg">
        		<div class="col-md-12">
              
        			<div class="table-responsive">     
                   	 <div id="checkDiv1">                	
                                    <table id="example" class="table table-bordered table-striped" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Description</th>
                                                <th>Qty</th>
                                                <th>Rate</th>
                                                <th>Sub Total</th>                                              
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%
						int j=0;
						 double value_amount=0.00,tot_value_amount=0.00;
			  			String query_invoice_temp=null;
			  			
			  			query_invoice_temp="select * from add_cart where user_id='"+session.getAttribute("admin_id")+"' and session_id='"+showQuoteNo+"' and status='A' order by modified_date desc";
						
			  			 
			  			
			  			Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
				value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("add_qty"))*(Double.parseDouble(rs_invoice_temp.getString("add_rate"))));
						
%>
                                        
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=rs_invoice_temp.getString("item_name")%></td>
                                                <td><%=rs_invoice_temp.getString("add_qty")%></td>
                                                <td><%=rs_invoice_temp.getString("add_rate")%></td>
                                                <td><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=value_amount%></td>
                                               
                                                <td><a href="addtocart.jsp?status=delete&id=<%=rs_invoice_temp.getString("id")%>&idq=<%=id%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a></td>
                                            </tr>
                                           
                                            <%
							value_amount=0.0;				
						}
						st_invoice_temp.close();
						rs_invoice_temp.close();
						
						if(j==0)
						{
					
%>											<tr>
                                                <td colspan="6" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
											 
						<%
						}
						%>
                        				<tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>&nbsp;</th>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                     <tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>&nbsp;</th>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                     
                                            
                                            <tr>
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <td>&nbsp;</td>  
                                                <th>Balance Owing : </th>  
                                                <th><%=session.getAttribute("admin_currency").toString()%>&nbsp;<%=tot_value_amount%></th>  
                                                <td>&nbsp;</td>                                                                                               
                                            </tr>
                                        </tbody>
                                       </table>  
                                     </div>
                                    </div>
                </div>
        </div>
       
        
        
    </div>
                                                                                 
                                              
                                                  <div class="tab-pane fade in" id="tab3">
                                                    <div class="row m-b-lg"> 
                                                    
                                                    <h3>Search Invoices</h3>    
                                                       <div align="right">
                                        
                                        <a href="#tab1" data-toggle="tab"><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Add Invoices</button></a>
                                        
                                        </div>
                                <div class="col-md-12">
                                <div class="table-responsive">
                                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Invoice No</th>
                                                <th>Name</th>
                                                <th>Due Date</th>
                                                <th>Total Amount</th>
                                                <th>Amount Owing</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Invoice No</th>
                                                <th>Name</th>
                                                <th>Due Date</th>
                                                <th>Total Amount</th>
                                                <th>Amount Owing</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <%
						int i=0;
						String query="select ino,clientName,id,quoteStatus from quote_tab where user_id='"+session.getAttribute("admin_id")+"' order by modified_date desc";
						Statement st_invoice=con.createStatement();
						ResultSet rs_invoice=st_invoice.executeQuery(query);
						while(rs_invoice.next())
						{
						i=i+1;
							record_invoice=rs_invoice.getString("ino");
				
%>
            <%@include file="payments.jsp"%>                            
                                            <tr>
                                                <td><%=i%></td>
                                                <td><a href="quote.jsp?invoice_no=<%=rs_invoice.getString("ino")%>"><%=rs_invoice.getString("ino")%></a></td>
                                                <td><%=rs_invoice.getString("client_name")%></td>
                                                <td><%=rs_invoice.getString("due_date")%></td>
                                                <td><%=tot_calculate_1%></td>
                                                <td><%=tot_calculate_3%></td>
                                                
                                                <td>
                                                <%
												if(tot_calculate_3 > 0)
												{
												%>
                                                <a href="record-payment.jsp?status=pay&id=<%=rs_invoice.getString("ino")%>" title="Record Payment"><i class="fa fa-dollar"></i></a>&nbsp;&nbsp;                     
                                                <%
												}
												if(rs_invoice.getString("quoteStatus").equals("ENABLED"))
												{
												%>               
                                            <a href="quotes.jsp?status=edit&id=<%=rs_invoice.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;<a href="quotes-submit.jsp?status=delete&id=<%=rs_invoice.getString("ino")%>" onClick="return con_delete()" title="Trash"><i class="fa fa-trash"></i></a>
                                            <%}
                                            
                                            %>
                                            </td>
                                            </tr>
                                            <%
						
						}
						st_invoice.close();
						rs_invoice.close();
						
						if(i==0)
						{
					
%>											
											 <tr>
                                                <td colspan="6" align="center" style="color:#FF0000;">No Data Avaliable !!!</td>                                                
                                            </tr>
						<%
						}
						%>
                                        </tbody>
                                       </table>  
                                    </div>
                                                        </div>
                                                     </div>
                                                     
                                                   </div>
                                                        
                                                        
                                                                                                     
                                                     
                                                </div>            
                                                
                                               
                                                
                                                
                                                 </div>
                                            
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
                  <%@include file="footer.jsp"%>
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
        <%@include file="footer-nav.jsp"%>
	

        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.1.3.min.js"></script>
        <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="assets/plugins/pace-master/pace.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/switchery/switchery.min.js"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
        <script src="assets/plugins/classie/classie.js"></script>
        <script src="assets/plugins/waves/waves.min.js"></script>
        <script src="assets/plugins/3d-bold-navigation/js/main.js"></script>
        <script src="assets/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="assets/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/select2/js/select2.min.js"></script>        
        <script src="assets/js/modern.min.js"></script>
        <script src="assets/js/pages/form-wizard.js"></script>
        <script src="assets/js/pages/form-select2.js"></script>
        
        <script src="assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>
        
    </body>
</html>

<%
}
else
{
	response.sendRedirect("sessionexpire.jsp");
}
%>