<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booking Success</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container my-3">
		<h1 style="color:green">Booking Success</h1>
		<div class="row">
			<div class="col-md-6">
				<h3>Train Details</h3>
				<table class="table table-bordered">
					<tr>
						<th>Train ID</th>
						<td>${booking.train.id}</td>
					</tr>
					<tr>
						<th>Source</th>
						<td>${booking.train.source}</td>
					</tr>
					<tr>
						<th>Destination</th>
						<td>${booking.train.destination}</td>
					</tr>
					<tr>
						<th>Departure Time</th>
						<td>${booking.train.departureTime}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<h3>Passenger Details</h3>
				<table class="table table-bordered">
					<tr>
						<th>Passenger ID</th>
						<td>${booking.passenger.id}</td>
					</tr>
					<tr>
						<th>First Name</th>
						<td>${booking.passenger.firstName}</td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td>${booking.passenger.lastName}</td>
					</tr>
					<tr>
						<th>Age</th>
						<td>${booking.passenger.age}</td>
					</tr>
					<tr>
						<th>Phone Number</th>
						<td>${booking.passenger.phoneNumber}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
