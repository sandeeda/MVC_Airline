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
	<img
			src="https://user-images.githubusercontent.com/42469977/229565307-5068351c-058a-4488-b3f7-7e6dd5f06597.png"
			alt="Logo" style="width: 500px; height: auto;">
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
			<tbody style="color: #888;">
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
			<button type="submit" class="glow-on-hover">Confirm Booking</button>
		</form>
	</div>
</body>
</html>
