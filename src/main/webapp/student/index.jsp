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
    <div class="container flex flex-col justify-center fcenter">
        <h1 class="h-flare relative font-black text-white text-[60px] w-full text-center px-32">
            You <span class="text-yellow">students</span> are the <br>
            <span class="text-yellow">future</span> of this <span class="text-yellow">campus</span>.
        </h1>
        <h2 class="font-bold text-white text-2xl mt-6 text-center">
            Let's <span class="text-yellow">achieve</span> great <span class="text-yellow">heights</span>.
        </h2>
        <div class="w-fit mx-auto mt-8">
            <a href="login.jsp">
                <button class="mx-4 btn-flare">
                    Login
                </button>
            </a>
            <a href="register.jsp">
                <button class="mx-4 btn-flare">
                    Register
                </button>
            </a>
        </div>
    </div>

</body>
<%@include file="../shared/style.jsp" %>
</html>
