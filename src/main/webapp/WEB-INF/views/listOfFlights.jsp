<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filtered Flights</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<h1>Filtered Flights</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Flight ID</th>
					<th scope="col">Source</th>
					<th scope="col">Destination</th>
					<th scope="col">Departure Date</th>
					<th scope="col">Num. of Travellers</th>
					<th scope="col">Travel Class</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="flight" items="${filterFlights}">
					<tr>
						<td>${flight.id}</td>
						<td>${flight.source}</td>
						<td>${flight.destination}</td>
						<td>${flight.departureDate}</td>
						<td>${numTravellers}</td>
						<td>${travelClass}</td>
						<td>
							<form action="${pageContext.request.contextPath}/book-flight" method="post">
								<input type="hidden" name="id" value="${flight.id}" />
								<input type="hidden" name="numTravellers" value="${numTravellers}" />
								<button type="submit" class="btn btn-primary">Book</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
