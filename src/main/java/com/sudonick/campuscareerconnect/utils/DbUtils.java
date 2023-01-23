package com.sudonick.campuscareerconnect.utils;

import com.sudonick.campuscareerconnect.models.Company;
import com.sudonick.campuscareerconnect.models.PO;
import com.sudonick.campuscareerconnect.models.Student;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DbUtils {
    public static Student parseStudentFromRs(ResultSet rs) {
        try{
            if(!rs.next()){
                return null;
            }
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String regId = rs.getString("regId");
            String password = rs.getString("password");
            String branch = rs.getString("branch");
            String resume = rs.getString("resume");
            Float cgpa = rs.getFloat("cgpa");
            Student s = new Student(id, regId, name, email, password, cgpa, branch, resume);
            return s;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static List<Student> parseStudentsFromRs(ResultSet rs) {
        List<Student> students = new ArrayList<>();
        try{
            Student s = parseStudentFromRs(rs);
            while(s != null){
                students.add(s);
                s = parseStudentFromRs(rs);
            }
            return students;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static Company parseCompanyFromRs(ResultSet rs) {
        try{
            if(!rs.next()){
                return null;
            }
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String site = rs.getString("site");
            String salary = rs.getString("salary");
            String venue = rs.getString("venue");
            Timestamp dateTime = rs.getTimestamp("date");
            System.out.println("Date in dbutils: "+ dateTime);

            Company c = new Company(id, name, site, salary, venue, dateTime);
            return c;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static List<Company> parseCompaniesFromRs(ResultSet rs) {
        List<Company> companies = new ArrayList<>();
        try{
            Company c = parseCompanyFromRs(rs);
            while(c != null){
                companies.add(c);
                c = parseCompanyFromRs(rs);
            }
            return companies;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static PO parsePOFromRs(ResultSet rs) {
        try{
            if(!rs.next()){
                return null;
            }
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String password = rs.getString("password");
            String role = rs.getString("role");

            PO p = new PO(id, name, email, password);
            return p;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static List<PO> parsePOsFromRs(ResultSet rs) {
        List<PO> companies = new ArrayList<>();
        try{
            PO c = parsePOFromRs(rs);
            while(c != null){
                companies.add(c);
                c = parsePOFromRs(rs);
            }
            return companies;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

}
