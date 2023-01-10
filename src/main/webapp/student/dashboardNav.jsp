<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w-full flex flex-row items-center justify-center my-5">
    <a href="me.jsp">
        <button class="mx-4" id="me.jsp">
            My Profile
        </button>
    </a>
    <a href="dashboard.jsp">
        <button class="mx-4" id="dashboard.jsp">
            Opportunities
        </button>
    </a>
    <a href="applications.jsp">
        <button class="mx-4" id="applications.jsp">
            Applied to
        </button>
    </a>
</div>
<script>
    const paths = window.location.pathname.split("/");
    const currPage = paths[paths.length - 1];
    const btn = document.getElementById(currPage);
    btn.classList.add("selected");
</script>