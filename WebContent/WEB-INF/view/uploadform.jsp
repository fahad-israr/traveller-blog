<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
 <head>
 <title>Image File Upload</title>
 <script type="text/javascript">
 /*document.getElementById("fileToUpload").onchange = function () {
	    var reader = new FileReader();
	    if(this.files[0].size>528385){
	        alert("Image Size should not be greater than 500Kb");
	        $("#menu_image").attr("src","blank");
	        $("#menu_image").hide();  
	        $('#menu_images').wrap('<form>').closest('form').get(0).reset();
	        $('#menu_images').unwrap();     
	        return false; }*/
	        var loadFile = function(event) {
	        	var image = document.getElementById('output');
	        	image.src = URL.createObjectURL(event.target.files[0]);
	        };
	   

 </script>
 </head>
 <body>
<h1>File Upload Example - JavaTpoint</h1>

<h3 style="color:red">${filesuccess}</h3>
<form:form method="post" action="savefile" enctype="multipart/form-data">
<p><label for="image">Choose Image</label></p>
<p><input name="file" id="fileToUpload" type="file" accept="image/jpeg,image/png,image/jpg" onchange="loadFile(event)"/></p>
<img id="output" width="300" />
<p><input type="submit" value="Upload"></p>
</form:form>


</body>
</html>