<%@ page import="com.sudonick.campuscareerconnect.models.Student" %>
<%@ page import="com.sudonick.campuscareerconnect.models.PO" %><%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 8:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<html>
<head>
    <title>Campus Career Connect</title>
    <%@include file="../shared/head.jsp" %>
</head>
<body>
<%@include file="../shared/navbar.jsp" %>
<%
    if(student != null){
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
    <form action="register" method="post" class="container flex flex-col items-center fcenter">
        <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto">
            <label for="name">Name</label>
            <input id="name" name="name" required>
            <label for="clg-email">College Email</label>
            <input type="email" id="clg-email" name="email" required>
            <label for="reg-id">Register id</label>
            <input id="reg-id" minlength="10" maxlength="10" name="regId" required>
            <label for="password">Password</label>
            <input id="password" minlength="8" name="password" type="password" required>
        </div>
        <button class="btn btn-flare mt-12">
            Register
        </button>
    </form>
</body>
<%@include file="../shared/style.jsp" %>
</html>
