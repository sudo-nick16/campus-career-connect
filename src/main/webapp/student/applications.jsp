<%@ page import="com.sudonick.campuscareerconnect.models.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.ApplicationRepo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sudonick.campuscareerconnect.models.PlacedObject" %>
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
    List<PlacedObject<Company>> applications = new ApplicationRepo().getCompaniesByStudentId(student.id, true);
    if (applications == null){
        applications = new ArrayList<>();
    }
%>
<div class="container">
    <%@include file="dashboardNav.jsp" %>
    <div class="w-full table grid grid-cols-4 gap-0 mx-auto text-yellow font-semibold">
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-1">Comapany Name</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Website</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Salary</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Status</h4>

        <% if(!applications.isEmpty()){%>
            <%for(PlacedObject<Company> c: applications){%>
                <p class="col-span-1 truncate"><%=c.object.name%></p>
                <a href="<%=c.object.site%>" target="_blank" class="hover:underline"><%=c.object.site%></a>
                <p><%=c.object.salary%></p>
                <p>
                <%if(c.placed){%>
                    Placed
                <%} else if(c.object.date.getTime() > System.currentTimeMillis()){%>
                    Yet to have test/interview
                <%} else {%>
                    In process
                <%}%>
                </p>
        <%}}%>

    </div>

</div>

</body>
<%@include file="../shared/style.jsp" %>
</html>
