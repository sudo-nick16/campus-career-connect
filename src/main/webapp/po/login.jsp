<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 8:51 PM
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
  if(officer != null){
    response.sendRedirect("dashboard.jsp");
    return;
  }
%>
<form method="post" action="login" class="container flex flex-col items-center fcenter">
  <div class="grid grid-cols-2 w-[400px] gap-4 mx-auto">
    <label for="email">Email</label>
    <input id="email" name="email" type="email" required>
    <label for="password">Password</label>
    <input id="password" name="password" type="password" required>
  </div>
  <button class="btn-flare mt-12">
    Login
  </button>
</form>

</body>
<%@include file="../shared/style.jsp" %>
</html>


