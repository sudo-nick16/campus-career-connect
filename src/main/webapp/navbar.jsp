<%@ page import="com.sudonick.campuscareerconnect.models.Student" %>
<%@ page import="com.sudonick.campuscareerconnect.models.PO" %>
<%
    String role = (String) request.getSession().getAttribute("role");
    Student student = null;
    PO officer = null;
    if(role == "student"){
        student = (Student) request.getSession().getAttribute("user");
    }else if(role == "po"){
        officer = (PO) request.getSession().getAttribute("user");
    }
%>
<div class="w-full flex items-center justify-between px-4 h-16 bg-darkblue shadow-[0_4px_5px_0_rgba(0,0,0,0.7)]">
    <a href="" class="mx-4">
        <img src="images/logo.png" class="w-auto h-12" alt="campus-career-connect">
    </a>
    <%if (student != null || officer != null){ %>
    <div class="flex item-center justify-center">
        <h1 class="text-yellow font-bold mx-2 text-2xl">
            <%=student != null? student.name: ""%>
            <%=officer != null? officer.name: ""%>
        </h1>
        <a href="auth/logout">
            <img class="w-8 h-8 mx-2" src="images/switch.png" alt="logout">
        </a>
    </div>
    <%} %>
</div>