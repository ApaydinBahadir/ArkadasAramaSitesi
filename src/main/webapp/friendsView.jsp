<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade2=null;
int _userId;

%>

<%
try{
	_userId = Integer.parseInt(request.getParameter("userId"));
	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "12345");
	ifade2=baglanti.prepareStatement("Select userName,relationType From relationslist where userId=?");
	ifade2.setInt(1, _userId);
	
	ResultSet result = ifade2.executeQuery();
	
	 while(result.next())
     {
     out.println(
         "<tr>"+
           "<td>"+
           result.getString("userName")+
          "</td>"+
           " "+
           "<td>"+
           result.getString("relationType")+
           "</td>"+
         "</tr>"+
           "<br/>"
           );

     }
}

catch(SQLException e){
out.println(e);
}finally{
ifade2.close();
baglanti.close();
}

%>

</body>
</html>