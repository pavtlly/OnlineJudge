/**   
* @Title: ResultServiceImpl.java 
* @Package com.oj.serviceimpl 
* @Description: TODO(用一句话描述该文件做什么) 
* @author cccccccccchy   
* @date Dec 16, 2018 8:37:41 PM 
* @version V1.0   
*/
package com.oj.serviceimpl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.oj.dao.ResultDao;
import com.oj.daoimpl.ProblemDaoImpl;
import com.oj.daoimpl.ResultDaoImpl;
import com.oj.service.ResultService;
import com.oj.entity.*;
/** 
* @ClassName: ResultServiceImpl 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author cccccccccchy 
* @date Dec 16, 2018 8:37:41 PM 
*  
*/
public class ResultServiceImpl implements ResultService {
	
	private ResultDaoImpl resultDao = new ResultDaoImpl();
	
	/**
	* <p>Title: insertResult</p> 
	* <p>Description: </p> 
	* @param result 
	* @see com.oj.service.ResultService#insertResult(com.mysql.cj.xdevapi.Result) 
	*/
	@Override
	public void insertResult(Result result) {
		try {
			resultDao.insertResult(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Result> getResultById(int id){
		ArrayList<Result> res = resultDao.getResults(id);
		return res;
	}

}
