<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 11:05 PM
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
<div class="container">
    <%@include file="dashboardNav.jsp" %>
    <div class="w-full table grid grid-cols-5 gap-0 mx-auto text-yellow font-semibold">
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-2">Name</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Email</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Salary</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Details</h4>

        <p class="col-span-2 truncate">Google</p>
        <a href="#">Google</a>
        <p>50 lpa</p>
        <a href="details.jsp"><button class="">Show</button></a>

    </div>

</div>

</body>
<%@include file="../shared/style.jsp" %>
</html>
