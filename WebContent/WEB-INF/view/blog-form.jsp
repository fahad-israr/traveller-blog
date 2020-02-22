<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Add Blog</title>
      <link type="text/css"
         rel="stylesheet"
         href="${pageContext.request.contextPath}/resources/css/style.css">
      <link type="text/css"
         rel="stylesheet"
         href="${pageContext.request.contextPath}/resources/css/add-blog-style.css">
   </head>
   <body>
      <div id="wrapper">
         <div id="header">
            <h2>Travellers Blog</h2>
         </div>
      </div>
      <div id="container">
         <h3>Add a Blog</h3>
         <form:form action="saveBlog" modelAttribute="blog" enctype="multipart/form-data" method="POST">
            <!-- need to associate this data with blog id -->
            <form:hidden path="id" />
            <table>
               <tbody>
                  <tr>
                     <td><label>Name:</label></td>
                     <td>
                        <form:input path="name"  id="name" onkeypress="check_max_length(event)" onkeydown="check_max_length(event)"/>
                     </td>
                  </tr>
                  <tr>
                   <tr>
                     <td><label>Description:</label></td>
                     <td>
                        <form:input path="description"  />
                     </td>
                  </tr>
                  <tr>
                     <td ><label>Date</label></td>
                     <td>
                        <form:input path="date" id="blog_date"  onchange="checkDate()" placeholder="dd/mm/yyyy" size="10" />
                     </td>
                  </tr>
                  <tr>
                     <td><label for="image">Choose Image</label></td>
                     <td> <input  name="file" id="fileToUpload" type="file" onchange="loadFile(event)" /></td>
                  </tr>
                  <tr>
                     <td>
                        <img id="output" width="300" />
                        <p id="size"></p>
                     </td>
                  </tr>
                  <tr>
                     <td><label></label></td>
                     <td><input id="final_submit" type="submit" value="Save" class="save" disabled/></td>
                  </tr>
               </tbody>
            </table>
         </form:form>
         <div style="clear; both;"></div>
         <p>
            <a href="${pageContext.request.contextPath}/blog/list">Back to List</a>
         </p>
      </div>
      
      
      
      <!-- Java Script to Handle Input Form Constrains like Max length,File Size and Format -->
      
      <script type="text/javascript">
      
      
      function checkDate() {
		   var selectedText = document.getElementById('blog_date').value;
		   //console.log(selectedText);
		   var darray = selectedText.split("/")
		   //console.log(darray);
		   var selectedDate = new Date(darray[2],darray[1]-1,darray[0]);
		   console.log(selectedDate);
		   var now = new Date();
		   if (selectedDate > now) {
		    alert("Date must be in the past");
		    document.getElementById('blog_date').value=""
		   }
		   if(selectedDate.toString()=="Invalid Date"){
			   alert(selectedDate);
			    document.getElementById('blog_date').value=""
		   }
		 }
    //Function to Restrict max length to 100
      function check_max_length(event){
    	  
    	  if(event.target.value.length>=100){
    		  
    		  if(!document.getElementById("final_submit").hasAttribute("disabled")){
    			  document.getElementById("final_submit").setAttribute("disabled","true");
    		  }
    		  alert("Max Length for name is 100");
    	  }else 
    		  document.getElementById("final_submit").removeAttribute("disabled");
      }
    //File Extension Checking Utility Function
         function hasExtension(inputID, exts) {
             var fileName = document.getElementById(inputID).value;
             console
             return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
             
         }
         var loadFile = function(event) {
         	const fsize = event.target.files[0].size; 
                const file = Math.round((fsize / 1024)); 
                // The size of the file. 
                if (file >= 5120) { 
                    alert( 
                      "File too Big, please select a file less than 5MB"); 
                      event.target.value = "";
                      if(!document.getElementById("final_submit").hasAttribute("disabled")){
            			  document.getElementById("final_submit").setAttribute("disabled","true");
            		  }
                } 
                else
                	if (!hasExtension('fileToUpload', ['.jpg', '.jpeg', '.png'])){
                		alert( "Invalid file format(only JPG,JPEG and PNG supported)"); 
                        event.target.value = "";
                        if(!document.getElementById("final_submit").hasAttribute("disabled")){
              			  document.getElementById("final_submit").setAttribute("disabled","true");
              		  }
                	}
                	else
                	{	
                	
                		if(document.getElementById("name").value.length<100)
            	         document.getElementById("final_submit").removeAttribute("disabled");
           
                        document.getElementById('size').innerHTML = '<b>'
                            + file + '</b> KB'; 
                	        
            	        	var image = document.getElementById('output');
            	        	image.src = URL.createObjectURL(event.target.files[0]);
            	        	
                	}
                 
         
         
         };
         
         
      </script>
      
      
   </body>
</html>