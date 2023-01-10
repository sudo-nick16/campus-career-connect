package com.sudonick.campuscareerconnect.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "logout", value = "/auth/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            if(request.getSession().getAttribute("user") != null){
                request.getSession().removeAttribute("user");
                if(request.getSession().getAttribute("role") != null){
                    request.getSession().removeAttribute("role");
                    response.sendRedirect("../");
                }else {
                    response.sendRedirect("index.jsp");
                }
            }else {
                response.sendRedirect("index.jsp");
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
