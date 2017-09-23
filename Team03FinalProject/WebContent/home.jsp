<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Trojan's Textbook</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<style>
		
			h1 {
				margin-top: 0px;
			}
			
				/*The red bar you see at the top.*/
			#topBar {
				width: 100%;
				height: 60px;
				background: linear-gradient(rgb(156, 0, 0), rgb(209, 0, 0));
				border-bottom: 3px solid #ffc72c;
			}
			
				/*Div id for the longin and sign up buttons' "container"*/
			#menuBar {
				padding: 15px;
				height: 30px;
			}
			
				/*Using unordered lists to create some buttons in the menuBar div
				(log in and sign up).*/
			ul {
    			list-style-type: none;
    			margin: 0;
    			padding: 0;
			}
			
			li {
			    float: right;
			    margin-left: 5px;
			    margin-right: 5px;
			}
			
			li a, .dropButton {
			    display: block;
			    color: white;
			    text-align: center;
			    padding: 4px 16px;
			    text-decoration: none;
			    border: 2px solid white;
			    border-radius: 4px;
			}
			
			li a:hover, .dropDown:hover .dropButton {
			    background-color: rgb(219, 0, 0);
			    color: #ffc72c;
			}
			
			li.dropDown {
				display: inline-block;
			}
			
			.dropDownContent {
				display: none;
    			position: absolute;
    			background-color: #f9f9f9;
    			min-width: 160px;
    			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    			z-index: 1;
			}
			
			.dropDownContent a {
    			color: black;
				padding: 12px 16px;
				text-decoration: none;
				display: block;
				text-align: left;
			}
			
			.dropDownContent a:hover {
				background-color: #f1f1f1
			}

			.dropDown:hover .dropDownContent {
    			display: block;
			}
			
				/*Red background you see behind the book tiles. Middle part gets covered by bookDisplay div.*/
			#bookDisplayBackground {
				width: 100%;
				height: 850px;
				background: linear-gradient(rgb(209, 0, 0), rgb(156, 0, 0));
			}
			
				/*Div that holds all the book tiles. Still need to make it so the height is set dynamically
				based on the number of book tiles are in the div.*/
			#bookDisplay {
				margin-right: auto;
				margin-left: auto;
				max-width: 90%;
				height: 95%;
				background-color: white;
				padding-left: 20px;
				padding-right: 20px;
			}
			
				/*Still trying to figure out the welcome box in the middle. I planned on putting a little
				description of the site and placing the search bar in here. (To get started, enter the 
				information of a book you would like to buy or sell here and find it in the search results
				below: [search box]). The background is currently set to yellow so you can see what the
				actual welcomeBox covers and play around with the styling.*/
			#welcomeBoxBackground {
				max-width: 100%;
				height: 250px;
				margin-right: auto;
				margin-left: auto;
				margin-top: 15px;
				margin-bottom: 15px;
				padding-top: 150px;
				padding-left: 250px;
				padding-right: 250px;
				
			}
			
			#welcomeBox {
				max-width: 100%;
				padding-left: 50px;
				padding-right: 50px;
				padding-top: 25px;
				padding-bottom: 25px;
				height: 250px;
				background-color: white;
			}
			
				/*Image gallery code I grabbed from w3schools. Could still use some tweaking to
				make the text be centered no matter the size of the image. The width of the image 
				is set and the height is dynamically set based on the proportions of the image.*/
			div.gallery {
    			margin: 20px;
    			border: 2px groove rgb(209, 0, 0);
    			border-radius: 5px;
    			float: left;
    			width: 220px;
    			height: 340px;
			}

			div.gallery:hover {
    			border: 2px groove yellow;
    			border-radius: 5px;
			}
			
			div.gallery img {
			    width: 100%;
			    height: auto;
			}
			
			div.desc {
			    padding: 15px;
			    height: 56px;
			    width: 190px;
			    text-align: center;
			}
		
			.bookTable {
				width: 100%;
			}
			
			#searchform form input[type='text']{
				display:inline;
			    box-sizing: border-box;
			    border: 2px solid #ccc;
			    border-radius: 4px;
			    font-size: 16px;
			    background-color: white;
			    background-position: 10px 10px; 
			    background-repeat: no-repeat;
			    padding: 12px 20px 12px 10px;
			    -webkit-transition: width 0.4s ease-in-out;
			    transition: width 0.4s ease-in-out;
			    width:80%;
			    height: 12px;
			}

			#select {
				width: 10%;
			}
			#welcomeselect {
				width: 10%;
			}
			
		</style>
		<script>
		<%
		session = request.getSession();
		
		boolean is_loggedin = false;
				if(session.getAttribute("userID") != null){
					if((int)session.getAttribute("userID") != -1){
						is_loggedin = true;
					}
				}
		%>
		</script>
	</head>
	<body style="margin: 0px; padding: 0px">
		<div id="topBar" style="position: fixed;">
			<div id="menuBar">
				<ul>
					<%
					if(is_loggedin){
					%>
					<li class="dropDown"><a href="javascript:void(0)" class="dropButton"><%=session.getAttribute("email") %></a>
						<div class="dropDownContent">
							<a href="ProfilePage.jsp">Profile</a>
							<a href="MyListing.jsp">My Listings</a>
							<a href="EditProfile.jsp">Settings</a>
						</div>
					</li>
					<%
					}
					%>
					
					<%
					if(!is_loggedin){

					%>
						<li><form name="loginform" action="Login.jsp" method="POST"><button type="submit">Log in</button></form></li>
						<li><form name="signupform" action="Signup.jsp" method="POST"><button type="submit">Sign up</button></form></li>
						
					<%
					} else {%>
						<li><form name="logoutform" action="logout" method="POST"><button type="submit">Logout</button></form></li>
					<%
					}
					
					%>
						<li><form name="home" action="home.jsp" method="POST"><button type="submit">Home</button></form></li>
				</ul>
			</div>
		</div>
		<div id="topBar"></div>
		<div id="welcomeBoxBackground">
			<div id="welcomeBox">
				<h1 style="text-align: center">Trojan's Textbooks</h1>
					<div id="searchform">
					<form name="searchForm" method = "GET" action = "search" >
					<select id="select" name = "selectType">
						<option value = "Title">Title </option>
						<option value = "Author"> Author </option>
						<option value =  "ISBN"> ISBN </option>
					</select>
					<input type="text" name = "userinput" placeholder="Search for a book..." id="userName">
					<input type = "submit" id="welcomesubmit" name="submit" value = "Submit"> 	
					</form>
					</div>
			</div>
		</div>
	</body>
</html>