package com.etoak.dao;

import com.etoak.po.User;

public interface UserDao {
    public boolean addUser(User u);
    public boolean queryUserByName(String name);
    public User queryUserByNameAndPass(String name, String pass);
}
