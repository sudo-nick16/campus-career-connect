<%@ page import="com.sudonick.campuscareerconnect.models.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.ApplicationRepo" %>
<%@ page import="java.util.ArrayList" %>
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
    List<Company> applications = new ApplicationRepo().getCompaniesByStudentId(student.id);
    if (applications == null){
        applications = new ArrayList<>();
    }
%>
<div class="container">
    <%@include file="dashboardNav.jsp" %>
    <div class="w-full table grid grid-cols-4 gap-0 mx-auto text-yellow font-semibold">
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-2">Comapany Name</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Website</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Salary</h4>

        <% if(!applications.isEmpty()){%>
            <%for(Company c: applications){%>
                <p class="col-span-2 truncate"><%=c.name%></p>
                <a href="<%=c.site%>" target="_blank" class="hover:underline"><%=c.site%></a>
                <p><%=c.salary%></p>
        <%}}%>

    </div>

</div>

</body>
<%@include file="../shared/style.jsp" %>
</html>
