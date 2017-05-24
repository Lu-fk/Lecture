<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>DHU讲座管理系统管理员端</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


  </head>
   <%
				String s=(String)session.getAttribute("sign");
  				if(s==null||s.equals("login")){
					response.sendRedirect("login.jsp");
				}
				else{
%>
  <body>
	<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
					<img alt="140x140" src="pictures/main_10.jpg" />
				</div>
				<div class="col-md-8 column">
					<h1 class="text-center">
						东华大学讲座管理系统-管理员
					</h1>
				</div>
			</div>
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <a class="navbar-brand" href="administrator.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="adm_gl.jsp"><strong>讲座管理</strong></a>
						</li>
						<li>
							 <a href="adm_tj.jsp"><strong>添加讲座</strong></a>
						</li>
						<li>
							 <a href="adm_qd.jsp"><strong>学生签到</strong></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="login.jsp">登出|切换账户</a>
						</li>
					</ul>
				</div>
				
			</nav>
			<div class="jumbotron">
				<h1>
					欢迎你，管理员！
				</h1>
				<p>
					您已进入东华大学讲座管理员界面！
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="adm_gl.jsp">进入管理</a>
				</p>
			</div>
			
			<div class="carousel slide" id="carousel-122585">
				<ol class="carousel-indicators">
					<li class="active" data-target="#carousel-122585" data-slide-to="0">
					</li>
					<li data-target="#carousel-122585" data-slide-to="1">
					</li>
					<li data-target="#carousel-122585" data-slide-to="2">
					</li>
				</ol>
				<div class="carousel-inner" >
					<div class="item active">
						<img alt="" src="pictures/teach.jpg" style="width:100%;height:100%"/>
						<div class="carousel-caption">
							<h4>
								猜你喜欢
							</h4>
							<p>
								详细信息请点击“讲座查看”功能查看，更多精彩讲座等你来看。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="pictures/classroom.jpg" style="width:100%;height:100%"/>
						<div class="carousel-caption">
							<h4>
								猜你喜欢
							</h4>
							<p>
								详细信息请点击“讲座查看”功能查看，更多精彩讲座等你来看。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="pictures/chairs.jpg" style="width:100%;height:100%"/>
						<div class="carousel-caption">
							<h4>
								猜你喜欢
							</h4>
							<p>
								详细信息请点击“讲座查看”功能查看，更多精彩讲座等你来看。
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-122585" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-122585" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
</div>
  </body>
  <%} %>
</html>