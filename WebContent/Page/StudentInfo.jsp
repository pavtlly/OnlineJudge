<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.oj.entity.User"%>

<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta property="qc:admins" content="25115412737374526375">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>OnlineJudge</title>
	    <link href="https://static.hihocoder.com/images/hiho.ico" rel="shortcut icon" type="image/x-icon">
		<link type="text/css" rel="stylesheet" href="https://static.hihocoder.com/styles/home.css?1496820864.css">
		<script src="//hm.baidu.com/hm.js?9334676254a219943ea90c19530c3bec"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/libs/jquery-1.10.2.min.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/api.js?1499873233.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/common.js?1496820864.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/dropdown.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/button.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/alert.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/libs/tab.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/collapse.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/tooltip.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/modal.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/tag.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/discuss.js?1457224552.js"></script>
		<script type="text/javascript" src="https://static.hihocoder.com/js/framework/contest.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/popover.js?1457224552.js"></script>
		<script type="text/javascript">
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "//hm.baidu.com/hm.js?9334676254a219943ea90c19530c3bec";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
		</script>
	</head>
	<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
		<div id="wrap">
		<nav id="tl-top-navbar" class="navbar navbar-inverse">
		<div class="collapse navbar-collapse">
		<div class="container">
			<a class="navbar-brand" href="StudentInfo.jsp">OnlineJudge</a>
			<ul class="nav navbar-nav">
				<li><a href="<%=basePath %>home.jsp">每周一练</a></li>
				<li><a href="<%=basePath %>contestlistshow" class="fire">比赛<span class="icon-fire"></span></a></li>
				<li><a href="<%=basePath %>problemshow">题库</a></li>
				<li><a href="<%=basePath %>history">历史</a></li>
				<c:if test="${ user.getRole() == 2}">
					<li><a href="AddProblem.jsp">录题</a></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=user.getNickname() %> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="StudentInfo.jsp">账户设置</a></li>
						<li><a href="<%=basePath %>logout">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
		</nav>			
		<div id="content" class="container">
			<main class="md-card fn-p10">
			<ul class="nav nav-tabs" style="margin-top: 10px;">
	  			<li class="active"><a href="StudentInfo.jsp">用户信息</a></li>
			  	<li><a href="EditPwd.jsp">修改密码</a></li>
			</ul><div class="row" style="margin-top: 30px;position: relative;">
		<form class="form-horizontal col-xs-10" action="<%=basePath %>updateinfo" method="post" role="form">
		<div class="form-group">
			<label for="real-name" class="col-xs-2 control-label">用户昵称</label>
			<div class="col-xs-5">
				<input type="text" class="form-control" id="real-name" name="nickname" value="${user.getNickname()}">
			</div>
		</div>
		<div class="form-group">
			<label for="city" class="col-xs-2 control-label">用户邮箱</label>
			<div class="col-xs-5">
				<input type="text" class="form-control" id="city" name="username" value="${user.getUsername()}">
			</div>
		</div>
		<div class="form-group">
			<label for="mobile" class="col-xs-2 control-label">手机号码</label>
			<div class="col-xs-5">
				<input type="text" class="form-control" id="mobile" name="phone" value="${user.getPhone()}">
			</div>
		</div>
		<div class="form-group">
			<label for="post-code" class="col-xs-2 control-label">学生学号</label>
			<div class="col-xs-5">
				<input type="text" class="form-control" id="post-code" name="student_id" value="${user.getStudent_id()}">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-xs-5">
				<button type="submit" class="btn btn-success"> 保存修改 </button>
			</div>
		</div>
	</form>
	<form class="settings-aside col-xs-2" action="<%=basePath %>modifyavatar" method="POST" enctype="multipart/form-data">
		<img class="cur-avatar" src="img/1.jpg">
		<div class="change-avatar">
			<input type="file" name="avatar" onchange="this.form.submit();">
			<a href="javascript:void(0);" class="btn btn-default">修改头像</a>
		</div>
		<span>图像大小不要超过4MB</span>
	</form>
	</div>
	</main>		
	</div>
	</div>
	<div id="mark_mask" style="display:none;position:fixed;top:40px;left:0;z-index:99999999;height:1000px;width:100%;background:rgba(0,0,0,0.4);"></div>
    <a id="gotop" href="#">
        <span>▲</span>
    </a>	
	</body>
</html>