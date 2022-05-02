<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade=null;
String _username,_email,_registerDate,_password_,_birthDate,_gender,_privelege;

LocalDateTime date = LocalDateTime.now();
DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String registerDate = date.format(formatDate);

%>

<%
try{
	_username=request.getParameter("username");
	_email=request.getParameter("email");
	_registerDate = registerDate;
	_password_=request.getParameter("password_");
	_birthDate=request.getParameter("birthDate");
	_gender= null;
	_privelege= "0";

	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/newschema", "root", "My12?Sql");
	ifade=baglanti.prepareStatement("insert into members(username,email,registerDate,password_,birthDate,gender,privelege) values(?,?,?,?,?,?,?) ");
	ifade.setString(1, _username);
	ifade.setString(2, _email);
	ifade.setString(3,_registerDate);
	ifade.setString(4, _password_);
	ifade.setString(5,_birthDate);
	ifade.setString(6, _gender);
	ifade.setString(7, _privelege);
	ifade.executeUpdate();
	out.println("Kayit Oldunuz");
}

catch(SQLException e){
out.println(e);
}finally{
ifade.close();
baglanti.close();
}

%>
<br/>
<input type="button" id="btn" value="Giris Ekrani">

<script>      
        document.getElementById("btn")
            .onclick = function(){
                window.setTimeout(function(){location.href = 'login.jsp';}, 500);                 
             };
    </script>


</body>
</html>