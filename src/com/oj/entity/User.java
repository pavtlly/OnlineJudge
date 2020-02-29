package com.oj.entity;
/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午12:36:55 
* 类说明:关于用户实体类
*/
public class User {
	private int id;//主键
	private String username;//登录账号
	private String password;//登录密码
	private String student_id;//学号
	private String nickname;//昵称
	private int role;//用户身份
	private String phone;//联系电话
	
	
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", student_id=" + student_id
				+ ", nickname=" + nickname + ", role=" + role + ", phone=" + phone + "]";
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getStudent_id() {
		return student_id;
	}


	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getRole() {
		return role;
	}


	public void setRole(int role) {
		this.role = role;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
}
