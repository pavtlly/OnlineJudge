/**   
* @Title: ResultService.java 
* @Package com.oj.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author cccccccccchy   
* @date Dec 16, 2018 8:37:12 PM 
* @version V1.0   
*/
package com.oj.service;

import com.oj.entity.Result;

/** 
* @ClassName: ResultService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author cccccccccchy 
* @date Dec 16, 2018 8:37:12 PM 
*  
*/
public interface ResultService {
	/**
	 * 
	* @Title: insertResult 
	* @Description: 插入用户考试成绩
	* @param @param result    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void insertResult(Result result);
}
