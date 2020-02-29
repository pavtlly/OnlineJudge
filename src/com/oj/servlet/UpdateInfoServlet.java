package com.oj.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oj.entity.User;
import com.oj.serviceimpl.UserServiceImpl;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月11日 上午10:11:37 
* 类说明:修改用户信息servlet
*/
public class UpdateInfoServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServiceImpl userservice = new UserServiceImpl();
		User user=(User)request.getSession().getAttribute("user");
		int id = user.getId();
		String nickname = request.getParameter("nickname");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String student_id = request.getParameter("student_id");
		userservice.editUserInfo(id, nickname, username, phone, student_id);
		user.setNickname(nickname);user.setUsername(username);
		user.setPhone(phone);user.setStudent_id(student_id);
		System.out.println("进入用户信息Servle");
		response.sendRedirect("Page/StudentInfo.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
