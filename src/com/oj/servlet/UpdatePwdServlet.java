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
* @version 创建时间:2018年12月13日 上午2:06:24 
* 类说明:修改用户密码servlet
*/
public class UpdatePwdServlet extends HttpServlet{
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServiceImpl userservice = new UserServiceImpl();
		User user=(User)request.getSession().getAttribute("user");
		int id = user.getId();
		String old_passwd = request.getParameter("old-passwd");
		String new_passwd = request.getParameter("new-passwd");
		String compare_passwd = request.getParameter("compare-passwd");
		String UID=CookieUtil.getUid(request,"token");
		user=userservice.getuser(UID);
		if(!new_passwd.equals(compare_passwd)) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('输入的新密码和确认密码不一致');");
			out.println("history.back();");
			out.println("</script>");
			System.out.println("登录失败");
			return ;
		}
		if(!user.getPassword().equals(old_passwd)) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('输入的原密码不正确');");
			out.println("history.back();");
			out.println("</script>");
			return ;
		}
		userservice.editUserPwd(id, new_passwd);
		response.sendRedirect("login.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
