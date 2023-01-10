package com.sudonick.campuscareerconnect.repository;

import com.sudonick.campuscareerconnect.database.DB;
import com.sudonick.campuscareerconnect.models.Student;
import com.sudonick.campuscareerconnect.utils.DbUtils;
import com.sudonick.campuscareerconnect.utils.HashUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentRepo {
    private final static Connection db = DB.getConn();
    public StudentRepo(){}

    public Student getStudentById(int sid) {
        try{
            String query = "select * from students where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setInt(1, sid);
            ResultSet result = stmt.executeQuery();
            Student s = DbUtils.parseStudentFromRs(result);
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public Student getStudentByRegId(String regId){
        try{
            String query = "select * from students where regid=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, regId);
            ResultSet result = stmt.executeQuery();
            Student s = DbUtils.parseStudentFromRs(result);
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public Student getStudentByEmail(String email){
        try{
            String query = "select * from students where email=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet result = stmt.executeQuery();
            Student s = DbUtils.parseStudentFromRs(result);
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };
    public Student createStudent(Student student){
        try {
            String[] returnId = { "id" };
            String hashedPassword = HashUtils.hashPassword(student.password);
            String query = "insert into students(name, regid, email, password) values(?, ?, ?, ?)";
            PreparedStatement stmt = db.prepareStatement(query, returnId);
            stmt.setString(1, student.name);
            stmt.setString(2, student.regId);
            stmt.setString(3, student.email);
            stmt.setString(4, hashedPassword);
            int r = stmt.executeUpdate();
            if (r > 0){
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    student.id = rs.getInt(1);
                }
                rs.close();
                Student stu = this.getStudentById(student.id);
                if(stu != null){
                    return stu;
                }
                return student;
            }else {
                return null;
            }
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public Student updateStudentById(Student student){
        try {
            String query = "update students set branch=?, resume=?, cgpa=? where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, student.branch);
            stmt.setString(2, student.resume);
            stmt.setFloat(3, student.cgpa);
            stmt.setInt(4, student.id);
            int rs = stmt.executeUpdate();
            if (rs > 0){
                return student;
            }else {
                return null;
            }
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public Student updateStudentByRegId(Student student){
        try {
            String query = "update students set branch=?, resume=?, cgpa=? where regid=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, student.branch);
            stmt.setString(2, student.resume);
            stmt.setFloat(3, student.cgpa);
            stmt.setString(4, student.regId);
            int rs = stmt.executeUpdate();
            if (rs > 0){
                return student;
            }else {
                return null;
            }
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };
}
