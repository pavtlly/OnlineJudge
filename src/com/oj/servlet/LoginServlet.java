package com.oj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oj.entity.User;
import com.oj.serviceimpl.UserServiceImpl;
import com.oj.util.CookieUtil;
import com.oj.util.JsonUtil;
//import com.sun.org.apache.xml.internal.serializer.ElemDesc;

import redis.clients.jedis.Jedis;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午12:34:48 
* 类说明:登录servlet
*/

public class LoginServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User();
		UserServiceImpl user_service = new UserServiceImpl();
		user.setUsername(username);
		user.setPassword(password);
		User cur_user = null;
		try {
			cur_user = user_service.loginJudge(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cur_user != null) {
			//登录成功后生成token
			String token = UUID.randomUUID().toString();
			Jedis jedis = new Jedis("localhost");
			//使用String类型保存session信息，使用token为key
			//保存用户信息到redis，key为token，value为Tbuser对象转换成json
			jedis.set(token, JsonUtil.beanToJson(cur_user));
			//设置key的过期时间，模拟session的过期时间为30分钟
			jedis.expire(token, 1800);
			CookieUtil.addCookie(response, "token", token, 1800);
			request.getSession().setAttribute("user", cur_user);
			System.out.println("登录成功");
			response.sendRedirect("home.jsp");
		}
		else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('用户名或密码错误');");
			out.println("history.back();");
			out.println("</script>");
			System.out.println("登录失败");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
