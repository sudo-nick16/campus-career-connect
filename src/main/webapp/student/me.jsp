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
  if(student == null){
    response.sendRedirect("../");
    return;
  }
%>
<div  class="container flex flex-col items-center">
  <%@include file="dashboardNav.jsp" %>
  <form action="update" method="post" class="flex flex-col items-center">
    <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto mt-14">
      <label for="name">Name</label>
      <input id="name" value="<%=student.name%>" readonly>
      <label for="clg-email">College Email</label>
      <input id="clg-email" value="<%=student.email%>" readonly>
      <label for="reg-id">Register id</label>
      <input id="reg-id" value="<%=student.regId%>" readonly>
      <label for="branch">Branch</label>
      <input id="branch" name="branch" value="<%=student.branch%>">
      <label for="resume">Resume</label>
      <input id="resume" name="resume" value="<%=student.resume%>">
      <label for="cgpa">Cgpa</label>
      <input id="cgpa" name="cgpa" value="<%=student.cgpa%>">
    </div>
    <button class="btn-flare mt-12">
      Update Profile
    </button>
  </form>
</div>
</body>
<%@include file="../shared/style.jsp" %>
</html>
