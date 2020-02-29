package com.oj.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oj.serviceimpl.UserServiceImpl;
import com.oj.util.CookieUtil;
import com.oj.util.StringUtil;
import com.oj.entity.User;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午4:43:06 
* 类说明:登录过滤器
*/

public class LoginFilter implements Filter {
	
	private FilterConfig config;
    public LoginFilter() {
    }
	
	public void destroy() {
		System.out.println("LoginFilter destory...");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("LoginFilter doFilter...");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpServletRequest hrequest = (HttpServletRequest)request;
		HttpServletResponse hresponse = (HttpServletResponse)response;
		UserServiceImpl UserService = new UserServiceImpl();
		
		String path = hrequest.getContextPath();
		String basePath = hrequest.getScheme()+"://"+hrequest.getServerName()+":"+hrequest.getServerPort()+path+"/";
		
		if(hrequest.getServletPath().equals("/login.jsp")||hrequest.getServletPath().equals("/login")) {
			chain.doFilter(request, response);
			return;
		}
		
		if(hrequest.getServletPath().equals("/register.jsp")||hrequest.getServletPath().equals("/register")) {
			chain.doFilter(request, response);
			return;
		}
		
		if(hrequest.getServletPath().equals("/index.jsp")) {
			chain.doFilter(request, response);
			return ;
		}
		
		String token = CookieUtil.getUid(hrequest, "token");
		
		//cookie中不存在token,未登录状态
		if(StringUtil.isEmpty(token)) {
			hresponse.sendRedirect(basePath+"index.jsp");
			//chain.doFilter(request, response);注意这里加上是错误的,doFilter()调用时若chain链中没有下一个filter则会返回到请求界面
			//比如在跳转到home.jsp是进行过滤，检查为未登录要跳转到登录界面，那么doFilter()如果加上则会继续跳转到home.jsp两次跳转会冲突。
			return;
		}
		
		//如果取到token,需要调用sso系统的服务，根据token取用户信息
		UserServiceImpl user_service = new UserServiceImpl();
		User user=user_service.getUserByToken(token);
		
		//若没有取到用户信息，则登录已经过期
		if(user==null) {
			hresponse.sendRedirect(basePath+"index.jsp");
			return;
		}
		
		//取到用户信息，则为登录状态
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
		
		return;
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFilter init...");
		this.config=config;
	}

}
