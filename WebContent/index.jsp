<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta property="qc:admins" content="25115412737374526375">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OnlineJudge</title>
        <link href="https://static.hihocoder.com/images/hiho.ico" rel="shortcut icon" type="image/x-icon">
        <link type="text/css" rel="stylesheet" href="https://static.hihocoder.com/styles/home.css?1496820864.css">
        <script src="//hm.baidu.com/hm.js?9334676254a219943ea90c19530c3bec"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/api.js?1499873233.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/common.js?1496820864.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/dropdown.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/button.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/tooltip.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/modal.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/tag.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/discuss.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/framework/popover.js?1457224552.js"></script>
        <script type="text/javascript" src="https://static.hihocoder.com/js/libs/jquery-1.10.2.min.js?1457224552.js"></script>
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
            <nav id="tl-top-navbar-index" class="navbar navbar-default">
            <div class="collapse navbar-collapse">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">每周一练</a>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                    </ul>
                </div>
            </div>
            </nav>
        <style type="text/css">
            #tl-top-navbar-index .navbar-right {
                padding-top: 0;
            }
            #tl-top-navbar-index .navbar-nav>li>a {
                color: #CCC8C8;
            }
            #tl-top-navbar-index .navbar-nav>li>a:hover {
                color: #FFF;
            }
            .navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover {
                background-color: #080808;
                color: #555;
            }
        </style>
        <style type="text/css" xmlns="http://www.w3.org/1999/html">body{background: #ffffff;}</style>
        <div class="site-intro">
            <div class="container">
                <h2 class="site-intro-slogan">通过高水平的程序设计比赛提升编程水平</h2>
                <div class="site-intro-register">
                    <form class="form" action="" method="post" onsubmit="">
                        <div class="input-group fn-auto">
                            <input type="email" name="email" class="form-control input-lg" placeholder="Email">
                            <span class="input-group-btn">
                                <button class="btn btn-success" type="submit">注册帐号</button>
                            </span>
                        </div>
                    </form>
                </div>
                <div class="site-intro-snslogin">
                    <div class="fn-auto">
                        <strong>通过第三方帐号直接登录</strong>&nbsp&nbsp&nbsp&nbsp
                        <a href="javascript:api.githubLogin(Callbacks.redirect('url'));" class="git" title="Github"></a>
                        <a href="javascript:api.googleLogin(Callbacks.redirect('url'));" class="google" title="Google"></a>
                        <a href="javascript:api.sinaWeiBoLogin(Callbacks.redirect('url'));" class="sinaweibo" title="新浪微博"></a>
                        <a href="javascript:api.QQLogin(Callbacks.redirect('url'));" class="qq" title="QQ"></a>
                        <a href="javascript:api.liveLogin(Callbacks.redirect('url'));" class="live" title="Live ID"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container section-bar">
            <div class="row features">
                <div class="col-xs-3 feature-cell">
                    <div class="feature-cell-title fn-auto">
                        <a><span class="icon-lightbulb icon" style="padding: 25px 30px;"></span></a>
                        <h3>每周一练</h3>
                    </div>
                    <p>每周一道编程题目，经典算法或名企笔试题目，还可以查看其他人提交的代码，并从中得到启发。</p>
                </div>
                <div class="col-xs-3 feature-cell">
                    <div class="feature-cell-title fn-auto">
                        <a><span class="icon-trophy icon" style="padding: 25px 26px;"></span></a>
                        <h3>有奖竞赛</h3>
                    </div>
                    <p>每月举办一次编程月赛，同其他coders同台竞技，检验自己的编程水平。</p>
                </div>
                <div class="col-xs-3 feature-cell">
                    <div class="feature-cell-title fn-auto">
                        <a><span class="icon-comments icon"></span></a>
                        <h3>讨论社区</h3>
                    </div>
                    <p>在讨论社区和其他coders讨论算法，分享心得，并从中不断学习。</p>
                </div>
                <div class="col-xs-3 feature-cell">
                    <div class="feature-cell-title fn-auto">
                        <a><span class="icon-file-alt icon" style="padding: 25px 28px;"></span></a>
                        <h3>工作机会</h3>
                    </div>
                    <p>众多企业都青睐于算法方面的人才，参加月赛，提升编程水平，我们会推荐给企业</p>
                </div>
            </div>
        </div> 
    </body>
    
</html>