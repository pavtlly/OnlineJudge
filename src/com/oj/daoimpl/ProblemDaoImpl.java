package com.oj.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.oj.dao.ProblemDao;
import com.oj.entity.Problem;
import com.oj.entity.User;
import com.oj.util.DbUtil;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 上午9:23:31 
* 类说明:关于题目数据交互的具体实现方法
*/
public class ProblemDaoImpl implements ProblemDao{
	
	//获取所有题目
	public ArrayList<Problem> getProblems(){
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			ArrayList<Problem> problems = new ArrayList<Problem>();
			con=DbUtil.getCon();
			String sql="select * from problem";
			cmd=con.prepareStatement(sql);
			rs=cmd.executeQuery();
			while(rs.next()) {
				Problem problem =new Problem();
				problem.setId(rs.getInt("pb_id"));
				problem.setContent(rs.getString("pb_content"));
				problem.setA(rs.getString("pb_A"));
				problem.setB(rs.getString("pb_B"));
				problem.setC(rs.getString("pb_C"));
				problem.setD(rs.getString("pb_D"));
				problem.setAns(rs.getString("pb_answer"));
				problem.setTag(rs.getString("pb_tag"));
				problem.setLevel(rs.getString("pb_level"));
				problems.add(problem);
			}
			return problems;
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (cmd != null) {
				try {
					cmd.close();
					cmd = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//增加新的题目
	public boolean addProblem(Problem problem) {
		PreparedStatement cmd = null;
		ResultSet rs=null;
		Connection con=null;
		try {
			con=DbUtil.getCon();
			String sql="INSERT INTO problem(pb_id,pb_content,pb_A,pb_B,pb_C,pb_D,pb_answer,pb_tag,pb_level) VALUES(null,?,?,?,?,?,?,?,?)";
			Date date = new Date();  
			cmd=con.prepareStatement(sql);
			cmd.setString(1, problem.getContent());
			cmd.setString(2, problem.getA());
			cmd.setString(3, problem.getB());
			cmd.setString(4, problem.getC());
			cmd.setString(5, problem.getD());
			cmd.setString(6, problem.getAns());
			cmd.setString(7, problem.getTag());
			cmd.setString(8, problem.getLevel());
			if(cmd.executeUpdate()<=0) return false;
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (cmd != null) {
				try {
					cmd.close();
					cmd = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
}
