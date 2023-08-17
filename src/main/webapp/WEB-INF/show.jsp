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
		<h1><c:out value="${book.title}" /></h1>
		<a href="/books">back to shelves</a>
	</div>
	<div>
		<h2><c:out value="${book.user.name}" /> read <c:out value="${book.title}" /> by <c:out value="${book.author}" /></h2>
		<h2>Here are <c:out value="${book.user.name}" />'s thoughts:</h2>
		<h3><c:out value="${book.thoughts}" /></h3>
	</div>
</body>
</html>