package com.oj.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oj.entity.Contest;
import com.oj.entity.Problem;
import com.oj.service.ContestService;
import com.oj.serviceimpl.ContestServiceImpl;
import com.oj.serviceimpl.ProblemServiceImpl;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 下午3:42:20 
* 类说明:比赛页面展示
*/
public class ContestShowServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int ID = Integer.parseInt(id);
		
		ProblemServiceImpl problemservice = new ProblemServiceImpl();
		ArrayList<Problem> problems = problemservice.getProblems();
		ArrayList<Problem> contest_problems = new ArrayList<Problem>();
		
		ContestServiceImpl contestservice = new ContestServiceImpl();
		Contest contest = contestservice.getContest(ID);
		String is_or_not = contest.getPb_list();
		
		for(int i=0;i<is_or_not.length();i++) {
			char c=is_or_not.charAt(i);
			if(c=='1') {
				contest_problems.add(problems.get(i));
			}
		}
		
		request.getSession().setAttribute("contest_problems", contest_problems);
		request.getSession().setAttribute("contest", contest);
		request.getSession().setAttribute("ans_list", contest.getAns_list());
		
		response.sendRedirect("Page/ContestShow.jsp");
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
