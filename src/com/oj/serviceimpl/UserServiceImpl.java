package com.oj.serviceimpl;
/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月10日 下午12:55:14 
* 类说明:关于用户服务的具体实现方法
*/

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;

import com.alibaba.fastjson.JSON;
import com.oj.dao.UserDao;
import com.oj.daoimpl.UserDaoImpl;
import com.oj.entity.Problem;
import com.oj.entity.User;
import com.oj.service.UserService;
import com.oj.util.JsonUtil;
import com.oj.util.StringUtil;

import redis.clients.jedis.Jedis;

public class UserServiceImpl implements UserService{
	
	//判断用户名密码是否正确，并生成token
	public User loginJudge(User user) throws SQLException {
		UserDaoImpl user_dao = new UserDaoImpl();
		User cur_user = user_dao.getUser(user); 
		if(cur_user != null) {
			destroy(cur_user.getUsername());
			return cur_user;
		}
		else return null;
	}
	
	//用户注销
	public void userLogout(String UID) {
        Jedis jedis = new Jedis("localhost");
        jedis.del(UID);
	}
	
	//用户注册
	public String createUser(User user) throws SQLException {
		UserDaoImpl user_dao = new UserDaoImpl();
		if(user_dao.insertUser(user)) {
			String token = UUID.randomUUID().toString();
			Jedis jedis = new Jedis("localhost");
			jedis.set(token, JsonUtil.beanToJson(user));
			jedis.expire(token, 1800);
			return token;
		}
		else return null;
	}
	
	//用户查询
	public User getuser(String UID) {
        Jedis jedis = new Jedis("localhost");
    	String json = jedis.get(UID); 
        User user = JSON.parseObject(json, User.class);
        return user;
	}
	//根据token查询用户是否已经登录
	public User getUserByToken(String token) {
        // 根据token查询redis。
        Jedis jedis = new Jedis("localhost");
        String json = jedis.get(token);
        if (StringUtil.isEmpty(json)) {
            //如果查询不到数据。返回用户已经过期。
        	System.out.println("json null!");
            return null;
        }
        // 如果查询到数据，说明用户已经登录，需要重置key的过期时间。
        jedis.expire(token, 1800);
        // 把json数据转换成user对象
        User user = JSON.parseObject(json, User.class);
        return user;
    }
	
	//顶号操作,删除redis中所有和输入相同的用户名的token
	public void destroy(String username) {
        Jedis jedis = new Jedis("localhost");
        Set <String> keys =jedis.keys("*"); 
        for(String key:keys) {
        	String json = jedis.get(key);
            User user = JSON.parseObject(json, User.class);
            if(user.getUsername().equals(username)) {
                jedis.del(key);
            }
        }
	}
	
	//修改用户信息
	public void editUserInfo(int id, String nickname, String username, String phone, String student_id) {
		UserDaoImpl user_dao = new UserDaoImpl();
		user_dao.editUserInfo(id, nickname, username, phone, student_id);
	}
	
	//修改用户密码
	public void editUserPwd(int id,String password) {
		UserDaoImpl user_dao = new UserDaoImpl();
		user_dao.editUserPwd(id, password);
	}
		
}
