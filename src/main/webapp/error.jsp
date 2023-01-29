<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/10/23
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Campus Career Connect</title>
    <link rel="icon" href="images/logo.png">
    <%@include file="shared/head.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<%
    String error = null;
    String lastPage = null;
    try{
        error = (String) request.getSession().getAttribute("error");
        if (error == null){
            response.sendRedirect("index.jsp");
            return;
        }
        request.getSession().setAttribute("error", null);
        lastPage = (String) request.getSession().getAttribute("lastPage");
        if(lastPage == null){
            lastPage = request.getContextPath();
        }
    }catch (Exception e){
        System.out.println(e);
    }
%>

<div class="container fcenter">
    <div class="flex mt-16 flex-col items-center justify-evenly">
        <h1 class="text-white h-flare relative font-black text-[60px] leading-tight">
            OOPS
        </h1>
        <img src="images/warning.png" class="w-60 h-auto" alt="goal">
    </div>
    <div class="flex flex-col items-center justify-center mt-8">
        <div class="font-bold text-3xl text-white w-[600px] flex flex-wrap justify-center items-center">
            <%
                int index = 0;
                for(String e: error.split(" ")){
                    if(index%2 == 0){
            %>
                <span class="text-white"><%=e%>&nbsp;</span>
            <%}else{%>
                <span class="text-yellow"><%=e%>&nbsp;</span>
            <%}; index++;}%>
        </div>
        <div class="flex flex-row mt-8">
            <a class="" href="<%=lastPage%>">
                <button class="mx-4 btn-flare">
                    Go back
                </button>
            </a>
        </div>
    </div>
</div>
</body>
<%@include file="shared/style.jsp" %>
</html>