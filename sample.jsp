<script>
function checkPhoto(target) {
	alert("Haiii");
    if(target.files[0].type.indexOf("image") == -1) {
        document.getElementById("photoLabel").innerHTML = "File not supported";
        return false;
    }
    if(target.files[0].size > 102400) {
        document.getElementById("photoLabel").innerHTML = "Image too big (max 100kb)";
		
        return false;
    }
    document.getElementById("photoLabel").innerHTML = "";
    return true;
}
</script>
<form action="sample-submit.jsp" name="sample">
<div class="photo">
    <div>Photo (max 240x240 and 100 kb):</div>
    <input type="file" name="photo" id="file" onchange="checkPhoto(this)"/>
	<input type="submit" onclick="checkPhoto('document.sample.photo.value')">
</div>
<br><br>
<div id="photoLabel">
</div>
<br><div id="photoLabel1">
</div>
</form>
 <script src="jadmin/assets/plugins/jquery/jquery-2.1.3.min.js"></script>
 <script>
		var _URL = window.URL || window.webkitURL;

$("#file").change(function(e) {
    var file, img;


    if ((file = this.files[0])) {
        img = new Image();
        img.onload = function() {
            alert(this.width + " " + this.height);
			if(this.width>240&&this.height>240)
			{
			document.getElementById("photoLabel1").innerHTML ="too big "+this.width+" X "+this.height;
			return false;
			
			}
        };
        img.onerror = function() {
            alert( "not a valid file: " + file.type);
			return false;
        };
        img.src = _URL.createObjectURL(file);
		return true;

    }

});
		</script>