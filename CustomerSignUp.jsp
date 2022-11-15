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
<script src="./js/CalendarControl.js" language="javascript"></script>
<link href="./css/CalendarControl.css" rel="stylesheet" type="text/css">

</head>

<body>
	<script type="text/javascript">
		function validate() {

		}
	</script>
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
				<li><a href="userHome.jsp">Home</a></li>
				
				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
	</section>

	<section id="content_area">
	<div class="clearfix wrapper main_content_area">
		<div align="center"></div>


		<div align="center">
			<h1>Customer Registration</h1>
			<br />
			<form action="UserRegistration" method="post">
				<table cellpadding="5" cellspacing="5">
					<tr>
						<td>First Name</td>
						<td><input type="text" name="fname" pattern="^[A-Za-z]+$" 
							style="width: 170px; height: 20px" required title="First name should contains only characters"> </td>
						<td>Last Name</td>
						<td><input type="text" name="lname" pattern="^[A-Za-z]+$"  title="Last name should contains only characters"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Date of Birth</td>
						<td><input type="text" name="dob" id="dob"
							onfocus="showCalendarControl(this);"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td style="color: black; size: 10px"><b>Gender : </b></td>
						<td>&nbsp;Male<input type="radio" name="gender" id="gender"
							value="male"></input> &nbsp;Female<input type="radio"
							name="gender" id="gender" value="female"></input>
						</td>
					</tr>
					<tr>
						<td>Addresss</td>
						<td><textarea name="address" pattern="^[a-zA-Z0-9 ]+$" rows="2" cols="20" required  title="Address should contains only characters and numbers"></textarea></td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td><input type="text" name="phoneNum" pattern="[789][0-9]{9}" maxlength="10" title=" Only Number allowed Start with 7 or 8 or 9"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Please enter valid email address"
							style="width: 170px; height: 20px" required></td>

					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Procced"
							style="width: 85px; height: 35px"> <input type="reset"
							style="width: 85px; height: 35px"></td>

					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td></td>
						<td></td>
					</tr>

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
