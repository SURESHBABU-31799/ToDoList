<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<style type="text/css">
.input {
	text-align: center;
}
body{
	display: flex;
	justify-content: center;
	margin-top: 100px;
	background-image: url("signup.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	flex-wrap: wrap;
}
form {
	/* border: 2px solid black; */	
	display:inline-block;
	border-radius: 15px; 
	box-shadow: 0px 0px 10px 10px black;
	color: white;
}
.content{
	text-align: right;
	font-size: large;
}
table,tr,td{
	padding: 10px;
}
#button{
	height: 40px;
	width: 80px;
	border-radius: 12px;
	font-size: large;
	font-family: serif;
}
.input1{
	border: 3px solid black;
	height: 25px;
}
</style>
</head>
<body>
	<form action="saveuser" method="post" enctype="multipart/form-data">
	<!-- <form action="" method="post" enctype="formdata/multi-part"> -->
	<table>
		<tr> <td colspan="2"> <h2 class="input">SIGNUP</h2> </td> </tr>
		<tr>
			<td class="content">ID:</td>
			<td class="input"><input class="input1" type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<td class="content">Name:</td>
			<td class="input"><input class="input1" type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td class="content">E-mail:</td>
			<td class="input"><input class="input1" type="email" name="email" required="required"></td>
		</tr>
		<tr>
			<td class="content">Contact:</td>
			<td class="input"><input class="input1" type="text" name="contact" required="required"></td>
		</tr>
		<tr>
			<td class="content">Password:</td>
			<td class="input"><input class="input1" type="text" name="password" required="required"></td>
		</tr>
		<tr>
			<td class="content">Image:</td>
			<td class="input"><input id="file1" type="file" name="image" required="required"></td>
		</tr>
		<tr><td colspan="2" class="input"><input id="button" type="submit"></td></tr>
	</table>
		 
		 
		
	</form>
</body>
</html>