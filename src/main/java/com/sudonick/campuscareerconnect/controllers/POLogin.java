package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.PO;
import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.repository.PORepo;
import com.sudonick.campuscareerconnect.repository.StudentRepo;
import com.sudonick.campuscareerconnect.utils.HashUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@WebServlet(name = "po/login", value = "/po/login")
public class POLogin extends HttpServlet {
    private PORepo repo = new PORepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();

            if (email.length() == 0 || password.length() == 0){
                throw new Exception("Incorrect details.");
            }

            PO p = this.repo.getPOByEmail(email);
            if (p == null){
                throw new Exception("Incorrect Email.");
            }else{
                if(!Objects.equals(p.password, password)){
                    throw new Exception("Incorrect Password.");
                }
                request.getSession().setAttribute("user", p);
                request.getSession().setAttribute("role", "po");
                response.sendRedirect("dashboard.jsp");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }
}
