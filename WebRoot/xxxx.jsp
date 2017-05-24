<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>详细信息</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
  </head>
  	<%
		  	String lec_id=request.getParameter("lec_id");
			String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 0)
						out.print("<script>alert('添加成功！');location.href='xxxx.jsp?lec_id='+lec_id;</script>");
					else if(E == 1)
						out.print("<script>alert('添加失败！');location.href='xxxx.jsp?lec_id='+lec_id;</script>");
				}
				else ;
 			String s=(String)session.getAttribute("sign");
  			if(s==null||s.equals("login")){
				response.sendRedirect("login.jsp");
			}
			else{
				DB db=new DB();
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
					<h2 class="text-center">
						东华大学讲座管理系统
					</h2>
				</div>
			</div>
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <a class="navbar-brand" href="index.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="jzcx.jsp"><strong>讲座查看</strong></a>
						</li>
						<li>
							 <a href="jzyy.jsp"><strong>讲座评论</strong></a>
						</li>
						<li>
							 <a href="wdjz.jsp"><strong>我的讲座</strong></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="logoutServlet">登出|切换账户</a>
						</li>
					</ul>					
				</div>				
			</nav>
			<%
				lecture l=db.getLec(lec_id);
				String lrname=db.getLecturername(l.getLecturer_id());
			
			%>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						讲座名
					</h3>
				</div>
				<div class="panel-body">
					<%=l.getLec_name() %>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">
						主讲人
					</h3>
				</div>
				<div class="panel-body">
					<%=lrname %>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">
						讲座介绍
					</h3>
				</div>
 				<div class="panel-body">
					<%=l.getLec_mess() %>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">
						学生评论
					</h3>
				</div>
				<div class="panel-body">
					<table class="table">
						<th>评论者</th><th>评论内容 </th>
						<%
							ArrayList<comTable> ct=db.findL_ComTable(lec_id);
							Iterator iter=ct.iterator();
							while(iter.hasNext()){
								comTable c=(comTable)iter.next();
						%>
						<tr><td><%=db.getStu_nameForid(c.getStu_id()) %></td>
						<td><%=c.getCom() %></td></tr>
						<%} %>
					</table>
				<div class="panel-footer">
				</div>
					<form class="form-horizontal" action="AddcomServlet?lec_id=<%=l.getLec_id() %>" method="post">
						<div>
    						<textarea class="form-control" rows="8" name="com"></textarea>
    					</div>
						<input class="btn btn-default" type="submit" value="添加我的评论">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
  </body>
  <%db.Close();} %>
</html>