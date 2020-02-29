package com.oj.util;

import java.sql.*;

public class DbUtil {
	
	/*SQL 连接字符串 */
	public static final String dbURL="jdbc:mysql://localhost:3306/oj?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai";
	/*SQL 驱动器 */
	public static final String driverName="com.mysql.jdbc.Driver";
	/*SQL 登录账号 */
	public static final String userName="root";
	/*SQL 登录账密码 */
	public static final String userPwd="xiaochao123";
	
	private static Connection conn=null;
	
	static {
		 try{
		     Class.forName(driverName);
		     System.out.println("驱动加载成功");
		 }catch(Exception e){
		     e.printStackTrace();
		     System.out.println("驱动加载失败");
		 }
	}
	
	public static Connection getCon() {
		try {
			conn=DriverManager.getConnection(dbURL,userName,userPwd);
			if(conn!=null)
				System.out.println("数据库连接成功");
			else
				System.out.println("数据库连接失败");
			return conn;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("数据库连接失败");
			return null;
		}
	}

}
