<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="objectify.Greeting" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.*" %>


<html>

 <head>
 <!-- Add JQuery to project -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 
   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
   
  <!-- Typed.js for dynamic text -->
	<script src="/js/typed.min.js"></script>
	<script>
	  $(function(){
	      $(".element").typed({
	        strings: ["DREAMERS. ^2000",
	                  "THINKERS. ^2000",
	                  "DO-ERS. ^2000",
	                  "JUNIOR DEVS. ^2000",
	                  "LATE NIGHT WARRIORS. ^2000",
	                  "461L STUDENTS. ^2000"],
	        typeSpeed: 0
	      });
	  });
	</script>
 </head>
	
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->
	<!-- [COMPONENT]: BODY -->

  <body class='body1'>
  	
  	<!-- [COMPONENT] LOG IN -->
	<!-- [COMPONENT] LOG IN -->
	<!-- [COMPONENT] LOG IN -->
	<!-- [COMPONENT] LOG IN -->
	
	 <%
		String guestbookName = request.getParameter("guestbookName");
		
		    if (guestbookName == null) {
		
		        guestbookName = "default";
		
		    }
		
		    pageContext.setAttribute("guestbookName", guestbookName);
		
		    UserService userService = UserServiceFactory.getUserService();
		
		    User user = userService.getCurrentUser();
		
		    if (user != null) {
			  
		      pageContext.setAttribute("user", user);
		      
		   %>
		  
  	<!-- NAVIGATION -->
  	<!-- NAVIGATION -->
  	<!-- NAVIGATION -->
 
  	<div class='nav'>
  	
		<p style='text-transform: uppercase;'>USER: <strong>${fn:escapeXml(user.nickname)}</strong> 
		(<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>" style='text-decoration: none; color: #DF0174;'><b>LOG OUT</b></a>)</p>
	
	</div>
		<%
		
		    } else {
		
		%>
		<div class='nav'>
		<strong>
		<p style='text-transform: uppercase;'>
		Please  
		<a href="<%= userService.createLoginURL(request.getRequestURI()) %>" style='text-decoration: none; color: #DF0174;'>
		Log in.
		</a>
		</p>
		</strong>
		</div>
		<%
		
		    }
		
		%>
  	
  	<!-- BODY DIV -->
	 
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  <!-- [COMPONENT: STARTING OF MAIN DIV] -->
  
  <!-- LOGO -->
  <div style="max-width:85%;margin:auto;height:100vh;padding-top:8vh;">
  
  <span id='message_1'>WE ARE  
  <b><span class="element"></span></b></span>
  <br>
  <br>
  <img src="/images/BlogLogo.png">
  
	<br>
	<br>
	<a id='b1'class='message' style='text-decoration: none;'>
		HEAR OUR STORY
	</a>
	</div>
  
  	<!-- CONTINUE THROUGH MAIN DIV -->
	<!-- CONTINUE THROUGH MAIN DIV -->
	<!-- CONTINUE THROUGH MAIN DIV -->
	<!-- CONTINUE THROUGH MAIN DIV -->
	
	<div id='container_main'>
	
	<br>
	
<%
	// View greetings
	ObjectifyService.register(Greeting.class);
	List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
	Collections.sort(greetings);
    if (greetings.isEmpty()) {

        %>

        <p>Whoops! There seems to be no blog entries at the moment.</p>
        <!-- '${fn:escapeXml(guestbookName)}'.</p> -->

        <%

    } else {

        %>

        <p>Messages in Guestbook '${fn:escapeXml(guestbookName)}'.</p>

        <%
		
        //	Test
        //greetings.clear();
        for (Greeting greeting : greetings) {

            pageContext.setAttribute("greeting_content", greeting.getContent());

            if (greeting.getUser() == null) {

                %>

                <p>An anonymous person wrote:</p>

                <%

            } else {

                pageContext.setAttribute("greeting_user", greeting.getUser());

                %>

                <p><b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:</p>

                <%

            }

            %>

            <blockquote>${fn:escapeXml(greeting_content)}</blockquote>

            <%

        }

    }

%>

    <form action="/ofysign" method="post" style='background:black;'>
		<a href="entry.jsp" style='text-decoration:none;' class='message'><strong>
		Submit a Post</strong></a>
      <!-- <div><textarea name="content" rows="3" cols="60"></textarea></div>

      <div><input type="submit" value="Submit An Entry" /></div> -->

      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>

    </form>

	</div>
  </body>

</html>