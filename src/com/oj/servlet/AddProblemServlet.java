package com.oj.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oj.entity.Problem;
import com.oj.service.ProblemService;
import com.oj.serviceimpl.ProblemServiceImpl;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月17日 上午1:26:51 
* 类说明:题目增加Servlet
*/
public class AddProblemServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProblemServiceImpl problemServiceImpl = new ProblemServiceImpl();
		Problem problem = new Problem();
		problem.setContent(request.getParameter("describe"));
		problem.setA(request.getParameter("A"));
		problem.setB(request.getParameter("B"));
		problem.setC(request.getParameter("C"));
		problem.setD(request.getParameter("D"));
		problem.setAns(request.getParameter("ans"));
		problem.setLevel(request.getParameter("level"));
		if(problemServiceImpl.addProblem(problem)) {
			System.out.println("增加题目成功");
			response.sendRedirect("problemshow");
		}
		else {
			System.out.println("增加题目失败");
			response.sendRedirect("Page/AddProblem.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
