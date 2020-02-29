package com.oj.serviceimpl;

import java.util.ArrayList;

import com.oj.daoimpl.ProblemDaoImpl;
import com.oj.entity.Problem;
import com.oj.service.ProblemService;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 上午9:17:27 
* 类说明:关于题目服务的具体实现方法
*/
public class ProblemServiceImpl implements ProblemService{
	
	//获取题目列表
	public ArrayList<Problem> getProblems(){
		ProblemDaoImpl problemdao = new ProblemDaoImpl();
		ArrayList problems = problemdao.getProblems();
		return problems;
	}
	
	//增加题目
	public boolean addProblem(Problem problem) {
		ProblemDaoImpl problemdao = new ProblemDaoImpl();
		if(problemdao.addProblem(problem)) return true;
		return false;
	}
}
