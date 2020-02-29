/**   
* @Title: Result.java 
* @Package com.oj.entity 
* @Description: TODO(用一句话描述该文件做什么) 
* @author cccccccccchy   
* @date Dec 16, 2018 7:29:37 PM 
* @version V1.0   
*/
package com.oj.entity;

/** 
* @ClassName: Result 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author cccccccccchy 
* @date Dec 16, 2018 7:29:37 PM 
*  
*/
public class Result {
	private int id;
	private int us_id;
	private int ex_id;
	private String result;
	private int grades;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUs_id() {
		return us_id;
	}
	public void setUs_id(int us_id) {
		this.us_id = us_id;
	}
	public int getEx_id() {
		return ex_id;
	}
	public void setEx_id(int ex_id) {
		this.ex_id = ex_id;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getGrades() {
		return grades;
	}
	public void setGrades(int grades) {
		this.grades = grades;
	}
	
	
}
