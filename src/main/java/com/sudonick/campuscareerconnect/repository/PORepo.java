package com.sudonick.campuscareerconnect.repository;

import com.sudonick.campuscareerconnect.database.DB;
import com.sudonick.campuscareerconnect.models.PO;
import com.sudonick.campuscareerconnect.utils.DbUtils;
import com.sudonick.campuscareerconnect.utils.HashUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PORepo {
    private final static Connection db = DB.getConn();
    public PORepo(){}

    public PO getPOById(int id) {
        try{
            String query = "select * from officers where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            ResultSet result = stmt.executeQuery();
            result.next();
            PO s = DbUtils.parsePOFromRs(result);
            return s;
        }catch (Exception e){
            return null;
        }
    };

    public PO getPOByEmail(String email){
        try{
            String query = "select * from officers where email=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet result = stmt.executeQuery();
            PO s = DbUtils.parsePOFromRs(result);
            return s;
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public PO createPO(PO PO){
        try {
            String[] returnId = { "id" };
            String hashedPassword = HashUtils.hashPassword(PO.password);
            String query = "insert into officers(name, email, password) values(?, ?, ?)";
            PreparedStatement stmt = db.prepareStatement(query, returnId);
            stmt.setString(1, PO.name);
            stmt.setString(2, PO.email);
            stmt.setString(3, hashedPassword);
            int r = stmt.executeUpdate();
            if (r > 0){
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    PO.id = rs.getInt(1);
                }
                PO stu = this.getPOById(PO.id);
                if(stu != null){
                    System.out.println("PO" + stu);
                    return stu;
                }
                return PO;
            }else {
                return null;
            }
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
    };

    public PO updatePOByEmail(PO PO){
        try {
            String query = "update officers set name=?, email=?, password=? where email=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, PO.name);
            stmt.setString(2, PO.email);
            stmt.setString(3, PO.password);
            stmt.setString(3, PO.email);
            int rs = stmt.executeUpdate();
            if (rs > 0){
                return PO;
            }else {
                return null;
            }
        }catch (Exception e){
            return null;
        }
    };

    public PO updatePOById(PO PO){
        try {
            String query = "update officers set name=?, email=?, password=? where id=?";
            PreparedStatement stmt = db.prepareStatement(query);
            stmt.setString(1, PO.name);
            stmt.setString(2, PO.email);
            stmt.setString(3, PO.password);
            stmt.setInt(4, PO.id);
            int rs = stmt.executeUpdate();
            if (rs > 0){
                return PO;
            }else {
                return null;
            }
        }catch (Exception e){
            return null;
        }
    };
}
