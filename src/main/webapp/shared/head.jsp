<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 2:50 AM
  To change this template use File | Settings | File Templates.
--%>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="icon" href="../images/logo.png">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    blue: '#000C24',
                    darkblue: '#000C22',
                    yellow: '#FFC700',
                    orange: '#FF9900',
                    green: '#3B7A57',
                    red: '#FF2400',
                }
            }
        }
    }
</script>
<%
    if(request.getRequestURI().endsWith(".jsp") && !request.getRequestURI().endsWith("error.jsp")){
        String queryString = request.getQueryString() == null? "" : "?"+request.getQueryString();
        request.getSession().setAttribute("lastPage", request.getRequestURI()+queryString);
    }
    System.out.println("LastPath: "+ request.getSession().getAttribute("lastPage"));
%>