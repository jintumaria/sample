<?php
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Drag & Drop File Upload Demo</title>
		<link href="css/fileuploader.css" rel="stylesheet" type="text/css">	
		<link href="css/jquery.ui/jquery.ui.css" rel="stylesheet" type="text/css">	
		<link href="css/imgareaselect-default.css" rel="stylesheet" type="text/css" />
	</head>
	<body>		
	    <p><img src="images/logo.jpg" width="385" height="225" alt="sapnagroup" title="sapnagroup" /></p>
		<p>This HTML5 demo uses:
			<ul>
				<li><i><b>Andrew Valums' Ajax Upload</b></i> which can be found at <a href="http://valums.com/ajax-upload/" target="_blank">http://valums.com/ajax-upload/</a>.</li>
				<li><i><b>imgAreaSelect</b></i> which can be found at <a href="http://odyniec.net/projects/imgareaselect/" target="_blank">http://odyniec.net/projects/imgareaselect/</a>.</li>
			</ul>
		</p>
		<p>The PHP function which handles the file uploads is explained <a href="http://html5.sapnagroup.com/2011/02/drag-and-drop-upload-of-files/" target="_blank">here</a>.</p>
	    <p>To upload files, click on the button below or drag files from your desktop to the button / drop area.</p>
	    <p>Drag & Drop is supported in Firefox, Chrome.</p>
		<p>Progress-bar is supported in Firefox 3.6+, Chrome 6+, Safari 4+</p>
		<p><b>Note:</b>
			<ul>
				<li>Limit of 10MB per file (although 30MB is acceptable and anything above 30MB will crash your browser).</li>
				<li>Only, .GIF, .JPG, .JPEG, .PNG, .TXT file are allowed.</li>
				<li>Any files you have uploaded will be automatically deleted in 1 hour.</li>
				<li>Thumbnails are created only for .JPG or .JPEG files in this demo.</li>
				<li>To crop an image, click 'Crop' from the file list. A popup with a cropping tool will appear. You can select the area to be cropped and click 'Crop' to crop and upload the image.</li>
			</ul>
		</p>
		
		<div id="fileuploader">		
			<noscript>			
				<p>Please enable JavaScript to use file uploader.</p>
			</noscript>         
		</div>
		<br />
		<div id="message" style="color: green; font-weight: bold;">
			
		</div>
		<br />
		<div id="imageThumbnails">
		
		</div>
		<div id="imageCropper">
		
		</div>
		<br />
		<div id="dirListing">
<?
		    if (is_dir('uploads/'.session_id().'/')){
		    	echo "<p>These are the files you have uploaded today.</p>";
		    	echo "<p><b>Note:</b> The files you have uploaded will be automatically deleted in 1 hour.</p>";
			    echo "<table border=0 cellpadding=5 cellspacing=0 width=500>";
		    		echo "<tr>";
		    			echo "<td><b>Icon</b></td>";
		    			echo "<td><b>File Name</b></td>";
		    			echo "<td><b>Download</b></td>";
		    		echo "</tr>";
					if (($handle = opendir('uploads/'.session_id().'/'))){
						while ($file = readdir($handle)) {
							if($file == "." || $file == ".."){
								continue;
							}else{
								$exts = split("[/\\.]", $file);
					            $n = count($exts)-1; 
								$exts = $exts[$n]; 
								
								$isImage = false;
								
								switch($exts){
									case 'jpg':	
									case 'jpeg':
									case 'png':
									case 'gif':
										$img =  'image';
										$isImage = true;
									break;
								}
								
								echo "<tr>";
									echo "<td valign=\"top\">";
									
										
									
										echo "<img src=\"images/icons/".$img.".png\" border=\"0\" />";
									echo "</td>";	       
									echo "<td valign=\"top\">".$file."</td>";
									$dir = 'uploads/'.session_id();
									$path = $dir.'/'.$file;
									echo "<td valign=\"top\"><a href=\"".$path."\" target=\"_blank\">Download</a></td>";
									if($isImage){
										echo "<td valign=\"top\"><img src=\"".$path."\" /></td>";
									}else{
										echo "<td valign=\"top\"></td>";
									}
								echo "</tr>";
					       }
			          }
		          }
		          echo "</table>";
	       }    
		?>	
		</div>
		<hr />
		
		<script src="js/jquery.js" type="text/javascript"></script>
		<script src="js/jquery.ui.js" type="text/javascript"></script>
		<script src="js/jquery.imgareaselect.js" type="text/javascript"></script>
	    <script src="js/fileuploader.js" type="text/javascript"></script>
	    <script>
			$(document).ready(function () {
				uploader = new qq.FileUploader({
	                element: document.getElementById('fileuploader'),
	                folderName: 'uploads',
	                action: 'upload.php',
						//Files with following extensions are only allowed
	                allowedExtensions: ['gif','jpg','jpeg','png','txt'],
	                showCropTool: 1,
	                sizeLimit: 10737418240, // Maximum filesize limit which works without any problems is 30MB. Current limit is set to 10MB = 10 * 1024 * 1024
	                params: {
						'uploadedBy': 'Sapnagroup',
						'x1': '0',
						'y1': '0',
						'x2': '300',
						'y2': '150',
						'cWidth': '300',
						'cHeight': '150',
						'oWidth': '800',
						'oHeight': '600',
						'rWidth': '300',
						'rHeight': '150'
					},
					onSubmit: function(id, fileName){
						
					},
	                onComplete: function(id, fileName, responseJSON){ // Customize the output sent to responseJSON in demo.php
						resetParams();
						
						switch(responseJSON.ext){
		                	case 'gif':
		                	case 'jpg':
		                	case 'jpeg':
		                	case 'png':
			                	var imageHTML = '<div style="margin: 0 10px 0 0;"><img src="' + responseJSON.thumbnailPath + '" width="75" border="0" /><br />' + fileName + ' uploaded by ' + responseJSON.uploadedBy + '</div>';
			                	document.getElementById('imageThumbnails').innerHTML = document.getElementById('imageThumbnails').innerHTML + imageHTML;
		                	break;
		                	default:
		                		// Do nothing
		                	break;	
	                	}
						
						if(uploader._filesInProgress < 1){
	                		document.getElementById('message').innerHTML = "All files have been uploaded. The page will refresh itself in 10 seconds."
		                	// var t = setTimeout('location.href = location.href;', 10000)
	                	}
	                }
	            });
			});
			
			var uploader;
			
			function updateParams(img, selection){
				uploader.setParams({
					'x1': selection.x1,
					'y1': selection.y1,
					'x2': selection.x2,
					'y2': selection.y2,
					'cWidth': selection.width,
					'cHeight': selection.height,
					'oWidth': img.width,
					'oHeight': img.height,
					'rWidth': '300',
					'rHeight': '150'
				});
			}
			
			function resetParams(){
				uploader.setParams({
					'x1': '0',
					'y1': '0',
					'x2': '300',
					'y2': '150',
					'cWidth': '300',
					'cHeight': '150',
					'oWidth': '800',
					'oHeight': '600',
					'rWidth': '300',
					'rHeight': '150'
				});
			}
	    </script>    
	</body>
</html>