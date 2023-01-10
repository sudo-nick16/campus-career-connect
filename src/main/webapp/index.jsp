<%@ page import="com.sudonick.campuscareerconnect.models.Student" %>
<%@ page import="com.sudonick.campuscareerconnect.models.PO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Campus Career Connect</title>
    <link rel="icon" href="images/logo.png">
    <%@include file="shared/head.jsp" %>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <div class="container fcenter">
        <div class="flex mt-16 flex-row justify-evenly">
            <h1 class="text-white h-flare relative font-black text-[60px] leading-tight">
                Let your <span class="text-yellow">campus</span> <br>
                <span class="text-yellow">connect</span> you to the<br>
                right <span class="text-yellow">career</span> path.
            </h1>
            <img src="images/bullseye.png" class="w-60 h-auto" alt="goal">
        </div>
        <div class="flex flex-col items-center justify-center mt-20">
            <h2 class="flex flex-row font-bold text-3xl text-white">
                <span class="text-yellow">Explore</span>&nbsp;based on your&nbsp;<span class="text-yellow">role</span>
            </h2>
            <div class="flex flex-row mt-8">
                <a href="po">
                    <button class="mx-4 btn-flare">
                        I am a PO
                    </button>
                </a>
                <a href="student">
                    <button class="mx-4 btn-flare">
                        I am a Student
                    </button>
                </a>
            </div>
        </div>
    </div>
</body>
<style>

</style>
<%@include file="shared/style.jsp" %>
</html>