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
<style>

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
<img
			src="https://user-images.githubusercontent.com/42469977/229565982-7d636539-43ac-4cad-bcb8-fcfa6f6db967.png"
			alt="Logo" style="width: 400px; height: auto;">

	<div class="container">
	
		<h1>Booking Confirmation</h1>
		<p>Your flight booking has been confirmed!</p>
		
		<h2>Flight Details</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Departure Airport</th>
					<th>Arrival Airport</th>
					<th>Departure Date</th>
				</tr>
			</thead>
			<tbody style="color: #888;">
				<tr>
					<td>${flightById.source}</td>
					<td>${flightById.destination}</td>
					<td>${flightById.departureDate}</td>
				</tr>
			</tbody>
		</table>
		
		<h2>Passenger Details</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody style="color: #888;">
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
