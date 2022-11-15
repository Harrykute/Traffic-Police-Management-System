<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<title>Vehicle</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Oswald Font -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/tooltipster.css" />
<!-- home slider-->
<link href="css/pgwslider.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="style.css" rel="stylesheet" media="screen">
<link href="responsive.css" rel="stylesheet" media="screen">
</head>

<body>

	<section id="header_area">
	<div class="wrapper header">
		<div class="clearfix header_top">
			<div class="clearfix logo floatleft">
				<h1 style="color: white; font-size: xx-large;">Vehicle
					Management System</h1>
			</div>

		</div>
		<div class="header_bottom">
			<ul id="nav">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="Login.jsp">Customer</a></li>
				<li><a href="RtoLogin.jsp">RTO</a></li>
			</ul>
		</div>
	</div>
	</section>

	<section id="content_area">
	<div class="clearfix wrapper main_content_area">
		<div align="center"></div>


		<div align="center">
			<br /> <br /> <br />
			<h1>RTO Police Login</h1>
			<br />
			<form action="AdminLogin" method="post">
				<table cellpadding="5" cellspacing="5">
					<tr>
						<td>Username</td>
						<td><input type="text" name="username"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"
							style="width: 170px; height: 20px" required></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Login"
							style="width: 85px; height: 35px"> <input type="reset"
							style="width: 85px; height: 35px"></td>

					</tr>
					<tr></tr>
					<tr></tr>

				</table>

			</form>

			<br /> <br /> <br /> <br /> <br /> <br />

		</div>
		<div class="clearfix main_content floatleft">
			<div class="clearfix content"></div>
			<div class="clearfix single_content"></div>
		</div>
	</div>
	</div>
	</div>
	</section>

	<section id="footer_top_area"> </section>

	<section id="footer_bottom_area"> </section>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.7.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.tooltipster.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.tooltip').tooltipster();
		});
	</script>
	<script type="text/javascript" src="js/selectnav.min.js"></script>
	<script type="text/javascript">
		selectnav('nav', {
			label : '-Navigation-',
			nested : true,
			indent : '-'
		});
	</script>
	<script src="js/pgwslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.pgwSlider').pgwSlider({

				intervalDuration : 5000

			});
		});
	</script>
	<script type="text/javascript" src="js/placeholder_support_IE.js"></script>

</body>
</html>
