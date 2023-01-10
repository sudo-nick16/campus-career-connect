<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w-full flex flex-row items-center justify-center my-5">
    <a href="accounts.jsp">
        <button class="mx-4" id="accounts">
            All PO accounts
        </button>
    </a>
    <a href="add.jsp">
        <button class="mx-4" id="add">
            Add PO
        </button>
    </a>
</div>
<script>
    const pathMap = {
        "accounts.jsp": "accounts",
        "add.jsp": "add",
    }
    const paths = window.location.pathname.split("/");
    const currPage = paths[paths.length - 1];
    const btn = document.getElementById(pathMap[currPage]);
    btn.classList.add("selected");
</script>