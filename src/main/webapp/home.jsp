<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Homestyle.css" />
<title>home</title>
</head>
<body>

<div id="wrapper">
            <div id="menu">
                <p class="welcome">Welcome, <b></b></p>
                <p class="logout"><a id="exit" href="logout">Exit Chat</a></p>
            </div>
 
            <div id="chatbox"></div>
 
            <form action="">
                <input id="usermsg" type="text" name="usermsg"/>
                <input id="submitmsg" type="submit" name="submitmsg" onclick="sendMessage()" value="Send" />
            </form>
        </div>
        
        <script>
        		var WsUrl = "ws://localhost:8080/ArkadasAramaSitesi/chat";
        		websocket = new WebSocket(WsUrl);
        		
        		websocket.onmessage = function processMessage(usermsg){
        			//chatbox.value += usermsg.data + "n";
        			document.getElementById("chatbox").innerHTML = usermsg.data;
        		};
        		
        		function sendMessage(){
        			websocket.send(usermsg.value);
        			usermsg.value = "";
        		}
        		
        </script>
</body>
</html>