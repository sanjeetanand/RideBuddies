<%
if (session.getAttribute("phone") != null){
	response.sendRedirect("home.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ride Buddies - Login & Signup</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="form-3/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="form-3/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="form-3/assets/css/form-elements.css">
<link rel="stylesheet" href="form-3/assets/css/style.css">
<link rel="shortcut icon" href="form-3/assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="form-3/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="form-3/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="form-3/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="form-3/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">

				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
					<img src="logo.png" height="100px" width="100px">
						<h1><b>Ride</b> Budies</h1>
						<div class="description">
							<p>
								<strong>Login & SignUp</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-5">

						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Login</h3>
									<p>Enter phone number and password to log on:</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-key"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="controllers/logincontroller.jsp" method="post" class="login-form">
								<input type="hidden" name="type" value="login">
									<div class="form-group">
										<label class="sr-only" for="form-username">Phone</label> <input
											type="text" name="phone" placeholder="Phone number..."
											class="form-username form-control" id="form-username">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-password">Password</label> <input
											type="password" name="password" placeholder="Password..."
											class="form-password form-control" id="form-password">
									</div>
									<button type="submit" class="btn">Log in!</button>
								</form>
							</div>
						</div>
					</div>


					<div class="col-sm-1 middle-border"></div>
					<div class="col-sm-1"></div>


					<div class="col-sm-5">
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Sign up now</h3>
									<p>Fill in the form below to get instant access:</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="controllers/logincontroller.jsp" method="post"
									class="registration-form">
									<input type="hidden" name="type" value="signup">
									<div class="form-group">
										<label class="sr-only" for="form-first-name">Name</label> <input
											type="text" name="name" placeholder="Name..."
											class="form-first-name form-control" id="form-first-name">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-first-name">Gender</label> <input
											type="text" name="gender" placeholder="Gender..."
											class="form-first-name form-control" id="form-first-name">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-last-name">Phone
											Number</label> <input type="text" name="phone"
											placeholder="Phone Number..."
											class="form-last-name form-control" id="form-last-name">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-email">Email</label> <input
											type="text" name="email" placeholder="Email..."
											class="form-email form-control" id="form-email">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-password">Password</label> <input
											type="password" name="password" placeholder="Password..."
											class="form-password form-control" id="form-password">
									</div>
									<button type="submit" class="btn">Sign me up!</button>
								</form>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>

	</div>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="footer-border"></div>
					<p>
						<strong><b>Ride</b> Buddies</strong>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script src="form-3/assets/js/jquery-1.11.1.min.js"></script>
	<script src="form-3/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="form-3/assets/js/scripts.js"></script>

</body>

</html>