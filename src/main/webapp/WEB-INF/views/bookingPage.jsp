<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Page</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>Booking Page</h1>
		<p>Flight Details:</p>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Source</th>
					<th scope="col">Destination</th>
					<th scope="col">Departure Date</th>
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
		<p>Passenger Details:</p>
		<form action="${pageContext.request.contextPath}/confirm-booking" method="post">
			<c:forEach var="i" begin="1" end="${numTravellers}">
				<fieldset>
					<legend>Passenger ${i}</legend>
					<div class="form-group">
						<label for="name${i}">Name</label>
						<input type="text" class="form-control" id="name${i}" name="name${i}" required>
					</div>
					<div class="form-group">
						<label for="email${i}">Email</label>
						<input type="email" class="form-control" id="email${i}" name="email${i}" required>
					</div>
					<div class="form-group">
						<label for="age${i}">Age</label>
						<input type="text" class="form-control" id="age${i}" name="age${i}" required>
					</div>
				</fieldset>
			</c:forEach>
			<input type="hidden" name="flightId" value="${flightById.id}">
			<input type="hidden" name="numTravellers" value="${numTravellers}">
			<button type="submit" class="btn btn-primary">Confirm Booking</button>
		</form>
	</div>
</body>
</html>
