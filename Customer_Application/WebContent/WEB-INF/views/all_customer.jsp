<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CUSTOMERS</title>
</head>
<h2>welcome ${user.name}</h2>
<br />
	<a href="logout">logout</a>
	<br />
	<br />
	<br />
	<div class="container"></div>
	<div class="row"></div>
	<div class="col-sm-6"></div>

	<table border="1">

		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>address</th>
				<th>phone</th>
				<th>email</th>

				<th>entry date</th>

				<th>delete</th>
				<th>update</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td>${customer.id}</td>
					<td>${customer.name}</td>
					<td>${customer.address}</td>
					<td>${customer.phone}</td>
					<td>${customer.email}</td>
					<td><fmt:formatDate type="date" value="${customer.entryDate}" /></td>
					<%-- <td>${book.pubDate}</td> --%>
					<c:if test="${user.profile == 'admin'}">
						<td><a href="delete?id=${customer.id}">delete</a></td>
						<td><a href="update?id=${customer.id}">update</a></td>

					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${user.profile == 'admin' || user.profile == 'manager'}">
		<a href="addcustomer">addcustomer</a>
	</c:if>
</body>
</html>