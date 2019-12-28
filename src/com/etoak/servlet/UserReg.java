package com.etoak.servlet;

import com.etoak.dao.UserDao;
import com.etoak.dao.UserDaoImpl;
import com.etoak.po.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reg")
public class UserReg extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        UserDao dao = new UserDaoImpl();
        if(dao.addUser(new User(null,name,pass,phone,email,"0"))){
            response.sendRedirect("/marryYJH/login.html");
            return ;
        }
        response.sendRedirect("/marryYJH/reg.html");
    }
}
