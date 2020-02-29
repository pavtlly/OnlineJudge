/**   
* @Title: ResultDao.java 
* @Package com.oj.dao 
* @Description: TODO(用一句话描述该文件做什么) 
* @author cccccccccchy   
* @date Dec 16, 2018 8:02:35 PM 
* @version V1.0   
*/
package com.oj.dao;

import java.sql.SQLException;

import com.oj.entity.Result;


/** 
* @ClassName: ResultDao 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author cccccccccchy 
* @date Dec 16, 2018 8:02:35 PM 
*  
*/
public  interface  ResultDao {
	
	/**
	 * 
	* @Title: insertResult 
	* @Description: 插入用户考试结果
	* @param @param result
	* @param @return
	* @param @throws SQLException    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean insertResult(Result result) throws SQLException;


	
}
