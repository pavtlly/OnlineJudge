package com.oj.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oj.entity.Problem;
import com.oj.serviceimpl.ProblemServiceImpl;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 上午8:53:34 
* 类说明:题库题目展示Servlet
*/
public class ProblemsShowServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flg = (String) request.getParameter("search");
		if(flg == null ) {
			flg = "(";
		}
		ProblemServiceImpl problemservice = new ProblemServiceImpl();
		ArrayList<Problem> problems = problemservice.getProblems();
		ArrayList<Problem> realProblems = new ArrayList<>();
		for(int i = 0; i < problems.size(); i++) {
			String t = problems.get(i).toString();
			if(t.indexOf(flg) != -1) {
				realProblems.add(problems.get(i));
			}
			
		}
		System.out.println("xxxxxxxxxx"+flg);
		request.getSession().setAttribute("problems", realProblems);
		response.sendRedirect("Page/Problems.jsp");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
