package com.etoak.po;

public class User {
    private Integer id;
    private String name;
    private String pass;
    private String phone;
    private String email;
    private String status;

    public User() {
    }

    public User(Integer id, String name, String pass, String phone, String email, String status) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pass='" + pass + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
