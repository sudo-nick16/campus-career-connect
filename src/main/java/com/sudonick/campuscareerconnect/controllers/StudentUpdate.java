package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.repository.StudentRepo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.server.ExportException;
import java.util.Arrays;

@WebServlet(name = "student/update", value = "/student/update")
public class StudentUpdate extends HttpServlet {
    private StudentRepo repo = new StudentRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try{
            Student student = (Student) request.getSession().getAttribute("user");
            if(student == null){
                throw new Exception("You're not logged in.");
            }

            Student s = new Student(student);
            String branch = request.getParameter("branch").trim();
            if(branch != null){
                s.branch = branch;
            }
            String resume = request.getParameter("resume").trim();
            if(resume != null){
                s.resume = resume;
            }
            Float cgpa = Float.valueOf(request.getParameter("cgpa").trim());
            if(cgpa != null){
                s.cgpa = cgpa;
            }

            System.out.println("Current Page: "+ request.getContextPath());
            System.out.println("Current Page: "+ request.getRequestURI());
            System.out.println("Current student: "+student+"\n New student: "+s);

            if(s.cgpa < 0 || s.cgpa > 10 ){
                throw new Exception("Cgpa must be in inclusive range of 0 and 10.");
            }

            s = this.repo.updateStudentById(s);

            if (s != null){
                request.getSession().setAttribute("user", s);
                request.getSession().setAttribute("role", "student");
                response.sendRedirect("me.jsp");
            }else {
                throw new Exception("Couldn't update user.");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }
}
