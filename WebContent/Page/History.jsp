<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oj.entity.Problem"%>

<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Onlinejudge</title>
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
			ArrayList<Problem> arrayList = new ArrayList<Problem>();
			arrayList = (ArrayList<Problem>) session.getAttribute("problems");
		%>
		<div id="wrap">
		<nav id="tl-top-navbar" class="navbar navbar-inverse">
		<div class="collapse navbar-collapse">
		<div class="container">
			<a class="navbar-brand" href="Problems.jsp">hihocoder</a>
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
			<h3 class="tl-subnav-title">历史</h3>
			<ul class="tl-subnav-menu">
				<li class="active"><a href="Problems.jsp">我的成绩</a></li>
			</ul>
		</div>
		</nav>
		
		
		
		
		
		<div id="content" class="container">
		<div id="main" class="problemset-index">
		<div id="problemset_wrapper" class="dataTables_wrapper no-footer">
		<table  id="problemset" class="table table-bordered table-hover problemset-index-plist dataTable no-footer" role="grid" aria-describedby="problemset_info"  >
		<thead>
			<tr role="row">
				<th class="id sorting_asc" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 80.1667px;" aria-sort="ascending" aria-label="编号: activate to sort column descending">编号</th>
				<th class="def sorting" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 57.1667px;" aria-label="题目描述: activate to sort column ascending">试卷编号</th>
				<th class="def sorting" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 57.1667px;" aria-label="难度: activate to sort column ascending">提交答案</th>
				<th class="def sorting" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 57.1667px;" aria-label="题目描述: activate to sort column ascending">考试成绩</th>
		</thead>
		<!-- 循环开始 -->
		<c:forEach items="${sessionScope.history}" var="history">
				<tbody>
					<tr role="row" class="odd">
						<td class="id sorting_1">
							<span class="icon-circle " title=""></span>${history.getId()}
						</td>
						<td class="name-tags" >
							<div class="name">${history.getEx_id()}</div>
							<div class="clr"></div>
						</td>
						<td>
							<div class="name">${history.getResult()}</div>
							<div class="clr"></div>
						</td>
						<td>
							<div class="name">${history.getGrades()}</div>
							<div class="clr"></div>
						</td>
					</tr>
				</tbody>
		</c:forEach>
		<!-- 循环结束 -->
		</table>
		</div>
		</div>
		</div>
		</div>
		</body>
</html>