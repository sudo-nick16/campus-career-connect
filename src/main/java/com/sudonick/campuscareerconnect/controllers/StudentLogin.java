package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.repository.StudentRepo;
import com.sudonick.campuscareerconnect.utils.HashUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "student/login", value = "/student/login")
public class StudentLogin extends HttpServlet {
    private StudentRepo repo = new StudentRepo();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try{
            String regId = request.getParameter("regId").trim();
            String password = request.getParameter("password").trim();

            if(regId.length() == 0 || password.length() == 0){
                throw new Exception("Incorrect details.");
            }

            Student s = this.repo.getStudentByRegId(regId);
            if(s == null){
                throw new Exception("Could not find user with provided Register Id.");
            }else{
                if(!HashUtils.verifyHash(password, s.password)){
                    throw new Exception("Incorrect password.");
                }
                request.getSession().setAttribute("user", s);
                request.getSession().setAttribute("role", "student");
                response.sendRedirect("dashboard.jsp");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }
}
