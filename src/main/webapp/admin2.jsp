<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet,java.sql.Statement"%>
    
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
		<%
		if(session.getAttribute("getMessage") != null){
						try
						{
						
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "12345");
						String sql = "select userName,message,sendTime from message where sender=? ORDER BY userName DESC, sendTime ;";
						PreparedStatement statement = conn.prepareStatement(sql);
				        statement.setString(1, (String)request.getSession().getAttribute("getMessage"));
				        ResultSet rs=statement.executeQuery();
					
						while(rs.next())
						{
							
						out.println(
								"<tr>"+
									"<td>"+
										"<mark>"+rs.getString("userName")+"</mark>"+
									"</td>"+
									"<td>"+
										"<b>"+rs.getString("message")+"</b>"+
									"</td>"+
									"<td>"+
										"<b>"+rs.getString("sendTime")+"</b>"+
									"</td>"+
								"</tr>"+
								"</br>"
								
							);

						}
						
						}catch(Exception e)
						{
						System.err.println(e);
						}
		}
		session.setAttribute("getMessage", null);

						%>	

	</body>
	
	<script type="text/javascript">
    </script>
	
	</html>