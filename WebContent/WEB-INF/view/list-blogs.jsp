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
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
		
			<input type="button" value="Add Blog"
				   onclick="window.location.href='showFormForAdd'; return false;"
				   class="add-button"
			/>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>Name</th>
					<th>Date</th>
					<th>Description</th>
					<th>IMage</th>
					<th>Action</th>
				</tr>
				
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
					
					<tr>
						<td> ${tempBlog.name} </td>
						<td> ${tempBlog.date} </td>
						<td> ${tempBlog.description} </td>
						
						<td><img src="${pageContext.request.contextPath}/image/${tempBlog.image }" width="400"/></td>
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this blog?'))) return false">Delete</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	
</body>

</html>









