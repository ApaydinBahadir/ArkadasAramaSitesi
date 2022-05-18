<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
   
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div class="form-container deleteUser-container">
			<form action="AdminFunct" method="post">
				<h1>Delete User</h1>
				<input type="text" placeholder="Username" name="delete"/>
				<button>Delete</button>
			</form>
		</div>
		
		<div class="form-container maker-container">
			<form action="AdminFunct" method="post">
				<h1>Make Admin</h1>
				<input type="text" placeholder="Username" name="adminer"/>
				<button>Make Admin</button>
			</form>
		</div>
		
		<div class="form-container massageContainer">
			<form action="AdminFunct" method="post">
				<h1>Get Message of User</h1>
				<input type="text" placeholder="Username" name="message"/>
				<button>Get Message</button>
			</form>
		</div>
				
	</body>
	
	<script type="text/javascript">
    </script>
	
	</html>