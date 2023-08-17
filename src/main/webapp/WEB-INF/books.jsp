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
		<h1>Welcome, <c:out value="${user.name}" /></h1>
		<a href="/logout">Logout</a>
	</div>
	<div>
		<h2>Books from everyone's shelves:</h2>
		<a href="/books/new">+ Add a book to my shelf!</a>
	</div>
	<table>
    <thead>
        <tr>
        	<th>ID</th>
            <th>Title</th>
            <th>Author Name</th>
            <th>Posted By</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="book" items="${books}">
        	<tr>
	         	<td><c:out value="${book.id}" /></td>
	         	<td><a href="/books/${book.id}"><c:out value="${book.title}" /></a></td>
	         	<td><c:out value="${book.author}" /></td>
	         	<td><c:out value="${book.user.name}" /></td>
        	</tr>
        </c:forEach>
    </tbody>
</table>
	
	
</body>
</html>