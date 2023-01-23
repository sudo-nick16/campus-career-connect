<%@ page import="com.sudonick.campuscareerconnect.models.Company" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.CompanyRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Company> companies = new CompanyRepo().getCompanies();
    if (companies == null){
        companies = new ArrayList<>();
    }
%>

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
    <div class="container">
        <%@include file="dashboardNav.jsp" %>
        <div class="w-full table grid grid-cols-6 gap-0 mx-auto text-yellow font-semibold">
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Comapany Name</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Website</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Salary</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Venue</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Timings</h4>
            <h4 class="font-bold border border-yellow p-2 text-xl text-yellow"></h4>

            <% if(!companies.isEmpty()){
                for(Company c: companies){%>
                    <p class="truncate overflow-hidden"><%=c.name%></p>
                    <a href="<%=c.site%>" target="_blank" class="hover:underline overflow-hidden truncate"><%=c.site%></a>
                    <p><%=c.salary%></p>
                    <p><%=c.venue%></p>
                    <input name="datetime" type="datetime-local" readonly class="text-sm text-center" value="<%=String.join(":",Arrays.copyOfRange(c.date.toString().split(":"), 0, 2))%>">
                    <form class="h-full w-full flex items-center justify-evenly">
                        <input name="cid" value="<%=c.id%>" hidden="hidden">
                        <abbr title="Show details">
                            <button formmethod="get" formaction="details.jsp" class="mr-4 px-2">
                                <img src="../images/list.png" class="w-6 h-6">
                            </button>
                        </abbr>
                        <abbr title="Delete">
                            <button
                                    onclick="return confirm('All applications for this company will be deleted. Do you wish to continue?')"
                                    formaction="company"
                                    formmethod=""
                                    content="blah"
                                    class="ml-1 px-2"
                            >
                                <img src="../images/recycle-bin.png" class="w-6 h-6">
                            </button>
                        </abbr>

                    </form>
            <%}}%>

        </div>

    </div>

</body>
<%@include file="../shared/style.jsp" %>
</html>

