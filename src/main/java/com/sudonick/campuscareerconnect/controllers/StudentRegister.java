package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.repository.StudentRepo;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "student/register", value = "/student/register")
public class StudentRegister extends HttpServlet {

    private StudentRepo repo = new StudentRepo();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getContextPath();

        try{
            String regId = request.getParameter("regId").trim();
            String name = request.getParameter("name").trim();
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();

            if(regId.length() == 0 || name.length() == 0 || email.length() == 0 || password.length() == 0){
                throw new Exception("Missing details..");
            }
            if(password.length() < 8 ){
                throw new Exception("Password should contain at least 8 characters.");
            }
            Student t = this.repo.getStudentByRegId(regId);
            if(t != null){
                throw new Exception("Register Id already exists.");
            }
            t = this.repo.getStudentByEmail(email);
            if(t != null){
                throw new Exception("Email already exists.");
            }

            Student s = new Student(regId, name, email, password);
            s = this.repo.createStudent(s);

            if (s != null){
                request.getSession().setAttribute("user", s);
                request.getSession().setAttribute("role", "student");
                response.sendRedirect("dashboard.jsp");
            }else {
                throw new Exception("Registration failed. Please try again.");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }

    public void destroy() {
    }
}
