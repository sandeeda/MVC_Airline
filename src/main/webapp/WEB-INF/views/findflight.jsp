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
	background: #3267c1; /* fallback for older browsers */
	background: -webkit-linear-gradient(to bottom, #3267c1, #5ac9ef);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to bottom, #3267c1, #5ac9ef);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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
							<button type="submit" class="btn btn-primary"
								style="background-color: #ef6614;">Book</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>