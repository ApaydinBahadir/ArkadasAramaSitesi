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
 
            <form name="message" action="">
                <input id="usermsg" type="text" name="usermsg"/>
                <input id="submitmsg" type="submit" name="submitmsg" value="Send" />
            </form>
        </div>
         <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script type="text/javascript">
             // jQuery Document
             $(document).ready(function () {});
         </script>

</body>
</html>