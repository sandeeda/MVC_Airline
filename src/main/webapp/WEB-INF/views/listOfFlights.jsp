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
<style>
.card-body-black {
  background-color: black;
}
.container {
	margin-top: 0vh;
}

.form-control {
	width: 50%;
}

#travelers-img {
	position: fixed;
	bottom: 0;
	right: 0;
	height: 200px;
}

html,
body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100vh;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    background: #000;
	color: #aaa;
}

.glow-on-hover {
    width: 220px;
    height: 50px;
    border: none;
    outline: none;
    color: #fff;
    background: #111;
    cursor: pointer;
    position: relative;
    z-index: 0;
    border-radius: 10px;
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left:-2px;
    background-size: 400%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #000
}

.glow-on-hover:active:after {
    background: transparent;
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: #111;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% { background-position: 0 0; }
    50% { background-position: 400% 0; }
    100% { background-position: 0 0; }
}
input[type="text"], input[type="password"] {
  background-color: #b7b9bb;
}

</style>
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
			<tbody style="color: #888;">
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
		<img
			src="https://user-images.githubusercontent.com/42469977/229564511-7858b30d-e3a6-4a1e-bb1e-efda889658ad.png"
			alt="Logo" style="width: 800px; height: auto;">
	</div>
</body>
</html>
