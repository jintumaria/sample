<%@page import="java.util.Date"%><%@page import="java.text.SimpleDateFormat"%><%@include file="include/dbconnection.jsp"%><%@include file="include/utilities.jsp"%><%@include file="invoice-info.jsp"%><%if(session.getAttribute("admin_id")!=null)	{%><!DOCTYPE html><html>    <head>        <title><%=titleName%></title>        <link rel="SHORTCUT ICON" href="assets/images/admin.png"/>        <meta content="width=device-width, initial-scale=1" name="viewport"/>        <meta charset="UTF-8">        <meta name="description" content="Admin Dashboard Template" />        <meta name="keywords" content="admin,dashboard" />        <meta name="author" content="FSHDesign" />        <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>        <link href="assets/plugins/pace-master/themes/blue/pace-theme-flash.css" rel="stylesheet"/>        <link href="assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet"/>        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/line-icons/simple-line-icons.css" rel="stylesheet" type="text/css"/>	        <link href="assets/plugins/waves/waves.min.css" rel="stylesheet" type="text/css"/>	        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/3d-bold-navigation/css/style.css" rel="stylesheet" type="text/css"/>	        <link href="assets/plugins/slidepushmenus/css/component.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	        <link href="assets/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css">        <link href="assets/css/modern.min.css" rel="stylesheet" type="text/css"/>        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>        <script src="check.js"></script>               <script src="assets/plugins/3d-bold-navigation/js/modernizr.js"></script>        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->        <!--[if lt IE 9]>        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>        <![endif]-->   <script type="text/javascript" src="ckeditor/ckeditor.js"></script>   <script type="text/javascript" src="ckfinder/ckfinder.js"></script>	   </head>    <body class="page-header-fixed compact-menu page-horizontal-bar">        <main class="page-content content-wrap">           <div class="navbar">                <div class="navbar-inner container">                    <div class="sidebar-pusher">                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic push-sidebar">                            <i class="fa fa-bars"></i>                        </a>                    </div>                    <div class="logo-box">                       <a href="home.jsp" class="logo-text"><span><%=titleName%></span></a>                    </div><!-- Logo Box -->                    <div class="search-button">                        <a href="javascript:void(0);" class="waves-effect waves-button waves-classic show-search"><i class="fa fa-search"></i></a>                    </div>                      <%@include file="outer-menu.jsp"%>                </div>            </div><!-- Navbar -->             <%@include file="menu.jsp"%>            <div class="page-inner">                <div class="page-breadcrumb">                    <ol class="breadcrumb container">                        <li><a href="home.jsp">Home</a></li>                        <li><a href="#">Invoices</a></li>                        <li class="active">Manage Invoices</li>                    </ol>                </div>                <div class="page-title">                    <div class="container">                        <% if(status.equals("edit")) {	 %>                                            <h3>Edit Invoice</h3><%}else{%>                                           <h3>Add Invoice</h3>											<%}%>                    </div>                </div>                <div id="main-wrapper" class="container">                    <div class="row">                        <div class="col-md-12">                            <div class="panel panel-white">                                <div class="panel-body">                                 <%
                            	if(request.getParameter("msg")!=null)	{				if(request.getParameter("msg").equals("0"))	{%>		                 <div class="alert alert-danger alert-dismissible" role="alert">                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                        Invoice already Exists !!<br>                                    </div>                	<%}				if(request.getParameter("msg").equals("1"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                       Saved Successfully !!                                    </div>	<br><%}					if(request.getParameter("msg").equals("2"))		{%>		 <div class="alert alert-success alert-dismissible" role="alert">                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                       Saved Successfully !!                                    </div>	<br><%}
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
                                        <a href="invoices-search.jsp" ><button type="button" class="btn btn-secondary"><i class="fa fa-truck m-r-xs"></i>&nbsp;&nbsp;Search Invoices</button></a>
                <br><br>
            </div>
            <%
            String quoteNo="";
            if(request.getParameter("quoteNo")!=null)
            {
           	quoteNo=request.getParameter("quoteNo");
           	String quote_show_query="select ino,issueDate,refNo,clientName,termsAndConditions from  quote_tab where ino='"+quoteNo+"'";
           	Statement st_quote_view=con.createStatement();
			ResultSet rs_quote_view=st_quote_view.executeQuery(quote_show_query);
				if(rs_quote_view.next())
				{
						clientName=rs_quote_view.getString("clientName");
						
						
						issueDate=rs_quote_view.getString("issueDate");
						
						SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
						SimpleDateFormat dt1= new SimpleDateFormat("MM/dd/yyyy");
							Date dobDate = dt.parse(issueDate);
							issueDate=dt1.format(dobDate);
						
						//ref_no=rs_quote_view.getString("refNo");
							//System.out.println("cn : "+client_name+" issud : "+issue_date+" ref : "+ref_no);
	            }
	            rs_quote_view.close();
	            
	          //  String tempId="",tempSession="",tempItem="",tempQty="",tempRate="";
	            if(quoteNo!=null)
	  			 {
	            	ResultSet rs_check=null;
	            	
	  				String query_quote_temp="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+quoteNo+"' and status='A'";
	  				Statement st_quote_temp=con.createStatement();
					ResultSet rs_quote_temp=st_quote_temp.executeQuery(query_quote_temp);
					while(rs_quote_temp.next())
					{
						int F=0;
						
					//	tempId=session.getAttribute("admin_id");
					//	tempSession=show_invoice_no;
					//	tempItem=rs_quote_temp.getString("item_name");
					//	tempQty=rs_quote_temp.getString("add_qty");
					//	tempRate=rs_quote_temp.getString("add_rate");
						
					//String check_query="select * from add_cart where user_id='"+tempId+"' and session_id='"+tempSession+"' and status='A' and item_name='"+tempItem+"' and add_qty='"+tempQty+"' and add_rate='"+tempRate+"'";
					//	System.out.println(check_query);
					//ResultSet rs_check_incoice=st_quote_temp.executeQuery(check_query);
					//if(rs_check_incoice.next())
					{
					//	F=1;
					} 
						if(F==0)
						{
							String query_quote="insert into add_cart(userId, sessionId, itemName, addQty, addRate, status, createdDate, modifiedDateTime) values('"+session.getAttribute("admin_id")+"','"+showInvoiceNo+"','"+rs_quote_temp.getString("itemName")+"','"+rs_quote_temp.getString("addQty")+"','"+rs_quote_temp.getString("addRate")+"','"+rs_quote_temp.getString("status")+"',now(), now())";
							st_quote_temp.executeUpdate(query_quote);
						}
					}
					//ref_no=quoteNo;
					
	  			 }
	        }
            
            
            if(type.equals("copy"))
 			 {
           		ResultSet rs_copy=null;
           	
           		String copy_show_query="select ino,issueDate,refNo,clientName from  invoice_tab where ino='"+id+"'";
               	Statement st_copy_view=con.createStatement();
    			ResultSet rs_copy_view=st_copy_view.executeQuery(copy_show_query);
    				if(rs_copy_view.next())
    				{
    						clientName=rs_copy_view.getString("clientName");
    						
    						//issue_date=rs_copy_view.getString("issue_date");
    						SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
    						SimpleDateFormat dt1= new SimpleDateFormat("MM/dd/yyyy");
    						//	Date dobDate = dt.parse(issue_date);
    						//	issue_date=dt1.format(dobDate);
    						
    						
    						//System.out.println("cn : "+clientName+" issud : "+issueDate+" ref : "+refNo);
    	            }
    	            rs_copy_view.close();
           		
 				String query_copy_temp="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+id+"' and status='A'";
 				System.out.println(query_copy_temp);
 				Statement st_copy_temp=con.createStatement();
				rs_copy=st_copy_temp.executeQuery(query_copy_temp);
				while(rs_copy.next())
				{
					int F=0;					Statement st_check=con.createStatement();					String query_check="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+showInvoiceNo+"' and itemName='"+rs_copy.getString("itemName")+"' and addQty='"+rs_copy.getString("addQty")+"' and addRate='"+rs_copy.getString("addRate")+"' and status='"+rs_copy.getString("status")+"'";					ResultSet rs_check=st_check.executeQuery(query_check);					if(rs_check.next())					{						F=1;					}					rs_check.close();					st_check.close();
					
					if(F==0)
					{
						String query_quote="insert into add_cart(userId, sessionId, itemName, addQty, addRate, status, createdDate, modifiedDateTime) values('"+session.getAttribute("admin_id")+"','"+showInvoiceNo+"','"+rs_copy.getString("itemName")+"','"+rs_copy.getString("addQty")+"','"+rs_copy.getString("addRate")+"','"+rs_copy.getString("status")+"',now(), now())";
						st_copy_temp.executeUpdate(query_quote);
					}
				}
				
				
 			 }
            %>
            <div class="row m-b-lg">
        		<div class="col-md-12">
        			<div class="row">
        				<div class="form-group col-md-2">
                         <label for="exampleInputName2">Invoice No</label>
                         <%if(type.equals("copy")){%>
                         <input type="text" class="form-control" required name="invoice_no" readonly   placeholder="Invoice Number" value="<%=copyInvoiceNo%>"  maxlength="249"  >
                         <%}else if(status.equals("edit")){%>
                         <input type="text" class="form-control" required name="invoice_no" readonly   placeholder="Invoice Number" value="<%=showInvoiceNo%>"  maxlength="249"  >
                         <%}else{%>
                         <input type="text" class="form-control" required name="invoice_no"   placeholder="Invoice Number" value="<%=showInvoiceNo%>"  maxlength="249"  >
                         <%}%>
                        </div>
                        <div class="form-group col-md-3">
                         <label for="exampleInputName2">Date of Issue</label>
                         <input type="text" class="form-control date-picker" required  value="<%=issueDate%>"  name="issue_date" placeholder="Date of Issue" maxlength="99" >
                        </div>
                        <div class="form-group col-md-3">
                         <label for="exampleInputName2">Due Date</label>
                         <input type="text" class="form-control date-picker" required value="<%=dueDate%>"   name="due_date" placeholder="Due Date" maxlength="99" >
                        </div>
                        <div class="form-group col-md-2">
                         <label for="exampleInputName2">Ref No</label>
                         <input type="text" class="form-control" value="<%=refNo%>" name="ref_no" placeholder="Reference No" maxlength="249" >
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
                                String query_inv_customer="select clientName,id from client_tab where userId='"+session.getAttribute("admin_id")+"'  and clientCategory='1' order by clientName asc";
                                //out.println(query_inv_customer);
                                Statement st_inv_customer=con.createStatement();
                                ResultSet rs_inv_customer=st_inv_customer.executeQuery(query_inv_customer);
                                %>
                                <select name="client_name"  required id="client_name" onChange="checkAvailabilityFunction1('checkDiv',document.wizardForm.client_name.value)" class="js-states form-control" tabindex="-1" style="width: 100%">
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
                                <option value="<%=rs_inv_customer.getString("clientName")%>"><%=rs_inv_customer.getString("clientName")%></option>
                                <%
                                }
                                rs_inv_customer.close();
                                st_inv_customer.close();
                                
                                %>
                                </select>        
        			</div>
                    <div class="form-group col-md-2">
                        <br>
                     <a href="clients.jsp?page=invoice"><button type="button" class="btn btn-secondary">Add New Client +</button></a>
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
			  			
			  			query_invoice_temp="select * from add_cart where userId='"+session.getAttribute("admin_id")+"' and sessionId='"+showInvoiceNo+"' and status='A' order by modifiedDateTime desc";
						
			  			 
			  			
			  			Statement st_invoice_temp=con.createStatement();
						ResultSet rs_invoice_temp=st_invoice_temp.executeQuery(query_invoice_temp);
						while(rs_invoice_temp.next())
						{
						j=j+1;
							
				value_amount=value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
								tot_value_amount=tot_value_amount+(Double.parseDouble(rs_invoice_temp.getString("addQty"))*(Double.parseDouble(rs_invoice_temp.getString("addRate"))));
						
%>
                                        
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=rs_invoice_temp.getString("itemName")%></td>
                                                <td><%=rs_invoice_temp.getString("addQty")%></td>
                                                <td><%=rs_invoice_temp.getString("addRate")%></td>
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