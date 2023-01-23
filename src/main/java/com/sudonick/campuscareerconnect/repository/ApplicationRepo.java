package com.sudonick.campuscareerconnect.repository;

import com.sudonick.campuscareerconnect.database.DB;
import com.sudonick.campuscareerconnect.models.Company;
import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.utils.DbUtils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.function.Consumer;

public class ApplicationRepo {
    private final static Connection db = DB.getConn();
    public ApplicationRepo(){}

    public List<Student> getStudentsByCompanyId(int cid) {
        try{
            String query = "select stu.id, stu.name, stu.email, stu.regid, stu.password, stu.resume, stu.branch, stu.cgpa from applications app left join students stu on app.studentid=stu.id where companyid=? ";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setInt(1, cid);
            ResultSet result = stmt.executeQuery();
            List<Student> s = DbUtils.parseStudentsFromRs(result);
            if(s != null){
                s.forEach(e -> {
                    e.password = "";
                });
            }
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public List<Company> getCompaniesByStudentId(int sid){
        try{
            String query = "select com.id, com.name, com.site, com.salary, com.venue, com.date from applications app inner join companies com on app.companyid=com.id where app.studentid=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setInt(1, sid);
            ResultSet result = stmt.executeQuery();
            List<Company> c = DbUtils.parseCompaniesFromRs(result);
            return c;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public boolean createApplication(int sid, int cid){
        try {
            // String query = "insert into applications(studentid, companyid) values(?, ?)";
            String query = "call apply(?, ?)";
            CallableStatement stmt = db.prepareCall(query);
            stmt.setInt(1, sid);
            stmt.setInt(2, cid);
            stmt.execute();
            return true;
//            System.out.println("did get executed? "+ rs);
//            return rs;
//            if (rs > 0) {
//                return false;
//            } else {
//                return true;
//            }
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
    };
}
