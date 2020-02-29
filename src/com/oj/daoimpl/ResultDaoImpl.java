/**   
* @Title: ResultDaoImpl.java 
* @Package com.oj.daoimpl 
* @Description: TODO(用一句话描述该文件做什么) 
* @author cccccccccchy   
* @date Dec 16, 2018 8:03:16 PM 
* @version V1.0   
*/
package com.oj.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.oj.util.*;
import com.oj.dao.*;
import com.oj.entity.*;
/** 
* @ClassName: ResultDaoImpl 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author cccccccccchy 
* @date Dec 16, 2018 8:03:16 PM 
*  
*/
public class ResultDaoImpl implements ResultDao {

	/**
	* <p>Title: insertResult</p> 
	* <p>Description: </p> 
	* @param result
	* @return
	* @throws SQLException 
	* @see com.oj.dao.ResultDao#insertResult(com.oj.entity.Result) 
	*/
	@Override
	public boolean insertResult(Result result) throws SQLException {
		PreparedStatement cmd = null;
		ResultSet rs=null;
		Connection con=null;
		try {
			con=DbUtil.getCon();
			String sql="INSERT INTO result(RS_ID,US_ID,EX_ID,RS_RESULT,RS_GRADES) VALUES(null,?,?,?,?)";
			cmd=con.prepareStatement(sql);
			cmd.setInt(1, result.getUs_id());
			cmd.setInt(2, result.getEx_id());
			cmd.setString(3, result.getResult());
			cmd.setInt(4, result.getGrades());
			System.out.println(sql);
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
	
	public ArrayList<Result> getResults(int id){
		Connection con=null;
		PreparedStatement cmd = null;
		ResultSet rs=null;
		try {
			ArrayList<Result> result = new ArrayList<Result>();
			con=DbUtil.getCon();
			String sql="select * from result where us_id = ?";
			cmd=con.prepareStatement(sql);
			cmd.setInt(1, id);
			rs=cmd.executeQuery();
			
			while(rs.next()) {
				Result res = new Result();
				res.setId(rs.getInt("rs_id"));
				res.setUs_id(rs.getInt("us_id"));
				res.setEx_id(rs.getInt("ex_id"));
				res.setGrades(rs.getInt("rs_grades"));
				res.setResult(rs.getString("rs_result"));
				result.add(res);
			}
			return result;
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
