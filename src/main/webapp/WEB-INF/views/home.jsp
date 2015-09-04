<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery-1.9.0-min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.atmosphere-min.js"/>"></script>
	<script>
	    var request = {
			url: '/atmosphereServlet/chat',
			logLevel : 'debug',
			transport : "websocket",
			fallbackTransport: 'long-polling'
		};
	    
		request.onMessage = function (response) {
			console.log("onMessage: " + response.responseBody);
			alert(response.responseBody);
		};
		
		request.onError = function(response) {
			console.log("onError: " + response.responseBody);
		};
		
		request.onOpen = function(response) {
			console.log("onOpen: " + response.responseBody);
		};
		
		var socket = $.atmosphere.subscribe(request);
	</script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<script>
	$( "p" ).click(function() {
		socket.push("Hello");
	});
</script>
</body>
</html>
