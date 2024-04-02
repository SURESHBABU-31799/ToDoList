<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style type="text/css">
body{
	background-image: url("signup1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
#maindiv{
	display: flex;
	justify-content: center;
	gap: 20px;
	position: absolute;
	margin-left: 41%
}
#login{
	border:5px solid gold;
	display: inline-block;
	border-radius: 10px;

}
#login:hover{
	box-shadow: 1px 1px 6px 6px orange;  
}
#signup{
	border:5px solid gold;
	display: inline-block;
	border-radius: 10px;
}
#signup:hover{
	box-shadow: 1px 1px 6px 6px orange;  
}
#a1{
	color:silver;
	text-decoration: none;
}
#a2{
	color:silver;
	text-decoration: none;
}
#h1{
	display:block;
	text-align: center;
	margin-top: 15%;
}
</style>
</head>
<body>
	<h1 id="h1">Welcome</h1>
	<div id="maindiv">
		<h1 id="login"><a id="a1" href="login.jsp" title="Click to login page">Login</a></h1>
		<h1 id="signup"><a id="a2" href="signup.jsp" title="Click to signup page">SignUp</a></h1>
	</div>
</body>
</html>