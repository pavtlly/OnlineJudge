<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div id="wrap">
            <nav id="tl-top-navbar" class="navbar navbar-inverse">
            <div class="collapse navbar-collapse">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">每周一练</a>
                    <ul class="nav navbar-nav">
                        <li><a href="login.jsp">每周一练</a></li>
	                    <li><a href="login.jsp" class="fire">比赛<span class="icon-fire"></span></a></li>
	                    <li><a href="login.jsp">题库</a></li> 
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                    </ul>
            </div>
            </div>
            </nav>          
        <div id="content" class="container">
            <div class="register">
            <h2>注册</h2>
            <div class="row">
                <main id="main" class="col-xs-5">
                    <form class="form" action="register" method="post">
                        <div class="form-group">
                            <label class="sr-only">邮箱地址</label>
                            <input type="text" name="nickname" class="form-control input-lg" placeholder="输入昵称">
                            <br>
                            <input type="email" name="email" class="form-control input-lg" placeholder="邮箱地址">
                            <br>
                            <input type="password" name="password" class="form-control input-lg" placeholder="输入密码">
                            <br>
                            <input type="password" name="repassword" class="form-control input-lg" placeholder="确认密码">
                        	<br>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg">注册</button>
                    </form>
                </main>
                <aside id="side" class="col-xs-5">
                <p>推荐您通过以下网站账户<a href="login.jsp">直接登录</a>，无需注册</p>
                    <a href="/login" class="auth-login">
                        <span class="google"></span>
                        <span class="git"></span>
                        <span class="qq"></span>
                    </a>
                </aside>
            </div>
            </div> 
        </div>
        </div>
    </body>
</html>