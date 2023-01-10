<%@ page import="com.sudonick.campuscareerconnect.repository.StudentRepo" %><%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/10/23
  Time: 7:02 AM
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
    Student s = null;
    try {
        int sid = Integer.parseInt(request.getParameter("sid"));
        System.out.println("sid:a "+ sid);
        s = new StudentRepo().getStudentById(sid);
        System.out.println("User: "+ s);
        if(s == null){
            response.sendRedirect("dashboard.jsp");
            return;
        }
    }catch (Exception e){
        System.out.println(e);
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<div  class="container flex flex-col items-center">
    <%@include file="dashboardNav.jsp" %>
    <div class="flex flex-col items-center">
        <div class="grid grid-cols-2 w-[500px] gap-4 mx-auto mt-14">
            <label for="name">Name</label>
            <input id="name" value="<%=s.name%>" readonly>
            <label for="clg-email">College Email</label>
            <a name="clg-email" href="mailto:<%=s.email%>" target="_blank" class="w-full text-yellow font-bold w-full border-b-1 pt-1">
                <%=s.email%>
            </a>
            <label for="reg-id">Register id</label>
            <input id="reg-id" value="<%=s.regId%>" readonly>
            <label for="branch">Branch</label>
            <input id="branch" name="branch" value="<%=s.branch%>" readonly>
            <label for="resume">Resume</label>
            <a name="resume" href="<%=s.resume%>" target="_blank" class="text-yellow font-bold w-full border-b-1 hover:underline underline-offset-4 pt-1">
                    See Resume
            </a>
            <label for="cgpa">Cgpa</label>
            <input id="cgpa" name="cgpa" value="<%=s.cgpa%>" readonly>
        </div>
    </div>
</div>
</body>
<%@include file="../shared/style.jsp" %>
</html>
