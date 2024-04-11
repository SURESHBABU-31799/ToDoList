<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
body{
	display: flex;
	justify-content: center;
	margin-top: 20%;
	font-size: large;
	background-image: url("welcome.jpg");
	background-repeat:no-repeat;
	background-size:cover;
	color: white;
}
form{
	border: 1px solid black;
	display: inline-block;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 10px blue;
}
table,td,tr{
	height: 40px;
	text-align: center;
}
.field{
	border: 2px solid black;
	border-radius: 5px;
}
#button{
	/* border: 3px solid black; */
	height: 30px;
	border-radius: 10px;
	background-color: gray;
	color: maroon;
	font-weight: bolder;
}
#button:hover{
	box-shadow: 0px 0px 5px 5px maroon;
	background-color: transparent;
}
#row1{
	color: maroon;
	font-size: x-large;
	font-weight: bolder;
}
/* #hide1,#hide2{
	display: none;
} */
</style>
</head>
<body>
	<% String u = (String)request.getAttribute("message");%>
	<form action="login" method="post">
	
		<table>
			<tr id="row1" class="row">
				<td colspan="2">LOGIN</td>
			</tr>
			<tr>
				<td colspan="2"><% if(u != null){  %> <h4> <%= u %> </h4> <%} %></td>
			</tr>
			<tr id="row2" class="row">
				<td>EMAIL:</td>
				<td><input id="input1" class="field" type="text" name="email"></td>
			</tr>
			<tr id="row3" class="row">
				<td>PASSWORD:</td>
				<td><input id="input2" class="field" type="text" name="password"></td>
			</tr>
			<tr id="row4" class="row">
				<td colspan="2"><input id="button" type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>