
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="objectify.Greeting" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.*" %>

<%@ page language="java" contentType="html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

 <head>
 <!-- Add JQuery to project -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 
  <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
 </head>

  <body class='body2'>

	<div id='container_entry' style='margin:auto;'>
	
  <div style='font-weight:300; text-align:left;'><h1>
    Need to vent?</h1>
    Write about your <span style='color:rgb(171,6,68);'>day</span>.
    <br>
    Your <span style='color:rgb(171,6,68);'>dreams</span>.
    <br>
    That <span style='color:rgb(171,6,68);'>girl from the other day</span>.
    <br></div>
    <b>Let it all out.</b>
  

	<% String guestbookName = request.getParameter("guestbookName");

    if (guestbookName == null) {

        guestbookName = "default";
    }

    pageContext.setAttribute("guestbookName", guestbookName);

    UserService userService = UserServiceFactory.getUserService();

    User user = userService.getCurrentUser();

 
	  
      pageContext.setAttribute("user", user);
      
   %>

<%-- <p><div id='hello_1'>Hello, ${fn:escapeXml(user.nickname)}! (You can

<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p></div> --%>

<p>Title For Posts</p>

<%
	// View greetings
	ObjectifyService.register(Greeting.class);

	List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();   

	Collections.sort(greetings); 
	
    if (greetings.isEmpty()) {

        %>

        <p>Guestbook '${fn:escapeXml(guestbookName)}' has no messages.</p>

        <%

    } else {

        for (Greeting greeting : greetings) {

            pageContext.setAttribute("greeting_content", greeting.getContent());

            if (greeting.getUser() == null) {

                %>

                <p>An anonymous person wrote:</p>

                <%

            } else {

                pageContext.setAttribute("greeting_user", greeting.getUser());

                %>

                <%-- <p><b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:</p> --%>

                <%

            }

            %>

           <%--  <blockquote>${fn:escapeXml(greeting_content)}</blockquote> --%>

            <%

        }

    }
    
%>

    <form action="/ofysign" method="post">

      <div><textarea name="content" rows="3" cols="60"></textarea></div>

      <div><input type="submit" value="Submit An Entry" /></div>
       <a href="ofyguestbook.jsp" style='text-decoration:none; color:#DF0174;'><strong>
		Cancel Post </strong></a>
      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>

    </form>

 
	</div>
  </body>

</html>