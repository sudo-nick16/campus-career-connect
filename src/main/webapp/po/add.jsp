<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Campus Career Connect</title>
    <%@include file="../shared/head.jsp" %>
</head>
<body>
<%@include file="../shared/navbar.jsp" %>
<%
    if(officer == null){
        response.sendRedirect("../");
        return;
    }
%>
<div  class="container flex flex-col items-center">
    <%@include file="dashboardNav.jsp" %>
    <form action="company" method="post" class="flex flex-col items-center">
        <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto mt-14">
            <label for="name">Name</label>
            <input id="name" name="name" required>
            <label for="website">Website</label>
            <input id="website" name="website">
            <label for="salary">Salary</label>
            <input id="salary" name="salary">
            <label for="venue">Venue</label>
            <input id="venue" name="venue">
            <label for="date-time">Date & Time</label>
            <input id="date-time" style="color-scheme: dark" name="date-time" type="datetime-local" >
        </div>
        <button class="btn-flare mt-12">
            Add
        </button>
    </form>
</div>
</body>
<%@include file="../shared/style.jsp" %>
</html>
