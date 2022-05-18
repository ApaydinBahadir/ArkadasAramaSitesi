<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet,java.sql.Statement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Homestyle.css" />
<title>home</title>
</head>
<body>
			
		<div id="memberBox">
			<table>
				
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
								"</tr>"
									);
						}
						
						}catch(Exception e)
						{
						System.err.println(e);
						}
						%>	
			</table>
			
			<div id="messageBox">
				<form action='message.jsp' method='post'>
					<input type="text" placeholder="UserName" name="userName"/>
					<input type="text" placeholder="Mesaj" name="message" />
					<button>Send</button>
				</form>
			</div>
			
		</div>


		
		<div id="messageView">
        	<table>
        	
        	<%
						try
						{
						
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newschema", "root", "12345");
						
						String sql = "SELECT sender,message FROM message WHERE userName = ?";

						PreparedStatement statement = conn.prepareStatement(sql);
				        statement.setString(1, (String)request.getSession().getAttribute("userName"));

						
						
						ResultSet rs=statement.executeQuery();
					
						while(rs.next())
						{
							
						out.println(
								"<tr>"+
									"<td>"+
										"<mark>"+rs.getString("sender")+"</mark>"+
									"</td>"+
									"<td>"+
										"<b>"+rs.getString("message")+"</b>"+
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
        </div>
		


		<div id="wrapper">
            <div id="menu">

                <p class="welcome">${member.userName}</p>
                <%
	            	if(session.getAttribute("privelege").equals("1") || session.getAttribute("privelege").equals("2")){
	            		%>
	            			<a href="admin">deneme</a>
	            		<%
	            	}
                %>

                
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
        			document.getElementById("chatbox").innerHTML +=  usermsg.data + "<br/>";
        		};
        		
        		
        		function sendMessage(){
        			websocket.send("<mark>"+"${member.userName}"+"</mark>" + ":" + "<b>"+ usermsg.value +"</b>");
        			usermsg.value = "";
        		}
        		
        	
        		
        		
        		
        </script>
</body>
</html>