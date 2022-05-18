<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Homestyle.css" />
<title>home</title>
</head>
<body>

<<<<<<< Updated upstream
=======
			<table id="memberBox">
				
						<%
						try
						{
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newschema", "root", "12345");
						String query="Select userID,userName From member";
						Statement stmt=conn.createStatement();
						ResultSet rs=stmt.executeQuery(query);
						
						while(rs.next())
						{
						out.println(
								"<tr>"+
									"<td>"+
										"<img src='Member_icon.png' width='40px' height='40px' />"+
									"</td>"+
									"<td>"+
										rs.getString("userName")+
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td>"+
										"<input id='idvmsg' type='text' name='idvmsg' />"+
									"</td>"+
									"<td>"+
										"<input id='sendmsg' type='submit' name='sendmsg' onclick='' value='Send' />"+
									"</td>"+
								"</tr>"
									);
						}
						
						}catch(Exception e)
						{
						System.err.println(e);
						}
						%>
					
							
			</table>
>>>>>>> Stashed changes

<%!
Connection baglanti=null;
PreparedStatement ifade=null;
String _userID,_message;
%>


<div id="wrapper">
            <div id="menu">
<<<<<<< Updated upstream
                <p class="welcome">${member.username}</p>
=======
                <p class="welcome">${member.userName}</p>
                <%
	            	if(session.getAttribute("privelege").equals("1") || session.getAttribute("privelege").equals("2")){
	            		%>
	            			<a href="admin">deneme</a>
	            		<%
	            	}

                %>
>>>>>>> Stashed changes
                <p class="logout"><a id="exit" href="logout">Exit Chat</a></p>
            </div>
 
            <div id="chatbox"></div>
 
            <div>
                <input id="usermsg" type="text" name="usermsg"/>
                <input id="submitmsg" type="submit" name="submitmsg" onclick="sendMessage()" value="Send" />
            </div>
        </div>
        
        <script>
        		var WsUrl = "ws://localhost:8080/ArkadasAramaSitesi/chat";
        		websocket = new WebSocket(WsUrl);
        		
        		websocket.onmessage = function processMessage(usermsg){
        			document.getElementById("chatbox").innerHTML += "${member.username}:" + " " + usermsg.data + "<br/>";
        		};
        		
        		function sendMessage(){
        			websocket.send(usermsg.value);
        			usermsg.value = "";
        		}
        		
        </script>
</body>
</html>