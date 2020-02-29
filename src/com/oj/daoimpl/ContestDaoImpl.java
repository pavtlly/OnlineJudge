package com.oj.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.oj.dao.ContestDao;
import com.oj.entity.Contest;
import com.oj.entity.User;
import com.oj.util.DbUtil;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 下午6:13:26 
* 类说明:关于比赛数据交互的具体实现方法
*/
public class ContestDaoImpl implements ContestDao{
	
	//获取所有比赛信息
	public List<Contest> getContestList() {
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			con=DbUtil.getCon();
			String sql="select * from exam ";
			cmd=con.prepareStatement(sql);
			rs=cmd.executeQuery();
			List<Contest> contestList = new ArrayList<>();
			while(rs.next()) {
				Contest contest = new Contest();
				contest.setId(rs.getInt("ex_id"));
				contest.setName(rs.getString("ex_name"));
				contest.setStart_time(rs.getDate("ex_start_time"));
				contest.setEnd_time(rs.getDate("ex_end_time"));
				contest.setLimit(rs.getString("ex_limit"));
				contest.setPb_list(rs.getString("ex_pb_list"));
				contest.setAns_list(rs.getString("ex_ans_list"));
				contestList.add(contest);
			}
			return contestList;
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
	
	//获取比赛信息
	public Contest getContest(int id) {
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			con=DbUtil.getCon();
			String sql="select * from exam where ex_id=?";
			cmd=con.prepareStatement(sql);
			cmd.setInt(1, id);
			rs=cmd.executeQuery();
			if(rs.next()) {
				Contest contest = new Contest();
				contest.setId(rs.getInt("ex_id"));
				contest.setName(rs.getString("ex_name"));
				contest.setStart_time(rs.getDate("ex_start_time"));
				contest.setEnd_time(rs.getDate("ex_end_time"));
				contest.setLimit(rs.getString("ex_limit"));
				contest.setPb_list(rs.getString("ex_pb_list"));
				contest.setAns_list(rs.getString("ex_ans_list"));
				return contest;
			}
			else {
				return null;
			}
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
}
