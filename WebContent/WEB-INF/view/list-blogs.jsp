<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Blogs</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Travellers Blog</h2>
		</div>
	</div>
	<input type="button" value="+ Add Blog"
				   onclick="window.location.href='showFormForAdd'; return false;"
				   class="add-button"
			/>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Blog -->
		
			
		
			<!--  add our html table here -->
		
			
			
				<div class="main_flex">
				
				<!-- loop over and print our blogs -->
				<c:forEach var="tempBlog" items="${blogs}">
				
					<!-- construct an "update" link with blog id -->
					<c:url var="updateLink" value="/blog/showFormForUpdate">
						<c:param name="blogId" value="${tempBlog.id}" />
					</c:url>					

					<!-- construct an "delete" link with blog -->
					<c:url var="deleteLink" value="/blog/delete">
						<c:param name="blogId" value="${tempBlog.id}" />
					</c:url>					
						
						<div class="inner_flex">
					<div>
					<img src="${pageContext.request.contextPath}/image/${tempBlog.image }" width="450"/>
					</div>
					<div class="main_flex_2">
						<div>
						<h1> ${tempBlog.name}</h1>
						 </div>
						 <div>
						 <h3>Date:${tempBlog.date}</h3> 
						 </div>
						 <div>
						<h4>Description:</h4><p>${tempBlog.description}</p> 
						</div>
						
						
						
							<!-- display the update link -->
							<div>
							<h3>Available Actions:</h3>
							<a href="${updateLink}" class="edit-button">Update</a>
							<a href="${deleteLink}" class="edit-button" onclick="if (!(confirm('Are you sure you want to delete this blog?'))) return false">Delete</a>
							   </div>
					</div>
						
					</div>
				
				</c:forEach>
						
		</div>
				
		</div>
	
	</div>
	
</body>

</html>









