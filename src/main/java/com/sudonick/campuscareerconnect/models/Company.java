package com.sudonick.campuscareerconnect.models;

public class Company {
    public int id;
    public String name;
    public String site;
    public String salary;

    public Company(String name, String site, String salary) {
        this.name = name;
        this.site = site;
        this.salary = salary;
    }

    public Company(int id, String name, String site, String salary) {
        this.id = id;
        this.name = name;
        this.site = site;
        this.salary = salary;
    }
}
