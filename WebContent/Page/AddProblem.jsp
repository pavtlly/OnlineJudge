<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oj.entity.Problem"%>

<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Onlinejudge</title>
	    <link href="https://static.hihocoder.com/images/hiho.ico" rel="shortcut icon" type="image/x-icon">
		<link type="text/css" rel="stylesheet" href="https://static.hihocoder.com/styles/home.css?1496820864.css">
		<link type="text/css" rel="stylesheet" href="css/button.css">
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
		<style type="text/css"> 
			#select{
                margin:100px;
                background: rgba(0,0,0,0);
                width: 249px;
                height: 40px;
                font-family: "微软雅黑";
                font-size: 18px;
                color: white;
                border: 1px #1a1a1a solid;
                border-radius: 5px;
            }
            .select-head{
                overflow: hidden;
                width: 249px;
                height: 40px;
                box-sizing: border-box;
                padding: 0 10px;
                line-height: 40px;
            }
            .select-head .select-head-cont{
                float: left;
            }
            .select-head .select-icon{
                float: right;
            }
            .option{
                text-indent: 10px;
                margin-top: 1px;
                width: 249px;
                color: black;
                background: rgba(236,111,111,0.1);
                line-height: 25px;
                border: 1px #cfcfcf solid;
                display: none;
            }
            .option-item:hover{
                background: rgba(204,106,67,0.3);
            }
		</style>
	</head>
	<body>
		<%
			ArrayList<Problem> arrayList = new ArrayList<Problem>();
			arrayList = (ArrayList<Problem>) session.getAttribute("contest_problems");
		%>
		<div id="wrap">
		<nav id="tl-top-navbar" class="navbar navbar-inverse">
		<div class="collapse navbar-collapse">
		<div class="container">
			<a class="navbar-brand" href="ContestShow.jsp">hihocoder</a>
			<ul class="nav navbar-nav">
				<li><a href="<%=basePath %>home.jsp">每周一练</a></li>
				<li><a href="<%=basePath %>contestlistshow" class="fire">比赛<span class="icon-fire"></span></a></li>
				<li><a href="<%=basePath %>problemshow">题库</a></li>
				<li><a href="<%=basePath %>history">历史</a></li>
				<c:if test="${ user.getRole() == 2}">
					<li><a href="<%=basePath %>Page/AddProblem.jsp">录题</a></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">ehanla <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="StudentInfo.jsp">账户设置</a></li>
						<li><a href="<%=basePath %>logout">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
		</nav>
		
		<nav class="tl-subnav">
		<div class="container clearfix">
			<h3 class="tl-subnav-title">比赛题目</h3>
		</div>
		</nav>
		
		<div id="content" class="container">
		<div id="main" class="problemset-index">
		<div id="problemset_wrapper" class="dataTables_wrapper no-footer">
				<form class="form" action="<%=basePath %>addproblem" method="post">
			       <div class="form-group">
			           <input type="text" name="describe" class="form-control input-lg" placeholder="题目描述">
			           <br>
			           <input type="text" name="A" class="form-control input-lg" placeholder="选项A">
			           <br>
			           <input type="text" name="B" class="form-control input-lg" placeholder="选项B">
			           <br>
			           <input type="text" name="C" class="form-control input-lg" placeholder="选项C">
			           <br>
			           <input type="text" name="D" class="form-control input-lg" placeholder="选项D">
			           <br>
			           <div style="font-size:20px">
							答案
							<select name = "ans">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
							</select>
						</div>
						<br>
				   <button type="submit" class="button button-action button-rounded">提交</button>
			       </div>
	         	</form>
		</div>
		</div>
		</div>
		</div>
		</body>
</html>