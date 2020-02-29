package com.oj.entity;
/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 下午6:08:24 
* 类说明:
*/

import java.sql.Date;

public class Contest {
	private int id;
	private String name;
	private Date start_time;
	private Date end_time;
	private String limit;
	private String pb_list;
	private String ans_list;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getPb_list() {
		return pb_list;
	}
	public void setPb_list(String pb_list) {
		this.pb_list = pb_list;
	}
	public String getAns_list() {
		return ans_list;
	}
	public void setAns_list(String ans_list) {
		this.ans_list = ans_list;
	}
	
}
