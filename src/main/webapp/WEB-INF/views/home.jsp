<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>Home Page</title>


<style>
/* Apply styles to shift the card to the right */
.card {
	width: 1200px; /* Set the desired width of your card */
	margin-left: auto;
	/* Auto margin on the left side to push it to the right */
	margin-right: 0; /* Remove any default margin on the right side */
	border: 1px solid #ccc; /* Optional: Add a border for visual clarity */
	padding: 10px; /* Optional: Add padding for better visual appearance */
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-primary pt-3 pb-3">
		<a class="navbar-brand" href="home"
			style="font-family: cursive; font-weight: bold; color: white;">Employee
			Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home"
					style="margin-left: 100%; font-weight: bold;">Home </a></li>

				<li class="nav-item active"><a class="nav-link" href="add_emp"
					style="margin-left: 100%; font-weight: bold;">AddEmployee</a></li>


			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>




	<div class="container mt-3">

			<div class="card">
				<div class="card-body">
					<h1 class="text-center  mb-4">List of all Employee</h1>

					<c:if test="${not empty msg }">
						<h5 class="text-success text-center">${msg }</h5>
						<c:remove var="msg" />
					</c:if>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Password</th>
								<th scope="col">Salary</th>
								<th scope="col">Address</th>
								<th scope="col">Designation</th>
								<th scope="col">Action</th>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${employee}" var="p">
								<tr>
									<th scope="row">${p.id}</th>
									<td>${p.name}</td>
									<td>${p.email}</td>
									<td>${p.password}</td>
									<td>${p.salary}</td>
									<td>${p.address}</td>
									<td>${p.designation}</td>
									<td><a class="btn btn-outline-warning"
										href="update/${p.id}">Update</a>

										<div class="mt-2">
											<a class="btn btn-outline-danger" href="delete/${p.id}">Delete</a>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
						<a class="btn btn-outline-primary " href="add_emp"> Add
							Employee</a>
					</div>

				</div>
			</div>
		</div>

	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>


</body>
</html>