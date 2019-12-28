package com.etoak.servlet;

import com.etoak.dao.UserDao;
import com.etoak.dao.UserDaoImpl;
import com.etoak.po.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/log")
public class UserLog extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		UserDao dao = new UserDaoImpl();

		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		User u = dao.queryUserByNameAndPass(name,pass);
		HttpSession session = request.getSession();
		if(u!=null){
			session.setAttribute("u",u);
			response.sendRedirect("/marryYJH/index.jsp");
			return;
		}
		session.invalidate();
		out.print("<h1>密码错误！ 请重新><a href='login.html'>登录</a></h1>");
		out.close();
	}
}
