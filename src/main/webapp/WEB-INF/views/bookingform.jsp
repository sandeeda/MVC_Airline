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
