<%@ page import="com.sudonick.campuscareerconnect.models.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form method="post" action="login" class="container flex flex-col items-center fcenter">
  <div class="grid grid-cols-2 w-[400px] gap-4 mx-auto">
    <label for="reg-id">Register id</label>
    <input id="reg-id" name="regId" required>
    <label for="password">Password</label>
    <input id="password" type="password" name="password" required>
  </div>
  <button class="btn-flare mt-12">
    Login
  </button>
</form>

</body>
<%@include file="../shared/style.jsp" %>
</html>


