package com.etoak.dao;

import com.etoak.factory.Factory;
import com.etoak.po.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.Connection;

public class UserDaoImpl implements UserDao{
    Connection con;
    QueryRunner qr = new QueryRunner();
    @Override
    public boolean addUser(User u) {
        try {
            String sql = "insert into marryuser values (null,?,?,?,?,?);";
            con = Factory.getCon();
            return qr.update(con,sql,u.getName(),u.getPass(),u.getPhone(),u.getEmail(),u.getStatus())==1;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean queryUserByName(String name) {
        try {
            String sql = "select * from marryuser where name = ?";
            con =Factory.getCon();
            return qr.query(con,sql,new BeanHandler<User>(User.class),name)!=null;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User queryUserByNameAndPass(String name, String pass) {
        try{
            String sql = "select * from marryuser where name=? and pass=?";
            con = Factory.getCon();
            return qr.query(con,sql,new BeanHandler<User>(User.class),name,pass);
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
