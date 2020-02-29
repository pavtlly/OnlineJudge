<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.oj.entity.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
			<a class="navbar-brand" href="Contests.jsp">每周一练</a>
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
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=user.getNickname() %><b class="caret"></b></a>
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
			<h3 class="tl-subnav-title">比赛</h3>
			<ul class="tl-subnav-menu">
				<li class="active"><a href="Contests.jsp">正在进行</a></li>
				<li><a href="Contests.jsp">已经结束</a></li>
			</ul>
		</div>
		</nav>
		<div id="content" class="container">
		<main class="contests" id="main">
			<c:forEach items="${sessionScope.contestList}" var="contest">
				<ol class="ongoing">
					<li class="md-card md-summary clearfix">
						<img class="md-summary-logo" src="https://static.hihocoder.com/images/hiho.jpg">
						<div class="md-summary-cnt">
							<a href="<%=basePath %>contestshow?id=${contest.getId()}" >${contest.getName()}</a>
							<p></p>
							<!-- <p class="hiho-member" title="报名人数"><i class="icon-user"></i>1024</p> -->  <!-- 暂无报名人数 -->
						</div>
						<div class="md-summary-side">
							<p class="md-summary-stime" title="开始时间">
								<i class="icon-calendar"></i>
								<span class="htzc">${contest.getStart_time()} (+0800)</span>
							</p>
							<p class="md-summary-etime" title="结束时间">
								<i class="icon-calendar"></i>
								<span class="htzc">${contest.getEnd_time()} (+0800)</span>
							</p>
						</div>
					</li>
				</ol>
			</c:forEach>
		
		
	  <div class="md-mid-hr">
			<h4>即将到来</h4>
			<hr>
		</div>
		
		<ol class="upcoming">
			<li class="md-card md-summary clearfix">
			<img class="md-summary-logo" src="https://static.hihocoder.com/images/hiho.jpg">
			<div class="md-summary-cnt">
				<a href="/contest/offers87">练习赛1</a>
				<p></p>
				<p class="hiho-member" title="报名人数"><i class="icon-user"></i>1024</p>
			</div>
			<div class="md-summary-side">
				<p class="md-summary-stime" title="开始时间">
					<i class="icon-calendar"></i>
					<span class="htzc">2018-12-16 12:00 (+0800)</span>
				</p>
				<p class="md-summary-etime" title="结束时间">
					<i class="icon-calendar"></i>
					<span class="htzc">2018-12-16 14:30 (+0800)</span>
				</p>
			</div>
		</li>
		</ol>
		</main>
		
		<div class="modal fade" id="reg-contest502" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<form class="form-horizontal" onsubmit="$(this).ajaxsubmit(Callbacks.redirect('url'));return false;" method="post" action="/api/contest/register.json">
					<input class="hide" name="cid" value="502">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">报名参赛</h4>
					</div>
					<div class="modal-body">
								</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">报名参赛</button>
					</div>
				</form>
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
		<div id="mark_mask" style="display:none;position:fixed;top:40px;left:0;z-index:99999999;height:1000px;width:100%;background:rgba(0,0,0,0.4);"></div>
	</body>
</html>