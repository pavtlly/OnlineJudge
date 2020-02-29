package com.oj.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;
import com.oj.entity.Contest;
import com.oj.entity.Problem;
import com.oj.entity.Result;
import com.oj.entity.User;
import com.oj.service.ResultService;
import com.oj.serviceimpl.ResultServiceImpl;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 下午9:20:03 
* 类说明:
*/
public class ContestResultServlet extends HttpServlet{

	private ResultServiceImpl resultService = new ResultServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		ArrayList<Problem> contest_problems = (ArrayList<Problem>)request.getSession().getAttribute("contest_problems");
		Contest contest = (Contest) request.getSession().getAttribute("contest");
		String ans_list = (String) request.getSession().getAttribute("ans_list");
		
		String pattern="";
		for(int i=0;i<contest_problems.size();i++) {
			String str=request.getParameter("Select"+contest_problems.get(i).getId());
			pattern=pattern+str;
		}
		
		int id=0,right_problem=0,all_problem=contest_problems.size();
		
		for(int i=0;i<pattern.length();i++) {
			char ch1 = pattern.charAt(i);
			char ch2 = ans_list.charAt(i);
			if(ch1 == ch2) {
				right_problem=right_problem+1;
			}
		}
		System.out.println("all_problem: "+all_problem);
		System.out.println("right_problem: "+right_problem);
		System.out.println("match: "+ans_list);
		System.out.println("pattern: "+pattern);
		
		Result result = new Result();
		result.setUs_id(user.getId());
		result.setEx_id(contest.getId());
		result.setResult(pattern);
		result.setGrades(100 / all_problem * right_problem);
		resultService.insertResult(result);
		
		
		request.getSession().setAttribute("all_problem", all_problem);
		request.getSession().setAttribute("right_problem", right_problem);
		request.getSession().setAttribute("match", ans_list);
		request.getSession().setAttribute("pattern", pattern);
		response.sendRedirect("Page/ResultShow.jsp");
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
