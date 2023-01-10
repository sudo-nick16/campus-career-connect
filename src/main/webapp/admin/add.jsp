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
<%@include file="navbar.jsp" %>
<div class="container flex flex-col items-center">
    <%@include file="dashboardNav.jsp" %>
    <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto mt-14">
        <label for="name">Name</label>
        <input id="name" required>
        <label for="email">Email</label>
        <input id="email" required>
        <label for="password">Password</label>
        <input id="password" required>
    </div>
    <a href="/api/company">
        <button class="btn-flare mt-12">
            Add
        </button>
    </a>
</div>
</body>
<%@include file="../shared/style.jsp" %>
</html>
