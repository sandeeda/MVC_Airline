<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>List of Trains</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
#luggage-img {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 200px;
}

#travelers-img {
	position: fixed;
	bottom: 0;
	right: 0;
	height: 200px;
}


</style>
</head>
<body>
	<img id="luggage-img"
		src="https://img.freepik.com/premium-vector/travel-luggage-cartoon_24640-34702.jpg?w=2000"
		alt="Luggage Cartoon">
	<img id="travelers-img"
		src="https://img.freepik.com/free-vector/travelers-concept-illustration_114360-2602.jpg?w=2000"
		alt="Travelers Concept Illustration">

	<div class="container mt-5">

		<h2>List of Trains</h2>

		<form method="post" action="${pageContext.request.contextPath }/handle-filtertrain">
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="source">Source</label> <select class="form-control"
						id="source" name="source">
						<option value="">--Select Source--</option>
						<c:forEach var="train" items="${listoftrains}">
							<option value="${train.source}">${train.source}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4 mb-3">
					<label for="destination">Destination</label> <select
						class="form-control" id="destination" name="destination">
						<option value="">--Select Destination--</option>
						<c:forEach var="train" items="${listoftrains}">
							<option value="${train.destination}">${train.destination}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4 mb-3">
					<label for="submit">&nbsp;</label>
					<button type="submit" class="btn btn-primary btn-block">Search</button>
				</div>
			</div>
		</form>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Train ID</th>
					<th>Source</th>
					<th>Destination</th>
					<th>Departure Time</th>
					<th>Action</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="train" items="${listoftrains}">
					<tr>
						<td>${train.id}</td>
						<td>${train.source}</td>
						<td>${train.destination}</td>
						<td>${train.departureTime}</td>
						<td>
							<form action="${pageContext.request.contextPath}//handle-booktrain" method="post">
								<input type="hidden" name="trainId" value="${train.id}" />
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