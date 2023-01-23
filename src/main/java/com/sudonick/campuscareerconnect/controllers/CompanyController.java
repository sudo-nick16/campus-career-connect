package com.sudonick.campuscareerconnect.controllers;

import com.sudonick.campuscareerconnect.models.Company;
import com.sudonick.campuscareerconnect.repository.CompanyRepo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@WebServlet(name = "po/company", value = "/po/company")
public class CompanyController extends HttpServlet {
    private CompanyRepo repo = new CompanyRepo();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String sCid = request.getParameter("cid");
            if(sCid == null){
                throw new Exception("Invalid company.");
            }
            sCid = sCid.trim();
            int cid = Integer.parseInt(sCid);

            boolean deleted = this.repo.deleteCompanyById(cid);
            if(deleted){
                response.sendRedirect("dashboard.jsp");
            }else {
                throw new Exception("Couldn't delete company. Please try again.");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String name = request.getParameter("name").trim();
            String website = request.getParameter("website").trim();
            String salary = request.getParameter("salary").trim();
            String venue = request.getParameter("venue").trim();
            String dateTime = request.getParameter("date-time").trim();

            dateTime = dateTime.replace("T", " ");
            dateTime += ":00.000";
            Timestamp ts = Timestamp.valueOf(dateTime);

            if(name.length() == 0){
                throw new Exception("Company name cannot be empty");
            }

            Company c = new Company(name, website, salary, venue, ts);
            c = this.repo.createCompany(c);

            if (c != null){
                response.sendRedirect("dashboard.jsp");
            }else {
                throw new Exception("Couldn't add company. Please try again.");
            }
        }catch (Exception e){
            System.out.println(e);
            request.getSession().setAttribute("error", e.getMessage());
            response.sendRedirect("../error.jsp");
        }
    }
}
