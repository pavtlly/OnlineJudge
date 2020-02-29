package com.oj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oj.entity.User;
import com.oj.serviceimpl.UserServiceImpl;
import com.oj.util.CookieUtil;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午4:43:06 
* 类说明:注册Servlet
*/

public class RegisterServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String nickname = request.getParameter("nickname");
		if(!password.equals(repassword)) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('新密码和确认密码不一致');");
			out.println("history.back();");
			out.println("</script>");
			return ;
		}
		User user = new User();
		UserServiceImpl user_service = new UserServiceImpl();
		user.setUsername(username);
		user.setNickname(nickname);
		user.setPassword(password);
		user.setRole(1);
		String token = null;
		try {
			token = user_service.createUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(token != null) {
	        CookieUtil.addCookie(response, "token", token, 1800);
	        request.getSession().setAttribute("user", user);
	        System.out.println("注册成功");
			response.sendRedirect("home.jsp");
		}
		else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('用户邮箱已经存在');");
			out.println("history.back();");
			out.println("</script>");
			System.out.println("注册失败");
			return ;
		}
		return ;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
