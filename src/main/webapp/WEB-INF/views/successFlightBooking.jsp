<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Booking Confirmation</title>
	<!-- Add Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Booking Confirmation</h1>
		<p>Your flight booking has been confirmed!</p>
		
		<h2>Flight Details</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Departure Airport</th>
					<th>Arrival Airport</th>
					<th>Departure Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${flightById.source}</td>
					<td>${flightById.destination}</td>
					<td>${flightById.departureDate}</td>
				</tr>
			</tbody>
		</table>
		
		<h2>Passenger Details</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookings}">
					<tr>
						<td>${booking.flightPassenger.name}</td>
						<td>${booking.flightPassenger.email}</td>
						<td>${booking.flightPassenger.age} years old</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
