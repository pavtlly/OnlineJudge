package com.oj.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月13日 上午11:53:32 
* 类说明:头像修改servlet
*/
public class ModifyAvatarServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream is = request.getPart("avatar").getInputStream();
	    String filePath = request.getServletContext().getRealPath("/Page/img/1.jpg");
        byte[] buf = new byte[1024];
        FileOutputStream fos = new FileOutputStream(filePath);
        int i = 0;
        while((i = is.read(buf)) != -1){
	        fos.write(buf, 0, i);
	    }
        fos.close();
        response.sendRedirect("Page/StudentInfo.jsp");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
