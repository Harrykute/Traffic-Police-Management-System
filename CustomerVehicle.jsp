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
<%
if(request.getParameter("success")!=null){
	out.println("<script>alert('Customer details saved successfully.')</script>");
}
%>
	<section id="header_area">
	<div class="wrapper header">
		<div class="clearfix header_top">
			<div class="clearfix logo floatleft">
				<a href=""><h1>Stolen Vehicle</h1></a>
			</div>

		</div>
		<div class="header_bottom">
			<nav>
			<ul id="nav">
				<li><a href="userHome.jsp">Home</a></li>
				<li><a href="CustomerVehicle.jsp">Vehicle</a></li>
				<li><a href="index.jsp">Logout</a></li>
			</ul>

			</nav>
		</div>
	</div>
	</section>

	<section id="content_area">
	<div class="clearfix wrapper main_content_area">
		<div align="center"></div>


		<div align="center">

			<h1>Vehicle Details</h1>
			<br />

			<form action="AddVehicle" method="post">
				<table cellpadding="5" cellspacing="5">
					<tr>
						<td>Driving License</td>
						<td><input type="text" name="drivingLicense"
							style="width: 170px; height: 20px" maxlength="12" required></td>
					</tr>
					<tr>
						<td>Vehicle Number</td>
						<td><input type="text" name="vehicleNum" pattern="^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$"
						maxlength="14" style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Model</td>
						<td><input type="text" name="model" maxlength="15" 
							style="width: 170px; height: 20px" required></td>

						<td>Year</td>
						<td><input type="text" name="year" maxlength="4" pattern="[0-9]{4}"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Vehicle Reg. Number</td>
						<td><input type="text" name="vrn" pattern="[0-9]{10}" maxlength="10"
							style="width: 170px; height: 20px" required></td>
					</tr>
					<tr>
						<td>Vehicle Reg. Date</td>
						<td><input type="text" name="vrd" id=vrd"
							onfocus="showCalendarControl(this);"
							style="width: 170px; height: 20px" required></td>
					</tr>


					<tr>
						<td></td>
						<td><input type="submit" value="Register"
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


		</div>

	</div>

	</section>



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
