package com.sudonick.campuscareerconnect.models;

public class PO {
    public int id;
    public String name;
    public String email;
    public String password;
    public final String role = "po";

    public PO(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public PO(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }
}
