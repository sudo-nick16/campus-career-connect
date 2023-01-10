package com.sudonick.campuscareerconnect.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    static private final String DB_URL = System.getenv("DB_URL");
    static private final String USER = System.getenv("USER");
    static private final String PASS = System.getenv("PASS");
    public static Connection conn = null;
    private static DB instance = null;

    private DB() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the Database.");
        }catch (Exception e){
            System.out.println(e);
            conn = null;
        }
    }

    public static Connection getConn(){
        if (instance == null){
            instance = new DB();
        }
        return conn;
    }
    public static void close() throws SQLException {
        conn.close();
    }
}
