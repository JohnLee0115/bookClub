<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Add a Book to your Shelf!</h1>
		<a href="/books">back to shelves</a>
	</div>
	
	    <form:form action="/books/new" method="post" modelAttribute="book">
	        	<form:input type="hidden" path="user" value="${user_id}" />
	        <div class="form-group">
	            <label>Title</label>
	            <form:input path="title" class="form-control" />
	            <form:errors path="title" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Author</label>
	            <form:input path="author" class="form-control" />
	            <form:errors path="author" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Thoughts</label>
	            <form:input path="thoughts" class="form-control" />
	            <form:errors path="thoughts" class="text-danger" />
	        </div>
	        
	        <input type="submit" value="Submit" class="btn btn-primary" />
	    </form:form>
</body>
</html>