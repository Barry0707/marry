package com.etoak.servlet;

import com.etoak.dao.MarryDao;
import com.etoak.dao.MarryDaoImpl;
import com.etoak.po.Marry;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/show")
public class Show extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();

        MarryDao dao = new MarryDaoImpl();
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page = Integer.parseInt(request.getParameter("page"));

        String mname = request.getParameter("mname");
        String time1 = request.getParameter("time1");
        String time2 = request.getParameter("time2");
        System.out.println(mname + time1 + time2);
        Integer allRecord = dao.queryCount(mname, time1, time2);
        List<Marry> list = dao.queryMarry(mname, time1, time2, (page - 1) * limit, limit);
        System.out.println(allRecord);
        for (Marry m : list) {
            System.out.println(m);
        }

        JSONObject jo = new JSONObject();

        jo.put("code", "0");
        jo.put("msg", "");
        jo.put("count", allRecord);
        jo.put("data", list);

        out.print(jo);
        out.close();
    }
}
