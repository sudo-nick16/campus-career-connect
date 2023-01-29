<%@ page import="com.sudonick.campuscareerconnect.models.Company" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.ApplicationRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sudonick.campuscareerconnect.repository.CompanyRepo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
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
    if(officer == null){
        response.sendRedirect("../");
        return;
    }
    List<PlacedObject<Student>> students = new ArrayList<>();
    String studentsJson = "";
    Company company = null;
    try{
        int cid = Integer.parseInt(request.getParameter("cid"));
        company = new CompanyRepo().getCompanyById(cid);
        students = new ApplicationRepo().getStudentsByCompanyId(cid, true);
        System.out.println("students" + students);
        if(company == null){
            response.sendRedirect("../");
            return;
        }
        if(students == null){
            students = new ArrayList<>();
        }
        Gson gson = new Gson();
        studentsJson = gson.toJson(students);
    }catch (Exception e){
        System.out.println(e);
    }
%>
<div class="container">
    <%@include file="dashboardNav.jsp" %>
    <div class="flex items-center justify-between text-yellow font-bold px-3 py-3 border border-yellow text-xl">
        <div class="center">
            Company name: <h2 class="mx-2"><%=company.name%></h2>
        </div>
        <%if(!students.isEmpty()){%>
            <button onclick="studentsToCsv()">
                Generate CSV
            </button>
        <%}%>
    </div>
    <div class="w-full table grid grid-cols-5 gap-0 mx-auto text-yellow font-semibold">
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-1">Name</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow col-span-1">Email</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">CGPA</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Profile</h4>
        <h4 class="font-bold border border-yellow p-2 text-xl text-yellow">Place</h4>

        <% if(!students.isEmpty()){%>
            <%for(PlacedObject<Student> s: students){%>
                <p class="col-span-1 truncate"><%=s.object.name%></p>
                <a href="mailto:<%=s.object.email%>" class="hover:underline col-span-1 overflow-hidden truncate"><%=s.object.email%></a>
                <p><%=s.object.cgpa%></p>
                <a href="student.jsp?sid=<%=s.object.id%>"><button class="">Show</button></a>
                <form action="place?aid=<%=s.appId%>&cid=<%=company.id%>" method="post" class="w-full h-full">
                    <%if( s.placed ){ %>
                        <button
                                class="bg-green text-black"
                                onclick="<%if(s.placed){%>alert('Student already placed.'); return;<%}%> return confirm('This student will be placed, this action cannot be undone in future.')"
                        >Placed</button>
                    <%}else{ %>
                        <button class="bg-red text-black">Place</button>
                    <%} %>
                </form>
        <%}}%>

    </div>

</div>

</body>
<script>
    const data = <%=studentsJson%>;
    const filename = "<%=company.name%>.csv";

    const download = (blob, filename) => {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
        a.remove();
        URL.revokeObjectURL(url);
    };

    function transformStudents(students){
        return students.map(function(curr, i){
            const s = curr.object;
            return {
                Sno: i+1,
                Name: s.name,
                "Register id": s.regId,
                Email: s.email,
                Branch: s.branch,
                Cgpa: s.cgpa,
                Resume: s.resume,
                Placed: curr.placed? "Yes": "No"
            }
        })
    }

    function studentsToCsv(){
        const students = transformStudents(data);
        console.log("final data", students)
        const replacer = (key, value) => value === null ? '' : value;
        const header = Object.keys(students[0]);
        let csv = students.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','));
        csv.unshift(header.join(','));
        let csvArray = csv.join('\r\n');
        let blob = new Blob([csvArray], { type: 'text/csv' });
        download(blob, filename);
    }
    console.log(data)
</script>
<%@include file="../shared/style.jsp" %>
</html>
