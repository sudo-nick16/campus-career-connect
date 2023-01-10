<%@ page import="com.sudonick.campuscareerconnect.models.Student" %>
<%@ page import="com.sudonick.campuscareerconnect.models.PO" %><%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 9:18 PM
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
<div class="container flex flex-col items-center">
  <%@include file="dashboardNav.jsp" %>
  <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto mt-14">
    <label for="name">Name</label>
    <input id="name" value="<%=officer.name%>" readonly>
    <label for="email">Email</label>
    <input id="email" value="<%=officer.email%>" readonly>
  </div>
</div>
</body>
<%@include file="../shared/style.jsp" %>
</html>
