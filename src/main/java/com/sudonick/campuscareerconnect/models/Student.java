package com.sudonick.campuscareerconnect.models;

import com.google.gson.Gson;

import java.util.Base64;

public class Student {
    public int id;
    public String regId;
    public String name;
    public String email;
    public String password;
    public String branch;
    public String resume;
    public Float cgpa;
    public final String role = "student";


    public Student(String regId, String name, String email, String password) {
        this.regId = regId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.cgpa = 0f;
        this.branch = "";
        this.resume = "";
    }
    public Student(int id, String regId, String name, String email, String password, Float cgpa, String branch, String resume) {
        this.id = id;
        this.regId = regId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.cgpa = cgpa;
        this.branch = branch;
        this.resume = resume;
    }

    public Student(Student student) {
        this.id = student.id;
        this.regId = student.regId;
        this.name = student.name;
        this.email = student.email;
        this.password = student.password;
        this.cgpa = student.cgpa;
        this.branch = student.branch;
        this.resume = student.resume;
    }

    public String toBase64() {
        String encodedString = Base64.getEncoder().encodeToString(this.toJson().getBytes());
        return encodedString;
    }

    public String toJson() {
        Object obj = new Gson().toJson(this);
        System.out.println("JSON: "+ obj);
        return obj.toString();
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", regId='" + regId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", branch='" + branch + '\'' +
                ", resume='" + resume + '\'' +
                ", cgpa=" + cgpa +
                '}';
    }
}
