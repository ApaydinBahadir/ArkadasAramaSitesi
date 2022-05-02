<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="Loginstyle.css" type="text/css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">

	<div class="form-container sign-up-container">
		<form action="register.jsp" method="post">
			<h1>Sign Up</h1>
			<input type="text" placeholder="UserName" name="username"/>
			<input type="email" placeholder="Email" name="email"/>
			<input onfocus="(this.type='date')" placeholder="BirthDate" name="birthDate"/>
			<input type="password" placeholder="Password" name="password_" />
			<button>Create An Account</button>
		</form>
	</div>
	
	<div class="form-container log-in-container">
	<form action="login" method="post">
			<h1>Log In</h1>
			<input type="email" placeholder="Email" name="email" />
			<input type="password" placeholder="Password" name="password_" />
			<a href="#">Forgot your password?</a>
			<button>Sign In</button>
	</form>
	</div>
	
</div>


</body>
</html>