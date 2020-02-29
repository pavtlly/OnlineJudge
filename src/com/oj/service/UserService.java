package com.oj.service;

import java.sql.SQLException;

import com.oj.entity.User;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午12:53:32 
* 类说明:关于用户服务
*/
public interface UserService {
	
	//判断用户名密码是否正确，并生成token
	public User loginJudge(User user) throws SQLException ;
	//用户注销
	public void userLogout(String UID) ;
	//用户注册
	public String createUser(User user) throws SQLException ;
	//根据token查询用户是否已经登录
	public User getUserByToken(String token) ;
	//顶号操作,删除redis中所有和输入相同的用户名的token
	public void destroy(String user_name) ;
	
	//修改用户信息
	public void editUserInfo(int id, String nickname, String username, String phone, String student_id) ;
	//修改用户密码
	public void editUserPwd(int id,String password) ;
}
