<!DOCTYPE html>
<html>
    <head>
        
            
    </head>
    <body>
		<input type="file" id="file" />
	
	

        <script src="assets/plugins/jquery/jquery-2.1.3.min.js"></script>
        
		
		<script>
		var _URL = window.URL || window.webkitURL;

$("#file").change(function(e) {
    var file, img;


    if ((file = this.files[0])) {
        img = new Image();
        img.onload = function() {
            alert(this.width + " " + this.height);
        };
        img.onerror = function() {
            alert( "not a valid file: " + file.type);
        };
        img.src = _URL.createObjectURL(file);


    }

});
		</script>
    </body>
</html>

