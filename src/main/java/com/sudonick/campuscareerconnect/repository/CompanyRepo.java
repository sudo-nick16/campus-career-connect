package com.sudonick.campuscareerconnect.repository;

import com.sudonick.campuscareerconnect.database.DB;
import com.sudonick.campuscareerconnect.models.Company;
import com.sudonick.campuscareerconnect.utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class CompanyRepo {
    private final static Connection db = DB.getConn();
    public CompanyRepo(){}

    public List<Company> getCompanies() {
        try{
            Statement stmt = this.db.createStatement();
            String query = "select * from companies";
            ResultSet result = stmt.executeQuery(query);
            List<Company> companies = DbUtils.parseCompaniesFromRs(result);
            return companies;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public Company getCompanyById(int id) {
        try{
            String query = "select * from companies where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet result = stmt.executeQuery();
            Company s = DbUtils.parseCompanyFromRs(result);
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };


    public boolean deleteCompanyById(int id) {
        try{
            String query = "delete from companies where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setInt(1, id);
            int r = stmt.executeUpdate();
            if (r > 0){
               return true;
            }
            return false;
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
    };

    public Company createCompany(Company company){
        try {
            String query = "insert into companies(name, site, salary) values(?, ?, ?)";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, company.name);
            stmt.setString(2, company.site);
            stmt.setString(3, company.salary);
            int r = stmt.executeUpdate();
            if (r > 0){
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    company.id = rs.getInt(1);
                }
                Company com = this.getCompanyById(company.id);
                if(com != null){
                    System.out.println("Company: " + com);
                    return com;
                }
                return company;
            }else {
                return null;
            }
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };
}
