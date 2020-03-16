# OnlineJudge
Java大作业 在线评测系统

**注：该项目的数据库文件(oj.sql)已放入，请放心使用。**

一、项目概况

1.1设计内容

　　一个在线评测系统，分用户和管理员两种身份。用户能够通过注册登录，参加比赛，最后实时得到比赛结果，并保存历史比赛结果；管理员除此之外还能录入题目增加题库内容。

1.2开发工具

　　Eclipse，Java，MySQL，Redis，Html，CSS，JS。

二、详细设计

2.1网站结构

![image](https://github.com/pavtlly/OnlineJudge/blob/master/images/1.png)

2.2主要功能

    以下功能均对应相应的JSP，Servlet层，DAO层，Service层

    注册：在JSP页面中输入需要注册账号的昵称，用户名，密码，确认密码。在Servlet中先进行密码和确认密码的判定，判定成功后，连接数据库MySQL，进行用户名的判定，再次判定成功后，将注册信息写入MySQL数据库中的User表单中，最后重定向到主页。

    登录：在JSP页面输入用户名和密码。在Servlet中连接数据库MySQL，获取数据库User表单中对应账号的密码，再与输入的密码进行判定，最后重定向到主页。

    注销：将对应用户储存的cookie和redis删除，重定向到登录界面。

    信息修改：JSP页面中输入昵称，用户名，手机号，学号。在Servlet中连接数据库MySQL，将数据库User表单中对应的信息替换成输入的。最后再重定向到该页面，可发现信息已修改。

    密码修改：在JSP页面中输入当前密码，新密码，确认密码。在Servlet中先进行新密码和确认密码的判定，判定成功后，连接数据库Mysql，获取User表单中当前账号的密码，与输入的当前密码进行判定，判定成功后用新密码替换当前密码，重定向到登录界面，重新登录。

    头像修改：在Servlet中获取头像数据，转化成，连接数据库，将其替换当前账号已经储存的

    单点登录（顶号）：以过滤器过滤登录，注册的Servlet和对应的jsp，以redis存储登录状态，再次登录删除之前与当前账号相同的redis记录。

    录入题目：在JSP页面中输入需要添加的题目，包括题目题目，内容等。

    题目列表：在用户点击题库，列出所有的题目。

    题目搜索：用户输入在题库中输入相应的题目，编号即可找出相应的题目


三、程序架构和使用说明

3.1程序架构

![image](https://github.com/pavtlly/OnlineJudge/blob/master/images/2.png)

3.2使用说明

　　文件结构：Dao层，Service层，Servlet层。数据库操作在Dao层，Service层为相关服务，Servlet层获取从JSP得到的相关数据并重定向到其他jsp页面。

　　使用方式：本程序包含MySQL数据库文件，需先导入oj.sql到命名为oj的数据库中。再导入OnlineJudge项目到eclipse中。修改com.oj.util中DbUtil中登录数据库的账号密码（自己数据库的）。以Run On Service中选择tomcat运行项目文件。
