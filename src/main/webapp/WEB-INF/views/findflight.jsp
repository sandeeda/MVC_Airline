<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Flight Booking System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
</head>
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
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1 class="text-center" style="color: white;">
					<i class="fa fa-plane" aria-hidden="true"></i> Flight Booking
					System
				</h1>
				<form action="${pageContext.request.contextPath}//handle-filterFlight" method="post" class="form-horizontal">
					<div class="form-group">
						<label style="color: white;" class="control-label col-sm-3"
							for="source">Source:</label>
						<div class="col-sm-9">
							<select class="form-control" id="source" name="source">
								<c:forEach items="${sources}" var="source">
									<option value="${source}">${source}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label style="color: white;" class="control-label col-sm-3"
							for="destination">Destination:</label>
						<div class="col-sm-9">
							<select class="form-control" id="destination" name="destination">
								<c:forEach items="${destinations}" var="destination">
									<option value="${destination}">${destination}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label style="color: white;" class="control-label col-sm-3"
							for="departureDate">Departure Date:</label>
						<div class="col-sm-9">
							<div class="input-group date">
								<input type="text" class="form-control" id="departureDate"
									name="departureDate" placeholder="Enter departure date"
									readonly> <span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>

							<script>
								$(document).ready(function() {
									$("#departureDate").datepicker({
										format : 'dd/mm/yyyy',
										autoclose : true,
										todayHighlight : true
									});
								});
							</script>
						</div>
					</div>
					<div class="form-group">
						<label style="color: white;" class="control-label col-sm-3"
							for="numTravellers">Number of Travellers:</label>
						<div class="col-sm-9">
							<input type="number" class="form-control" id="numTravellers"
								name="numTravellers" min="1" max="10">
						</div>
					</div>
					<div class="form-group">
						<label style="color: white;" class="control-label col-sm-3"
							for="travelClass">Travel Class:</label>
						<div class="col-sm-9">
							<select class="form-control" id="travelClass" name="travelClass">
								<option value="Economy">Economy</option>
								<option value="Business">Business</option>
								<option value="First">First</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="glow-on-hover"
								style="background-color: #ef6614;">Book</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>