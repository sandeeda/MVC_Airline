<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Train</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
          <style>
#luggage-img {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 300px;
}
#travelers-img {
	position: fixed;
	bottom: 0;
	right: 0;
	height: 300px;
}

</style>
</head>
<body>
<div class="container">
<img id="luggage-img"
		src="https://png.pngtree.com/png-vector/20220705/ourmid/pngtree-book-now-in-banner-style-png-image_5683712.png"
		alt="Luggage Cartoon">
<img id="travelers-img"
		src="https://thumbs.dreamstime.com/b/train-ticket-set-brown-isolated-white-31723544.jpg"
		alt="Luggage Cartoon">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1 class="text-center">Book Train</h1>
            <form method="post" action="${pageContext.request.contextPath }/handle-booking">
                <div class="form-group">
                    <label for="id">Train ID:</label>
                    <input type="text" class="form-control" id="id" name="trainId" value="${trainbyid.id}" readonly />
                </div>
                <div class="form-group">
                    <label for="source">Source:</label>
                    <input type="text" class="form-control" id="source" name="source" value="${trainbyid.source}" readonly />
                </div>
                <div class="form-group">
                    <label for="destination">Destination:</label>
                    <input type="text" class="form-control" id="destination" name="destination" value="${trainbyid.destination}" readonly />
                </div>
                <div class="form-group">
                    <label for="departureTime">Departure Time:</label>
                    <input type="text" class="form-control" id="departureTime" name="departureTime" value="${trainbyid.departureTime}" readonly />
                </div>
                
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required />
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required />
                </div>
                <div class="form-group">
                    <label for="age">Age:</label>
                    <input type="number" class="form-control" id="age" name="age" required />
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required />
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Book Now" />
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
