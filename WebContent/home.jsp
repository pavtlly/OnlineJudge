<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.oj.entity.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<body style="">
		<%
			User user = (User) session.getAttribute("user");
		%>
		<div id="wrap">
			<nav id="tl-top-navbar" class="navbar navbar-inverse">
			<div class="collapse navbar-collapse">
			<div class="container">
			<a class="navbar-brand" href="home.jsp">hihocoder</a>
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">每周一练</a></li>
				<li><a href="<%=basePath %>contestlistshow" class="fire">比赛<span class="icon-fire"></span></a></li>
				<li><a href="<%=basePath %>problemshow">题库</a></li>
				<li><a href="<%=basePath %>history">历史</a></li>
				<c:if test="${ user.getRole() == 2}">
					<li><a href="Page/AddProblem.jsp">录题</a></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=user.getNickname() %><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="Page/StudentInfo.jsp">账户设置</a></li>
						<li><a href="logout">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
		</nav>				
		<nav class="tl-subnav">
		<div class="container clearfix">
			<h3 class="tl-subnav-title">每周一练</h3>
			<ul class="tl-subnav-menu">
				<li class="active"><a href="home.jsp">正在进行</a></li>
				<li><a href="home.jsp">已经结束</a></li>
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
				<th class="def sorting" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 57.1667px;" aria-label="题目描述: activate to sort column ascending">题目描述</th>
				<th class="def sorting" tabindex="0" aria-controls="problemset" rowspan="1" colspan="1" style="width: 57.1667px;" aria-label="难度: activate to sort column ascending">选项</th>
		</thead>
		<!-- 循环开始 -->
				<tbody>
					<tr role="row" class="odd">
						<td class="id sorting_1">
							<span class="icon-circle " title=""></span>1001
						</td>
						<td class="name-tags" >
							<div class="name">在8位进制补码中， 10101011表示的数是十进制下的(  )。</div>
							<div class="clr"></div>
						</td>
						<td>
							<table align="center">
								<tr>
									<td>A.43</td>
								</tr>
								<tr>
									<td>B.-85</td>
								</tr>
								<tr>
									<td>C.-43</td>
								</tr>
								<tr>
									<td>D.-84</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
		<!-- 循环结束 -->
		</table>
		</div>
		</div>
		</div>
		<script type="text/javascript" src="https://static.hihocoder.com/js/hiho-tzc.js" charset="utf-8"></script>
		<script type="text/javascript">
			var x = new Date();
		    var offset_in_minutes = x.getTimezoneOffset();
		    var htzc = new HTZC(offset_in_minutes);
		    var times = document.getElementsByClassName('htzc');
		    for (var i = 0; i < times.length; i++) {
		        times[i].innerHTML = htzc.convert(times[i].innerHTML);
		    }
		</script>			
		</div>
		</div>	
	</body>
</html>