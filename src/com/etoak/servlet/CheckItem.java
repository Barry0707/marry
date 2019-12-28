package com.etoak.servlet;

import com.etoak.dao.MarryDao;
import com.etoak.dao.MarryDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checkItem")
public class CheckItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();

        MarryDao dao = new MarryDaoImpl();

        Integer mid = Integer.parseInt(request.getParameter("mid"));
        if(dao.updateStatus(mid)){
            out.print("suc");
            out.close();
            return;
        }
        out.print("wrong");
        out.close();
    }
}
