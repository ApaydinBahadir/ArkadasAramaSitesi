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
			<table id="memberBox">
				
						<%
						try
						{
<<<<<<< Updated upstream
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newschema", "root", "12345");

=======
							
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "12345");
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
								"</tr>"+
=======
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
			<label><b>Send message</b></label>
				<form action='message.jsp' method='post'>
					<input type="text" placeholder="UserName" name="userName"/>
					<input type="text" placeholder="Mesaj" name="message" />
					<button id="btnsendmsg">Send</button>
				</form>
			</div>
			
			


			<div id="friendsBox">
			<label><b>Add to friends</b></label>
				<form action='friends.jsp' method='post'>
				
					<input type="hidden" name="userId" value= "${member.userID}" />
					<input type="text" placeholder="AddFriend" name="userName"/>
					
					<input type="checkbox" name="relationType" value="friend">Friend
					<input type="checkbox" name="relationType" value="dear">Dear
					<input type="checkbox" name="relationType" value="flirt">Flirt
					<button id="addfriends">Add</button>
				</form>
			</div>

		</div>



		<div id="friendsView">
			<form action='friendsView.jsp' method='post'>
				<input type="hidden" name="userId" value= "${member.userID}" />
				<button>Friends List</button>
			</form>
     	</div>
     	
     	
     	<div id="friendsDelete">
			<form action='friendsDelete.jsp' method='post'>
				<input type="text" placeholder="DeleteFriend" name="userName" />
				<button id="deletefriends">Delete</button>
			</form>
     	</div>



		
		<div id="messageView">
		<label><b>Email box</b></label>
        	<table>
        	
        	<%
						try
						{
						
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "12345");
						String sql = "SELECT sender,message FROM message WHERE userName = ?";
						PreparedStatement statement = conn.prepareStatement(sql);
				        statement.setString(1, (String)request.getSession().getAttribute("userName"));
				        ResultSet rs=statement.executeQuery();
					
						while(rs.next())
						{
							
						out.println(
>>>>>>> Stashed changes
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

                <p class="welcome">${member.userName}</p>
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
        		
        		
<<<<<<< Updated upstream
=======
        	
    			document.getElementById("btnsendmsg")
                		.onclick = function(){
                         	window.setTimeout(function(){location.href = 'home.jsp';}, 50);                 
                         };
                         
                 
              	document.getElementById("addfriends")
              			.onclick = function(){
              				window.alert("Friend Added");
              				window.setTimeout(function(){location.href = 'home.jsp';}, 50);                 
            	};
            	
            	
            	document.getElementById("deletefriends")
        		.onclick = function(){
            		window.alert("Friend Deleted");
                 	window.setTimeout(function(){location.href = 'home.jsp';}, 50);                 
                 };
        	
           </script>
>>>>>>> Stashed changes
        		
        		
        </script>
</body>
</html>