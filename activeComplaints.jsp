<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
				<a href=""><h1>Stolen Vehicle</h1></a>
			</div>

		</div>
		<div class="header_bottom">
			<nav>
			<ul id="nav">
				<li><a href="adminHome.jsp">Home</a></li>
				<li><a href="viewUsers.jsp">Users</a></li>
				<li><a href="activeComplaints.jsp">Active Complaints</a></li>
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
			<br /> <br /> <br />
			<h1>Ative User Complaints </h1>
			<%
				Connection con = DbConnection.getConnection();
				PreparedStatement ps = con
						.prepareStatement("SELECT * from user_info UN INNER JOIN user_vehicles UV ON UV.user_id = UN.id AND UV.stolen = '1' ");
				ResultSet  rs = ps.executeQuery();
			%>

			<table border="1">
				<tr>
					<td>Sr. No</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>DOB</td>
					<td>Gender</td>
					<td>Address</td>
					<td>Email</td>
					<td>Phone Num</td>
				</tr>

				<%
					int sr = 0;
					while (rs.next()) {
				%>
				<tr>
					<td><%=++sr%></td>
					<td><%=rs.getString("first_name")%></td>
					<td><%=rs.getString("last_name")%></td>
					<td><%=rs.getString("dob")%></td>
					<td><%=rs.getString("gender")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("phone_num")%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<br /> <br /> <br /> <br /> <br /> <br /> <br />

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
