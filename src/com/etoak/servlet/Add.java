package com.etoak.servlet;

import com.etoak.dao.MarryDao;
import com.etoak.dao.MarryDaoImpl;
import com.etoak.po.Marry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/add")
public class Add extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String mname = request.getParameter("mname");
        String mphone = request.getParameter("mphone");
        String mwishtime = request.getParameter("mtime");
        String marea = request.getParameter("marea");
        String mt[] = request.getParameterValues("mstyle");
        String mty;
        if(mt.length==0){
            mty = "";
        }else{
            String mstyle="";
            for(String m : mt){
                mstyle = mstyle+m+",";
            }
            mty= mstyle.substring(0,mstyle.length()-1);
        }
        System.out.println(mty);
        String mtype = request.getParameter("mtype");
        Integer mmoney = Integer.parseInt(request.getParameter("result"));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String msettime =df.format(new Date());
        MarryDao dao = new MarryDaoImpl();
        if(dao.addMarry(new Marry(null,mname,marea,mtype,mmoney,mty,mphone,mwishtime,msettime,"0"))){
            response.sendRedirect("index.jsp");
            return ;
        }
        response.sendRedirect("login.html");

    }
}
