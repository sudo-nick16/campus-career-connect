<%@ page import="com.sudonick.campuscareerconnect.models.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.CompanyRepo" %>
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
    List<Company> companies = new CompanyRepo().getCompanies();
    if(companies == null){
        companies = new ArrayList<>();
    }
%>
    <div class="container">
        <%@include file="dashboardNav.jsp" %>
        <div class="w-full table grid grid-cols-5 gap-0 mx-auto text-yellow font-semibold">
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-2">Comapany Name</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Website</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Salary</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Apply</h4>

            <% if(!companies.isEmpty()){
                for(Company c: companies){%>
                    <p class="col-span-2 truncate"><%=c.name%></p>
                    <a href="<%=c.site%>" target="_blank" class="hover:underline overflow-hidden truncate"><%=c.site%></a>
                    <p><%=c.salary%></p>
                    <a href="../application?cid=<%=c.id%>"><button class="">Apply</button></a>
                <%}}%>

        </div>

    </div>

</body>
<%@include file="../shared/style.jsp" %>
</html>

