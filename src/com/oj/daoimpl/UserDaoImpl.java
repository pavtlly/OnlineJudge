package com.oj.daoimpl;
/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午12:59:28 
* 类说明:关于用户数据交互的具体实现方法
*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
//import org.junit.Test;
import org.quartz.utils.DBConnectionManager;
import com.oj.util.DataSourceUtil;
import com.oj.dao.UserDao;
import com.oj.entity.User;
import com.oj.util.DbUtil;
//import com.sun.org.apache.bcel.internal.generic.NEW;

public class UserDaoImpl implements UserDao{

	QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
	
	//用户查询
	public User getUser(User user) {
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			con=DbUtil.getCon();
			String sql="select * from user where us_username=? and us_password=?";
			cmd=con.prepareStatement(sql);
			cmd.setString(1, user.getUsername());
			cmd.setString(2, user.getPassword());
			rs=cmd.executeQuery();
			if(rs.next()) {
				User cur_user=new User();
				cur_user.setId(rs.getInt("us_id"));
				cur_user.setUsername(rs.getString("us_username"));
				cur_user.setPassword(rs.getString("us_password"));
				cur_user.setRole(rs.getInt("us_role"));
				cur_user.setStudent_id(rs.getString("us_student_id"));
				cur_user.setNickname(rs.getString("us_nickname"));
				cur_user.setPhone(rs.getString("us_phone"));
				return cur_user;
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
	
	//插入新用户
	public boolean insertUser(User user) {
		PreparedStatement cmd = null;
		ResultSet rs=null;
		Connection con=null;
		if(getUser(user)!=null)  return false;
		try {
			con=DbUtil.getCon();
			String sql="INSERT INTO user(US_ID,US_USERNAME,US_PASSWORD,US_ROLE,US_STUDENT_ID,US_NICKNAME,US_PHONE) VALUES(null,?,?,?,?,?,?)";
			Date date = new Date();  
			java.sql.Date sql_date = new java.sql.Date(date.getTime());
			Timestamp timeStamp = new Timestamp(date.getTime());
			cmd=con.prepareStatement(sql);
			cmd.setString(1, user.getUsername());
			cmd.setString(2, user.getPassword());
			cmd.setInt(3, user.getRole());
			cmd.setString(4, user.getStudent_id());
			cmd.setString(5, user.getNickname());
			cmd.setString(6, user.getPhone());
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
	
	//修改用户信息
	public void editUserInfo(int id, String nickname, String username, String phone, String student_id) {
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			String sql="update user set us_nickname='"+nickname+"',us_username='"+username+"',us_phone='"+phone+"',us_student_id='"+student_id+"' where "+ " us_id = " +id;
			con=DbUtil.getCon();
			cmd=con.prepareStatement(sql);
			cmd.execute();
		}catch(Exception ex) {
			ex.printStackTrace();
			return ;
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
	
	//修改用户信息
	public void editUserPwd(int id, String password) {
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			String sql="update user set us_password='"+password+"' where "+ " us_id = " +id;
			con=DbUtil.getCon();
			cmd=con.prepareStatement(sql);
			cmd.execute();
		}catch(Exception ex) {
			ex.printStackTrace();
			return ;
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
