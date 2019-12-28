package com.etoak.factory;

import java.sql.Connection;
import java.sql.DriverManager;


public class Factory {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getCon(){
        try {
            return DriverManager.getConnection("jdbc:mysql:///marry", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
