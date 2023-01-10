package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.repository.ApplicationRepo;
import com.sudonick.campuscareerconnect.repository.StudentRepo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "application", value = "/application")
public class ApplicationController extends HttpServlet {

    private ApplicationRepo repo = new ApplicationRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try{
            Student s = (Student) request.getSession().getAttribute("user");
            if (s != null){
                int sid = s.id;
                String sCid = request.getParameter("cid");
                if(sCid == null){
                    throw new Exception("Missing details.");
                }
                int cid = Integer.parseInt(sCid);
                if(this.repo.createApplication(sid, cid)){
                    response.sendRedirect("student/applications.jsp");
                }else {
                    throw new Exception("Couldn't apply for this company.");
                }
            }else{
                throw new Exception("You're not authorized.");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
