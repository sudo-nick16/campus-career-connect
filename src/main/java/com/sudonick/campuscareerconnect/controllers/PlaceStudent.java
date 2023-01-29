package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Company;
import com.sudonick.campuscareerconnect.repository.ApplicationRepo;
import com.sudonick.campuscareerconnect.repository.CompanyRepo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "po/place", value = "/po/place")
public class PlaceStudent extends HttpServlet {

    private ApplicationRepo repo = new ApplicationRepo();
    private CompanyRepo companyRepo = new CompanyRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            try{
                int aid = Integer.parseInt(request.getParameter("aid").trim());
                int cid = Integer.parseInt(request.getParameter("cid").trim());

                Company c = this.companyRepo.getCompanyById(cid);
                if(c == null){
                    throw new Exception("Couldn't find the company you're placing the student for.");
                }
                if(c.date.getTime() > System.currentTimeMillis()){
                    throw new Exception("Cannot place the student before the test/interview.");
                }
                boolean s = this.repo.placeStudent(aid);
                if(!s){
                    throw new Exception("Couldn't place or unplace the student.");
                }else{
                    response.sendRedirect("details.jsp?cid="+cid);
                }
            }catch (Exception e){
                System.out.println(e);
                request.getSession().setAttribute("error", e.getMessage());
                response.sendRedirect("../error.jsp");
            }
    }
}
