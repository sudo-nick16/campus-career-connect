package com.sudonick.campuscareerconnect.models;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class Company {
    public int id;
    public String name;
    public String site;
    public String salary;
    public String venue;
    public Timestamp date;

    public Company(String name, String site, String salary, String venue, Timestamp date) {
        this.name = name;
        this.site = site;
        this.salary = salary;
        this.venue = venue;
        this.date = date;
    }

    public Company(int id, String name, String site, String salary, String venue, Timestamp date) {
        this.id = id;
        this.name = name;
        this.site = site;
        this.salary = salary;
        this.venue = venue;
        this.date = date;
    }
}
