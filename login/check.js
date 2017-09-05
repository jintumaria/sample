function checkComment(post,status,target,no)
	{
		//alert("HAIII"+post+status+target+"  "+no);
		 document.getElementById(target).innerHTML="Please wait ......";
		var xmlHttp;
		try {
				// Firefox, Opera 8.0+, Safari
				xmlHttp=new XMLHttpRequest();
		}
		catch (e) {
			// Internet Explorer
			try  {
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e) {
				try   {
						xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
					alert("Your browser does not support AJAX!");
					return false;
				}
			}
		}
		xmlHttp.onreadystatechange=function()
		{
			if(xmlHttp.readyState==4)
			{
				document.getElementById(target).innerHTML=xmlHttp.responseText;
				//alert(xmlHttp.responseText);
			}
		}
		xmlHttp.open("GET","checkComment.jsp?value1="+post+"&value2="+status+"&value3="+no,true);	
		xmlHttp.send(null);
	}
	
	function postComment(comment,post,status,no,commentid,target)
	{
		target='refreshMyPage';
		//alert(comment+post+status+" "+no+" target : "+target);
		document.getElementById(target).innerHTML="Please wait ......";
		var xmlHttp;
		try {
				// Firefox, Opera 8.0+, Safari
				xmlHttp=new XMLHttpRequest();
		}
		catch (e) {
			// Internet Explorer
			try  {
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e) {
				try   {
						xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
					alert("Your browser does not support AJAX!");
					return false;
				}
			}
		}
		xmlHttp.onreadystatechange=function()
		{
			if(xmlHttp.readyState==4)
			{
				document.getElementById(target).innerHTML=xmlHttp.responseText;
				//alert(xmlHttp.responseText);
			}
		}
		xmlHttp.open("GET","post-comment.jsp?postid="+post+"&status="+status+"&comments="+comment+"&no="+no+"&commentid="+commentid,true);	
		xmlHttp.send(null);
		
	}